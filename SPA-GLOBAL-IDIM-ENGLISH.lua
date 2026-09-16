-- SPA-GLOBAL-IDIM-ENGLISH
-- Complete English Edition
-- Original version: SPA-GLOBAL V2.18

-- Internal keys remain unchanged; only their visible labels are localized.
SPA_ENGLISH_LABELS = {
	["VUELTAS"] = "LAPS", ["BOXES"] = "PITS", ["FAST LAPS"] = "FASTEST LAPS",
	["CONFIG"] = "SETTINGS", ["CHOQUES"] = "COLLISIONS", ["ANÁLISIS"] = "ANALYSIS",
	["LLANTAS"] = "TIRES", ["SANCIONES"] = "PENALTIES", ["CARRERA"] = "RACE",
	["TODOS"] = "ALL", ["INCIDENTES"] = "INCIDENTS", ["QUALY"] = "QUALIFYING",
	["WP CC"] = "WAYPOINTS", ["REGISTROS CC"] = "TRACK LIMITS LOG", ["CONFIG CC"] = "SETTINGS",
	["CONTACTO"] = "CONTACT", ["ALCANCE"] = "REAR-END", ["LATERAL"] = "SIDE CONTACT",
	["FRONTAL"] = "HEAD-ON", ["FUERTE"] = "SEVERE", ["MODERADO"] = "MODERATE",
	["LEVE"] = "MINOR", ["MURO"] = "WALL",
}

-- ╔══════════════════════════════════════════════════════════════════╗
-- ║  SPA-GLOBAL-IDIM-ENGLISH · QUALIFYING · WAYPOINTS · TRACK LIMITS ║
-- ║  1) Professional loading screen (White, Black, Red)             ║
-- ║  2) Right-side timing tower with position-change animations    ║
-- ║  3) Qualifying mode: configurable time-based rankings          ║
-- ║  4) Native track limits monitoring (optimized)                 ║
-- ║  ── NEW FEATURES ────────────────────────────────────────────  ║
-- ║  5) Per-driver image ID displayed next to the tower            ║
-- ║  6) Individually configurable WPs (LAP / PIT IN / PIT OUT)     ║
-- ║  7) Animated logo above the tower (ID 70836470072887)           ║
-- ║  8) FIA-excluded drivers are hidden from the tower automatically ║
-- ╚══════════════════════════════════════════════════════════════════╝

local mfloor  = math.floor
local mceil   = math.ceil
local mclamp  = math.clamp
local mmax    = math.max
local mmin    = math.min
local mround  = math.round
local mrad    = math.rad
local mabs    = math.abs
local mpi     = math.pi
local mrandom = math.random
local sformat = string.format
local ssub    = string.sub
local supper  = string.upper
local sfind   = string.find
local tinsert = table.insert
local tsort   = table.sort
local tcreate = table.create

local Players         = game:GetService("Players")
local RunService      = game:GetService("RunService")
local HttpService     = game:GetService("HttpService")
local UserInputService= game:GetService("UserInputService")
local Workspace       = game:GetService("Workspace")
local TweenService    = game:GetService("TweenService")

local player    = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local Camera    = Workspace.CurrentCamera

-- ─── V2: GLOBALS EXPOSED EARLY ──────────────────────────────
-- (The CONFIG panel reads these during construction, so they must exist BEFORE that UI.)
ENABLE_GAP              = true
GAP_MODE_LEAD           = true
ENABLE_VSC              = false
ENABLE_CHAT_EVENTS      = true
PENALTY_OFFSET          = {}
PENDING_SANCTIONS       = {}
APPLIED_SANCTIONS       = {}
CURRENT_STANDINGS_ORDER = {}
HUD_LAST_SIGNATURE       = nil
HUD_RANK_CACHE           = HUD_RANK_CACHE or { signature = nil, byUid = {}, standings = {}, qualy = {} }
DSQ_DRIVERS             = DSQ_DRIVERS or {}
groundEffectState       = groundEffectState or {}
SPA_ENGINE_SOUND_ID     = "rbxassetid://7621764624"
SPA_ENGINE_VOLUME       = 3.0
QUALY_STANDINGS         = {}
OVERTAKE_COUNT          = {}
CRASH_LEVE_COUNT        = {}
GLOBAL_FASTEST_LAP      = { time = math.huge, uid = nil, name = nil }
PENALTY_CONFIG = {
	ccWarnings     = 3,   -- track limits infringements before proposing a penalty
	crashLeves     = 3,   -- minor collisions before proposing a penalty
	finalGapSec    = 2,   -- gap (s) for flagging a potential track-cutting advantage
	penaltySeconds = 5,   -- penalty seconds when a penalty is confirmed
}

-- ─── GLOBAL CONSTANTS ────────────────────────────────────────
local CAL_FACTOR              = 0.6437
local CAL_OFFSET              = 0
local SPEED_CONVERSION_FACTOR = CAL_FACTOR
local SPEED_LIMIT             = 70
local showOnlyVehicles        = false
local MAX_LAPS                = 50
local MAX_PITS                = 3
local NOTIFICATION_COOLDOWN   = 10
local NOTIFICATION_DURATION   = 5
ENABLE_PERF_DIAGNOSTICS       = false
ENABLE_NITRO_DEBUG             = false
SPA_PERF = SPA_PERF or { samples = {}, lastLog = 0, spikeMs = 5, lastSpike = {} }
SPA_PERF.lastSpike = SPA_PERF.lastSpike or {}
function SPA_PerfMark(moduleName, startedAt, extra)
	if not ENABLE_PERF_DIAGNOSTICS or not startedAt then return end
	local elapsed = (os.clock() - startedAt) * 1000
	local item = SPA_PERF.samples[moduleName] or { total = 0, count = 0, last = 0, peak = 0 }
	item.total += elapsed; item.count += 1; item.last = elapsed; item.peak = mmax(item.peak or 0, elapsed)
	SPA_PERF.samples[moduleName] = item
	local now = tick()
	if elapsed >= (SPA_PERF.spikeMs or 5) and now - (SPA_PERF.lastSpike[moduleName] or 0) >= 1 then
		SPA_PERF.lastSpike[moduleName] = now
		warn(("[SPA-GLOBAL-IDIM-ENGLISH PERF SPIKE] module=%s duration=%.2fms%s"):format(moduleName, elapsed, extra and (" " .. tostring(extra)) or ""))
	end
	if now - (SPA_PERF.lastLog or 0) >= 10 then
		SPA_PERF.lastLog = now
		local parts = {}
		for name, d in pairs(SPA_PERF.samples) do
			parts[#parts + 1] = ("%s=%.2fms"):format(name, d.last or 0)
		end
		warn("[SPA-GLOBAL-IDIM-ENGLISH PERF] " .. table.concat(parts, " "))
	end
end
local notifiedPlayers         = {}
local lastSpeeds              = {}
-- CRASH_VELOCITY_DROP removed → see the global SPA_Crash table below [SPAV4]
local COLLISION_COOLDOWN      = 10
local lastCollisionNotificationTime = 0
local DEBOUNCE_TIME           = 3
local MAX_PLAYERS_DISPLAY     = 22
local CHECKPOINT_RADIUS       = 350
local WP_WIDTH                = 120
local WP_HEIGHT               = 90
local WP_THICKNESS            = 20

-- ─── PER-WAYPOINT SETTINGS (independent; never combined) ─────
local wpCfg = {
	LAP     = { width = 120, height = 90, thickness = 20, detectionWidth = 350, detectionHeight = 120, detectionTolerance = 4 },
	PIT_IN  = { width = 120, height = 90, thickness = 20 },
	PIT_OUT = { width = 120, height = 90, thickness = 20 },
}
local DETECT_LAPS             = true
local DETECT_PITS             = true
local LAP_LINE_CFRAME         = CFrame.new(0, 35, 0)
local PIT_ENTRY_CFRAME        = CFrame.new(80, 35, 0)
local PIT_EXIT_CFRAME         = CFrame.new(100, 35, 0)
local lapData                 = {}
local pitData                 = {}
local fastLapData             = {}
local isSpectating            = false
local originalCameraType      = nil
local originalCameraSubject   = nil
local spectRenderConnection   = nil
local targetSpectPlayer       = nil
local CAMERA_FOV              = 70
local SHOW_HEAD_NAME          = true
local SHOW_HEAD_SPEED         = true

-- Waypoint visibility
local WP_VISIBLE              = true

-- Qualifying mode
local QUALY_MODE              = false
local QUALY_LAPS              = 3
local RACE_STATE              = "IDLE" -- IDLE, QUALY, RACE, FINISHED
-- [QUALY FIX] Only these times belong to the current qualifying session.
-- Race fastest laps remain separate from this official source.
local QUALY_BEST_TIMES        = {}
local FINAL_QUALY_RESULTS     = {}
local QUALY_FIA_STATUS        = {}
local QUALY_NAMES              = {}
local QUALY_GLOBAL_FASTEST     = { time = math.huge, uid = nil, name = nil }
local RACE_GLOBAL_FASTEST      = { time = math.huge, uid = nil, name = nil }
local FINAL_QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }

-- Timing tower
local TOWER_SCALE      = 1.0
local TOWER_ROW_H      = 24
local TOWER_HEADER_H   = 28
local TOWER_WIDTH      = 148

local customPlayerData = {}
local FIA_EXCLUDED     = {}

-- ─── TRACK LIMITS CONSTANTS ──────────────────────────────────
local DETECTCC        = true
local CCDEBOUNCETIME  = 5
local CCWPWIDTH       = 120
local CCWPHEIGHT      = 90
local CCWPTHICKNESS   = 20
local SHOW_WAYPOINTS_CC = true
local ccWaypoints     = {}
local ccData          = {}
local lastSeenInCC    = {}
local ccDebounce      = {}
local ccWpCounter     = 0

-- ─── OPTIMIZATION 2: GUI row cache ───────────────────────────
local vueltasRowCache  = {}
local boxesRowCache    = {}
local fastLapsRowCache = {}
local boxesRowRefs     = {}
local fastLapsRowRefs  = {}
local HUD_DIAGNOSTICS = { cycles = 0, lastSuccessfulAt = 0, errors = 0 }
local hudWarningAt = {}

local function warnHudError(stage, player, err)
	local uid = player and player.UserId or "-"
	local name = player and player.Name or "-"
	local message = tostring(err)
	local key = tostring(stage) .. ":" .. tostring(uid) .. ":" .. message
	local now = tick()
	HUD_DIAGNOSTICS.errors += 1
	if not hudWarningAt[key] or now - hudWarningAt[key] >= 5 then
		hudWarningAt[key] = now
		warn(("[SPA-GLOBAL-IDIM-ENGLISH HUD] stage=%s uid=%s name=%s error=%s"):format(tostring(stage), tostring(uid), tostring(name), message))
	end
end

local function safeDestroyGui(instance)
	if instance and instance.Parent then
		local ok, err = pcall(function() instance:Destroy() end)
		if not ok then warnHudError("gui_destroy", nil, err) end
	end
end

-- ─── COLORS (iOS DARK-GLASS PALETTE · SPAV4) ─────────────────
-- Cool translucent graphite for panels, with iOS-style accents.
local C_BG      = Color3.fromRGB(18, 20, 27)   -- deep graphite (base panel)
local C_BG2     = Color3.fromRGB(32, 35, 45)   -- raised graphite (rows/headers)
local C_RED     = Color3.fromRGB(255, 69, 58)  -- iOS systemRed
local C_WHITE   = Color3.fromRGB(245, 246, 250)
local C_GRAY    = Color3.fromRGB(152, 154, 164) -- iOS secondaryLabel
local C_YELLOW  = Color3.fromRGB(255, 214, 10)  -- iOS systemYellow
local C_GREEN   = Color3.fromRGB(48, 209, 88)   -- iOS systemGreen
local C_ORANGE  = Color3.fromRGB(255, 159, 10)  -- iOS systemOrange
local C_DARKRED = Color3.fromRGB(120, 30, 28)
local C_BLUE    = Color3.fromRGB(10, 132, 255)  -- iOS systemBlue
local C_F1_PURPLE    = Color3.fromRGB(191, 90, 242) -- iOS systemPurple
local C_F1_YELLOW    = Color3.fromRGB(255, 214, 10)
local C_F1_GREEN_LT  = Color3.fromRGB(48, 209, 88)
local CCWPCOLOR      = Color3.fromRGB(255, 214, 10) -- Track limits waypoint color

-- ════════════════════════════════════════════════════════════════
-- ███  iOS THEME ENGINE · GLASSMORPHISM (SPAV4)  ██████████████
-- Purely visual layer. Everything lives INSIDE an IIFE and is
-- exposed as the global 'Glass'. Globals do NOT consume local registers
-- in the main chunk, avoiding Luau's 200-local limit
-- without removing functionality.
-- ════════════════════════════════════════════════════════════════
Glass = (function()
	local Lighting = game:GetService("Lighting")

	local GLASS = {
		PANEL_TRANSPARENCY  = 0.16,  -- large containers/panels
		ROW_TRANSPARENCY    = 0.20,  -- list rows
		BUTTON_TRANSPARENCY = 0.08,  -- buttons / inputs
		STROKE_COLOR        = Color3.fromRGB(255, 255, 255),
		STROKE_TRANSPARENCY = 0.86,  -- translucent hairline border (iOS)
		STROKE_THICKNESS    = 1,
		GRADIENT_TOP        = 0.0,    -- inner glow (subtle vertical gradient)
		GRADIENT_BOTTOM     = 0.10,
		BLUR_SIZE           = 26,     -- Gaussian background blur when modals open
	}

	-- iOS-style corner radius (Roblox clamps to half the shorter side)
	local function _iosRadius(g)
		local oy = g.Size.Y.Offset
		if g.Size.Y.Scale > 0 and oy == 0 then return UDim.new(0, 14) end
		if oy >= 120 then return UDim.new(0, 20) end
		if oy >= 50  then return UDim.new(0, 14) end
		if oy >= 28  then return UDim.new(0, 10) end
		return UDim.new(0, 8)
	end

	-- Thin bar/divider/indicator? Keep it crisp, without a glass effect.
	local function _isThinAccent(g)
		local s = g.Size
		local thinY = (s.Y.Scale == 0 and s.Y.Offset > 0 and s.Y.Offset <= 4)
		local thinX = (s.X.Scale == 0 and s.X.Offset > 0 and s.X.Offset <= 4)
		return thinY or thinX
	end

	local _GLASS_TARGETS = {
		Frame = true, TextButton = true, TextBox = true,
		ScrollingFrame = true, ImageButton = true,
	}

	local function glassify(inst)
		if typeof(inst) ~= "Instance" then return end
		if not _GLASS_TARGETS[inst.ClassName] then return end
		if inst:GetAttribute("_glassed") then return end
		inst:SetAttribute("_glassed", true)
		if _isThinAccent(inst) then return end

		-- Rounded corners
		local corner = inst:FindFirstChildOfClass("UICorner")
		if not corner then corner = Instance.new("UICorner"); corner.Parent = inst end
		corner.CornerRadius = _iosRadius(inst)

		-- Only apply glass to elements with a visible background
		if inst.BackgroundTransparency < 0.6 then
			local sy = inst.Size.Y.Scale
			local oy = inst.Size.Y.Offset
			local target
			if inst:IsA("ScrollingFrame") or (sy > 0) or oy >= 120 then
				target = GLASS.PANEL_TRANSPARENCY
			elseif inst:IsA("TextButton") or inst:IsA("ImageButton") or inst:IsA("TextBox") then
				target = GLASS.BUTTON_TRANSPARENCY
			else
				target = GLASS.ROW_TRANSPARENCY
			end
			inst.BackgroundTransparency = target

			-- Hairline border: rectangles only (on TextButton/TextBox,
			-- UIStroke would outline the text, so omit it there).
			if (inst:IsA("Frame") or inst:IsA("ScrollingFrame") or inst:IsA("ImageButton"))
				and not inst:FindFirstChild("_GlassStroke") then
				local st = Instance.new("UIStroke")
				st.Name = "_GlassStroke"
				st.Color = GLASS.STROKE_COLOR
				st.Transparency = GLASS.STROKE_TRANSPARENCY
				st.Thickness = GLASS.STROKE_THICKNESS
				st.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				st.Parent = inst
			end

			-- Subtle vertical gradient (inner glow): plain Frames only,
			-- to avoid dimming button/input text.
			if inst:IsA("Frame") and not inst:FindFirstChild("_GlassGradient") then
				local gr = Instance.new("UIGradient")
				gr.Name = "_GlassGradient"
				gr.Rotation = 90
				gr.Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, GLASS.GRADIENT_TOP),
					NumberSequenceKeypoint.new(1, GLASS.GRADIENT_BOTTOM),
				})
				gr.Parent = inst
			end
		end
	end

	-- BlurEffect for Gaussian background blur
	local _glassBlur = Lighting:FindFirstChild("SPA_GlassBlur")
	if not _glassBlur then
		_glassBlur = Instance.new("BlurEffect")
		_glassBlur.Name = "SPA_GlassBlur"
		_glassBlur.Size = 0
		_glassBlur.Enabled = true
		_glassBlur.Parent = Lighting
	end

	local _glassModals = {}
	local function _updateGlassBlur()
		local anyOpen = false
		for f, _ in pairs(_glassModals) do
			if f.Parent and f.Visible then anyOpen = true; break end
		end
		TweenService:Create(_glassBlur, TweenInfo.new(0.28, Enum.EasingStyle.Quart),
			{ Size = anyOpen and GLASS.BLUR_SIZE or 0 }):Play()
	end

	local function registerGlassModal(frame)
		if not frame then return end
		frame:SetAttribute("_glassed", true)
		local corner = frame:FindFirstChildOfClass("UICorner")
		if not corner then corner = Instance.new("UICorner"); corner.Parent = frame end
		corner.CornerRadius = UDim.new(0, 22)
		if frame.BackgroundTransparency < 0.6 then
			frame.BackgroundTransparency = GLASS.PANEL_TRANSPARENCY
		end
		if not frame:FindFirstChild("_GlassStroke") then
			local st = Instance.new("UIStroke")
			st.Name = "_GlassStroke"; st.Color = GLASS.STROKE_COLOR
			st.Transparency = 0.82; st.Thickness = 1.4
			st.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; st.Parent = frame
		end
		_glassModals[frame] = true
		frame:GetPropertyChangedSignal("Visible"):Connect(_updateGlassBlur)
		frame.AncestryChanged:Connect(_updateGlassBlur)
	end

	local _GLASS_SKIP_GUI = { SPA_LOADING_PRO = true }
	local function attachGlass(screenGui)
		if not screenGui or _GLASS_SKIP_GUI[screenGui.Name] then return end
		for _, d in ipairs(screenGui:GetDescendants()) do glassify(d) end
		screenGui.DescendantAdded:Connect(function(d) task.defer(glassify, d) end)
	end

	local function applyIOSGlassTheme()
		for _, g in ipairs(playerGui:GetChildren()) do
			if g:IsA("ScreenGui") then attachGlass(g) end
		end
		playerGui.ChildAdded:Connect(function(g)
			if g:IsA("ScreenGui") then task.defer(attachGlass, g) end
		end)
		_updateGlassBlur()
	end

	return {
		registerModal = registerGlassModal,
		apply         = applyIOSGlassTheme,
		glassify      = glassify,
		blur          = _glassBlur,
		BLUR_SIZE     = GLASS.BLUR_SIZE,
	}
end)()

-- ─── GLOBAL HELPERS ─────────────────────────────────────────
local function fmtTime(s)
	if not s or s <= 0 then return "--:--.---" end
	local mins = mfloor(s / 60)
	local secs = s % 60
	return sformat("%d:%06.3f", mins, secs)
end

local function fmtTimeDelta(s)
	if not s then return "" end
	if s == 0 then return "LEADER" end
	return sformat("+%06.3f", s)
end

local function getDisplayName(p)
	local cd = customPlayerData[p.UserId]
	if cd and cd.name and cd.name ~= "" then return cd.name end
	return p.Name
end

local function getNameColor(p)
	local cd = customPlayerData[p.UserId]
	if cd and cd.color then return cd.color end
	return C_WHITE
end

local function toSpeedDisplay(studs)
	return mfloor(studs * 0.28 * 3.6 * CAL_FACTOR + CAL_OFFSET + 0.5)
end

local function getVehicleSpeed(seat)
	if not seat then return 0 end
	local ok, mag = pcall(function()
		if seat.AssemblyLinearVelocity then return seat.AssemblyLinearVelocity.Magnitude else return seat.Velocity.Magnitude end
	end)
	if ok and mag then return mag else return 0 end
end

local speedLimitCache = {}
local function getPlayerSpeedLimit(seat, vehicleCache)
	if not seat or not seat.Parent then return 0 end
	local root = _telGetRootModel and _telGetRootModel(seat)
	if vehicleCache and vehicleCache.vehicleRoot == root and vehicleCache.speedLimitReady then
		local valueObject = vehicleCache.speedLimitValue
		if valueObject and valueObject.Parent and (valueObject:IsA("NumberValue") or valueObject:IsA("IntValue")) then
			return mfloor(valueObject.Value * 10 + 0.5) / 10
		end
		if not valueObject then return vehicleCache.speedLimit or 0 end
		vehicleCache.speedLimitReady = false
	end
	local cacheKey = root or seat
	local cached = speedLimitCache[cacheKey]
	if cached then
		local valueObject = cached.valueObject
		if not valueObject then
			return cached.fallback or 0
		elseif valueObject.Parent and (valueObject:IsA("NumberValue") or valueObject:IsA("IntValue")) then
			return mfloor(valueObject.Value * 10 + 0.5) / 10
		else
			speedLimitCache[cacheKey] = nil
		end
	end
	local valueObject
	if root then
		for _, v in ipairs(root:GetDescendants()) do
			if (v:IsA("NumberValue") or v:IsA("IntValue")) and v.Value > 0 then
				local nm = v.Name:lower()
				if nm=="maxspeed" or nm=="topspeed" or nm=="top_speed" or nm=="speedlimit" then
					valueObject = v; break
				end
			end
		end
	end
	if not valueObject then
		for _, v in pairs(seat:GetChildren()) do
			if (v:IsA("NumberValue") or v:IsA("IntValue")) and v.Value > 0
				and (v.Name:lower():find("speed") or v.Name:lower():find("limit")) then
				valueObject = v; break
			end
		end
	end
	local limit = valueObject and valueObject.Value or (seat:IsA("VehicleSeat") and seat.MaxSpeed or 0)
	limit = mfloor(limit * 10 + 0.5) / 10
	speedLimitCache[cacheKey] = { valueObject = valueObject, fallback = limit }
	if vehicleCache and vehicleCache.vehicleRoot == root then
		vehicleCache.speedLimitValue = valueObject; vehicleCache.speedLimit = limit; vehicleCache.speedLimitReady = true
	end
	return limit
end

local function getPlayerSpeed(p, cachedState)
	local seat = cachedState and cachedState.seat
	if cachedState and cachedState.inVehicle and seat and seat.Parent then
		return toSpeedDisplay(getVehicleSpeed(seat))
	end
	local root = cachedState and cachedState.root
	if root and root.Parent then return mround(root.AssemblyLinearVelocity.Magnitude * SPEED_CONVERSION_FACTOR + CAL_OFFSET) end
	local char = p.Character
	if not char then return 0 end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum and hum.SeatPart and (hum.SeatPart:IsA("VehicleSeat") or hum.SeatPart:IsA("Seat")) then return toSpeedDisplay(getVehicleSpeed(hum.SeatPart)) end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return 0 end
	return mround(hrp.AssemblyLinearVelocity.Magnitude * SPEED_CONVERSION_FACTOR + CAL_OFFSET)
end

local function ensurePlayerData(p)
	if not p then return end
	local uid = p.UserId
	if not lapData[uid] then lapData[uid] = {lapsMade=0, lastLapTouch=0} end
	if not pitData[uid] then pitData[uid] = {status="En Pista", pitStopsMade=0, lastPitTouch=0} end
	if not fastLapData[uid] then fastLapData[uid] = {bestTime=nil, lastStartTime=nil, currentLapStarted=false} end
	if not ccData[uid] then ccData[uid] = { total = 0, history = {} } end
end

for _, pl in ipairs(Players:GetPlayers()) do ensurePlayerData(pl) end

-- ─── NOTIFICATIONS ─────────────────────────────────────────
local NOTIF_ENABLED = true
local function showNotification(text, bgColor, icon, yOffset)
	if not NOTIF_ENABLED then return end
	local gui = Instance.new("ScreenGui")
	gui.ResetOnSpawn = false
	gui.DisplayOrder = 200
	gui.Parent = playerGui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 420, 0, 48)
	frame.Position = UDim2.new(0.5, -210, 0, yOffset or 20)
	frame.BackgroundColor3 = C_BG
	frame.BorderSizePixel = 0
	frame.BackgroundTransparency = 0.1
	frame.Parent = gui

	local accent = Instance.new("Frame")
	accent.Size = UDim2.new(0, 4, 1, 0)
	accent.BackgroundColor3 = bgColor
	accent.BorderSizePixel = 0
	accent.Parent = frame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 4)
	corner.Parent = frame

	local iconLbl = Instance.new("TextLabel")
	iconLbl.Size = UDim2.new(0, 36, 1, 0)
	iconLbl.Position = UDim2.new(0, 8, 0, 0)
	iconLbl.BackgroundTransparency = 1
	iconLbl.Text = icon or "⚑"
	iconLbl.TextScaled = true
	iconLbl.Font = Enum.Font.GothamBold
	iconLbl.TextColor3 = bgColor
	iconLbl.Parent = frame

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -56, 1, 0)
	lbl.Position = UDim2.new(0, 50, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Font = Enum.Font.GothamBold
	lbl.TextScaled = true
	lbl.TextColor3 = C_WHITE
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Text = text
	lbl.Parent = frame

	frame.Position = UDim2.new(0.5, -210, 0, (yOffset or 20) - 30)
	frame.BackgroundTransparency = 1
	local tweenIn = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, -210, 0, yOffset or 20),
		BackgroundTransparency = 0.1
	})
	tweenIn:Play()

	task.delay(NOTIFICATION_DURATION - 0.4, function()
		local tweenOut = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			Position = UDim2.new(0.5, -210, 0, (yOffset or 20) - 20),
			BackgroundTransparency = 1
		})
		tweenOut:Play()
		tweenOut.Completed:Connect(function() gui:Destroy() end)
	end)
end

local function showSpeedingNotification(name, speed)
	showNotification(name .. "  SPEEDING  " .. speed .. " KM/H", C_RED, "⚠", 20)
end

local function showCollisionNotification()
	showNotification("COLLISION DETECTED", C_ORANGE, "💥", 78)
end

local function showCCNotification(text, yOffset)
	showNotification(text, CCWPCOLOR, "⚠️", yOffset or 136)
end

-- ─── WAYPOINTS AND PHYSICS (no GetPartsInPart; CFrame/vectors only) ───
-- [PERF FIX] playersInPart/overlapParams/getPlayerCharacters removed.
-- Lap/pit/track limits detection now uses CFrame:PointToObjectSpace()
-- directly, without physics overlap queries (see HB-LAP below).

local function createSphereTrigger(name, cframe)
	local part = Instance.new("Part")
	part.Name = name; part.Shape = Enum.PartType.Ball; part.Size = Vector3.new(CHECKPOINT_RADIUS, CHECKPOINT_RADIUS, CHECKPOINT_RADIUS)
	part.CFrame = cframe; part.Anchored = true; part.CanCollide = false; part.CanTouch = false
	part.CanQuery = true; part.Transparency = 1; part.Parent = Workspace
	return part
end

local function createWall(name, color, cframe, size, transparency)
	local wp = Instance.new("Part")
	wp.Name = name; wp.Size = size or Vector3.new(WP_WIDTH, WP_HEIGHT, WP_THICKNESS)
	wp.CFrame = cframe * CFrame.Angles(0, mrad(90), 0)
	wp.Anchored = true; wp.CanCollide = false; wp.CanTouch = false; wp.CanQuery = true
	wp.Transparency = transparency or (WP_VISIBLE and 0.4 or 1)
	wp.Color = color; wp.Material = Enum.Material.Neon; wp.Parent = Workspace
	return wp
end

local lapWall    = createWall("LAP_WALL",     C_GREEN,                   LAP_LINE_CFRAME,  Vector3.new(wpCfg.LAP.width,     wpCfg.LAP.height,     wpCfg.LAP.thickness))
local pitInWall  = createWall("PIT_IN_WALL",  C_ORANGE,                  PIT_ENTRY_CFRAME, Vector3.new(wpCfg.PIT_IN.width,  wpCfg.PIT_IN.height,  wpCfg.PIT_IN.thickness))
local pitOutWall = createWall("PIT_OUT_WALL", Color3.fromRGB(128,0,128), PIT_EXIT_CFRAME,  Vector3.new(wpCfg.PIT_OUT.width, wpCfg.PIT_OUT.height, wpCfg.PIT_OUT.thickness))
local pitEntrySphere = createSphereTrigger("PitEntryTrigger", PIT_ENTRY_CFRAME)
local pitExitSphere  = createSphereTrigger("PitExitTrigger",  PIT_EXIT_CFRAME)
local lapSphere      = createSphereTrigger("LapTrigger",      LAP_LINE_CFRAME)

function _spaLapRuntimeState(reason)
	local cf = lapWall and lapWall.CFrame
	if not cf then
		warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP STATE] reason=%s state=%s detect=%s wall=missing"):format(tostring(reason), tostring(RACE_STATE), tostring(DETECT_LAPS)))
		return
	end
	warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP STATE] reason=%s state=%s detect=%s wallPos=%s look=%s up=%s"):format(
		tostring(reason), tostring(RACE_STATE), tostring(DETECT_LAPS), tostring(cf.Position), tostring(cf.LookVector), tostring(cf.UpVector)))
end

local function applyWPVisibility()
	local t = WP_VISIBLE and 0.4 or 1
	if lapWall    then lapWall.Transparency    = t end
	if pitInWall  then pitInWall.Transparency  = t end
	if pitOutWall then pitOutWall.Transparency = t end
end

-- Track limits wall functions
local function createCCWall(id, name, cframe)
	return createWall("CCWP_" .. id, CCWPCOLOR, cframe, Vector3.new(CCWPWIDTH, CCWPHEIGHT, CCWPTHICKNESS), SHOW_WAYPOINTS_CC and 0.35 or 1)
end

local function applyWPVisibilityCC()
	local t = SHOW_WAYPOINTS_CC and 0.35 or 1
	for _, entry in pairs(ccWaypoints) do
		if entry.wall and entry.wall.Parent then entry.wall.Transparency = t end
	end
end

local function removeCCWall(id)
	local entry = ccWaypoints[id]
	if not entry then return end
	if entry.wall and entry.wall.Parent then entry.wall:Destroy() end
	lastSeenInCC[id] = nil
	local prefix = tostring(id) .. "_"  -- [SPAV4 fix] Do not erase debounces for IDs sharing the first digit (1 vs 10,11..)
	for key, _ in pairs(ccDebounce) do
		if type(key) == "string" and key:sub(1, #prefix) == prefix then ccDebounce[key] = nil end
	end
	ccWaypoints[id] = nil
end

-- ─── NEW LOADING SCREEN (PROFESSIONAL WHITE/BLACK/RED) ────────
loadGui = Instance.new("ScreenGui")
loadGui.Name = "SPA_LOADING_PRO"
loadGui.ResetOnSpawn = false
loadGui.DisplayOrder = 999
loadGui.Parent = playerGui

loadBg = Instance.new("Frame")
loadBg.Size = UDim2.new(1,0,1,0)
loadBg.BackgroundColor3 = Color3.fromRGB(10, 11, 16) -- Translucent deep black
loadBg.BackgroundTransparency = 0.12
loadBg.BorderSizePixel = 0
loadBg.Parent = loadGui

centerContainer = Instance.new("Frame")
centerContainer.Size = UDim2.new(0, 420, 0, 210)
centerContainer.Position = UDim2.new(0.5, -210, 0.5, -105)
centerContainer.BackgroundColor3 = C_BG2
centerContainer.BackgroundTransparency = 0.16
centerContainer.BorderSizePixel = 0
centerContainer.Parent = loadBg
do
	local _cc = Instance.new("UICorner"); _cc.CornerRadius = UDim.new(0, 26); _cc.Parent = centerContainer
	local _cs = Instance.new("UIStroke"); _cs.Color = Color3.fromRGB(255,255,255); _cs.Transparency = 0.82; _cs.Thickness = 1.4; _cs.ApplyStrokeMode = Enum.ApplyStrokeMode.Border; _cs.Parent = centerContainer
	local _cg = Instance.new("UIGradient"); _cg.Rotation = 90; _cg.Transparency = NumberSequence.new(0.0, 0.12); _cg.Parent = centerContainer
end

logoText = Instance.new("TextLabel")
logoText.Size = UDim2.new(1,0,0,50)
logoText.Position = UDim2.new(0,0,0,40)
logoText.BackgroundTransparency = 1
logoText.Text = "SPA-GLOBAL-IDIM-ENGLISH"
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.Font = Enum.Font.GothamBlack
logoText.TextSize = 48
logoText.TextScaled = true -- Fit the full edition name without changing the panel dimensions.
logoText.Parent = centerContainer

subText = Instance.new("TextLabel")
subText.Size = UDim2.new(1,0,0,20)
subText.Position = UDim2.new(0,0,0,95)
subText.BackgroundTransparency = 1
subText.Text = "RACE CONTROL SYSTEM"
subText.TextColor3 = C_RED
subText.Font = Enum.Font.GothamBold
subText.TextSize = 18
subText.Parent = centerContainer

statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1,0,0,20)
statusText.Position = UDim2.new(0,0,0,160)
statusText.BackgroundTransparency = 1
statusText.Text = "INITIALIZING SYSTEMS..."
statusText.TextColor3 = C_GRAY
statusText.Font = Enum.Font.GothamMedium
statusText.TextSize = 12
statusText.Parent = centerContainer

barBg = Instance.new("Frame")
barBg.Size = UDim2.new(1,0,0,2)
barBg.Position = UDim2.new(0,0,0,140)
barBg.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
barBg.BorderSizePixel = 0
barBg.Parent = centerContainer

barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0,0,1,0)
barFill.BackgroundColor3 = C_RED
barFill.BorderSizePixel = 0
barFill.Parent = barBg

task.spawn(function()
	TweenService:Create(Glass.blur, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {Size = Glass.BLUR_SIZE}):Play()
	TweenService:Create(barFill, TweenInfo.new(3.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size=UDim2.new(1,0,1,0)}):Play()
	task.wait(0.8)
	statusText.Text = "LOADING TELEMETRY AND UI..."
	task.wait(1.2)
	statusText.Text = "STARTING TRACK LIMITS MONITOR..."
	task.wait(1)
	statusText.Text = "SYSTEM READY"
	statusText.TextColor3 = C_WHITE
	task.wait(0.5)

	TweenService:Create(Glass.blur, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {Size = 0}):Play()
	TweenService:Create(loadBg, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {BackgroundTransparency=1}):Play()
	TweenService:Create(logoText, TweenInfo.new(0.4), {TextTransparency=1}):Play()
	TweenService:Create(subText, TweenInfo.new(0.4), {TextTransparency=1}):Play()
	TweenService:Create(statusText, TweenInfo.new(0.4), {TextTransparency=1}):Play()
	TweenService:Create(barBg, TweenInfo.new(0.4), {BackgroundTransparency=1}):Play()
	TweenService:Create(barFill, TweenInfo.new(0.4), {BackgroundTransparency=1}):Play()
	task.wait(0.6)
	loadGui:Destroy()
end)

-- ─── MAIN HUD PANEL ─────────────────────────────────────────
hudGui = Instance.new("ScreenGui")
hudGui.Name = "F125_HUD"
hudGui.ResetOnSpawn = false
hudGui.DisplayOrder = 10
hudGui.Parent = playerGui

lapPanel = Instance.new("Frame")
lapPanel.Name = "LapPanel"
lapPanel.Size = UDim2.new(0, 320, 0, 52)
lapPanel.Position = UDim2.new(0.5, -160, 0, 10)
lapPanel.BackgroundColor3 = C_BG
lapPanel.BackgroundTransparency = 0.1
lapPanel.BorderSizePixel = 0
lapPanel.Parent = hudGui
lapPanelCorner = Instance.new("UICorner")
lapPanelCorner.CornerRadius = UDim.new(0,4)
lapPanelCorner.Parent = lapPanel

lapPanelLine = Instance.new("Frame")
lapPanelLine.Size = UDim2.new(1,0,0,3)
lapPanelLine.Position = UDim2.new(0,0,1,-3)
lapPanelLine.BackgroundColor3 = C_RED
lapPanelLine.BorderSizePixel = 0
lapPanelLine.Parent = lapPanel

lapLabel = Instance.new("TextLabel")
lapLabel.Size = UDim2.new(0.3,0,0.5,0)
lapLabel.Position = UDim2.new(0,10,0,4)
lapLabel.BackgroundTransparency = 1
lapLabel.Text = "LAP"
lapLabel.Font = Enum.Font.GothamBold
lapLabel.TextColor3 = C_GRAY
lapLabel.TextSize = 11
lapLabel.TextXAlignment = Enum.TextXAlignment.Left
lapLabel.Parent = lapPanel

lapNumLabel = Instance.new("TextLabel")
lapNumLabel.Name = "LapNum"
lapNumLabel.Size = UDim2.new(0.35,0,0.55,0)
lapNumLabel.Position = UDim2.new(0,10,0.42,0)
lapNumLabel.BackgroundTransparency = 1
lapNumLabel.Text = "0 / " .. MAX_LAPS
lapNumLabel.Font = Enum.Font.GothamBlack
lapNumLabel.TextColor3 = C_WHITE
lapNumLabel.TextSize = 20
lapNumLabel.TextXAlignment = Enum.TextXAlignment.Left
lapNumLabel.Parent = lapPanel

sep = Instance.new("Frame")
sep.Size = UDim2.new(0,1,0.7,0)
sep.Position = UDim2.new(0.38,-0.5,0.15,0)
sep.BackgroundColor3 = C_GRAY
sep.BackgroundTransparency = 0.5
sep.BorderSizePixel = 0
sep.Parent = lapPanel

timeLabel = Instance.new("TextLabel")
timeLabel.Size = UDim2.new(0.62,-5,0.5,0)
timeLabel.Position = UDim2.new(0.38,6,0,4)
timeLabel.BackgroundTransparency = 1
timeLabel.Text = "BEST"
timeLabel.Font = Enum.Font.GothamBold
timeLabel.TextColor3 = C_GRAY
timeLabel.TextSize = 11
timeLabel.TextXAlignment = Enum.TextXAlignment.Left
timeLabel.Parent = lapPanel

bestTimeLabel = Instance.new("TextLabel")
bestTimeLabel.Name = "BestTime"
bestTimeLabel.Size = UDim2.new(0.62,-5,0.55,0)
bestTimeLabel.Position = UDim2.new(0.38,6,0.42,0)
bestTimeLabel.BackgroundTransparency = 1
bestTimeLabel.Text = "--:--.---  |  ---"
bestTimeLabel.Font = Enum.Font.GothamBlack
bestTimeLabel.TextColor3 = C_GREEN
bestTimeLabel.TextSize = 12
bestTimeLabel.TextXAlignment = Enum.TextXAlignment.Left
bestTimeLabel.Parent = lapPanel

-- ─── RIGHT-SIDE TIMING TOWER ─────────────────────────────────
towerGui = Instance.new("ScreenGui")
towerGui.Name = "F125_Tower"
towerGui.ResetOnSpawn = false
towerGui.DisplayOrder = 10
towerGui.Parent = playerGui

towerConfig = {
	posX        = 1,
	offsetX     = -160,
	posY        = 0,
	offsetY     = 12,
	headerColor = C_RED,
	titleText   = "SPA-GLOBAL-IDIM-ENGLISH",
	visible     = true,
	hudMasterVisible = true,  -- [SPAV4] Master HUD visibility (Q key), without a new local
}

towerContainer = Instance.new("Frame")
towerContainer.Name = "TowerContainer"
towerContainer.Size = UDim2.new(0, TOWER_WIDTH, 0, 30)
towerContainer.Position = UDim2.new(towerConfig.posX, towerConfig.offsetX, towerConfig.posY, towerConfig.offsetY)
towerContainer.BackgroundTransparency = 1
towerContainer.ClipsDescendants = false
towerContainer.Visible = towerConfig.visible
towerContainer.ZIndex = 2  -- [SPAV4] Rows and names ABOVE the white background (towerBgBottom)
towerContainer.Parent = towerGui

towerLayout = Instance.new("UIListLayout")
towerLayout.SortOrder = Enum.SortOrder.LayoutOrder
towerLayout.Padding = UDim.new(0, 2)
towerLayout.Parent = towerContainer

-- External visual background WITHOUT moving the original tower
towerBgTop = Instance.new("ImageLabel")
towerBgTop.Name = "TowerBgTop"
towerBgTop.Size = UDim2.new(0, TOWER_WIDTH, 0, 44)
towerBgTop.Position = UDim2.new(towerConfig.posX, towerConfig.offsetX, towerConfig.posY, towerConfig.offsetY - 46)
towerBgTop.BackgroundColor3 = Color3.fromRGB(255,255,255)
towerBgTop.BackgroundTransparency = 0
towerBgTop.Image = "rbxassetid://70836470072887"
towerBgTop.ScaleType = Enum.ScaleType.Fit
towerBgTop.BorderSizePixel = 0
towerBgTop.ZIndex = 1
towerBgTop.Parent = towerGui
_bgTopCorner = Instance.new("UICorner")
_bgTopCorner.CornerRadius = UDim.new(0,6)
_bgTopCorner.Parent = towerBgTop

towerBgBottom = Instance.new("Frame")
towerBgBottom.Name = "TowerBgBottom"
towerBgBottom.Size = UDim2.new(0, TOWER_WIDTH, 0, TOWER_HEADER_H)
towerBgBottom.Position = UDim2.new(towerConfig.posX, towerConfig.offsetX, towerConfig.posY, towerConfig.offsetY - 2)
towerBgBottom.BackgroundColor3 = Color3.fromRGB(255,255,255)
towerBgBottom.BackgroundTransparency = 0.75
towerBgBottom.BorderSizePixel = 0
towerBgBottom.ZIndex = 0  -- [SPAV4] Behind driver names (no white overlay above them)
towerBgBottom.Parent = towerGui
_bgBottomCorner = Instance.new("UICorner")
_bgBottomCorner.CornerRadius = UDim.new(0,6)
_bgBottomCorner.Parent = towerBgBottom

local _towerBgState = {}
RunService.Heartbeat:Connect(function()
	local contentH = towerLayout.AbsoluteContentSize.Y
	local tw = mround(TOWER_WIDTH * TOWER_SCALE)
	local topPos = UDim2.new(towerConfig.posX, towerConfig.offsetX, towerConfig.posY, towerConfig.offsetY - 46)
	local bottomH = math.max(0, contentH + 2)
	local bottomPos = UDim2.new(towerConfig.posX, towerConfig.offsetX, towerConfig.posY, towerConfig.offsetY - 2)
	local topVisible = towerConfig.visible and towerConfig.hudMasterVisible
	local bottomVisible = topVisible and bottomH > 0
	if _towerBgState.tw ~= tw or _towerBgState.topPos ~= topPos then
		towerBgTop.Size = UDim2.new(0, tw, 0, 44); towerBgTop.Position = topPos
		_towerBgState.tw = tw; _towerBgState.topPos = topPos
	end
	if _towerBgState.topVisible ~= topVisible then towerBgTop.Visible = topVisible; _towerBgState.topVisible = topVisible end
	if _towerBgState.bottomH ~= bottomH or _towerBgState.bottomPos ~= bottomPos then
		towerBgBottom.Size = UDim2.new(0, tw, 0, bottomH); towerBgBottom.Position = bottomPos
		_towerBgState.bottomH = bottomH; _towerBgState.bottomPos = bottomPos
	end
	if _towerBgState.bottomVisible ~= bottomVisible then towerBgBottom.Visible = bottomVisible; _towerBgState.bottomVisible = bottomVisible end
end)

-- ─── ORIGINAL TOWER HEADER ──────────────────────────────────
-- Created AFTER towerContainer so it can reference it.
-- Configured at the end of tower setup (see setupTowerBanner below)
towerHeader = Instance.new("Frame")
towerHeader.Size = UDim2.new(1,0,0,TOWER_HEADER_H)
towerHeader.BackgroundColor3 = towerConfig.headerColor
towerHeader.BorderSizePixel = 0
towerHeader.LayoutOrder = 0
towerHeader.Parent = towerContainer
thc = Instance.new("UICorner"); thc.CornerRadius = UDim.new(0,3); thc.Parent = towerHeader

towerHeaderText = Instance.new("TextLabel")
towerHeaderText.Name = "TowerLapText"
towerHeaderText.Size = UDim2.new(0.75,0,1,0)
towerHeaderText.Position = UDim2.new(0,8,0,0)
towerHeaderText.BackgroundTransparency = 1
towerHeaderText.Text = "LAP 0/" .. MAX_LAPS
towerHeaderText.Font = Enum.Font.GothamBlack
towerHeaderText.TextColor3 = C_WHITE
towerHeaderText.TextSize = 12
towerHeaderText.TextXAlignment = Enum.TextXAlignment.Left
towerHeaderText.Parent = towerHeader

liveDot = Instance.new("Frame")
liveDot.Size = UDim2.new(0,8,0,8)
liveDot.Position = UDim2.new(1,-26,0.5,-4)
liveDot.BackgroundColor3 = C_WHITE
liveDot.BorderSizePixel = 0
liveDot.Parent = towerHeader
liveDotC = Instance.new("UICorner"); liveDotC.CornerRadius = UDim.new(1,0); liveDotC.Parent = liveDot

liveTxt = Instance.new("TextLabel")
liveTxt.Size = UDim2.new(0,20,1,0)
liveTxt.Position = UDim2.new(1,-20,0,0)
liveTxt.BackgroundTransparency = 1
liveTxt.Text = "●"
liveTxt.Font = Enum.Font.GothamBold
liveTxt.TextColor3 = C_WHITE
liveTxt.TextTransparency = 0.3
liveTxt.TextSize = 9
liveTxt.Parent = towerHeader

towerRows    = {}
towerRowData = {}
-- [SPAV4] Master HUD visibility flag lives in towerConfig (no new local)



local function applyTowerConfig()
	towerContainer.Position = UDim2.new(towerConfig.posX, towerConfig.offsetX, towerConfig.posY, towerConfig.offsetY)
	towerContainer.Visible = towerConfig.visible
	towerHeader.BackgroundColor3 = towerConfig.headerColor
end

local function applyTowerScale()
	local rh = mround(TOWER_ROW_H  * TOWER_SCALE)
	local hh = mround(TOWER_HEADER_H * TOWER_SCALE)
	local tw = mround(TOWER_WIDTH  * TOWER_SCALE)
	local ts = mclamp(mround(12 * TOWER_SCALE), 9, 22)
	local ns = mclamp(mround(11 * TOWER_SCALE), 8, 20)
	local ps = mclamp(mround(14 * TOWER_SCALE), 10, 24)
	local ls = mclamp(mround(10 * TOWER_SCALE), 8, 18)

	towerContainer.Size = UDim2.new(0, tw, 0, 30)
	towerHeader.Size    = UDim2.new(1, 0, 0, hh)
	towerHeaderText.TextSize = ts

	for uid, row in pairs(towerRows) do
		if not row or not row.Parent then
			towerRows[uid] = nil
			towerRowData[uid] = nil
			continue
		end
		row.Size = UDim2.new(1,0,0,rh)
		local tb = row:FindFirstChild("TeamBar")
		if tb then tb.Size = UDim2.new(0, mround(4*TOWER_SCALE), 1, 0) end
		local posFrame = row:FindFirstChild("PosFrame")
		if posFrame then
			posFrame.Size = UDim2.new(0, mround(26*TOWER_SCALE), 1, 0)
			local pt = posFrame:FindFirstChild("Pos")
			if pt then pt.TextSize = ps end
		end
		local playerImg = row:FindFirstChild("PlayerImg")
		if playerImg then
			local _imgSize = mround(rh * 0.8)
			playerImg.Size     = UDim2.new(0, _imgSize, 0, _imgSize)
			playerImg.Position = UDim2.new(0, mround(34*TOWER_SCALE), 0.5, -mround(_imgSize/2))
		end
		local nameTxt = row:FindFirstChild("Name")
		if nameTxt then
			nameTxt.Size     = UDim2.new(0.42, 0, 1, 0)
			nameTxt.Position = UDim2.new(0, mround(34*TOWER_SCALE) + mround(rh*0.8) + 4, 0, 0)
			nameTxt.TextSize = ns
		end
		local lapTxt = row:FindFirstChild("Lap")
		if lapTxt then lapTxt.TextSize = ls end
	end
	towerConfig.offsetX = -tw
	applyTowerConfig()
end

local function animTowerRow(uid, newPos, oldPos)
	local rd = towerRowData[uid]
	if not rd then return end
	local row    = towerRows[uid]
	local arrow  = rd.arrowLbl
	if not arrow or not arrow.Parent or not row or not row.Parent then
		towerRows[uid] = nil
		towerRowData[uid] = nil
		return
	end

	if newPos < oldPos then
		arrow.Text       = "▲"
		arrow.TextColor3 = C_F1_GREEN_LT
		TweenService:Create(row, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(0, 40, 15)}):Play()
		task.delay(1.2, function()
			if arrow and arrow.Parent then
				arrow.Text = ""
				TweenService:Create(row, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = C_BG2}):Play()
			end
		end)
	elseif newPos > oldPos then
		arrow.Text       = "▼"
		arrow.TextColor3 = C_RED
		TweenService:Create(row, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(40, 5, 5)}):Play()
		task.delay(1.2, function()
			if arrow and arrow.Parent then
				arrow.Text = ""
				TweenService:Create(row, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = C_BG2}):Play()
			end
		end)
	end
end

local function getOrCreateTowerRow(uid, name, pos)
	if towerRows[uid] and towerRows[uid].Parent and towerRowData[uid] then return towerRows[uid] end
	if towerRows[uid] then safeDestroyGui(towerRows[uid]) end
	towerRows[uid] = nil
	towerRowData[uid] = nil
	local rh = mround(TOWER_ROW_H * TOWER_SCALE)
	local ns = mclamp(mround(11 * TOWER_SCALE), 8, 20)
	local ps = mclamp(mround(14 * TOWER_SCALE), 10, 24)
	local ls = mclamp(mround(10 * TOWER_SCALE), 8, 18)

	local row = Instance.new("Frame")
	row.Name            = "Row_" .. uid
	row.Size            = UDim2.new(1, 0, 0, rh)
	row.BackgroundColor3= C_BG2
	row.BorderSizePixel = 0
	row.LayoutOrder     = pos
	row.Parent          = towerContainer

	local colorBar = Instance.new("Frame")
	colorBar.Name            = "TeamBar"
	colorBar.Size            = UDim2.new(0, mround(4 * TOWER_SCALE), 1, 0)
	colorBar.BackgroundColor3= C_WHITE
	colorBar.BorderSizePixel = 0
	colorBar.Parent          = row

	local posFrame = Instance.new("Frame")
	posFrame.Name            = "PosFrame"
	posFrame.Size            = UDim2.new(0, mround(26*TOWER_SCALE), 1, 0)
	posFrame.Position        = UDim2.new(0, 4, 0, 0)
	posFrame.BackgroundColor3= C_WHITE
	posFrame.BorderSizePixel = 0
	posFrame.Parent          = row
	local posFrameC = Instance.new("UICorner"); posFrameC.CornerRadius = UDim.new(0,2); posFrameC.Parent = posFrame

	local posTxt = Instance.new("TextLabel")
	posTxt.Name            = "Pos"
	posTxt.Size            = UDim2.new(1, 0, 1, 0)
	posTxt.BackgroundTransparency = 1
	posTxt.Text            = tostring(pos)
	posTxt.Font            = Enum.Font.GothamBlack
	posTxt.TextColor3      = C_BG
	posTxt.TextSize        = ps
	posTxt.Parent          = posFrame

	local arrowLbl = Instance.new("TextLabel")
	arrowLbl.Name            = "Arrow"
	arrowLbl.Size            = UDim2.new(0, 10, 1, 0)
	arrowLbl.Position        = UDim2.new(0, mround(30*TOWER_SCALE), 0, 0)
	arrowLbl.BackgroundTransparency = 1
	arrowLbl.Text            = ""
	arrowLbl.Font            = Enum.Font.GothamBold
	arrowLbl.TextSize        = 9
	arrowLbl.TextColor3      = C_F1_GREEN_LT
	arrowLbl.Parent          = row

	local nameTxt = Instance.new("TextLabel")
	nameTxt.Name            = "Name"
	nameTxt.Size            = UDim2.new(0.42, 0, 1, 0)
	nameTxt.Position        = UDim2.new(0, mround(34*TOWER_SCALE) + mround(rh*0.8) + 4, 0, 0)
	nameTxt.BackgroundTransparency = 1
	nameTxt.Text            = supper(ssub(name, 1, 8))
	nameTxt.Font            = Enum.Font.GothamBold
	nameTxt.TextColor3      = C_WHITE
	nameTxt.TextSize        = ns
	nameTxt.TextXAlignment  = Enum.TextXAlignment.Left
	nameTxt.Parent          = row

	local lapTxt = Instance.new("TextLabel")
	lapTxt.Name            = "Lap"
	lapTxt.Size            = UDim2.new(0.3, 0, 1, 0)
	lapTxt.Position        = UDim2.new(0.7, 0, 0, 0)
	lapTxt.BackgroundTransparency = 1
	lapTxt.Text            = "L0"
	lapTxt.Font            = Enum.Font.GothamBold
	lapTxt.TextColor3      = C_GRAY
	lapTxt.TextSize        = ls
	lapTxt.TextXAlignment  = Enum.TextXAlignment.Right
	lapTxt.Parent          = row

	-- Driver image on the right side of the row
	local playerImg = Instance.new("ImageLabel")
	playerImg.Name                    = "PlayerImg"
	local _imgSize = mround(rh * 0.8)
	playerImg.Size                    = UDim2.new(0, _imgSize, 0, _imgSize)
	playerImg.Position                = UDim2.new(0, mround(34*TOWER_SCALE), 0.5, -mround(_imgSize/2))
	playerImg.BackgroundTransparency  = 1
	playerImg.BorderSizePixel         = 0
	playerImg.ZIndex                  = 5
	playerImg.ScaleType               = Enum.ScaleType.Fit
	local _pcd = customPlayerData[uid]
	playerImg.Image = (_pcd and _pcd.imageId and _pcd.imageId ~= "") and ("rbxassetid://".._pcd.imageId) or ""
	playerImg.Parent                  = row

	local padding = Instance.new("UIPadding")
	padding.PaddingRight = UDim.new(0, 6)
	padding.Parent       = row

	towerRows[uid]    = row
	towerRowData[uid] = {
		lastPos  = pos,
		arrowLbl = arrowLbl,
		teamBar  = colorBar,
		posFrame = posFrame,
		posTxt   = posTxt,
		nameTxt  = nameTxt,
		lapTxt   = lapTxt,
		lastName = nameTxt.Text,
		lastLap  = lapTxt.Text,
		lastPosNum = pos,
	}
	return row
end

-- ─── MAIN PANEL ─────────────────────────────────────────────
mainGui = Instance.new("ScreenGui")
mainGui.Name = "SPA_PANEL"
mainGui.ResetOnSpawn = false
mainGui.DisplayOrder = 50
mainGui.Parent = playerGui

floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 54, 0, 54)
floatBtn.Position = UDim2.new(0, 14, 0.5, -27)
floatBtn.BackgroundColor3 = C_RED
floatBtn.Text = "SPA"
floatBtn.TextColor3 = C_WHITE
floatBtn.Font = Enum.Font.GothamBlack
floatBtn.TextSize = 13
floatBtn.BorderSizePixel = 0
floatBtn.Parent = mainGui
fbc = Instance.new("UICorner"); fbc.CornerRadius = UDim.new(0,4); fbc.Parent = floatBtn

fbLine = Instance.new("Frame")
fbLine.Size = UDim2.new(1,0,0,3)
fbLine.Position = UDim2.new(0,0,1,-3)
fbLine.BackgroundColor3 = C_WHITE
fbLine.BackgroundTransparency = 0.5
fbLine.BorderSizePixel = 0
fbLine.Parent = floatBtn

mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.78, 0, 0.72, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = C_BG
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = mainGui
mfc = Instance.new("UICorner"); mfc.CornerRadius = UDim.new(0,6); mfc.Parent = mainFrame
Glass.registerModal(mainFrame)

topAccent = Instance.new("Frame")
topAccent.Size = UDim2.new(1,0,0,3)
topAccent.BackgroundColor3 = C_RED
topAccent.BorderSizePixel = 0
topAccent.Parent = mainFrame

titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1,0,0,38)
titleBar.Position = UDim2.new(0,0,0,3)
titleBar.BackgroundColor3 = C_BG2
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

titleTxt = Instance.new("TextLabel")
titleTxt.Size = UDim2.new(0.7,0,1,0)
titleTxt.Position = UDim2.new(0,14,0,0)
titleTxt.BackgroundTransparency = 1
titleTxt.Text = "SPA-GLOBAL-IDIM-ENGLISH  —  RACE CONTROL"
titleTxt.Font = Enum.Font.GothamBlack
titleTxt.TextColor3 = C_WHITE
titleTxt.TextSize = 14
titleTxt.TextXAlignment = Enum.TextXAlignment.Left
titleTxt.Parent = titleBar

closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,32,0,28)
closeBtn.Position = UDim2.new(1,-38,0,5)
closeBtn.BackgroundColor3 = C_RED
closeBtn.Text = "✕"
closeBtn.TextColor3 = C_WHITE
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar
cbc = Instance.new("UICorner"); cbc.CornerRadius = UDim.new(0,3); cbc.Parent = closeBtn

-- ─── TABS ──────────────────────────────────────────────────────
tabs = {"VUELTAS", "BOXES", "FAST LAPS", "ONBOARD", "FIA", "CONFIG", "CHOQUES", "ANÁLISIS", "LLANTAS", "SANCIONES", "RACE CONTROL", "LAPS CONTROL"}
tabButtons = {}
tabFrames  = {}
currentTab = "VUELTAS"

-- ═══ SPA_RaceControl · LEVEL 2 ═══════════════════════════════
-- [RACE CONTROL] Lightweight log of events already detected by SPA.
-- Does not recalculate laps, positions, incidents or telemetry.
SPA_RaceControl = {
	events = {},
	MAX_EVENTS = 200,
	nextId = 0,
	rebuildFn = nil,
	onEventFn = nil,
	lastPositions = {},
	pendingPositions = {},
	rejoiningPositions = {},
	POSITION_DEBOUNCE = 0.75,
	suppressNextPositionChange = false,
}

function SPA_RaceControl:AddEvent(eventType, data)
	local ok, event = pcall(function()
		data = type(data) == "table" and data or {}
		self.nextId += 1
		local item = {
			id = self.nextId,
			type = tostring(eventType or "EVENT"),
			timestamp = tick(),
			clockText = os.date("%H:%M:%S"),
		}
		for key, value in pairs(data) do
			if key ~= "id" and key ~= "timestamp" and key ~= "clockText" then item[key] = value end
		end
		tinsert(self.events, 1, item)
		while #self.events > self.MAX_EVENTS do table.remove(self.events) end
		if self.onEventFn then pcall(self.onEventFn, item) end
		return item
	end)
	if ok then return event end
	warn("[SPA_RaceControl] Could not log event:", event)
	return nil
end

function SPA_RaceControl:ObserveStandings(order)
	if RACE_STATE ~= "RACE" then
		self.lastPositions = {}; self.pendingPositions = {}; self.rejoiningPositions = {}
		return
	end
	local incompleteRoster = false
	for _, pl in ipairs(Players:GetPlayers()) do
		if not pl.Character or not pl.Character:FindFirstChild("HumanoidRootPart") then
			incompleteRoster = true
			self.rejoiningPositions[pl.UserId] = true
		end
	end
	local positions = {}
	local publicPos = 0
	for _, uid in ipairs(order or {}) do
		if Players:GetPlayerByUserId(uid) and not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid] then
			publicPos += 1
			positions[uid] = publicPos
		end
	end
	if incompleteRoster then
		-- Do not compress positions or confirm changes while a driver respawns.
		self.pendingPositions = {}
		return
	end
	if self.suppressNextPositionChange then
		self.lastPositions = positions
		self.pendingPositions = {}
		self.suppressNextPositionChange = false
		return
	end
	for uid in pairs(self.lastPositions) do
		if not positions[uid] then
			-- Disappearance/respawn: do not count rejoining as an overtake.
			self.lastPositions[uid] = nil
			self.pendingPositions[uid] = nil
		end
	end
	local now = tick()
	for uid, newPos in pairs(positions) do
		local oldPos = self.lastPositions[uid]
		if self.rejoiningPositions[uid] then
			self.lastPositions[uid] = newPos
			self.pendingPositions[uid] = nil
			self.rejoiningPositions[uid] = nil
			continue
		end
		if oldPos and oldPos ~= newPos then
			local pending = self.pendingPositions[uid]
			if pending and pending.position == newPos then
				if now - pending.since >= self.POSITION_DEBOUNCE then
					local pl = Players:GetPlayerByUserId(uid)
					self:AddEvent("POSITION", {
						category = "CARRERA", severity = "INFO", uid = uid,
						name = pl and getDisplayName(pl) or ("UID " .. tostring(uid)),
						fromPosition = oldPos, toPosition = newPos,
						title = "↕ POSITION CHANGE",
						description = sformat("P%d → P%d", oldPos, newPos),
					})
					if newPos < oldPos then OVERTAKE_COUNT[uid] = (OVERTAKE_COUNT[uid] or 0) + (oldPos - newPos) end
					self.lastPositions[uid] = newPos
					self.pendingPositions[uid] = nil
				end
			else
				self.pendingPositions[uid] = { position = newPos, since = now }
			end
		else
			self.pendingPositions[uid] = nil
			if not oldPos then self.lastPositions[uid] = newPos end
		end
	end
end

-- ─── VERTICAL iOS SIDEBAR (translucent black) ────────────────
-- titleBar occupies y=3 h=38 → sidebar starts at y=41
-- [SPAV4 MOBILE FIX] ScrollingFrame → scrollable tabs on mobile/small screens
tabBar = Instance.new("ScrollingFrame")
tabBar.Name = "TabSidebar"
tabBar.Size = UDim2.new(0, 106, 1, -41)
tabBar.Position = UDim2.new(0, 0, 0, 41)
tabBar.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
tabBar.BackgroundTransparency = 0.04
tabBar.BorderSizePixel = 0
tabBar.ZIndex = 3
tabBar.ScrollBarThickness = 2
tabBar.ScrollBarImageColor3 = C_RED
tabBar.AutomaticCanvasSize = Enum.AutomaticSize.Y
tabBar.CanvasSize = UDim2.new(0, 0, 0, 0)
tabBar.ScrollingDirection = Enum.ScrollingDirection.Y
tabBar.Parent = mainFrame
do
	Instance.new("UICorner", tabBar).CornerRadius = UDim.new(0, 6)
end

-- Right-side sidebar divider
tabSep = Instance.new("Frame")
tabSep.Size = UDim2.new(0, 1, 1, -41)
tabSep.Position = UDim2.new(0, 106, 0, 41)
tabSep.BackgroundColor3 = Color3.fromRGB(255,255,255)
tabSep.BackgroundTransparency = 0.88
tabSep.BorderSizePixel = 0
tabSep.Parent = mainFrame

tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Vertical
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding = UDim.new(0, 1)
tabLayout.Parent = tabBar

tabIcons = {
	["VUELTAS"]   = "🏁",
	["BOXES"]     = "🔧",
	["FAST LAPS"] = "⚡",
	["ONBOARD"]   = "📷",
	["FIA"]       = "🔵",
	["CONFIG"]    = "⚙",
	["CHOQUES"]   = "💥",
	["ANÁLISIS"]  = "🔍",
	["LLANTAS"]   = "🏎",
	["SANCIONES"] = "🚩",
	["RACE CONTROL"] = "📡",
	["LAPS CONTROL"] = "🏁",
}

for i, tabName in ipairs(tabs) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 38)
	btn.BackgroundColor3 = tabName == currentTab and C_RED or Color3.fromRGB(0,0,0)
	btn.BackgroundTransparency = tabName == currentTab and 0.0 or 0.6
	btn.Text = (tabIcons[tabName] or "") .. "  " .. (SPA_ENGLISH_LABELS[tabName] or tabName)
	btn.TextColor3 = tabName == currentTab and C_WHITE or C_GRAY
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 10
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.BorderSizePixel = 0
	btn.LayoutOrder = i
	btn.ZIndex = 4
	btn.Parent = tabBar
	tabButtons[tabName] = btn
	do
		local _bp = Instance.new("UIPadding"); _bp.PaddingLeft = UDim.new(0,10); _bp.Parent = btn
	end

	-- Indicator: red stripe on the RIGHT of the active button
	local indicator = Instance.new("Frame")
	indicator.Name = "Indicator"
	indicator.Size = UDim2.new(0, 3, 1, 0)
	indicator.Position = UDim2.new(1, -3, 0, 0)
	indicator.BackgroundColor3 = tabName == currentTab and C_RED or Color3.fromRGB(0,0,0)
	indicator.BackgroundTransparency = tabName == currentTab and 0 or 1
	indicator.BorderSizePixel = 0
	indicator.ZIndex = 5
	indicator.Parent = btn

	-- Content area: RIGHT of the sidebar (x=110, y=41)
	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, -114, 1, -49)
	frame.Position = UDim2.new(0, 110, 0, 41)
	frame.BackgroundTransparency = 1
	frame.Visible = tabName == currentTab
	frame.Parent = mainFrame
	tabFrames[tabName] = frame

	btn.MouseButton1Click:Connect(function()
		currentTab = tabName
		for name, f in pairs(tabFrames) do
			f.Visible = name == currentTab
			local isActive = name == currentTab
			tabButtons[name].BackgroundColor3 = isActive and C_RED or Color3.fromRGB(0,0,0)
			tabButtons[name].BackgroundTransparency = isActive and 0.0 or 0.6
			tabButtons[name].TextColor3 = isActive and C_WHITE or C_GRAY
			local ind = tabButtons[name]:FindFirstChild("Indicator")
			if ind then
				ind.BackgroundColor3 = isActive and C_RED or Color3.fromRGB(0,0,0)
				ind.BackgroundTransparency = isActive and 0 or 1
			end
		end
	end)
end

-- ─── SCROLL HELPER ─────────────────────────────────────────────
local function createScrollingList(parent)
	local scroll = Instance.new("ScrollingFrame")
	scroll.Size                 = UDim2.new(1, 0, 1, 0)
	scroll.BackgroundColor3     = C_BG
	scroll.BorderSizePixel      = 0
	-- No AutomaticCanvasSize: unreliable in executors.
	-- Use the UIListLayout's AbsoluteContentSize directly.
	scroll.CanvasSize           = UDim2.new(0, 0, 0, 0)
	scroll.ScrollingDirection   = Enum.ScrollingDirection.Y
	scroll.ScrollBarThickness   = 10
	scroll.ScrollBarImageColor3 = C_ORANGE
	scroll.ElasticBehavior      = Enum.ElasticBehavior.Always
	scroll.Parent = parent

	local layout = Instance.new("UIListLayout")
	layout.Padding   = UDim.new(0, 2)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent    = scroll

	-- Synchronize the canvas WHENEVER its contents change
	local function _syncCanvas()
		scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 24)
	end
	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(_syncCanvas)
	task.defer(_syncCanvas)  -- First sync on the next frame (contents have rendered)

	return scroll, layout
end

-- ═══ RACE CONTROL UI · incremental timeline ═════════════════
local function setupRaceControlUI()
	local frame = tabFrames["RACE CONTROL"]
	if not frame then return end
	local state = { filter = "TODOS", rows = {}, detail = nil }
	local header = Instance.new("Frame")
	header.Size = UDim2.new(1, 0, 0, 52); header.BackgroundColor3 = C_BG2
	header.BorderSizePixel = 0; header.Parent = frame
	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(0.55, 0, 0, 20); title.Position = UDim2.new(0, 10, 0, 3)
	title.BackgroundTransparency = 1; title.Text = "SPA-GLOBAL-IDIM-ENGLISH"
	title.Font = Enum.Font.GothamBlack; title.TextSize = 12; title.TextColor3 = C_WHITE
	title.TextXAlignment = Enum.TextXAlignment.Left; title.Parent = header
	local status = Instance.new("TextLabel")
	status.Size = UDim2.new(0.95, -20, 0, 22); status.Position = UDim2.new(0, 10, 0, 26)
	status.BackgroundTransparency = 1; status.Font = Enum.Font.GothamBold; status.TextSize = 11
	status.TextColor3 = C_GREEN; status.TextXAlignment = Enum.TextXAlignment.Left; status.Parent = header

	local filters = {"TODOS", "CARRERA", "QUALY", "INCIDENTES", "SANCIONES", "BOXES", "FLAGS"}
	local filterBar = Instance.new("Frame")
	filterBar.Size = UDim2.new(1, 0, 0, 30); filterBar.Position = UDim2.new(0, 0, 0, 54)
	filterBar.BackgroundTransparency = 1; filterBar.Parent = frame
	local filterLayout = Instance.new("UIListLayout")
	filterLayout.FillDirection = Enum.FillDirection.Horizontal; filterLayout.Padding = UDim.new(0, 2); filterLayout.Parent = filterBar

	local timeline = Instance.new("ScrollingFrame")
	timeline.Name = "RaceControlTimeline"; timeline.Size = UDim2.new(1, 0, 1, -88)
	timeline.Position = UDim2.new(0, 0, 0, 88); timeline.BackgroundColor3 = C_BG
	timeline.BorderSizePixel = 0; timeline.ScrollBarThickness = 8; timeline.ScrollBarImageColor3 = C_RED
	timeline.CanvasSize = UDim2.new(0, 0, 0, 0); timeline.Parent = frame
	local timelineLayout = Instance.new("UIListLayout")
	timelineLayout.Padding = UDim.new(0, 2); timelineLayout.SortOrder = Enum.SortOrder.LayoutOrder; timelineLayout.Parent = timeline
	timelineLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		timeline.CanvasSize = UDim2.new(0, 0, 0, timelineLayout.AbsoluteContentSize.Y + 12)
	end)

	local empty = Instance.new("TextLabel")
	empty.Size = UDim2.new(1, -20, 0, 40); empty.Position = UDim2.new(0, 10, 0, 8)
	empty.BackgroundTransparency = 1; empty.Text = "No events recorded."
	empty.Font = Enum.Font.GothamBold; empty.TextSize = 12; empty.TextColor3 = C_GRAY; empty.Visible = false; empty.Parent = timeline

	local detail = Instance.new("Frame")
	detail.Name = "RaceControlDetails"; detail.Size = UDim2.new(0.86, 0, 0.68, 0)
	detail.Position = UDim2.new(0.07, 0, 0.16, 0); detail.BackgroundColor3 = C_BG2
	detail.BorderSizePixel = 0; detail.Visible = false; detail.ZIndex = 20; detail.Parent = frame
	Instance.new("UICorner", detail).CornerRadius = UDim.new(0, 6)
	local detailText = Instance.new("TextLabel")
	detailText.Size = UDim2.new(1, -16, 1, -42); detailText.Position = UDim2.new(0, 8, 0, 8)
	detailText.BackgroundTransparency = 1; detailText.TextWrapped = true; detailText.TextYAlignment = Enum.TextYAlignment.Top
	detailText.Font = Enum.Font.Gotham; detailText.TextSize = 12; detailText.TextColor3 = C_WHITE
	detailText.TextXAlignment = Enum.TextXAlignment.Left; detailText.ZIndex = 21; detailText.Parent = detail
	local closeDetail = Instance.new("TextButton")
	closeDetail.Size = UDim2.new(0, 86, 0, 26); closeDetail.Position = UDim2.new(1, -94, 1, -32)
	closeDetail.BackgroundColor3 = C_RED; closeDetail.Text = "CLOSE"; closeDetail.Font = Enum.Font.GothamBold
	closeDetail.TextSize = 11; closeDetail.TextColor3 = C_WHITE; closeDetail.BorderSizePixel = 0; closeDetail.ZIndex = 21; closeDetail.Parent = detail
	closeDetail.MouseButton1Click:Connect(function() detail.Visible = false end)

	local function categoryMatches(event)
		if state.filter == "TODOS" then return true end
		if state.filter == "INCIDENTES" then return event.category == "INCIDENTES" end
		if state.filter == "SANCIONES" then return event.category == "SANCIONES" end
		if state.filter == "BOXES" then return event.category == "BOXES" end
		if state.filter == "QUALY" then return event.category == "QUALY" end
		if state.filter == "FLAGS" then return event.category == "FLAGS" end
		return event.category == "CARRERA"
	end
	local function renderEvent(event)
		if not categoryMatches(event) then return end
		local row = Instance.new("TextButton")
		row.Name = "RaceEvent_" .. tostring(event.id); row.Size = UDim2.new(1, -8, 0, 52)
		row.BackgroundColor3 = event.severity == "WARN" and Color3.fromRGB(76, 45, 10) or C_BG2
		row.BorderSizePixel = 0; row.Text = ""; row.LayoutOrder = -event.id; row.Parent = timeline
		local txt = Instance.new("TextLabel")
		txt.Size = UDim2.new(1, -16, 1, 0); txt.Position = UDim2.new(0, 8, 0, 0)
		txt.BackgroundTransparency = 1; txt.TextWrapped = true; txt.TextXAlignment = Enum.TextXAlignment.Left
		txt.Font = Enum.Font.Gotham; txt.TextSize = 11; txt.TextColor3 = C_WHITE; txt.Parent = row
		local titleText = event.title or event.type
		local description = event.description or event.name or ""
		txt.Text = ("%s\n%s  %s"):format(event.clockText or "--:--:--", titleText, description)
		row.MouseButton1Click:Connect(function()
			local lines = {titleText, "", description, "Time: " .. tostring(event.clockText or "--:--:--")}
			if event.name then table.insert(lines, "Driver: " .. tostring(event.name)) end
			if event.fromPosition then table.insert(lines, "Previous position: P" .. tostring(event.fromPosition)) end
			if event.toPosition then table.insert(lines, "New position: P" .. tostring(event.toPosition)) end
			if event.lap ~= nil then table.insert(lines, "Lap: " .. tostring(event.lap)) end
			if event.checkpoint then table.insert(lines, "Checkpoint: " .. tostring(event.checkpoint)) end
			if event.speed then table.insert(lines, "Detected speed: " .. tostring(event.speed) .. " km/h") end
			if event.limit then table.insert(lines, "Limit: " .. tostring(event.limit) .. " km/h") end
			if event.bestTime then table.insert(lines, "Best time: " .. tostring(event.bestTime)) end
			if event.type == "BOOST" then table.insert(lines, "Infringement: Boost use") end
			if event.reason then table.insert(lines, "Reason: " .. tostring(event.reason)) end
			if event.detail then table.insert(lines, "Details: " .. tostring(event.detail)) end
			detailText.Text = table.concat(lines, "\n"); detail.Visible = true
		end)
		state.rows[event.id] = row
	end
	local function clearRows()
		for _, row in pairs(state.rows) do if row and row.Parent then row:Destroy() end end
		state.rows = {}
	end
	local function rebuild()
		clearRows()
		for _, event in ipairs(SPA_RaceControl.events) do renderEvent(event) end
		empty.Visible = next(state.rows) == nil
	end
	local function updateHeader()
		local leader = "---"; local order = CURRENT_STANDINGS_ORDER or {}
		for _, uid in ipairs(order) do if not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid] then local pl = Players:GetPlayerByUserId(uid); if pl then leader = getDisplayName(pl) end; break end end
		local laps = 0
		for _, uid in ipairs(order) do if lapData[uid] then laps = mmax(laps, lapData[uid].lapsMade or 0) end end
		status.Text = (ENABLE_VSC and "🟡 VSC" or "🟢 GREEN FLAG") .. "    LAP " .. tostring(laps) .. " / " .. tostring(MAX_LAPS) .. "    LEADER: " .. leader
	end
	for _, filterName in ipairs(filters) do
		local b = Instance.new("TextButton"); b.Size = UDim2.new(1/#filters, -2, 1, 0); b.BackgroundColor3 = filterName == state.filter and C_RED or C_BG2
		b.Text = SPA_ENGLISH_LABELS[filterName] or filterName; b.Font = Enum.Font.GothamBold; b.TextSize = 9; b.TextColor3 = C_WHITE; b.BorderSizePixel = 0; b.Parent = filterBar
		b.MouseButton1Click:Connect(function() state.filter = filterName; for _, child in ipairs(filterBar:GetChildren()) do if child:IsA("TextButton") then child.BackgroundColor3 = child == b and C_RED or C_BG2 end end; rebuild() end)
	end
	SPA_RaceControl.rebuildFn = rebuild; SPA_RaceControl.updateHeaderFn = updateHeader; SPA_RaceControl.onEventFn = function(event) renderEvent(event); empty.Visible = next(state.rows) == nil; updateHeader() end
	updateHeader(); rebuild()
end

-- ─── UI HELPERS ────────────────────────────────────────────────
local function makeSectionHeader(parent, text, order, bgColor, textColor)
	local h = Instance.new("Frame")
	h.Size = UDim2.new(1,0,0,22)
	h.BackgroundColor3 = bgColor or C_DARKRED
	h.BorderSizePixel = 0
	h.LayoutOrder = order
	h.Parent = parent
	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1,-12,1,0)
	lbl.Position = UDim2.new(0,10,0,0)
	lbl.BackgroundTransparency = 1
	lbl.Text = text
	lbl.Font = Enum.Font.GothamBlack
	lbl.TextColor3 = textColor or C_WHITE
	lbl.TextSize = 11
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Parent = h
end

local function makeVueltasRow(parent, order, pos, p)
	local uid = p.UserId
	local ld  = lapData[uid]     or {lapsMade=0}
	local pd2 = pitData[uid]     or {pitStopsMade=0}
	local fld = fastLapData[uid] or {}
	local displayName = getDisplayName(p) .. (FIA_EXCLUDED[uid] and "  [FIA]" or "")
	local nameCol     = FIA_EXCLUDED[uid] and C_BLUE or getNameColor(p)

	local topRow = Instance.new("Frame")
	topRow.Size = UDim2.new(1,0,0,30)
	topRow.BackgroundColor3 = order%2==0 and C_BG2 or C_BG
	topRow.BorderSizePixel = 0
	topRow.LayoutOrder = order*10
	topRow.Parent = parent

	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(0,3,1,0)
	bar.BackgroundColor3 = Color3.fromHSV((order*0.13)%1, 0.85, 1)
	bar.BorderSizePixel = 0
	bar.Parent = topRow

	local posLbl = Instance.new("TextLabel")
	posLbl.Name = "PosLabel"
	posLbl.Size = UDim2.new(0,28,1,0)
	posLbl.Position = UDim2.new(0,6,0,0)
	posLbl.BackgroundTransparency = 1
	posLbl.Text = "P"..pos
	posLbl.Font = Enum.Font.GothamBlack
	posLbl.TextColor3 = C_RED
	posLbl.TextSize = 13
	posLbl.TextXAlignment = Enum.TextXAlignment.Left
	posLbl.Parent = topRow

	local nameLbl = Instance.new("TextLabel")
	nameLbl.Name = "NameLabel"
	nameLbl.Size = UDim2.new(0.48,0,1,0)
	nameLbl.Position = UDim2.new(0,38,0,0)
	nameLbl.BackgroundTransparency = 1
	nameLbl.Text = displayName
	nameLbl.Font = Enum.Font.GothamBold
	nameLbl.TextColor3 = nameCol
	nameLbl.TextSize = 12
	nameLbl.TextXAlignment = Enum.TextXAlignment.Left
	nameLbl.Parent = topRow

	local lapCountLbl = Instance.new("TextLabel")
	lapCountLbl.Size = UDim2.new(0.38,-8,1,0)
	lapCountLbl.Position = UDim2.new(0.6,0,0,0)
	lapCountLbl.BackgroundTransparency = 1
	lapCountLbl.Text = sformat("LAP %d/%d", ld.lapsMade or 0, MAX_LAPS)
	lapCountLbl.Font = Enum.Font.GothamBold
	lapCountLbl.TextColor3 = (ld.lapsMade or 0)==MAX_LAPS and C_YELLOW or C_WHITE
	lapCountLbl.TextSize = 12
	lapCountLbl.TextXAlignment = Enum.TextXAlignment.Right
	lapCountLbl.Parent = topRow
	local rp1 = Instance.new("UIPadding"); rp1.PaddingRight = UDim.new(0,8); rp1.Parent = topRow

	local btnRow = Instance.new("Frame")
	btnRow.Size = UDim2.new(1,0,0,26)
	btnRow.BackgroundColor3 = order%2==0 and Color3.fromRGB(14,14,20) or Color3.fromRGB(10,10,16)
	btnRow.BorderSizePixel = 0
	btnRow.LayoutOrder = order*10+1
	btnRow.Parent = parent

	local btnLayout = Instance.new("UIListLayout")
	btnLayout.FillDirection = Enum.FillDirection.Horizontal
	btnLayout.Padding = UDim.new(0,4)
	btnLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	btnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	btnLayout.Parent = btnRow

	local function makeResetBtn(txt, bgColor, callback)
		local b = Instance.new("TextButton")
		b.Size = UDim2.new(0,90,0,20)
		b.BackgroundColor3 = bgColor
		b.Text = txt
		b.Font = Enum.Font.GothamBold
		b.TextColor3 = C_WHITE
		b.TextSize = 10
		b.BorderSizePixel = 0
		b.Parent = btnRow
		local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,3); bc.Parent = b
		b.MouseButton1Click:Connect(callback)
		return b
	end

	makeResetBtn("↺ LAPS", C_DARKRED, function()
		lapData[uid] = {lapsMade=0, lastLapTouch=0}
		fastLapData[uid] = {bestTime=nil, lastStartTime=nil, currentLapStarted=false}
		if vueltasRowCache[uid] then
			local lc = vueltasRowCache[uid].lapLbl
			if lc then
				lc.Text      = sformat("LAP 0/%d", MAX_LAPS)
				lc.TextColor3= C_WHITE
			end
		end
	end)
	makeResetBtn("↺ PIT STOPS", Color3.fromRGB(80,40,0), function()
		pitData[uid] = {status="En Pista", pitStopsMade=0, lastPitTouch=0}
		if boxesRowCache[uid] then
			local rightLbl = boxesRowRefs[uid] and boxesRowRefs[uid].rightLbl
			if rightLbl then
				rightLbl.Text      = sformat("PIT 0/%d", MAX_PITS)
				rightLbl.TextColor3= C_WHITE
			end
		end
	end)
	makeResetBtn("↺ TIME", Color3.fromRGB(0,70,30), function()
		if fastLapData[uid] then
			fastLapData[uid].bestTime = nil
			fastLapData[uid].currentLapStarted = false
			fastLapData[uid].lastStartTime = nil
		end
		if fastLapsRowCache[uid] then
			local rightLbl = fastLapsRowRefs[uid] and fastLapsRowRefs[uid].rightLbl
			if rightLbl then
				rightLbl.Text      = "NO TIME"
				rightLbl.TextColor3= C_GRAY
			end
		end
	end)

	lapCountLbl.Name = "LapCount"
	vueltasRowCache[uid] = {topRow = topRow, btnRow = btnRow, posLbl = posLbl, nameLbl = nameLbl, lapLbl = lapCountLbl}
end

-- ─── SCROLL / PANEL VARIABLES ───────────────────────────────
vueltasScroll   = nil
boxesScroll     = nil
fastLapsScroll  = nil
onboardScroll   = nil
nameConfigPanel = nil
configScroll    = nil
sancionesScroll = nil

-- ══════════════════════════════════════════════════════════════
-- ═══  _setupUI1  ══════════════════════════════════════════════
-- ══════════════════════════════════════════════════════════════
function _setupUI1()  -- [SPAV4] Global: frees registers in the main scope
	vueltasScroll,  _ = createScrollingList(tabFrames["VUELTAS"])
	boxesScroll,    _ = createScrollingList(tabFrames["BOXES"])
	fastLapsScroll, _ = createScrollingList(tabFrames["FAST LAPS"])
	onboardScroll,  _ = createScrollingList(tabFrames["ONBOARD"])
	local fiaScroll,_  = createScrollingList(tabFrames["FIA"])
	configScroll,   _ = createScrollingList(tabFrames["CONFIG"])
	sancionesScroll, _ = createScrollingList(tabFrames["SANCIONES"])
	setupRaceControlUI()
	-- [SPAV4] configScroll inherits thickness and color from createScrollingList

	-- Name settings panel
	nameConfigPanel = Instance.new("Frame")
	nameConfigPanel.Size = UDim2.new(1,0,0,0)
	nameConfigPanel.AutomaticSize = Enum.AutomaticSize.Y
	nameConfigPanel.BackgroundTransparency = 1
	nameConfigPanel.LayoutOrder = 0
	nameConfigPanel.Parent = vueltasScroll

	local nameConfigHeader = Instance.new("TextButton")
	nameConfigHeader.Size = UDim2.new(1,0,0,26)
	nameConfigHeader.BackgroundColor3 = Color3.fromRGB(0,80,160)
	nameConfigHeader.Text = "✏  CUSTOM NAMES AND COLORS  ▼"
	nameConfigHeader.Font = Enum.Font.GothamBold
	nameConfigHeader.TextColor3 = C_WHITE
	nameConfigHeader.TextSize = 11
	nameConfigHeader.BorderSizePixel = 0
	nameConfigHeader.LayoutOrder = 0
	nameConfigHeader.Parent = nameConfigPanel
	local nhc = Instance.new("UICorner"); nhc.CornerRadius = UDim.new(0,3); nhc.Parent = nameConfigHeader

	local nameConfigBody = Instance.new("Frame")
	nameConfigBody.Size = UDim2.new(1,0,0,0)
	nameConfigBody.AutomaticSize = Enum.AutomaticSize.Y
	nameConfigBody.BackgroundColor3 = Color3.fromRGB(12,12,20)
	nameConfigBody.BorderSizePixel = 0
	nameConfigBody.LayoutOrder = 1
	nameConfigBody.Visible = false
	nameConfigBody.Parent = nameConfigPanel
	local bodyLayout = Instance.new("UIListLayout")
	bodyLayout.Padding = UDim.new(0,2)
	bodyLayout.SortOrder = Enum.SortOrder.LayoutOrder
	bodyLayout.Parent = nameConfigBody

	nameConfigHeader.MouseButton1Click:Connect(function()
		nameConfigBody.Visible = not nameConfigBody.Visible
		nameConfigHeader.Text = nameConfigBody.Visible
			and "✏  CUSTOM NAMES AND COLORS  ▲"
			or  "✏  CUSTOM NAMES AND COLORS  ▼"
	end)

	local COLOR_PALETTE = {
		{name="WHITE",   color=Color3.fromRGB(255,255,255)},
		{name="RED",     color=Color3.fromRGB(230,0,0)},
		{name="BLUE",     color=Color3.fromRGB(0,120,255)},
		{name="GREEN",    color=Color3.fromRGB(0,210,90)},
		{name="YELLOW", color=Color3.fromRGB(255,200,0)},
		{name="ORANGE",  color=Color3.fromRGB(255,130,0)},
		{name="PURPLE",   color=Color3.fromRGB(160,0,220)},
		{name="CYAN",     color=Color3.fromRGB(0,220,220)},
		{name="PINK",     color=Color3.fromRGB(255,80,180)},
		{name="GRAY",     color=Color3.fromRGB(160,160,170)},
	}

	local function buildNameConfigRows()
		for _, c in ipairs(nameConfigBody:GetChildren()) do
			if c:IsA("Frame") then c:Destroy() end
		end
		for i, plr in ipairs(Players:GetPlayers()) do
			local uid = plr.UserId
			local cd  = customPlayerData[uid] or {name="", color=C_WHITE}

			local row = Instance.new("Frame")
			row.Size = UDim2.new(1,0,0,50)
			row.BackgroundColor3 = i%2==0 and C_BG2 or C_BG
			row.BorderSizePixel = 0
			row.LayoutOrder = i
			row.Parent = nameConfigBody

			local realLbl = Instance.new("TextLabel")
			realLbl.Size = UDim2.new(1,-8,0,18)
			realLbl.Position = UDim2.new(0,6,0,2)
			realLbl.BackgroundTransparency = 1
			realLbl.Text = "👤 " .. plr.Name
			realLbl.Font = Enum.Font.GothamBold
			realLbl.TextColor3 = C_GRAY
			realLbl.TextSize = 11
			realLbl.TextXAlignment = Enum.TextXAlignment.Left
			realLbl.Parent = row

			local nameBox = Instance.new("TextBox")
			nameBox.Size = UDim2.new(0.55,0,0,24)
			nameBox.Position = UDim2.new(0,6,0,20)
			nameBox.BackgroundColor3 = Color3.fromRGB(30,30,45)
			nameBox.BorderSizePixel = 0
			nameBox.Font = Enum.Font.GothamBold
			nameBox.TextColor3 = cd.color or C_WHITE
			nameBox.TextSize = 12
			nameBox.Text = cd.name or ""
			nameBox.PlaceholderText = "Name..."
			nameBox.ClearTextOnFocus = false
			nameBox.TextXAlignment = Enum.TextXAlignment.Left
			nameBox.Parent = row
			local nbc = Instance.new("UICorner"); nbc.CornerRadius = UDim.new(0,3); nbc.Parent = nameBox
			local nbp = Instance.new("UIPadding"); nbp.PaddingLeft = UDim.new(0,4); nbp.Parent = nameBox

			local colorIdx = 1
			if cd.color then
				for ci, opt in ipairs(COLOR_PALETTE) do
					if opt.color == cd.color then colorIdx = ci; break end
				end
			end

			local colorBtn = Instance.new("TextButton")
			colorBtn.Size = UDim2.new(0.38,-8,0,24)
			colorBtn.Position = UDim2.new(0.58,4,0,20)
			colorBtn.BackgroundColor3 = COLOR_PALETTE[colorIdx].color
			colorBtn.Text = COLOR_PALETTE[colorIdx].name
			colorBtn.Font = Enum.Font.GothamBold
			colorBtn.TextColor3 = Color3.fromRGB(0,0,0)
			colorBtn.TextSize = 10
			colorBtn.BorderSizePixel = 0
			colorBtn.Parent = row
			local cbc3 = Instance.new("UICorner"); cbc3.CornerRadius = UDim.new(0,3); cbc3.Parent = colorBtn

			nameBox.FocusLost:Connect(function()
				if not customPlayerData[uid] then customPlayerData[uid] = {name="", color=C_WHITE} end
				customPlayerData[uid].name = nameBox.Text
			end)

			colorBtn.MouseButton1Click:Connect(function()
				colorIdx = colorIdx % #COLOR_PALETTE + 1
				local opt = COLOR_PALETTE[colorIdx]
				colorBtn.BackgroundColor3 = opt.color
				colorBtn.Text = opt.name
				if not customPlayerData[uid] then customPlayerData[uid] = {name="", color=C_WHITE, imageId=""} end
				customPlayerData[uid].color = opt.color
				nameBox.TextColor3 = opt.color
			end)

			-- ─── DRIVER IMAGE ID FIELD (displayed next to the tower) ─────
			row.Size = UDim2.new(1, 0, 0, 78)

			local imgIdLbl = Instance.new("TextLabel")
			imgIdLbl.Size           = UDim2.new(0.36, 0, 0, 20)
			imgIdLbl.Position       = UDim2.new(0, 6, 0, 52)
			imgIdLbl.BackgroundTransparency = 1
			imgIdLbl.Text           = "🖼 Image ID:"
			imgIdLbl.Font           = Enum.Font.GothamBold
			imgIdLbl.TextColor3     = C_GRAY
			imgIdLbl.TextSize       = 10
			imgIdLbl.TextXAlignment = Enum.TextXAlignment.Left
			imgIdLbl.Parent         = row

			local imgIdBox = Instance.new("TextBox")
			imgIdBox.Size           = UDim2.new(0.57, -6, 0, 20)
			imgIdBox.Position       = UDim2.new(0.37, 2, 0, 52)
			imgIdBox.BackgroundColor3 = Color3.fromRGB(28, 28, 42)
			imgIdBox.BorderSizePixel  = 0
			imgIdBox.Font             = Enum.Font.GothamBold
			imgIdBox.TextColor3       = C_YELLOW
			imgIdBox.TextSize         = 10
			local _icd = customPlayerData[uid]
			imgIdBox.Text             = (_icd and _icd.imageId) or ""
			imgIdBox.PlaceholderText  = "e.g. 107605669230122"
			imgIdBox.ClearTextOnFocus = false
			imgIdBox.TextXAlignment   = Enum.TextXAlignment.Left
			imgIdBox.Parent           = row
			Instance.new("UICorner", imgIdBox).CornerRadius = UDim.new(0, 3)
			local _ibPad = Instance.new("UIPadding"); _ibPad.PaddingLeft = UDim.new(0,4); _ibPad.Parent = imgIdBox

			local imgPreview = Instance.new("ImageLabel")
			imgPreview.Size             = UDim2.new(0, 20, 0, 20)
			imgPreview.Position         = UDim2.new(1, -24, 0, 52)
			imgPreview.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
			imgPreview.BorderSizePixel  = 0
			imgPreview.ScaleType        = Enum.ScaleType.Fit
			imgPreview.Image            = (_icd and _icd.imageId and _icd.imageId ~= "") and ("rbxassetid://".._icd.imageId) or ""
			imgPreview.Parent           = row
			Instance.new("UICorner", imgPreview).CornerRadius = UDim.new(0, 3)

			imgIdBox.FocusLost:Connect(function()
				local rawId = imgIdBox.Text:gsub("%D", "")
				imgIdBox.Text = rawId
				if not customPlayerData[uid] then customPlayerData[uid] = {name="", color=C_WHITE, imageId=""} end
				customPlayerData[uid].imageId = rawId
				imgPreview.Image = rawId ~= "" and ("rbxassetid://"..rawId) or ""
				-- Update the image in the tower row in real time
				local tRow = towerRows[uid]
				if tRow then
					local pImg = tRow:FindFirstChild("PlayerImg")
					if pImg then
						pImg.Image = rawId ~= "" and ("rbxassetid://"..rawId) or ""
					end
				end
			end)

			-- ── PER-DRIVER LIMITS ───────────────────────────────────────
			row.Size = UDim2.new(1, 0, 0, 188)  -- Expanded for 4 extra limits
			local function mkLimL(txt, yp)
				local l=Instance.new("TextLabel"); l.Size=UDim2.new(0.35,0,0,18); l.Position=UDim2.new(0,6,0,yp)
				l.BackgroundTransparency=1; l.Text=txt; l.Font=Enum.Font.GothamBold
				l.TextColor3=C_GRAY; l.TextSize=9; l.TextXAlignment=Enum.TextXAlignment.Left; l.Parent=row; return l
			end
			-- 1) Speed limit
			mkLimL("🚗 Speed limit km/h", 80)
			local spdBox=Instance.new("TextBox"); spdBox.Size=UDim2.new(0.28,0,0,18); spdBox.Position=UDim2.new(0.36,2,0,80)
			spdBox.BackgroundColor3=Color3.fromRGB(28,28,42); spdBox.BorderSizePixel=0
			spdBox.Font=Enum.Font.GothamBold; spdBox.TextColor3=C_YELLOW; spdBox.TextSize=10
			local _cdA=customPlayerData[uid]
			spdBox.Text=(_cdA and _cdA.speedLimit) and tostring(_cdA.speedLimit) or ""
			spdBox.PlaceholderText=tostring(SPEED_LIMIT); spdBox.ClearTextOnFocus=false
			spdBox.TextXAlignment=Enum.TextXAlignment.Left; spdBox.Parent=row
			Instance.new("UICorner",spdBox).CornerRadius=UDim.new(0,3)
			spdBox.FocusLost:Connect(function()
				local n=tonumber(spdBox.Text:gsub("%D",""))
				if not customPlayerData[uid] then customPlayerData[uid]={name="",color=C_WHITE,imageId=""} end
				customPlayerData[uid].speedLimit=n; spdBox.Text=n and tostring(n) or ""
			end)
			-- 2) Maximum turbo
			mkLimL("⚡ Max turbo", 102)
			local trbIdx=1
			do local _cdB=customPlayerData[uid]
				if _cdB and _cdB.maxTurbo then
					for ci,n in ipairs(SPA_Telemetry.TURBO_CYCLE) do if n==_cdB.maxTurbo then trbIdx=ci;break end end
				end
			end
			local trbBtn=Instance.new("TextButton"); trbBtn.Size=UDim2.new(0.60,0,0,18); trbBtn.Position=UDim2.new(0.36,2,0,102)
			trbBtn.BackgroundColor3=Color3.fromRGB(30,30,45); trbBtn.BorderSizePixel=0
			trbBtn.Font=Enum.Font.GothamBold; trbBtn.TextColor3=C_ORANGE; trbBtn.TextSize=10
			trbBtn.Text=SPA_Telemetry.TURBO_CYCLE[trbIdx]; trbBtn.Parent=row
			Instance.new("UICorner",trbBtn).CornerRadius=UDim.new(0,3)
			trbBtn.MouseButton1Click:Connect(function()
				trbIdx=trbIdx%#SPA_Telemetry.TURBO_CYCLE+1
				trbBtn.Text=SPA_Telemetry.TURBO_CYCLE[trbIdx]
				if not customPlayerData[uid] then customPlayerData[uid]={name="",color=C_WHITE,imageId=""} end
				customPlayerData[uid].maxTurbo=trbIdx==1 and nil or SPA_Telemetry.TURBO_CYCLE[trbIdx]
			end)
			-- 3) Maximum suspension
			mkLimL("🔧 Max suspension", 124)
			local spIdx=1
			do local _cdC=customPlayerData[uid]
				if _cdC and _cdC.maxSusp then
					for ci,n in ipairs(SPA_Telemetry.SUSP_CYCLE) do if n==_cdC.maxSusp then spIdx=ci;break end end
				end
			end
			local spBtn=Instance.new("TextButton"); spBtn.Size=UDim2.new(0.60,0,0,18); spBtn.Position=UDim2.new(0.36,2,0,124)
			spBtn.BackgroundColor3=Color3.fromRGB(30,30,45); spBtn.BorderSizePixel=0
			spBtn.Font=Enum.Font.GothamBold; spBtn.TextColor3=C_GREEN; spBtn.TextSize=10
			spBtn.Text=SPA_Telemetry.SUSP_CYCLE[spIdx]; spBtn.Parent=row
			Instance.new("UICorner",spBtn).CornerRadius=UDim.new(0,3)
			spBtn.MouseButton1Click:Connect(function()
				spIdx=spIdx%#SPA_Telemetry.SUSP_CYCLE+1
				spBtn.Text=SPA_Telemetry.SUSP_CYCLE[spIdx]
				if not customPlayerData[uid] then customPlayerData[uid]={name="",color=C_WHITE,imageId=""} end
				customPlayerData[uid].maxSusp=spIdx==1 and nil or SPA_Telemetry.SUSP_CYCLE[spIdx]
			end)
			-- 4) Maximum drift
			mkLimL("💨 Max drift", 146)
			local drfBox=Instance.new("TextBox"); drfBox.Size=UDim2.new(0.28,0,0,18); drfBox.Position=UDim2.new(0.36,2,0,146)
			drfBox.BackgroundColor3=Color3.fromRGB(28,28,42); drfBox.BorderSizePixel=0
			drfBox.Font=Enum.Font.GothamBold; drfBox.TextColor3=C_YELLOW; drfBox.TextSize=10
			local _cdD=customPlayerData[uid]
			drfBox.Text=(_cdD and _cdD.maxDrift) and tostring(_cdD.maxDrift) or ""
			drfBox.PlaceholderText="e.g. 2.5"; drfBox.ClearTextOnFocus=false
			drfBox.TextXAlignment=Enum.TextXAlignment.Left; drfBox.Parent=row
			Instance.new("UICorner",drfBox).CornerRadius=UDim.new(0,3)
			drfBox.FocusLost:Connect(function()
				local n=tonumber(drfBox.Text)
				if not customPlayerData[uid] then customPlayerData[uid]={name="",color=C_WHITE,imageId=""} end
				customPlayerData[uid].maxDrift=n; drfBox.Text=n and tostring(n) or ""
			end)
		end

		local clearRow = Instance.new("Frame")
		clearRow.Size = UDim2.new(1,0,0,30)
		clearRow.BackgroundColor3 = C_BG
		clearRow.BorderSizePixel = 0
		clearRow.LayoutOrder = 999
		clearRow.Parent = nameConfigBody

		local clearBtn = Instance.new("TextButton")
		clearBtn.Size = UDim2.new(1,-12,0.8,0)
		clearBtn.Position = UDim2.new(0,6,0.1,0)
		clearBtn.BackgroundColor3 = C_DARKRED
		clearBtn.Text = "↺  CLEAR ALL CUSTOM NAMES"
		clearBtn.Font = Enum.Font.GothamBlack
		clearBtn.TextColor3 = C_WHITE
		clearBtn.TextSize = 11
		clearBtn.BorderSizePixel = 0
		clearBtn.Parent = clearRow
		local clc = Instance.new("UICorner"); clc.CornerRadius = UDim.new(0,3); clc.Parent = clearBtn
		clearBtn.MouseButton1Click:Connect(function()
			customPlayerData = {}
			buildNameConfigRows()
		end)
	end

	buildNameConfigRows()
	Players.PlayerAdded:Connect(function()   task.wait(1);   buildNameConfigRows() end)
	Players.PlayerRemoving:Connect(function() task.wait(0.2); buildNameConfigRows() end)

	-- FIA list
	local function buildFIAList()
		for _, c in ipairs(fiaScroll:GetChildren()) do
			if c:IsA("Frame") or c:IsA("TextLabel") then c:Destroy() end
		end

		local infoRow = Instance.new("Frame")
		infoRow.Size = UDim2.new(1,0,0,36)
		infoRow.BackgroundColor3 = C_BLUE
		infoRow.BorderSizePixel = 0
		infoRow.LayoutOrder = 0
		infoRow.Parent = fiaScroll
		local infoC = Instance.new("UICorner"); infoC.CornerRadius = UDim.new(0,4); infoC.Parent = infoRow
		local infoLbl = Instance.new("TextLabel")
		infoLbl.Size = UDim2.new(1,-10,1,0)
		infoLbl.Position = UDim2.new(0,8,0,0)
		infoLbl.BackgroundTransparency = 1
		infoLbl.Text = "🔵 EXCLUDED — laps and times do not count"
		infoLbl.Font = Enum.Font.GothamBold
		infoLbl.TextColor3 = C_WHITE
		infoLbl.TextSize = 11
		infoLbl.TextXAlignment = Enum.TextXAlignment.Left
		infoLbl.TextWrapped = true
		infoLbl.Parent = infoRow

		local allPlayers = Players:GetPlayers()
		for i, plr in ipairs(allPlayers) do
			local uid        = plr.UserId
			local isExcluded = FIA_EXCLUDED[uid] == true

			local row = Instance.new("Frame")
			row.Name            = "FIA_ROW_"..uid
			row.Size            = UDim2.new(1,0,0,38)
			row.BackgroundColor3= isExcluded and Color3.fromRGB(20,30,55) or C_BG2
			row.BorderSizePixel = 0
			row.LayoutOrder     = i
			row.Parent          = fiaScroll

			local sideBar = Instance.new("Frame")
			sideBar.Size            = UDim2.new(0,4,1,0)
			sideBar.BackgroundColor3= isExcluded and C_BLUE or C_GRAY
			sideBar.BorderSizePixel = 0
			sideBar.Parent          = row

			local nameLbl = Instance.new("TextLabel")
			nameLbl.Size = UDim2.new(0.55,0,1,0)
			nameLbl.Position = UDim2.new(0,14,0,0)
			nameLbl.BackgroundTransparency = 1
			nameLbl.Text = plr.Name
			nameLbl.Font = Enum.Font.GothamBold
			nameLbl.TextColor3 = isExcluded and C_BLUE or C_WHITE
			nameLbl.TextSize = 13
			nameLbl.TextXAlignment = Enum.TextXAlignment.Left
			nameLbl.Parent = row

			local statusLbl = Instance.new("TextLabel")
			statusLbl.Size = UDim2.new(0.22,0,1,0)
			statusLbl.Position = UDim2.new(0.38,0,0,0)
			statusLbl.BackgroundTransparency = 1
			statusLbl.Text = isExcluded and "EXCLUDED" or "ACTIVE"
			statusLbl.Font = Enum.Font.GothamBold
			statusLbl.TextColor3 = isExcluded and C_BLUE or C_GREEN
			statusLbl.TextSize = 11
			statusLbl.TextXAlignment = Enum.TextXAlignment.Center
			statusLbl.Parent = row

			local toggleBtn = Instance.new("TextButton")
			toggleBtn.Size = UDim2.new(0.28,-8,0.7,0)
			toggleBtn.Position = UDim2.new(0.72,0,0.15,0)
			toggleBtn.BackgroundColor3 = isExcluded and C_BLUE or Color3.fromRGB(0,100,40)
			toggleBtn.Text = isExcluded and "REINSTATE" or "EXCLUDE"
			toggleBtn.Font = Enum.Font.GothamBold
			toggleBtn.TextColor3 = C_WHITE
			toggleBtn.TextSize = 10
			toggleBtn.BorderSizePixel = 0
			toggleBtn.Parent = row
			local bc = Instance.new("UICorner"); bc.CornerRadius = UDim.new(0,3); bc.Parent = toggleBtn
			local rp = Instance.new("UIPadding"); rp.PaddingRight = UDim.new(0,6); rp.Parent = row

				toggleBtn.MouseButton1Click:Connect(function()
					FIA_EXCLUDED[uid] = not FIA_EXCLUDED[uid]
					SPA_RaceControl.suppressNextPositionChange = true
				SPA_RaceControl:AddEvent(FIA_EXCLUDED[uid] and "FIA_EXCLUDED" or "FIA_INCLUDED", { category = "FLAGS", severity = "INFO", uid = uid, name = getDisplayName(plr), title = "🔵 FIA", description = getDisplayName(plr) .. (FIA_EXCLUDED[uid] and " excluded from the standings" or " reinstated in the standings") })
				buildFIAList()
			end)
		end

		local clearRow = Instance.new("Frame")
		clearRow.Size = UDim2.new(1,0,0,38)
		clearRow.BackgroundColor3 = C_BG
		clearRow.BorderSizePixel = 0
		clearRow.LayoutOrder = 999
		clearRow.Parent = fiaScroll

		local clearBtn = Instance.new("TextButton")
		clearBtn.Size = UDim2.new(1,-16,0.75,0)
		clearBtn.Position = UDim2.new(0,8,0.125,0)
		clearBtn.BackgroundColor3 = C_DARKRED
		clearBtn.Text = "↺  REINSTATE ALL DRIVERS"
		clearBtn.Font = Enum.Font.GothamBlack
		clearBtn.TextColor3 = C_WHITE
		clearBtn.TextSize = 12
		clearBtn.BorderSizePixel = 0
		clearBtn.Parent = clearRow
		local cc = Instance.new("UICorner"); cc.CornerRadius = UDim.new(0,3); cc.Parent = clearBtn
		clearBtn.MouseButton1Click:Connect(function()
			FIA_EXCLUDED = {}
			SPA_RaceControl.suppressNextPositionChange = true
			buildFIAList()
		end)
	end

	buildFIAList()
	Players.PlayerAdded:Connect(function() task.wait(1); buildFIAList() end)
	Players.PlayerRemoving:Connect(function(pl) FIA_EXCLUDED[pl.UserId] = nil; task.wait(0.1); buildFIAList() end)
	tabButtons["FIA"].MouseButton1Click:Connect(function() buildFIAList() end)

	-- ONBOARD / SPECTATING
	local SPECT_FOV                   = 70
	local SPECT_HORIZONTAL_DISTANCE   = 60
	local SPECT_MIN_HEIGHT            = 20
	local SPECT_MAX_HEIGHT            = 150
	local SPECT_REPOSITION_THRESHOLD  = 160

	local spectCameraOffset       = Vector3.new(0,0,0)
	local spectFixedCameraPosition= Vector3.new(0,0,0)
	local spectLastPosition       = Vector3.new(0,0,0)
	local spectTotalDistance      = 0
	local spectCurrentIndex       = 1

	local spectHUD = Instance.new("TextLabel")
	spectHUD.Name = "SpectTrackingHUD"
	spectHUD.Size = UDim2.new(0,280,0,32)
	spectHUD.Position = UDim2.new(0.5,-140,1,-80)
	spectHUD.BackgroundColor3 = Color3.fromRGB(20,20,20)
	spectHUD.BackgroundTransparency = 0.3
	spectHUD.BorderSizePixel = 0
	spectHUD.Font = Enum.Font.GothamBold
	spectHUD.Text = ""
	spectHUD.TextColor3 = Color3.fromRGB(255,120,0)
	spectHUD.TextScaled = true
	spectHUD.Visible = false
	spectHUD.Parent = mainGui
	local spectHUDCorner = Instance.new("UICorner",spectHUD)
	spectHUDCorner.CornerRadius = UDim.new(0,8)

	local function spectRandomizeOffset()
		local angle   = mrandom() * 2 * mpi
		local height  = mrandom(SPECT_MIN_HEIGHT, SPECT_MAX_HEIGHT)
		local offsetXZ= Vector3.new(math.cos(angle)*SPECT_HORIZONTAL_DISTANCE, 0, math.sin(angle)*SPECT_HORIZONTAL_DISTANCE)
		spectCameraOffset = offsetXZ + Vector3.new(0,height,0)
	end

	local function spectatePlayerFunc(plr, index)
		if not plr or plr == player then return end
		if not isSpectating then
			isSpectating = true
			originalCameraType    = Camera.CameraType
			originalCameraSubject = Camera.CameraSubject

			spectRenderConnection = RunService.RenderStepped:Connect(function()
				if not (isSpectating and targetSpectPlayer) then return end
				if not targetSpectPlayer.Parent then stopSpectatingFunc(); return end
				local char = targetSpectPlayer.Character
				if not char then stopSpectatingFunc(); return end
				local rootPart = char:FindFirstChild("HumanoidRootPart")
				if rootPart then
					local currentPos = rootPart.Position
					spectTotalDistance += (currentPos - spectLastPosition).Magnitude
					spectLastPosition   = currentPos
					if spectTotalDistance >= SPECT_REPOSITION_THRESHOLD then
						spectRandomizeOffset()
						spectFixedCameraPosition = currentPos + spectCameraOffset
						spectTotalDistance = 0
					end
					local lookAt = currentPos + Vector3.new(0,3,0)
					Camera.CFrame = CFrame.lookAt(spectFixedCameraPosition, lookAt)
				else
					stopSpectatingFunc()
				end
			end)
		end

		targetSpectPlayer = plr
		spectCurrentIndex = index or 1

		local char = plr.Character
		if not char then return end
		local rootPart = char:FindFirstChild("HumanoidRootPart")
		if not rootPart then return end

		spectRandomizeOffset()
		spectLastPosition        = rootPart.Position
		spectFixedCameraPosition = spectLastPosition + spectCameraOffset
		spectTotalDistance       = 0

		Camera.CameraType   = Enum.CameraType.Scriptable
		Camera.FieldOfView  = SPECT_FOV

		spectHUD.Text    = "📹 TRACKING: " .. plr.Name
		spectHUD.Visible = true

		for _, btn in ipairs(onboardScroll:GetChildren()) do
			if btn:IsA("TextButton") and btn.Name:match("^OB_") then
				btn.BackgroundColor3 = btn.Name == "OB_"..plr.UserId and C_RED or C_BG2
			end
		end
	end

	function stopSpectatingFunc()
		if not isSpectating then return end
		isSpectating      = false
		targetSpectPlayer = nil
		if spectRenderConnection then spectRenderConnection:Disconnect(); spectRenderConnection = nil end
		Camera.CameraType = originalCameraType or Enum.CameraType.Custom
		local myChar = player.Character
		if myChar then
			local myHum = myChar:FindFirstChildOfClass("Humanoid")
			if myHum then Camera.CameraSubject = myHum else Camera.CameraSubject = originalCameraSubject or myChar:FindFirstChild("Head") end
		else
			task.spawn(function()
				player.CharacterAdded:Wait()
				task.wait(0.5)
				local newChar = player.Character
				if newChar then
					local newHum = newChar:FindFirstChildOfClass("Humanoid")
					if newHum then Camera.CameraSubject = newHum; Camera.CameraType = Enum.CameraType.Custom end
				end
			end)
		end
		spectHUD.Visible = false
		for _, btn in ipairs(onboardScroll:GetChildren()) do
			if btn:IsA("TextButton") and btn.Name:match("^OB_") then btn.BackgroundColor3 = C_BG2 end
		end
	end

	local function cycleSpectateTarget(direction)
		if not isSpectating then return end
		local valid = {}
		for _, candidate in ipairs(Players:GetPlayers()) do
			if candidate ~= player and candidate.Parent then tinsert(valid, candidate) end
		end
		if #valid == 0 then
			stopSpectatingFunc()
			return
		end

		local currentIndex = nil
		if targetSpectPlayer then
			for i, candidate in ipairs(valid) do
				if candidate == targetSpectPlayer or candidate.UserId == targetSpectPlayer.UserId then
					currentIndex = i
					break
				end
			end
		end
		local baseIndex = currentIndex or mclamp(spectCurrentIndex or 1, 1, #valid)
		local nextIndex = ((baseIndex - 1 + direction) % #valid) + 1
		spectatePlayerFunc(valid[nextIndex], nextIndex)
	end

	local function buildOnboardList()
		for _, c in ipairs(onboardScroll:GetChildren()) do
			if c:IsA("TextButton") or c:IsA("TextLabel") or c:IsA("Frame") then c:Destroy() end
		end
		makeSectionHeader(onboardScroll, "📹  TRACKING CAMERA", 0)
		local others = {}
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= player then tinsert(others, plr) end
		end
		for i, plr in ipairs(others) do
			local btn = Instance.new("TextButton")
			btn.Name = "OB_"..plr.UserId
			btn.Size = UDim2.new(1,0,0,36)
			btn.BackgroundColor3 = C_BG2
			btn.Text = ""
			btn.BorderSizePixel = 0
			btn.LayoutOrder = i
			btn.Parent = onboardScroll

			local bar = Instance.new("Frame")
			bar.Size = UDim2.new(0,3,1,0)
			bar.BackgroundColor3 = Color3.fromHSV((i*0.13)%1,0.85,1)
			bar.BorderSizePixel = 0
			bar.Parent = btn

			local nameLbl = Instance.new("TextLabel")
			nameLbl.Size = UDim2.new(0.7,0,1,0)
			nameLbl.Position = UDim2.new(0,14,0,0)
			nameLbl.BackgroundTransparency = 1
			nameLbl.Text = "▶  "..plr.Name
			nameLbl.Font = Enum.Font.GothamBold
			nameLbl.TextColor3 = C_WHITE
			nameLbl.TextSize = 13
			nameLbl.TextXAlignment = Enum.TextXAlignment.Left
			nameLbl.Parent = btn

			btn.MouseButton1Click:Connect(function() spectatePlayerFunc(plr, i) end)
		end

		local navRow = Instance.new("Frame")
		navRow.Size = UDim2.new(1,0,0,36)
		navRow.BackgroundTransparency = 1
		navRow.BorderSizePixel = 0
		navRow.LayoutOrder = 900
		navRow.Parent = onboardScroll

		local navLayout = Instance.new("UIListLayout")
		navLayout.FillDirection = Enum.FillDirection.Horizontal
		navLayout.Padding = UDim.new(0,4)
		navLayout.Parent = navRow

		local prevBtn = Instance.new("TextButton")
		prevBtn.Size = UDim2.new(0.5,-2,1,0)
		prevBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
		prevBtn.Text = "◄ PREV"
		prevBtn.Font = Enum.Font.GothamBold
		prevBtn.TextColor3 = C_WHITE
		prevBtn.TextScaled = true
		prevBtn.BorderSizePixel = 0
		prevBtn.Parent = navRow
		local prevC = Instance.new("UICorner",prevBtn); prevC.CornerRadius = UDim.new(0,6)

		local nextBtn = Instance.new("TextButton")
		nextBtn.Size = UDim2.new(0.5,-2,1,0)
		nextBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
		nextBtn.Text = "NEXT ►"
		nextBtn.Font = Enum.Font.GothamBold
		nextBtn.TextColor3 = C_WHITE
		nextBtn.TextScaled = true
		nextBtn.BorderSizePixel = 0
		nextBtn.Parent = navRow
		local nextC = Instance.new("UICorner",nextBtn); nextC.CornerRadius = UDim.new(0,6)

		prevBtn.MouseButton1Click:Connect(function()
			cycleSpectateTarget(-1)
		end)
		nextBtn.MouseButton1Click:Connect(function()
			cycleSpectateTarget(1)
		end)

		local exitBtn = Instance.new("TextButton")
		exitBtn.Size = UDim2.new(1,0,0,40)
		exitBtn.BackgroundColor3 = C_DARKRED
		exitBtn.Text = "✕  EXIT TRACKING"
		exitBtn.Font = Enum.Font.GothamBlack
		exitBtn.TextColor3 = C_WHITE
		exitBtn.TextSize = 13
		exitBtn.BorderSizePixel = 0
		exitBtn.LayoutOrder = 999
		exitBtn.Parent = onboardScroll
		exitBtn.MouseButton1Click:Connect(stopSpectatingFunc)
	end

	buildOnboardList()
	Players.PlayerAdded:Connect(function()   task.wait(1); buildOnboardList() end)
	Players.PlayerRemoving:Connect(function(pl)
		if targetSpectPlayer == pl then stopSpectatingFunc() end
		buildOnboardList()
	end)
	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if gameProcessedEvent or not isSpectating then return end
		local focusedTextBox = UserInputService:GetFocusedTextBox()
		if focusedTextBox then return end
		if input.KeyCode == Enum.KeyCode.Left then
			cycleSpectateTarget(-1)
		elseif input.KeyCode == Enum.KeyCode.Right then
			cycleSpectateTarget(1)
		end
	end)
end


-- ════════════════════════════════════════════════════════════════
-- ███  SPA COLLISION LOG (no notifications; logging only)  ████
-- High threshold (45 Δv) captures only genuine impacts.
-- Push notifications are disabled to prevent spam.
-- ════════════════════════════════════════════════════════════════
-- [MASTER TOGGLE] Disables the ENTIRE collision and replay system.
-- Declared GLOBAL (without 'local') because the main chunk is already
-- at Luau's limit of 200 top-level locals.
-- Fully disabled by default: no distance calculations,
-- collision searches or 3D history while false.
ENABLE_CRASH_SYSTEM = false

SPA_Crash = {
	THRESHOLD     = 45,   -- minimum Δv (studs/s) — genuine heavy impacts only
	RADIUS        = 28,   -- car-to-car detection radius (studs)
	COOLDOWN_PAIR = 10,   -- seconds between events for the same pair
	COOLDOWN_WALL = 6,    -- seconds between wall events for the same driver
	MIN_SPEED     = 22,   -- minimum speed to consider an impact
	GRACE_LAP     = 5,    -- grace period in seconds after crossing the finish line
	MAX_LOG       = 60,
	prevVel   = {},
	pairCD    = {},
	wallCD    = {},
	log       = {},
	scratch   = { impacted = {}, impactedList = {}, processed = {} },
	rebuildFn = nil,
}

local function _crashInVehicle(p)
	local char = p.Character
	if not char then return false, nil end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return false, nil end
	local seat = hum.SeatPart
	if seat and (seat:IsA("VehicleSeat") or seat:IsA("Seat")) and seat.Occupant == hum then
		return true, seat
	end
	return false, nil
end

local function _crashGetVel(p)
	local inSeat, seat = _crashInVehicle(p)
	if not inSeat or not seat then return nil end
	local ok, v = pcall(function() return seat.AssemblyLinearVelocity end)
	if not ok or not v then return nil end
	return v
end

local function _crashType(velA, posA, posB)
	local dir = (posB - posA)
	if dir.Magnitude < 0.01 then return "CONTACTO" end
	dir = dir.Unit
	local vn = velA.Magnitude < 0.01 and dir or velA.Unit
	local dot = mclamp(vn:Dot(dir), -1, 1)
	local ang = math.deg(math.acos(dot))
	if ang < 35 then return "ALCANCE"
	elseif ang < 65 then return "LATERAL"
	elseif ang < 115 then return "T-BONE"
	else return "FRONTAL" end
end

local function _crashSeverity(delta)
	if delta >= 60 then return "FUERTE",   C_RED
	elseif delta >= 45 then return "MODERADO", C_ORANGE
	else return "LEVE", C_YELLOW end
end

function _setupCollisionDetection()
	local _tCrash = 0
	RunService.Heartbeat:Connect(function(dt)
		if not ENABLE_CRASH_SYSTEM then return end
		_tCrash += dt
		if _tCrash < 0.1 then return end   -- 10 Hz — less load than before (previously 20 Hz)
		_tCrash = 0
		local perfCrashStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil

		local impacted = SPA_Crash.scratch.impacted; table.clear(impacted)
		local impactedList = SPA_Crash.scratch.impactedList; table.clear(impactedList)

		for uid, st in pairs(PlayerState) do
			if FIA_EXCLUDED[uid] then continue end
			if pitData[uid] and pitData[uid].status == "En Boxes" then continue end
			local vel = (st.inVehicle and st.seat) and st.seat.AssemblyLinearVelocity or nil
			if not vel then SPA_Crash.prevVel[uid] = nil; continue end
			local prev = SPA_Crash.prevVel[uid] or vel
			local delta = (vel - prev).Magnitude
			SPA_Crash.prevVel[uid] = vel
			local speed = vel.Magnitude
			if delta < SPA_Crash.THRESHOLD then continue end
			if speed < SPA_Crash.MIN_SPEED and prev.Magnitude < SPA_Crash.MIN_SPEED then continue end
			local ld = lapData[uid]
			if ld and ld.lastLapTouch and (tick() - ld.lastLapTouch) < SPA_Crash.GRACE_LAP then continue end
			if not st.root then continue end
			impacted[uid] = { delta=delta, pos=st.position or st.root.Position, vel=vel, player=st.player }
			impactedList[#impactedList + 1] = { uid = uid, data = impacted[uid] }
		end

		local processed = SPA_Crash.scratch.processed; table.clear(processed)
		for i1, itemA in ipairs(impactedList) do
			local uid1, d1 = itemA.uid, itemA.data
			if processed[uid1] then continue end
			local paired = false
			for i2 = i1 + 1, #impactedList do
				local itemB = impactedList[i2]
				local uid2, d2 = itemB.uid, itemB.data
				if processed[uid2] then continue end
				local dist = (d1.pos - d2.pos).Magnitude
				if dist > SPA_Crash.RADIUS then continue end
				local k = uid1 < uid2 and (uid1.."_"..uid2) or (uid2.."_"..uid1)
				if SPA_Crash.pairCD[k] and (tick()-SPA_Crash.pairCD[k]) < SPA_Crash.COOLDOWN_PAIR then
					processed[uid1]=true; processed[uid2]=true; paired=true; break
				end
				SPA_Crash.pairCD[k] = tick()
				processed[uid1]=true; processed[uid2]=true; paired=true
				local tipo = _crashType(d1.vel, d1.pos, d2.pos)
				local closingSpeed = (d1.vel - d2.vel).Magnitude
				local impactMag = math.max(d1.delta, d2.delta, closingSpeed * 0.6)
				local sev, sevColor = _crashSeverity(impactMag)
				local nA = getDisplayName(d1.player)
				local nB = getDisplayName(d2.player)
				local kmhA = mfloor(d1.vel.Magnitude * 0.28 * 3.6 * CAL_FACTOR + 0.5)
				local kmhB = mfloor(d2.vel.Magnitude * 0.28 * 3.6 * CAL_FACTOR + 0.5)
				-- No push notification — logging only
				table.insert(SPA_Crash.log, 1, {
					time=os.date("%H:%M:%S"), type=tipo, sev=sev, sevColor=sevColor,
					nameA=nA, nameB=nB, speedA=kmhA, speedB=kmhB,
					delta=mfloor(math.max(d1.delta,d2.delta)), dist=mfloor(dist), wall=false,
				})
				if #SPA_Crash.log > SPA_Crash.MAX_LOG then table.remove(SPA_Crash.log) end
				SPA_RaceControl:AddEvent("CRASH", { category = "INCIDENTES", severity = "WARN", name = nA .. " ↔ " .. nB, title = "💥 INCIDENT", description = nA .. " ↔ " .. nB .. " — " .. (SPA_ENGLISH_LABELS[tipo] or tipo) .. " — ΔV " .. tostring(mfloor(impactMag)), lap = lapData[uid1] and lapData[uid1].lapsMade or 0, speed = kmhA })
				if SPA_Crash.rebuildFn then SPA_Crash.rebuildFn() end
				if sev == "LEVE" and PENALTY_CONFIG and proposeSanction then
					CRASH_LEVE_COUNT = CRASH_LEVE_COUNT or {}
					for _, uidX in ipairs({uid1, uid2}) do
						CRASH_LEVE_COUNT[uidX] = (CRASH_LEVE_COUNT[uidX] or 0) + 1
						if CRASH_LEVE_COUNT[uidX] == PENALTY_CONFIG.crashLeves then
							proposeSanction(uidX, "Accumulated minor collisions",
								("%d minor collisions (limit: %d)"):format(CRASH_LEVE_COUNT[uidX], PENALTY_CONFIG.crashLeves))
						end
					end
				end
				break
			end
			if not paired then
				processed[uid1] = true
				if SPA_Crash.wallCD[uid1] and (tick()-SPA_Crash.wallCD[uid1]) < SPA_Crash.COOLDOWN_WALL then continue end
				SPA_Crash.wallCD[uid1] = tick()
				local nA = getDisplayName(d1.player)
				local kmhA = mfloor(d1.vel.Magnitude * 0.28 * 3.6 * CAL_FACTOR + 0.5)
				local sev, sevColor = _crashSeverity(d1.delta)
				-- No push notification — logging only
				table.insert(SPA_Crash.log, 1, {
					time=os.date("%H:%M:%S"), type="MURO", sev=sev, sevColor=sevColor,
					nameA=nA, nameB=nil, speedA=kmhA, speedB=0,
					delta=mfloor(d1.delta), dist=0, wall=true,
				})
				if #SPA_Crash.log > SPA_Crash.MAX_LOG then table.remove(SPA_Crash.log) end
				SPA_RaceControl:AddEvent("CRASH", { category = "INCIDENTES", severity = "WARN", uid = uid1, name = nA, title = "💥 INCIDENT", description = nA .. " — WALL — ΔV " .. tostring(mfloor(d1.delta)), lap = lapData[uid1] and lapData[uid1].lapsMade or 0, speed = kmhA })
				if SPA_Crash.rebuildFn then SPA_Crash.rebuildFn() end
				if sev == "LEVE" and PENALTY_CONFIG and proposeSanction then
					CRASH_LEVE_COUNT = CRASH_LEVE_COUNT or {}
					CRASH_LEVE_COUNT[uid1] = (CRASH_LEVE_COUNT[uid1] or 0) + 1
					if CRASH_LEVE_COUNT[uid1] == PENALTY_CONFIG.crashLeves then
						proposeSanction(uid1, "Accumulated minor collisions",
							("%d minor collisions (limit: %d)"):format(CRASH_LEVE_COUNT[uid1], PENALTY_CONFIG.crashLeves))
					end
				end
			end
		end
		SPA_PerfMark("Crash", perfCrashStart)
	end)

	-- ── COLLISIONS tab UI ───────────────────────────────────────
	local choquesFrame = tabFrames["CHOQUES"]
	if not choquesFrame then return end

	local chScroll = Instance.new("ScrollingFrame")
	chScroll.Size=UDim2.new(1,0,1,0); chScroll.BackgroundColor3=C_BG
	chScroll.BackgroundTransparency=0.12; chScroll.BorderSizePixel=0
	chScroll.CanvasSize=UDim2.new(0,0,0,0); chScroll.ScrollingDirection=Enum.ScrollingDirection.Y
	chScroll.ScrollBarThickness=8; chScroll.ScrollBarImageColor3=C_ORANGE
	chScroll.ElasticBehavior=Enum.ElasticBehavior.Always; chScroll.Parent=choquesFrame

	local chLayout = Instance.new("UIListLayout")
	chLayout.Padding=UDim.new(0,2); chLayout.SortOrder=Enum.SortOrder.LayoutOrder
	chLayout.Parent=chScroll
	local function _syncCh()
		chScroll.CanvasSize=UDim2.new(0,0,0,chLayout.AbsoluteContentSize.Y+24)
	end
	chLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(_syncCh)
	task.defer(_syncCh)

	local function rebuildChoquesUI()
		for _, c in ipairs(chScroll:GetChildren()) do
			if c:IsA("Frame") or c:IsA("TextLabel") then c:Destroy() end
		end
		if #SPA_Crash.log == 0 then
			local lbl = Instance.new("TextLabel")
			lbl.Size=UDim2.new(1,0,0,60); lbl.BackgroundTransparency=1
			lbl.Text="No collisions recorded yet.\n(Threshold: heavy impacts ≥45 Δv)"
			lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_GRAY
			lbl.TextSize=12; lbl.LayoutOrder=1; lbl.Parent=chScroll
			return
		end
		for idx, e in ipairs(SPA_Crash.log) do
			local card = Instance.new("Frame")
			card.Size=UDim2.new(1,0,0,52); card.BackgroundColor3=idx%2==0 and C_BG2 or C_BG
			card.BackgroundTransparency=0.1; card.BorderSizePixel=0
			card.LayoutOrder=idx; card.Parent=chScroll
			local bar=Instance.new("Frame"); bar.Size=UDim2.new(0,4,1,0)
			bar.BackgroundColor3=e.sevColor; bar.BorderSizePixel=0; bar.Parent=card
			-- Time and type
			local tLbl=Instance.new("TextLabel"); tLbl.Size=UDim2.new(0,55,0,18)
			tLbl.Position=UDim2.new(0,8,0,4); tLbl.BackgroundTransparency=1
			tLbl.Text=e.time; tLbl.Font=Enum.Font.GothamBold
			tLbl.TextColor3=C_GRAY; tLbl.TextSize=10
			tLbl.TextXAlignment=Enum.TextXAlignment.Left; tLbl.Parent=card
			local tyLbl=Instance.new("TextLabel"); tyLbl.Size=UDim2.new(0,70,0,16)
			tyLbl.Position=UDim2.new(0,65,0,5); tyLbl.BackgroundTransparency=1
			tyLbl.Text=(e.wall and "🧱 WALL" or ("💥 "..(SPA_ENGLISH_LABELS[e.type] or e.type)))
			tyLbl.Font=Enum.Font.GothamBold; tyLbl.TextColor3=e.sevColor
			tyLbl.TextSize=10; tyLbl.TextXAlignment=Enum.TextXAlignment.Left; tyLbl.Parent=card
			-- Severity
			local sevLbl=Instance.new("TextLabel"); sevLbl.Size=UDim2.new(0,60,0,16)
			sevLbl.Position=UDim2.new(1,-64,0,5); sevLbl.BackgroundTransparency=1
			sevLbl.Text=SPA_ENGLISH_LABELS[e.sev] or e.sev; sevLbl.Font=Enum.Font.GothamBlack
			sevLbl.TextColor3=e.sevColor; sevLbl.TextSize=10
			sevLbl.TextXAlignment=Enum.TextXAlignment.Right; sevLbl.Parent=card
			-- Names
			local nLbl=Instance.new("TextLabel"); nLbl.Size=UDim2.new(1,-16,0,18)
			nLbl.Position=UDim2.new(0,8,0,26); nLbl.BackgroundTransparency=1
			local txt = e.nameA
			if e.nameB then txt = txt.."  ↔  "..e.nameB end
			nLbl.Text=txt; nLbl.Font=Enum.Font.GothamBold
			nLbl.TextColor3=C_WHITE; nLbl.TextSize=11
			nLbl.TextXAlignment=Enum.TextXAlignment.Left
			nLbl.TextTruncate=Enum.TextTruncate.AtEnd; nLbl.Parent=card
		end
		-- Clear button
		local clrRow=Instance.new("Frame"); clrRow.Size=UDim2.new(1,0,0,32)
		clrRow.BackgroundColor3=C_BG; clrRow.BackgroundTransparency=0.1
		clrRow.BorderSizePixel=0; clrRow.LayoutOrder=999; clrRow.Parent=chScroll
		local clrBtn=Instance.new("TextButton"); clrBtn.Size=UDim2.new(1,-16,0.75,0)
		clrBtn.Position=UDim2.new(0,8,0.125,0); clrBtn.BackgroundColor3=C_DARKRED
		clrBtn.Text="🗑  CLEAR HISTORY"; clrBtn.Font=Enum.Font.GothamBlack
		clrBtn.TextColor3=C_WHITE; clrBtn.TextSize=11; clrBtn.BorderSizePixel=0
		clrBtn.Parent=clrRow; Instance.new("UICorner",clrBtn).CornerRadius=UDim.new(0,3)
		clrBtn.MouseButton1Click:Connect(function() SPA_Crash.log={}; rebuildChoquesUI() end)
	end

	SPA_Crash.rebuildFn = rebuildChoquesUI
	rebuildChoquesUI()
end


-- ⚠️  IMPORTANT: A Roblox LocalScript cannot detect which executor
--     a player is using. This detects ANOMALOUS BEHAVIOR
--     (impossible speed, flight, teleportation) that MAY indicate
--     exploit use, but is NOT definitive proof.
-- ════════════════════════════════════════════════════════════════
SPA_Analysis = {
	SPEED_ALERT   = 340,  -- studs/s outside a vehicle before flagging (≈ 120 km/h on foot)
	TELEPORT_DIST = 220,  -- studs in 0.5s outside a vehicle = possible teleportation
	FLY_TIME      = 2.8,  -- seconds airborne outside a vehicle = possible flight/noclip
	data          = {},   -- [uid] = {maxSpeed, airTime, lastPos, lastPosTick, flags, anomalies, status}
	rebuildFn     = nil,
}

local function _analHasFlag(flags, f)
	for _, v in ipairs(flags) do if v == f then return true end end
	return false
end

function _setupAnalysisDetection()
	local function _initData(uid)
		if not SPA_Analysis.data[uid] then
			SPA_Analysis.data[uid] = {
				maxSpeed   = 0,
				airTime    = 0,
				lastPos    = nil,
				lastTick   = tick(),
				flags      = {},
				anomalies  = 0,
				status     = "NORMAL",
			}
		end
		return SPA_Analysis.data[uid]
	end

	local _tAnal = 0
	RunService.Heartbeat:Connect(function(dt)
		_tAnal += dt
		if _tAnal < 0.5 then return end
		_tAnal = 0

		local now   = tick()
		local dirty = false

		-- Build the set of active UIDs for cleanup
		local activeUids = {}
		for _, p in ipairs(Players:GetPlayers()) do activeUids[p.UserId] = true end
		for uid in pairs(SPA_Analysis.data) do
			if not activeUids[uid] then SPA_Analysis.data[uid] = nil; dirty = true end
		end

		for _, p in ipairs(Players:GetPlayers()) do
			if p == player then continue end  -- Do not analyze the local player
			local uid  = p.UserId
			local char = p.Character
			if not char then continue end
			local hrp  = char:FindFirstChild("HumanoidRootPart")
			local hum  = char:FindFirstChildOfClass("Humanoid")
			if not hrp or not hum then continue end

			local d       = _initData(uid)
			local pos     = hrp.Position
			local speed   = hrp.AssemblyLinearVelocity.Magnitude
			local seat    = hum.SeatPart
			local inVeh   = seat and (seat:IsA("VehicleSeat") or seat:IsA("Seat")) and seat.Occupant == hum

			-- ── Highest observed speed ──────────────────────────────────
			if speed > d.maxSpeed then d.maxSpeed = speed; dirty = true end

			if not inVeh then
				-- ── Flag: anomalous speed outside a vehicle ─────────────────
				if speed > SPA_Analysis.SPEED_ALERT then
					if not _analHasFlag(d.flags, "VELOCIDAD") then
						table.insert(d.flags, "VELOCIDAD"); d.anomalies += 1; dirty = true
					end
				end

				-- ── Flag: teleportation (sudden position jump) ───────────────
				if d.lastPos then
					local dist    = (pos - d.lastPos).Magnitude
					local elapsed = now - d.lastTick
					if dist > SPA_Analysis.TELEPORT_DIST and elapsed <= 0.6 then
						if not _analHasFlag(d.flags, "TELEPORT") then
							table.insert(d.flags, "TELEPORT"); d.anomalies += 1; dirty = true
						end
					end
				end

				-- ── Flag: flight / noclip (airborne outside a vehicle) ───────
				if hum.FloorMaterial == Enum.Material.Air then
					d.airTime += 0.5
				else
					d.airTime = 0
				end
				if d.airTime >= SPA_Analysis.FLY_TIME then
					if not _analHasFlag(d.flags, "VUELO") then
						table.insert(d.flags, "VUELO"); d.anomalies += 1; dirty = true
					end
				end
			else
				d.airTime = 0
			end

			d.lastPos  = pos
			d.lastTick = now

			-- ── Overall player status ───────────────────────────────────
			local prev = d.status
			if     d.anomalies == 0 then d.status = "NORMAL"
			elseif d.anomalies <= 2 then d.status = "SOSPECHOSO"
			else                         d.status = "ALERTA" end
			if d.status ~= prev then dirty = true end
		end

		if dirty and SPA_Analysis.rebuildFn then SPA_Analysis.rebuildFn() end
	end)

	-- ── ANALYSIS tab UI ─────────────────────────────────────────
	local analFrame = tabFrames["ANÁLISIS"]
	if not analFrame then return end

	local analScroll = Instance.new("ScrollingFrame")
	analScroll.Size                 = UDim2.new(1, 0, 1, 0)
	analScroll.BackgroundColor3     = C_BG
	analScroll.BorderSizePixel      = 0
	analScroll.CanvasSize           = UDim2.new(0, 0, 0, 0)
	analScroll.ScrollingDirection   = Enum.ScrollingDirection.Y
	analScroll.ScrollBarThickness   = 10
	analScroll.ScrollBarImageColor3 = C_ORANGE
	analScroll.ElasticBehavior      = Enum.ElasticBehavior.Always
	analScroll.Parent               = analFrame

	local analLayout = Instance.new("UIListLayout")
	analLayout.Padding   = UDim.new(0, 2)
	analLayout.SortOrder = Enum.SortOrder.LayoutOrder
	analLayout.Parent    = analScroll
	local function _syncAnal()
		analScroll.CanvasSize = UDim2.new(0, 0, 0, analLayout.AbsoluteContentSize.Y + 24)
	end
	analLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(_syncAnal)
	task.defer(_syncAnal)


	-- Information notice at the top of ANALYSIS
	local _analHint = Instance.new("Frame")
	_analHint.Size = UDim2.new(1, -8, 0, 28)
	_analHint.Position = UDim2.new(0, 4, 0, 2)
	_analHint.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
	_analHint.BackgroundTransparency = 0.25
	_analHint.BorderSizePixel = 0
	_analHint.ZIndex = 5
	_analHint.Parent = analFrame
	Instance.new("UICorner", _analHint).CornerRadius = UDim.new(0, 5)
	local _analHintLbl = Instance.new("TextLabel")
	_analHintLbl.Size = UDim2.new(1, -10, 1, 0)
	_analHintLbl.Position = UDim2.new(0, 8, 0, 0)
	_analHintLbl.BackgroundTransparency = 1
	_analHintLbl.Text = "ℹ️  To view collisions, you must be on a vehicle"
	_analHintLbl.Font = Enum.Font.GothamBold
	_analHintLbl.TextColor3 = Color3.fromRGB(100, 180, 255)
	_analHintLbl.TextSize = 10
	_analHintLbl.TextXAlignment = Enum.TextXAlignment.Left
	_analHintLbl.TextTruncate = Enum.TextTruncate.AtEnd
	_analHintLbl.ZIndex = 6
	_analHintLbl.Parent = _analHint

	local function rebuildAnalUI()
		-- Replays only: clear everything except UIListLayout and replay cards
		for _, c in ipairs(analScroll:GetChildren()) do
			if not c:GetAttribute("IsReplayCard") and not c:IsA("UIListLayout") then
				c:Destroy()
			end
		end
		if SPA_Replay and SPA_Replay.rebuildFn then
			SPA_Replay.rebuildFn()
		end
		-- Message shown when no events have been recorded
		local _hasCards = false
		for _, c in ipairs(analScroll:GetChildren()) do
			if c:GetAttribute("IsReplayCard") then _hasCards = true; break end
		end
		if not _hasCards then
			local _ef = Instance.new("Frame")
			_ef.Size = UDim2.new(1,0,0,70); _ef.BackgroundTransparency=1
			_ef.LayoutOrder=1; _ef.Parent=analScroll
			local _el = Instance.new("TextLabel")
			_el.Size=UDim2.new(1,-20,1,0); _el.Position=UDim2.new(0,10,0,0)
			_el.BackgroundTransparency=1
			_el.Text="📹  No contacts recorded yet.\n\nContacts are recorded automatically when two drivers in vehicles come within 35 studs of each other, or when the collision system detects an impact."
			_el.Font=Enum.Font.GothamBold; _el.TextColor3=C_GRAY
			_el.TextSize=11; _el.TextWrapped=true
			_el.TextXAlignment=Enum.TextXAlignment.Left
			_el.Parent=_ef
		end
	end

	SPA_Analysis.rebuildFn = rebuildAnalUI
	rebuildAnalUI()

	-- Periodic UI refresh (even when not dirty)
	task.spawn(function()
		while analFrame.Parent do
			task.wait(2)
			if tabFrames["ANÁLISIS"] and tabFrames["ANÁLISIS"].Visible then
				rebuildAnalUI()
			end
		end
	end)
end

-- ════════════════════════════════════════════════════════════════
-- ███  SPA TELEMETRY · TURBO · DRIFT · SUSPENSION (SPAV4)  █████
-- Globals → 0 new top-level locals.
-- ════════════════════════════════════════════════════════════════
SPA_Telemetry = {
	SUSP_LEVELS  = {{1.7,"Level 1"},{2.5,"Level 2"},{2.0,"Level 3"},{3.0,"Level 4"}},
	TURBO_LEVELS = {{11.3,"Level 0"},{27.9,"Level 1"},{44.5,"Level 2"},{61.1,"Level 3"}},
	TURBO_CYCLE  = {"No limit","Level 0","Level 1","Level 2","Level 3"},
	SUSP_CYCLE   = {"No limit","Level 1","Level 2","Level 3","Level 4"},
	TURBO_IDX    = {["Level 0"]=1,["Level 1"]=2,["Level 2"]=3,["Level 3"]=4},
	SUSP_IDX     = {["Level 1"]=1,["Level 2"]=2,["Level 3"]=3,["Level 4"]=4},
	alerts       = {},
	-- [DRIFT FIX] latestDrift[uid] = latest friction detected through real-time signals.
	-- Updated ONLY when a tire changes CustomPhysicalProperties (reactive event),
	-- avoiding static scans reading 0.6 or 1.5 depending on the physics frame.
	latestDrift  = {},
	suspCache    = {},
	turboCache   = {},
	-- [DRIFT FIX] Active connections per UID (disconnect when leaving the vehicle)
	driftConns   = {},
}

function _telGetRootModel(seat)
	if not seat then return nil end
	-- Resolve the car before map-grouping models.
	local assembly = seat.AssemblyRootPart
	local cur = seat.Parent
	local nearest
	while cur and cur ~= Workspace do
		if cur:IsA("Model") then
			nearest = nearest or cur
			if cur:FindFirstChild("Body") or cur:FindFirstChild("Wheels")
				or (assembly and assembly ~= seat and assembly:IsDescendantOf(cur)) then
				return cur
			end
		end
		cur = cur.Parent
	end
	return nearest or seat
end

function _telFormatDrift(v)
	if not v then return "N/A" end
	local s = mfloor(v * 10 + 0.5) / 10
	if s <= 0 then return "0" end
	return sformat("%.1f", s)
end

function _telGetTurbo(seat)
	local function ext(v)
		local n
		if v:IsA("NumberValue") or v:IsA("IntValue") then n = v.Value
		elseif v:IsA("StringValue") then n = tonumber(v.Value) end
		if n then
			for _, e in ipairs(SPA_Telemetry.TURBO_LEVELS) do
				if mabs(n - e[1]) <= 3 then return e[2] end
			end
		end
	end
	local root = _telGetRootModel(seat)
	if root then
		local cached = SPA_Telemetry.turboCache[root]
		if not cached or cached.invalid then
			if cached and cached.connections then for _, c in ipairs(cached.connections) do pcall(function() c:Disconnect() end) end end
			cached = { values = {}, connections = {}, invalid = false }
			for _, v in ipairs(root:GetDescendants()) do if v.Name:lower() == "turbo" then cached.values[#cached.values + 1] = v end end
			local okConn, conn = pcall(function() return root.DescendantAdded:Connect(function(v) if v.Name:lower() == "turbo" then cached.invalid = true end end) end)
			if okConn and conn then cached.connections[#cached.connections + 1] = conn end
			SPA_Telemetry.turboCache[root] = cached
		end
		for _, v in ipairs(cached.values) do if v.Parent then local r = ext(v); if r then return r end end end
	end
	for _, v in ipairs(seat:GetChildren()) do
		if v.Name:lower() == "turbo" then local r = ext(v); if r then return r end end
	end
	return "N/A"
end

function _telGetDrift(seat, uid)
	-- [DRIFT FIX] Query the reactive value first (real-time event).
	-- This value changes only when the tire ACTUALLY changes its friction,
	-- eliminating the 0.6 <-> 1.5 oscillation caused by per-frame static scans.
	if uid and SPA_Telemetry.latestDrift[uid] ~= nil then
		return _telFormatDrift(SPA_Telemetry.latestDrift[uid])
	end
	-- Fallback: static scan (before the first event or when UID is unavailable)
	local root = _telGetRootModel(seat)
	if not root then return "N/A" end
	local best, maxDev, found = 1.0, -1, false
	for _, part in ipairs(root:GetDescendants()) do
		if part:IsA("BasePart") and part.Name:lower():find("physicalwheel") then
			local ok, cpp = pcall(function() return part.CustomPhysicalProperties end)
			if ok and cpp then
				local ok2, f = pcall(function() return cpp.Friction end)
				if ok2 then
					found = true
					local dev = mabs(f - 1.0)
					if dev > maxDev then maxDev = dev; best = f end
				end
			end
		end
	end
	return found and _telFormatDrift(best) or "N/A"
end

-- [DRIFT FIX] Connect reactive friction signals for a vehicle.
-- Disconnect the UID's previous connections before creating new ones.
local function _telWatchDrift(uid, seat)
	-- Clean up previous connections
	local prevConns = SPA_Telemetry.driftConns[uid]
	if prevConns then
		for _, c in ipairs(prevConns) do pcall(function() c:Disconnect() end) end
	end
	SPA_Telemetry.driftConns[uid] = {}
	SPA_Telemetry.latestDrift[uid] = nil  -- Reset upon entering a new vehicle

	local root = _telGetRootModel(seat)
	if not root then return end
	local initialBest, initialDev = nil, -1

	for _, part in ipairs(root:GetDescendants()) do
		if part:IsA("BasePart") and part.Name:lower():find("physicalwheel") then
			local cacheKey = tostring(part) .. "_fr"
			local initFr = 1.0
			local ok, cpp = pcall(function() return part.CustomPhysicalProperties end)
			if ok and cpp then
				local ok2, f = pcall(function() return cpp.Friction end)
				if ok2 then initFr = f; local dev = mabs(f - 1.0); if dev > initialDev then initialDev = dev; initialBest = f end end
			end
			local frCache = initFr
			local sigOk, conn = pcall(function()
				return part:GetPropertyChangedSignal("CustomPhysicalProperties"):Connect(function()
					local newFr = frCache
					local ok3, cpp2 = pcall(function() return part.CustomPhysicalProperties end)
					if ok3 and cpp2 then
						local ok4, f2 = pcall(function() return cpp2.Friction end)
						if ok4 then newFr = f2 end
					end
					if mabs(newFr - frCache) > 0.001 then
						frCache = newFr
						-- [DRIFT FIX v2] Follow EXACTLY the most recently changed value,
						-- as in the reference script. Do not keep the largest deviation,
						-- which could leave 1.5 stuck after the value dropped to 0.6.
						SPA_Telemetry.latestDrift[uid] = newFr
					end
				end)
			end)
			if sigOk and conn then
				table.insert(SPA_Telemetry.driftConns[uid], conn)
			end
		end
	end
	if initialBest ~= nil then SPA_Telemetry.latestDrift[uid] = initialBest end
end

-- [DRIFT FIX] Disconnect and clear everything when leaving the vehicle
local function _telStopDrift(uid)
	local conns = SPA_Telemetry.driftConns[uid]
	if conns then
		for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
	end
	SPA_Telemetry.driftConns[uid] = nil
	SPA_Telemetry.latestDrift[uid] = nil
end

function _telGetSusp(seat)
	local root = _telGetRootModel(seat)
	if not root then return "N/A" end
	local cached = SPA_Telemetry.suspCache[root]
	if not cached or cached.invalid then
		if cached and cached.connections then for _, c in ipairs(cached.connections) do pcall(function() c:Disconnect() end) end end
		cached = { constraints = {}, connections = {}, invalid = false }
		for _, child in ipairs(root:GetDescendants()) do if child:IsA("SpringConstraint") then cached.constraints[#cached.constraints + 1] = child end end
		local okAdd, addConn = pcall(function() return root.DescendantAdded:Connect(function(obj) if obj:IsA("SpringConstraint") then cached.invalid = true end end) end)
		if okAdd and addConn then cached.connections[#cached.connections + 1] = addConn end
		local okRem, remConn = pcall(function() return root.DescendantRemoving:Connect(function(obj) if obj:IsA("SpringConstraint") then cached.invalid = true end end) end)
		if okRem and remConn then cached.connections[#cached.connections + 1] = remConn end
		SPA_Telemetry.suspCache[root] = cached
	end
	local total, count = 0, 0
	for _, child in ipairs(cached.constraints) do
		if child.Parent then
			local ok, val = pcall(function() return child.FreeLength end)
			if ok and type(val) == "number" then total += val; count += 1 end
		end
	end
	if count == 0 then return "N/A" end
	local avg = total / count
	for _, e in ipairs(SPA_Telemetry.SUSP_LEVELS) do
		if mabs(avg - e[1]) <= 0.15 then return e[2] end
	end
	return "N/A"
end


-- ════════════════════════════════════════════════════════════════
-- ███  SPA TIRES — TIRE COMPOUND SYSTEM (SPAV4)  ███████████████
-- Detect the active compound by reading TextureID from
-- "physicalwheel"/"wheel" parts in the vehicle root model.
-- Recognizes only the 6 configured IDs; ignores all others.
-- ════════════════════════════════════════════════════════════════
SPA_Tires = {
	COMPOUNDS = {
		["11262113208"] = { name = "SOFT",      icon = "🔴", color = Color3.fromRGB(230, 30,  30)  },
		["11262228611"] = { name = "FULL WET",     icon = "🔵", color = Color3.fromRGB(10,  100, 255) },
		["11262205570"] = { name = "SUPERSOFT", icon = "🟣", color = Color3.fromRGB(191, 90,  242) },
		["11262199449"] = { name = "INTERMEDIATE",   icon = "🟢", color = Color3.fromRGB(48,  209, 88)  },
		["11262217221"] = { name = "MEDIUM",        icon = "🟡", color = Color3.fromRGB(255, 214, 10)  },
		["4504219366"]  = { name = "HARD",         icon = "⚪", color = Color3.fromRGB(210, 210, 215) },
	},
	current   = {},   -- [uid] = { name, icon, color }
	log       = {},   -- change history (newest first)
	MAX_LOG      = 80,
	rebuildFn    = nil,
	-- [SPAM FIX] Time a compound must remain stable before notification
	STABLE_TIME  = 2.0,   -- seconds of stability before triggering a notification
	_stableTimer = {},    -- [uid] = {cpd=compound, since=tick()}
	scanCache   = {},     -- [root] = {at=timestamp, value=compound}
}

function _tirGetCompound(seat)
	local root = _telGetRootModel(seat)
	if not root then return nil end
	local now = tick()
	local cached = SPA_Tires.scanCache[root]
	if cached and now - cached.at < 1 then return cached.value end
	local result = nil
	for _, part in ipairs(root:GetDescendants()) do
		if result then break end
		if part:IsA("BasePart") then
			local nm = part.Name:lower()
			if nm:find("physicalwheel") or nm:find("wheel") then
				-- MeshPart with TextureID
				if part:IsA("MeshPart") and part.TextureID and part.TextureID ~= "" then
					local id = part.TextureID:match("%d+")
					if id and SPA_Tires.COMPOUNDS[id] then result = SPA_Tires.COMPOUNDS[id]; break end
				end
				-- Child Decal / Texture
				for _, child in ipairs(part:GetChildren()) do
					if (child:IsA("Decal") or child:IsA("Texture")) and child.Texture and child.Texture ~= "" then
						local id = child.Texture:match("%d+")
						if id and SPA_Tires.COMPOUNDS[id] then result = SPA_Tires.COMPOUNDS[id]; break end
					end
				end
			end
		end
	end
	SPA_Tires.scanCache[root] = { at = now, value = result }
	return result
end

function _tirLogChange(p, oldCpd, newCpd, inPit)
	local uid  = p.UserId
	local lap  = (lapData[uid] and lapData[uid].lapsMade) or 0
	table.insert(SPA_Tires.log, 1, {
		time     = os.date("%H:%M:%S"),
		name     = getDisplayName(p),
		uid      = uid,
		oldName  = oldCpd and oldCpd.name or "—",
		oldIcon  = oldCpd and oldCpd.icon or "❓",
		oldColor = oldCpd and oldCpd.color or C_GRAY,
		newName  = newCpd.name,
		newIcon  = newCpd.icon,
		newColor = newCpd.color,
		lap      = lap,
		inPit    = inPit,
	})
	if #SPA_Tires.log > SPA_Tires.MAX_LOG then table.remove(SPA_Tires.log) end
	local locStr = inPit and "PIT" or "TRACK"
	showNotification(newCpd.icon .. "  " .. getDisplayName(p) .. "  →  " .. newCpd.name .. "  [" .. locStr .. "]", newCpd.color, newCpd.icon, 164)
	if SPA_Tires.rebuildFn then SPA_Tires.rebuildFn() end
end

-- ════════════════════════════════════════════════════════════════
-- ███  SPA REPLAY — 35-stud proximity + ring buffer + 2D replay █
-- Each player has an invisible 35-stud radius.
-- If another player enters it and Δv ≥ 8 st/s, the buffer
-- for the previous 2 s is saved → view the trajectory in ANALYSIS.
-- ════════════════════════════════════════════════════════════════
SPA_Replay = {
	RADIUS     = 20,    -- [OPT] More selective radius: fewer comparisons, less lag
	BUF_SEC    = 5.0,   -- seconds of history in the ring buffer
	POST_SEC   = 3.0,   -- [POST] Seconds recorded after impact
	BUF_HZ     = 12,    -- [OPT] Fewer samples/second to reduce CPU and memory use
	MIN_DV     = 8,     -- minimum Δv to capture (includes glancing contact)
	COOLDOWN   = 3,     -- seconds between captures for the same pair
	MAX_EVENTS = 15,    -- maximum events stored in ANALYSIS
	buffers    = {},    -- [uid] → sample table {pos,vel,t}
	pairCD     = {},    -- ["uidA_uidB"] = tick() of the last capture
	events     = {},    -- list of captured events
	rebuildFn  = nil,
}

-- Push a sample into the player's buffer (simple bounded table)
function _rpBufPush(uid, pos, vel, rot)
	local b = SPA_Replay.buffers[uid]
	if not b then b = {}; SPA_Replay.buffers[uid] = b end
	local maxN = math.ceil(SPA_Replay.BUF_SEC * SPA_Replay.BUF_HZ)
	local now = tick()
	local last = b[#b]
	if last and (pos - last.pos).Magnitude < 0.03 and (vel - last.vel).Magnitude < 0.1 then
		last.t = now; last.pos = pos; last.vel = vel; last.rot = rot
		return
	end
	-- rot = vehicle rotation CFrame (without translation), for accurate replay
	b[#b + 1] = { pos = pos, vel = vel, rot = rot, t = now }
	if #b > maxN then table.remove(b, 1) end
end

-- Return a copy of the current buffer (chronological order)
function _rpBufSnap(uid)
	local src = SPA_Replay.buffers[uid]
	if not src then return {} end
	local snap = {}
	for i, s in ipairs(src) do snap[i] = s end
	return snap
end

-- Capture a contact event and store it in events
function _rpCapture(uidA, nameA, uidB, nameB, dv, posImp)
	local now = tick()
	local key = uidA < uidB and (uidA .. "_" .. uidB) or (uidB .. "_" .. uidA)
	if SPA_Replay.pairCD[key] and now - SPA_Replay.pairCD[key] < SPA_Replay.COOLDOWN then return end
	SPA_Replay.pairCD[key] = now

	-- [POST FIX] Save the PRE-impact buffer now and, after POST_SEC,
	-- append only post-impact samples to show what happened afterward.
	local impactAt = now
	local preA = _rpBufSnap(uidA)
	local preB = uidB and _rpBufSnap(uidB) or {}

	local function appendPost(preSnap, postSnap, tCut)
		if not postSnap or #postSnap == 0 then return preSnap end
		local out = {}
		for i, s in ipairs(preSnap or {}) do out[#out+1] = s end
		for _, s in ipairs(postSnap) do
			if (s.t or 0) > tCut then out[#out+1] = s end
		end
		return out
	end

	task.delay(SPA_Replay.POST_SEC, function()
		local postA = _rpBufSnap(uidA)
		local postB = uidB and _rpBufSnap(uidB) or {}
		local ev = {
			time      = os.date("%H:%M:%S"),
			nameA     = nameA,
			nameB     = nameB,
			uidA      = uidA,
			uidB      = uidB,
			dv        = mfloor(dv + 0.5),
			posImpact = posImp,
			snapA     = appendPost(preA, postA, impactAt),
			snapB     = appendPost(preB, postB, impactAt),
		}
		table.insert(SPA_Replay.events, 1, ev)
		if #SPA_Replay.events > SPA_Replay.MAX_EVENTS then table.remove(SPA_Replay.events) end
		if SPA_Replay.rebuildFn then SPA_Replay.rebuildFn() end
	end)
end


-- Clone a player's 3D car model for 3D replay
-- Same pattern as Curve Tracker: clone + disable physics + semitransparency
function _rpCloneVehicle(p)
	local inV, seat = _crashInVehicle(p)
	if not inV or not seat then return nil, nil end
	local root = _telGetRootModel(seat)
	if not root then return nil, nil end
	local ok, clone = pcall(function() return root:Clone() end)
	if not ok or not clone then return nil, nil end
	-- Remove scripts and humanoids (as in Curve Tracker)
	for _, obj in ipairs(clone:GetDescendants()) do
		if obj:IsA("BaseScript") or obj:IsA("ModuleScript") then obj:Destroy()
		elseif obj:IsA("Humanoid") then obj:Destroy() end
	end
	-- Prepare parts: anchored, non-collidable, semitransparent
	local parts = {}
	for _, part in ipairs(clone:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false; part.Anchored = true; part.Massless = true
			part.Transparency = mmax(part.Transparency, 0.45)
			if part:IsA("VehicleSeat") or part:IsA("Seat") then
				pcall(function() part.Disabled=true; part.MaxSpeed=0; part.Torque=0 end)
			end
			parts[#parts + 1] = part
		end
	end
	clone.Name = "SPA_Ghost_" .. p.UserId
	return clone, parts
end

-- Run the 3D replay in Workspace using clones
function _rpPlay3D(ev, cloneA, partsA, cloneB, partsB)
	local function getAnc(cl)
		if not cl then return nil end
		return cl.PrimaryPart or cl:FindFirstChild("Body") or cl:FindFirstChild("Chassis")
			or cl:FindFirstChild("Main") or cl:FindFirstChild("Base")
			or cl:FindFirstChildWhichIsA("BasePart", true)
	end
	local ancA, ancB = getAnc(cloneA), cloneB and getAnc(cloneB)
	local offA, offB = {}, {}
	if ancA then
		for _, p in ipairs(partsA) do
			if p~=ancA and p.Parent then offA[p]=ancA.CFrame:ToObjectSpace(p.CFrame) end
		end
	end
	if ancB and cloneB then
		for _, p in ipairs(partsB) do
			if p~=ancB and p.Parent then offB[p]=ancB.CFrame:ToObjectSpace(p.CFrame) end
		end
	end
	local function mkTL(snap)
		if not snap or #snap==0 then return {} end
		local tl, t0 = {}, snap[1].t or 0
		for _, s in ipairs(snap) do
			tl[#tl+1] = { pos=s.pos, rot=s.rot, t=math.max(0,(s.t or 0)-t0) }
		end
		return tl
	end
	local tlA, tlB = mkTL(ev.snapA), mkTL(ev.snapB)
	local REPLAY_Y_OFFSET = Vector3.new(0, 3.5, 0)  -- [FIX] Raise the replay to keep it above the map
	local function posAt(tl, t)
		if #tl==0 then return nil end
		if t<=0 or #tl==1 then return tl[1].pos end
		if t>=tl[#tl].t then return tl[#tl].pos end
		for i=1,#tl-1 do
			if tl[i].t<=t and tl[i+1].t>t then
				local d=tl[i+1].t-tl[i].t
				if d<0.0001 then return tl[i].pos end
				return tl[i].pos:Lerp(tl[i+1].pos,(t-tl[i].t)/d)
			end
		end
		return tl[#tl].pos
	end
	-- [ROT FIX] Spherical rotation interpolation (CFrame slerp)
	local function rotAt(tl, t)
		if #tl==0 then return nil end
		local function haRot(s) return s.rot ~= nil end
		if not haRot(tl[1]) then return nil end
		if t<=0 or #tl==1 then return tl[1].rot end
		if t>=tl[#tl].t then return tl[#tl].rot end
		for i=1,#tl-1 do
			if tl[i].t<=t and tl[i+1].t>t then
				local d=tl[i+1].t-tl[i].t
				if d<0.0001 then return tl[i].rot end
				if not tl[i].rot or not tl[i+1].rot then return tl[i].rot end
				local alpha=(t-tl[i].t)/d
				-- Roblox CFrame:Lerp uses slerp for rotation and lerp for position
				return tl[i].rot:Lerp(tl[i+1].rot, alpha)
			end
		end
		return tl[#tl].rot
	end
	local dur = math.max(
		tlA[#tlA] and tlA[#tlA].t or 0,
		tlB[#tlB] and tlB[#tlB].t or 0
	)
	if dur<0.05 then dur=math.max(#(ev.snapA or{}),#(ev.snapB or{}))/SPA_Replay.BUF_HZ end
	local origCT = Camera.CameraType
	Camera.CameraType = Enum.CameraType.Scriptable
	local t0rs = tick()
	local _3d_acc = 0
	local _3d_interval = 1/30  -- exactly 30 FPS, no more
	local _rc; _rc = RunService.RenderStepped:Connect(function(dt)
		_3d_acc += dt
		if _3d_acc < _3d_interval then return end
		_3d_acc -= _3d_interval
		local t = tick()-t0rs
		local function moveCl(cl, anc, off, tl)
			if not cl or not cl.Parent then return end
			local pos = posAt(tl, t); if not pos then return end
			pos = pos + REPLAY_Y_OFFSET
			local cf
			-- [ROT FIX] Use recorded rotation when available (reproduces exact movement)
			local rot = rotAt(tl, t)
			if rot then
				-- Apply current translation to recorded rotation (rot has no position)
				cf = CFrame.new(pos) * rot
			else
				-- Fallback: orient along the direction of movement (previous behavior)
				local nxt = posAt(tl, t+0.05)
				local dir = (nxt and (nxt-pos).Magnitude>0.01) and (nxt-pos).Unit or Vector3.new(0,0,1)
				cf = CFrame.lookAt(pos, pos+dir)
			end
			if anc and anc.Parent then
				pcall(function() anc.CFrame=cf end)
				for p,o in pairs(off) do
					if p.Parent then pcall(function() p.CFrame=cf*o end) end
				end
			elseif cl:IsA("BasePart") then
				pcall(function() cl.CFrame=cf end)
			end
		end
		moveCl(cloneA,ancA,offA,tlA)
		moveCl(cloneB,ancB,offB,tlB)
		local fol=(ancA and ancA.Parent and ancA) or (ancB and ancB.Parent and ancB)
		if fol then Camera.CFrame=Camera.CFrame:Lerp(fol.CFrame*CFrame.new(0,6,18),0.14) end
		if t>dur+0.8 then
			_rc:Disconnect()
			Camera.CameraType=origCT
			-- [FIX] ALWAYS restore camera control to the local humanoid
			do
				local mc=player.Character
				if mc then
					local mh=mc:FindFirstChildOfClass("Humanoid")
					if mh then Camera.CameraSubject=mh end
				end
			end
			task.delay(0.4,function()
				if cloneA and cloneA.Parent then cloneA:Destroy() end
				if cloneB and cloneB.Parent then cloneB:Destroy() end
			end)
		end
	end)
end

function _setupReplayDetection()

	-- ── 1) Ring buffer: sample all players at BUF_HZ ─────────────
	local _tBuf = 0
	RunService.Heartbeat:Connect(function(dt)
		if not ENABLE_CRASH_SYSTEM then return end
		_tBuf += dt
		if _tBuf < 1 / SPA_Replay.BUF_HZ then return end
		_tBuf = 0
		local perfReplayStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
		for uid, st in pairs(PlayerState) do
			if not st.inVehicle or not st.seat then continue end
			local seat = st.seat
			-- [ROT FIX] Capture the vehicle's actual rotation for accurate replay
			local rotOnly = nil
			do
				local ok_cf, cf = pcall(function() return seat.CFrame end)
				if ok_cf and cf then
					rotOnly = CFrame.fromMatrix(Vector3.zero, cf.XVector, cf.YVector, cf.ZVector)
				end
			end
			_rpBufPush(uid, seat.Position, seat.AssemblyLinearVelocity, rotOnly)
		end
			SPA_PerfMark("Replay", perfReplayStart)
	end)

	-- ── 2) Proximity + small Δv (0.1 s) ─────────────────────────
	local _tPrx, _prevV = 0, {}
	RunService.Heartbeat:Connect(function(dt)
		if not ENABLE_CRASH_SYSTEM then return end
		_tPrx += dt
		if _tPrx < 0.15 then return end  -- [OPT] Check proximity less frequently
		_tPrx = 0
		local curV, curP, uid2P = {}, {}, {}
		for uid, st in pairs(PlayerState) do
			if not st.inVehicle or not st.seat or not st.root then continue end
			uid2P[uid] = st.player
			curV[uid]  = st.seat.AssemblyLinearVelocity
			-- [PRECISION FIX] Use seat.Position (car center) for accurate positioning
			curP[uid]  = st.seat.Position
		end
		for uidA, vA in pairs(curV) do
			local prev = _prevV[uidA]
			if not prev then continue end
			local dvA = (vA - prev).Magnitude
			if dvA < SPA_Replay.MIN_DV then continue end
			local pA = curP[uidA]
			if not pA then continue end
			for uidB, pB in pairs(curP) do
				if uidB == uidA then continue end
				if (pA - pB).Magnitude <= SPA_Replay.RADIUS then
					local pa = uid2P[uidA]; local pb = uid2P[uidB]
					if pa and pb then
						_rpCapture(uidA, getDisplayName(pa), uidB, getDisplayName(pb), dvA, pA)
					end
				end
			end
		end
		_prevV = curV
		-- [FIX] Do NOT delete buffers on departure — snapshots are already captured
		-- and deleting buffers can disrupt recorded events
	end)

	-- ── 3) ANALYSIS tab UI ───────────────────────────────────────
	local analFrame = tabFrames["ANÁLISIS"]
	if not analFrame then return end
	local analScroll = analFrame:FindFirstChildOfClass("ScrollingFrame")
	if not analScroll then return end

	-- [OPT] 2D rendering removed to save UI/CPU resources. 3D replay only.
	local function renderCanvas(canvas, ev, animated)
		for _, c in ipairs(canvas:GetChildren()) do
			if c:IsA("Frame") or c:IsA("TextLabel") then c:Destroy() end
		end
		local msg = Instance.new("TextLabel")
		msg.Size = UDim2.new(1,-10,1,-10)
		msg.Position = UDim2.new(0,5,0,5)
		msg.BackgroundTransparency = 1
		msg.TextWrapped = true
		msg.Text = "2D replay disabled\nUse the PLAY 3D button"
		msg.Font = Enum.Font.GothamBold
		msg.TextColor3 = C_GRAY
		msg.TextSize = 12
		msg.Parent = canvas
	end

	-- Build an event card
	local function buildCard(ev, order)
		local card = Instance.new("Frame")
		card.Size = UDim2.new(1, 0, 0, 222)
		card.BackgroundColor3 = C_BG2; card.BackgroundTransparency = 0.1
		card.BorderSizePixel = 0; card:SetAttribute("IsReplayCard", true)
		card.LayoutOrder = order

		local bar = Instance.new("Frame"); bar.Size = UDim2.new(0, 4, 1, 0)
		bar.BackgroundColor3 = C_BLUE; bar.BorderSizePixel = 0; bar.Parent = card

		-- Header
		local hdr = Instance.new("Frame"); hdr.Size = UDim2.new(1, 0, 0, 28)
		hdr.BackgroundColor3 = Color3.fromRGB(0, 18, 46); hdr.BorderSizePixel = 0; hdr.Parent = card
		local tLbl = Instance.new("TextLabel"); tLbl.Size = UDim2.new(0, 54, 1, 0)
		tLbl.Position = UDim2.new(0, 8, 0, 0); tLbl.BackgroundTransparency = 1
		tLbl.Text = ev.time; tLbl.Font = Enum.Font.GothamBold
		tLbl.TextColor3 = C_GRAY; tLbl.TextSize = 10
		tLbl.TextXAlignment = Enum.TextXAlignment.Left; tLbl.Parent = hdr
		local nLbl = Instance.new("TextLabel"); nLbl.Size = UDim2.new(0.55, 0, 1, 0)
		nLbl.Position = UDim2.new(0, 64, 0, 0); nLbl.BackgroundTransparency = 1
		nLbl.Text = (ev.nameA or "?") .. (ev.nameB and ("  ↔  " .. ev.nameB) or "  ↔  WALL")
		nLbl.Font = Enum.Font.GothamBold; nLbl.TextColor3 = C_WHITE; nLbl.TextSize = 10
		nLbl.TextXAlignment = Enum.TextXAlignment.Left
		nLbl.TextTruncate = Enum.TextTruncate.AtEnd; nLbl.Parent = hdr
		local dvB = Instance.new("TextLabel"); dvB.Size = UDim2.new(0, 52, 0, 18)
		dvB.Position = UDim2.new(1, -58, 0.5, -9)
		dvB.BackgroundColor3 = Color3.fromRGB(8, 8, 12); dvB.BorderSizePixel = 0
		dvB.Text = "Δv " .. ev.dv .. " s/s"; dvB.Font = Enum.Font.GothamBold
		dvB.TextColor3 = C_ORANGE; dvB.TextSize = 9; dvB.Parent = hdr
		Instance.new("UICorner", dvB).CornerRadius = UDim.new(0, 4)

		-- Canvas 2D
		local cbg = Instance.new("Frame"); cbg.Size = UDim2.new(0, 158, 0, 158)
		cbg.Position = UDim2.new(0, 6, 0, 30)
		cbg.BackgroundColor3 = Color3.fromRGB(6, 8, 14)
		cbg.BorderSizePixel = 0; cbg.ClipsDescendants = true; cbg.Parent = card
		Instance.new("UICorner", cbg).CornerRadius = UDim.new(0, 4)
		renderCanvas(cbg, ev, false)

		-- Right panel: legend + buttons
		local inf = Instance.new("Frame"); inf.Size = UDim2.new(1, -170, 0, 158)
		inf.Position = UDim2.new(0, 166, 0, 30); inf.BackgroundTransparency = 1; inf.Parent = card
		local function ir(icon, txt, col, yp)
			local r = Instance.new("TextLabel"); r.Size = UDim2.new(1, -2, 0, 17)
			r.Position = UDim2.new(0, 2, 0, yp); r.BackgroundTransparency = 1
			r.Text = icon .. " " .. txt; r.Font = Enum.Font.GothamBold
			r.TextColor3 = col; r.TextSize = 10
			r.TextXAlignment = Enum.TextXAlignment.Left
			r.TextTruncate = Enum.TextTruncate.AtEnd; r.Parent = inf
		end
		ir("🔵", ev.nameA or "?",    C_BLUE,   2)
		ir("🟠", ev.nameB or "WALL", C_ORANGE, 22)
		ir("⚡", "Δv " .. ev.dv .. " st/s", C_YELLOW, 42)
		if ev.posImpact then
			ir("📍", sformat("%.0f, %.0f", ev.posImpact.X, ev.posImpact.Z), C_GRAY, 62)
		end

		local captEv, captCbg = ev, cbg

		-- ▶ 3D: clone the actual car model and animate it in Workspace
		local gBtn = Instance.new("TextButton"); gBtn.Size = UDim2.new(1, -2, 0, 24)
		gBtn.Position = UDim2.new(0, 2, 0, 88)
		gBtn.BackgroundColor3 = Color3.fromRGB(0, 55, 20)
		gBtn.Text = "▶  GHOST 3D"; gBtn.Font = Enum.Font.GothamBold
		gBtn.TextColor3 = C_GREEN; gBtn.TextSize = 10; gBtn.BorderSizePixel = 0; gBtn.Parent = inf
		Instance.new("UICorner", gBtn).CornerRadius = UDim.new(0, 3)
		gBtn.MouseButton1Click:Connect(function()
			gBtn.Text = "⏳ ..."; gBtn.TextColor3 = C_GRAY
			local pA, pB
			for _, pl in ipairs(Players:GetPlayers()) do
				if pl.UserId == captEv.uidA then pA = pl end
				if captEv.uidB and pl.UserId == captEv.uidB then pB = pl end
			end
			if not pA or (captEv.nameB and not pB) then
				for _, pl in ipairs(Players:GetPlayers()) do
					local dn = getDisplayName(pl)
					if not pA and dn == captEv.nameA then pA = pl end
					if not pB and captEv.nameB and dn == captEv.nameB then pB = pl end
				end
			end
			local function mkGhost(pl, col, snap)
				-- [FIX] If the player is still in the server, try cloning their current vehicle.
				-- Otherwise, or if cloning fails, use a lightweight ghost based ONLY on snapshots.
				if pl then
					local cl = _rpCloneVehicle(pl)
					if cl then
						local pts = {}
						for _,pp in ipairs(cl:GetDescendants()) do
							if pp:IsA("BasePart") then
								pp.Anchored = true
								pp.CanCollide = false
								pp.Massless = true
								if pp.Transparency < 0.9 then pp.Color = col end
								pts[#pts+1] = pp
							end
						end
						cl.Parent = Workspace
						return cl, pts
					end
				end
				if not snap or #snap == 0 then return nil, {} end

				-- [FIX] Player-independent ghost: works even after they leave the server.
				local mdl = Instance.new("Model")
				mdl.Name = "SPA_SnapshotGhost"

				local body = Instance.new("Part")
				body.Name = "Body"
				body.Size = Vector3.new(6.4, 2.2, 10.8)
				body.Anchored = true
				body.CanCollide = false
				body.Massless = true
				body.Material = Enum.Material.Neon
				body.Color = col
				body.Transparency = 0.35
				body.CFrame = CFrame.new(snap[1].pos + Vector3.new(0, 3.5, 0))
				body.Parent = mdl

				local top = Instance.new("Part")
				top.Name = "Cabin"
				top.Size = Vector3.new(5.2, 1.4, 4.5)
				top.Anchored = true
				top.CanCollide = false
				top.Massless = true
				top.Material = Enum.Material.Neon
				top.Color = col:Lerp(Color3.new(1,1,1), 0.15)
				top.Transparency = 0.45
				top.CFrame = body.CFrame * CFrame.new(0, 1.3, -0.2)
				top.Parent = mdl

				mdl.PrimaryPart = body
				mdl.Parent = Workspace

				local lt=Instance.new("PointLight")
				lt.Color=col
				lt.Brightness=1.8
				lt.Range=22
				lt.Parent=body

				return mdl, {body, top}
			end
			local clA, parA = mkGhost(pA, C_BLUE,   captEv.snapA)
			local clB, parB = mkGhost(pB, C_ORANGE, captEv.snapB)
			if not clA and not clB then
				gBtn.Text = "No data"; gBtn.TextColor3 = C_RED
				task.delay(2, function() gBtn.Text="▶  GHOST 3D"; gBtn.TextColor3=C_GREEN end)
				return
			end
			-- _rpPlay3D handles the chase camera and restoration
			_rpPlay3D(captEv, clA, parA or {}, clB, parB or {})
			local dur3 = mmax(#(captEv.snapA or {}), #(captEv.snapB or {})) / SPA_Replay.BUF_HZ + 2
			task.delay(dur3, function() gBtn.Text="▶  GHOST 3D"; gBtn.TextColor3=C_GREEN end)
		end)

		-- 🗑 DELETE
		local dBtn = Instance.new("TextButton"); dBtn.Size = UDim2.new(1, -2, 0, 24)
		dBtn.Position = UDim2.new(0, 2, 0, 144)
		dBtn.BackgroundColor3 = C_DARKRED; dBtn.Text = "🗑 DELETE"
		dBtn.Font = Enum.Font.GothamBold; dBtn.TextColor3 = C_WHITE
		dBtn.TextSize = 10; dBtn.BorderSizePixel = 0; dBtn.Parent = inf
		Instance.new("UICorner", dBtn).CornerRadius = UDim.new(0, 3)
		dBtn.MouseButton1Click:Connect(function()
			for i, e in ipairs(SPA_Replay.events) do
				if e == captEv then table.remove(SPA_Replay.events, i); break end
			end
			if SPA_Replay.rebuildFn then SPA_Replay.rebuildFn() end
		end)

		return card
	end

	-- Rebuild the replay section in analScroll
	local function rebuildCards()
		for _, c in ipairs(analScroll:GetChildren()) do
			if c:GetAttribute("IsReplayCard") then c:Destroy() end
		end
		if #SPA_Replay.events == 0 then return end
		-- Section header
		local sh = Instance.new("Frame"); sh.Size = UDim2.new(1, 0, 0, 26)
		sh.BackgroundColor3 = Color3.fromRGB(0, 20, 52); sh.BorderSizePixel = 0
		sh.LayoutOrder = 500; sh:SetAttribute("IsReplayCard", true); sh.Parent = analScroll
		local shl = Instance.new("TextLabel"); shl.Size = UDim2.new(0.7, 0, 1, 0)
		shl.Position = UDim2.new(0, 10, 0, 0); shl.BackgroundTransparency = 1
		shl.Text = "📹  RECORDED CONTACTS (" .. #SPA_Replay.events .. ")"
		shl.Font = Enum.Font.GothamBlack; shl.TextColor3 = C_BLUE; shl.TextSize = 11
		shl.TextXAlignment = Enum.TextXAlignment.Left; shl.Parent = sh
		local caBtn = Instance.new("TextButton"); caBtn.Size = UDim2.new(0, 58, 0.7, 0)
		caBtn.Position = UDim2.new(1, -64, 0.15, 0); caBtn.BackgroundColor3 = C_DARKRED
		caBtn.Text = "🗑 ALL"; caBtn.Font = Enum.Font.GothamBold
		caBtn.TextColor3 = C_WHITE; caBtn.TextSize = 9; caBtn.BorderSizePixel = 0; caBtn.Parent = sh
		Instance.new("UICorner", caBtn).CornerRadius = UDim.new(0, 3)
		caBtn.MouseButton1Click:Connect(function()
			SPA_Replay.events = {}
			if SPA_Replay.rebuildFn then SPA_Replay.rebuildFn() end
		end)
		-- Event cards
		for i, ev in ipairs(SPA_Replay.events) do
			local c = buildCard(ev, 500 + i); c.Parent = analScroll
		end
	end

	SPA_Replay.rebuildFn = rebuildCards
end


-- V2.18: bounded audio retries and observational detection; no new Heartbeats.
SPA_AudioRetry = { MAX_ATTEMPTS = 5, INTERVAL = 0.5, initialized = false }

function SPA_AudioRetry:IsVehicle(seat, root, character)
	if not seat or not seat.Parent or not root or not root.Parent or not root:IsA("Model") then return false end
	if root == character or not seat:IsDescendantOf(root) then return false end
	local assembly = seat.AssemblyRootPart
	if not assembly or assembly.Anchored or not assembly:IsDescendantOf(root) then return false end
	-- A standalone Seat / decorative chair is not a car.
	return seat:IsA("VehicleSeat") or root:FindFirstChild("Wheels") ~= nil
		or root:FindFirstChild("Body") ~= nil
		or (assembly ~= seat and seat.AssemblyMass > seat:GetMass() * 1.2)
end

function SPA_AudioRetry:Log(uid, message)
	if ENABLE_NITRO_DEBUG then
		warn(("[SPA-GLOBAL-IDIM-ENGLISH AUDIO] uid=%s %s"):format(tostring(uid), message))
	end
end

function SPA_AudioRetry:Exhaust(uid, vc)
	if vc.audioState == "EXHAUSTED" then return end
	vc.audioState = "EXHAUSTED"; vc.audioReady = false
	if vc.audioConn then vc.audioConn:Disconnect(); vc.audioConn = nil end
	-- Cancel a pending load too: it must not start playing after retries are exhausted.
	if vc.engineSound and vc.engineSound.Parent and vc.audioOwnsSound then
		vc.engineSound:Stop()
	end
	self:Log(uid, "EXHAUSTED seat=" .. tostring(vc.seatId))
end

function SPA_AudioRetry:MarkReady(uid, vc)
	if vc.audioState == "READY" then return end
	vc.audioState = "READY"; vc.audioReady = true
	if not vc.audioConn then
		vc.audioConn = vc.vehicleRoot.DescendantAdded:Connect(function(obj)
			if obj:IsA("Sound") and obj ~= vc.engineSound then obj:Destroy() end
		end)
	end
	self:Log(uid, "READY")
end

function SPA_AudioRetry:Attempt(st, vc)
	if not self:IsVehicle(st.seat, vc.vehicleRoot, st.character) then
		vc.audioLastError = "seat has no valid physical vehicle"
		return
	end
	-- One scan and cleanup per identity, even if loading fails.
	if not vc.audioScanned then
		vc.audioScanned = true
		local sounds = {}
		for _, obj in ipairs(vc.vehicleRoot:GetDescendants()) do
			if obj:IsA("Sound") then
				sounds[#sounds + 1] = obj
				if obj.Name == "SPA_ENGINE_SOUND" and obj.SoundId == SPA_ENGINE_SOUND_ID
					and obj.Parent and obj.Parent:IsA("BasePart") then
					vc.engineSound = vc.engineSound or obj
				end
			end
		end
		for _, sound in ipairs(sounds) do
			if sound ~= vc.engineSound then sound:Destroy() end
		end
	end
	local sound = vc.engineSound
	if not sound or not sound.Parent then
		sound = Instance.new("Sound")
		vc.engineSound = sound; vc.audioOwnsSound = true
		sound.Name = "SPA_ENGINE_SOUND"
		sound.SoundId = SPA_ENGINE_SOUND_ID
		sound.Volume = SPA_ENGINE_VOLUME
		sound.Looped = true
		sound.Parent = st.seat
	end
	sound.SoundId = SPA_ENGINE_SOUND_ID
	sound.Volume = SPA_ENGINE_VOLUME
	sound.Looped = true
	sound:Play()
	vc.audioLastError = nil
end

function SPA_AudioRetry:Step(uid, st, vc, now)
	if not self.initialized or not vc or vc.cleaned or vc.audioState == "EXHAUSTED" then return end
	if vc.audioState == "READY" then
		-- READY does not recreate sounds. If destroyed, audio stops until the identity changes.
		if not vc.engineSound or not vc.engineSound.Parent then self:Exhaust(uid, vc) end
		return
	end
	-- Check playback after allowing time for asynchronous loading.
	if vc.audioState == "ATTEMPTING" then
		local sound = vc.engineSound
		if sound and sound.Parent and sound.IsLoaded and sound.IsPlaying then
			self:MarkReady(uid, vc)
			return
		end
		if now - vc.lastAttempt < self.INTERVAL then return end
		if vc.attemptCount >= self.MAX_ATTEMPTS then self:Exhaust(uid, vc); return end
	end
	if vc.attemptCount > 0 and now - vc.lastAttempt < self.INTERVAL then return end
	vc.attemptCount += 1; vc.lastAttempt = now; vc.audioState = "ATTEMPTING"
	self:Log(uid, ("attempt=%d/%d"):format(vc.attemptCount, self.MAX_ATTEMPTS))
	local ok, err = xpcall(function() self:Attempt(st, vc) end, debug.traceback)
	if not ok then
		vc.audioLastError = tostring(err)
		self:Log(uid, "error=" .. tostring(err))
	end
	if vc.engineSound and vc.engineSound.Parent and vc.engineSound.IsLoaded and vc.engineSound.IsPlaying then
		self:MarkReady(uid, vc)
	end
end

SPA_NoClip = {
	initialized = false, states = {}, INTERVAL = 0.15, GRACE = 3,
	STRIKE_INTERVAL = 1, STRIKE_WINDOW = 8, COOLDOWN = 30, REQUIRED_STRIKES = 3,
	MAX_PARTS = 128, MAX_CAST_DISTANCE = 150,
}

function SPA_NoClip:Ignored(obj)
	while obj and obj ~= Workspace do
		if obj:GetAttribute("SPA_NoClipIgnore") == true then return true end
		obj = obj.Parent
	end
	return false
end

function SPA_NoClip:Clear(uid, vc)
	local state = self.states[uid]
	if state and (not vc or state.cache == vc) then
		for _, connection in ipairs(state.connections) do connection:Disconnect() end
		state.params.FilterDescendantsInstances = {}
		table.clear(state.parts); table.clear(state.collidableParts); table.clear(state.collisionGroups)
		self.states[uid] = nil
	end
	if vc then vc.noclip = nil end
end

function SPA_NoClip:Scan(state, now)
	local old = state.parts
	local parts, collidableParts, groups = {}, {}, {}
	local count = 0
	for _, part in ipairs(state.vehicleRoot:GetDescendants()) do
		if part:IsA("BasePart") and not self:Ignored(part) and part.AssemblyRootPart == state.assembly
			and (part.CanCollide or old[part] or part == state.assembly) then
			count += 1
			if count > self.MAX_PARTS then break end
			parts[part] = old[part] or { canCollide = part.CanCollide, group = part.CollisionGroup }
			if parts[part].canCollide then collidableParts[#collidableParts + 1] = part end
			groups[part] = parts[part].group
		end
	end
	state.parts = parts; state.collidableParts = collidableParts; state.collisionGroups = groups
	state.invalid = false; state.lastScan = now
	state.previousPosition = nil; state.lastSample = nil
	state.graceUntil = now + self.GRACE
end

function SPA_NoClip:Build(uid, st, vc, now)
	self:Clear(uid)
	local state = {
		cache = vc, vehicleRoot = vc.vehicleRoot, seat = st.seat, character = st.character,
		assembly = st.seat.AssemblyRootPart, parts = {}, collidableParts = {}, collisionGroups = {},
		connections = {}, strikes = 0, suspicious = false, lastDetection = 0,
		lastStrike = -math.huge, lastProposal = -math.huge, invalid = true, lastScan = -math.huge,
	}
	state.params = RaycastParams.new()
	state.params.FilterType = Enum.RaycastFilterType.Exclude
	state.params.FilterDescendantsInstances = { vc.vehicleRoot, st.character }
	state.params.IgnoreWater = true
	state.params.RespectCanCollide = true
	state.expectedGroup = state.assembly.CollisionGroup
	state.params.CollisionGroup = state.expectedGroup
	self.states[uid] = state; vc.noclip = state
	for _, signal in ipairs({ vc.vehicleRoot.DescendantAdded, vc.vehicleRoot.DescendantRemoving }) do
		state.connections[#state.connections + 1] = signal:Connect(function(obj)
			if obj:IsA("BasePart") then state.invalid = true end
		end)
	end
	self:Scan(state, now)
	return state
end

function SPA_NoClip:PropertyEvidence(state, now)
	local disabled, changed = 0, 0
	for part, baseline in pairs(state.parts) do
		if part.Parent and not self:Ignored(part) then
			-- Explicit exception for legitimate phases (pits, spawning, track scripts).
			if part:GetAttribute("SPA_NoClipAllowCollisionChange") == true then
				baseline.canCollide = part.CanCollide; baseline.group = part.CollisionGroup
				state.collisionGroups[part] = baseline.group
				if part == state.assembly then
					state.expectedGroup = baseline.group; state.params.CollisionGroup = baseline.group
				end
				baseline.since = nil
			else
				local collisionChanged = baseline.canCollide and not part.CanCollide
				local groupChanged = baseline.group ~= part.CollisionGroup
				if collisionChanged or groupChanged then
					baseline.since = baseline.since or now
					if now - baseline.since >= 0.6 then
						if collisionChanged then disabled += 1 end
						if groupChanged then changed += 1 end
					end
				else
					baseline.since = nil
				end
			end
		end
	end
	return disabled, changed
end

function SPA_NoClip:CrossedObstacle(state, previous, current, delta)
	local hit = Workspace:Raycast(previous, delta, state.params)
	if not hit or not hit.Instance:IsA("BasePart") or not hit.Instance.Anchored
		or not hit.Instance.CanCollide or self:Ignored(hit.Instance) then return false end
	-- Two faces of the same static obstacle; excludes touching/passing alongside a wall.
	local reverse = Workspace:Raycast(current, -delta, state.params)
	if not reverse or reverse.Instance ~= hit.Instance or hit.Normal:Dot(reverse.Normal) > -0.5 then return false end
	if hit.Distance < 1.5 or reverse.Distance < 1.5 then return false end
	local part = hit.Instance
	local from = part.CFrame:PointToObjectSpace(previous)
	local to = part.CFrame:PointToObjectSpace(current)
	local half = part.Size * 0.5
	local fromOutside = math.abs(from.X) > half.X + 1 or math.abs(from.Y) > half.Y + 1 or math.abs(from.Z) > half.Z + 1
	local toOutside = math.abs(to.X) > half.X + 1 or math.abs(to.Y) > half.Y + 1 or math.abs(to.Z) > half.Z + 1
	return fromOutside and toOutside
end

function SPA_NoClip:Record(uid, state, now, previous, current, kind, reason)
	if now - state.lastStrike < self.STRIKE_INTERVAL or now - state.lastProposal < self.COOLDOWN then return end
	state.strikes += 1; state.lastStrike = now; state.lastDetection = now
	state.suspicious = true
	state.level = state.strikes >= 2 and "HIGH SUSPICION" or "SUSPICION"
	if state.strikes < self.REQUIRED_STRIKES or type(proposeSanction) ~= "function" then return end
	local pl = Players:GetPlayerByUserId(uid)
	local detail = ("driver=%s UID=%s vehicle=%s strikes=%d previous=%s current=%s type=%s reason=%s"):format(
		pl and pl.Name or "-", tostring(uid), state.vehicleRoot:GetFullName(), state.strikes,
		tostring(previous), tostring(current), kind, reason)
	proposeSanction(uid, "NoClip detected", detail)
	state.lastProposal = now; state.strikes = 0; state.suspicious = false
	state.level = "CONFIRMED"
end

function SPA_NoClip:Step(uid, st, vc, now)
	if not self.initialized then return end
	if not st.inVehicle or not SPA_AudioRetry:IsVehicle(st.seat, vc.vehicleRoot, st.character)
		or self:Ignored(vc.vehicleRoot) or self:Ignored(st.seat) then
		self:Clear(uid, vc); return
	end
	local state = self.states[uid]
	if not state or state.cache ~= vc or state.character ~= st.character or state.assembly ~= st.seat.AssemblyRootPart then
		state = self:Build(uid, st, vc, now)
	end
	if state.invalid then
		if now - state.lastScan < 0.5 then return end
		self:Scan(state, now)
	end
	if state.lastSample and now - state.lastSample < self.INTERVAL then return end
	local position = state.assembly.Position
	local velocity = state.assembly.AssemblyLinearVelocity
	local previous, previousVelocity, sampledAt = state.previousPosition, state.previousVelocity, state.lastSample
	state.previousPosition = position; state.previousVelocity = velocity; state.lastSample = now
	if now - state.lastDetection > self.STRIKE_WINDOW then state.strikes = 0; state.suspicious = false; state.level = nil end
	local explicitGrace = state.vehicleRoot:GetAttribute("SPA_NoClipGraceUntil")
	if now < state.graceUntil or (type(explicitGrace) == "number" and Workspace:GetServerTimeNow() < explicitGrace)
		or state.vehicleRoot:GetAttribute("SPA_NoClipAllowCollisionChange") == true then
		if state.vehicleRoot:GetAttribute("SPA_NoClipAllowCollisionChange") == true then
			for part, baseline in pairs(state.parts) do
				if part.Parent then
					baseline.canCollide = part.CanCollide; baseline.group = part.CollisionGroup; baseline.since = nil
					state.collisionGroups[part] = baseline.group
				end
			end
			state.expectedGroup = state.assembly.CollisionGroup
			state.params.CollisionGroup = state.expectedGroup
		end
		state.strikes = 0; state.suspicious = false
		return
	end
	local disabled, groups = self:PropertyEvidence(state, now)
	state.propertyAnomaly = disabled > 0 or groups > 0
	if not previous or not sampledAt then return end
	local dt = now - sampledAt
	if dt <= 0 or dt > 0.65 then state.graceUntil = now + self.GRACE; return end
	local delta = position - previous
	local distance = delta.Magnitude
	-- Rebase after large teleports, vertical jumps and non-finite samples; do not accuse.
	if distance ~= distance or distance > self.MAX_CAST_DISTANCE then state.graceUntil = now + self.GRACE; return end
	if distance < 4 or math.abs(delta.Y) > math.max(5, distance * 0.5) then return end
	local expected = ((previousVelocity or velocity).Magnitude + velocity.Magnitude) * 0.5 * dt
	local impossible = distance > math.max(12, expected * 2.5 + 5)
	local crossing = self:CrossedObstacle(state, previous, position, delta)
	-- A collision group or speed change alone never produces a proposal.
	if crossing and (impossible or state.propertyAnomaly) then
		self:Record(uid, state, now, previous, position, state.propertyAnomaly and "MIXED" or "OBSTACLE_CROSS",
			("crossed a static obstacle; CanCollide=%d CollisionGroup=%d movement=%s"):format(disabled, groups, tostring(impossible)))
	elseif impossible and disabled + groups >= 2 then
		self:Record(uid, state, now, previous, position, "MIXED",
			("inconsistent movement + persistent changes: CanCollide=%d CollisionGroup=%d"):format(disabled, groups))
	end
end

SPA_LapsControl = { rows = {}, connections = {}, initialized = false, confirmUntil = 0 }

function SPA_LapsControl:Refresh()
	for uid, refs in pairs(self.rows) do
		local laps = lapData[uid] and lapData[uid].lapsMade or 0
		local text = ("LAP %d / %d"):format(laps, MAX_LAPS)
		if refs.laps.Text ~= text then refs.laps.Text = text end
	end
	if self.confirmUntil > 0 and tick() > self.confirmUntil then self:CancelReset() end
end

function SPA_LapsControl:Set(uid, value, batch)
	if not Players:GetPlayerByUserId(uid) or type(value) ~= "number" or value ~= value or math.abs(value) == math.huge then return end
	if not lapData[uid] then lapData[uid] = { lapsMade = 0, lastLapTouch = 0 } end
	lapData[uid].lapsMade = mclamp(mfloor(value), 0, MAX_LAPS)
	HUD_LAST_SIGNATURE = nil; HUD_RANK_CACHE.signature = nil
	if not batch then
		self:Refresh()
		if self.refreshHUD then self.refreshHUD() end
	end
end

function SPA_LapsControl:CancelReset()
	self.confirmUntil = 0
	if self.resetButton then self.resetButton.Text = "RESET ALL LAPS" end
	if self.cancelButton then self.cancelButton.Visible = false end
end

function SPA_LapsControl:Remove(uid)
	local refs = self.rows[uid]
	if not refs then return end
	for _, connection in ipairs(refs.connections) do connection:Disconnect() end
	refs.row:Destroy(); self.rows[uid] = nil
end

function SPA_LapsControl:Add(pl)
	local uid = pl.UserId
	if self.rows[uid] then return end
	local row = Instance.new("Frame")
	row.Name = "LapControl_" .. uid; row.Size = UDim2.new(1, -8, 0, 62)
	row.BackgroundColor3 = C_BG2; row.BorderSizePixel = 0; row.Parent = self.scroll
	local name = Instance.new("TextLabel")
	name.Size = UDim2.new(0.55, -8, 0, 26); name.Position = UDim2.new(0, 6, 0, 3)
	name.BackgroundTransparency = 1; name.Font = Enum.Font.GothamBold; name.TextSize = 12
	name.TextColor3 = C_WHITE; name.TextXAlignment = Enum.TextXAlignment.Left
	name.TextTruncate = Enum.TextTruncate.AtEnd; name.Text = pl.Name; name.Parent = row
	local laps = Instance.new("TextLabel")
	laps.Size = UDim2.new(0.45, -8, 0, 26); laps.Position = UDim2.new(0.55, 0, 0, 3)
	laps.BackgroundTransparency = 1; laps.Font = Enum.Font.GothamBold; laps.TextSize = 12
	laps.TextColor3 = C_YELLOW; laps.Parent = row
	local refs = { row = row, laps = laps, connections = {} }
	self.rows[uid] = refs
	for i, label in ipairs({ "− LAP", "+ LAP", "RESET" }) do
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1/3, -8, 0, 26); button.Position = UDim2.new((i-1)/3, 4, 0, 32)
		button.Text = label; button.BackgroundColor3 = i == 3 and C_RED or C_BG
		button.TextColor3 = C_WHITE; button.Font = Enum.Font.GothamBold; button.TextSize = 11
		button.BorderSizePixel = 0; button.Parent = row
		refs.connections[#refs.connections + 1] = button.MouseButton1Click:Connect(function()
			local current = lapData[uid] and lapData[uid].lapsMade or 0
			self:Set(uid, i == 3 and 0 or current + (i == 1 and -1 or 1))
		end)
	end
	self:Refresh()
end

function SPA_LapsControl:Init()
	assert(tabFrames["LAPS CONTROL"], "LAPS CONTROL tab is missing")
	local frame = tabFrames["LAPS CONTROL"]
	local reset = Instance.new("TextButton")
	reset.Size = UDim2.new(0.7, -8, 0, 30); reset.Position = UDim2.new(0, 4, 0, 4)
	reset.Text = "RESET ALL LAPS"; reset.BackgroundColor3 = C_RED; reset.TextColor3 = C_WHITE
	reset.Font = Enum.Font.GothamBold; reset.TextSize = 11; reset.BorderSizePixel = 0; reset.Parent = frame
	self.resetButton = reset
	local cancel = Instance.new("TextButton")
	cancel.Size = UDim2.new(0.3, -8, 0, 30); cancel.Position = UDim2.new(0.7, 4, 0, 4)
	cancel.Text = "CANCEL"; cancel.BackgroundColor3 = C_BG2; cancel.TextColor3 = C_WHITE
	cancel.Font = Enum.Font.GothamBold; cancel.TextSize = 11; cancel.Visible = false; cancel.Parent = frame
	self.cancelButton = cancel
	local scroll = createScrollingList(frame)
	scroll.Position = UDim2.new(0, 0, 0, 40); scroll.Size = UDim2.new(1, 0, 1, -40)
	self.scroll = scroll
	self.connections[#self.connections + 1] = reset.MouseButton1Click:Connect(function()
		if self.confirmUntil > tick() then
			for _, pl in ipairs(Players:GetPlayers()) do self:Set(pl.UserId, 0, true) end
			self:CancelReset(); self:Refresh()
			if self.refreshHUD then self.refreshHUD() end
		else
			self.confirmUntil = tick() + 5
			reset.Text = "CONFIRM RESET (5 s)"; cancel.Visible = true
		end
	end)
	self.connections[#self.connections + 1] = cancel.MouseButton1Click:Connect(function() self:CancelReset() end)
	self.connections[#self.connections + 1] = frame:GetPropertyChangedSignal("Visible"):Connect(function()
		self:CancelReset()
	end)
	self.connections[#self.connections + 1] = Players.PlayerAdded:Connect(function(pl) self:Add(pl) end)
	self.connections[#self.connections + 1] = Players.PlayerRemoving:Connect(function(pl) self:Remove(pl.UserId) end)
	for _, pl in ipairs(Players:GetPlayers()) do self:Add(pl) end
	self.connections[#self.connections + 1] = frame.Destroying:Connect(function()
		for uid in pairs(self.rows) do self:Remove(uid) end
		for _, connection in ipairs(self.connections) do connection:Disconnect() end
		table.clear(self.connections)
		self.scroll = nil; self.resetButton = nil; self.cancelButton = nil; self.refreshHUD = nil
		self.initialized = false
	end)
	self.initialized = true
end

function _spaInitStage(stage, fn, dependencies)
	if not SPA_INIT then SPA_INIT = { stages = {}, failed = {}, criticalFailed = false, ready = false } end
	if SPA_INIT.stages[stage] then return SPA_INIT.stages[stage] == "OK" end
	for _, dependency in ipairs(dependencies or {}) do
		if SPA_INIT.stages[dependency] ~= "OK" then
			SPA_INIT.stages[stage] = "BLOCKED"; SPA_INIT.criticalFailed = true
			SPA_INIT.failed[stage] = "failed dependency: " .. dependency
			warn(("[SPA-GLOBAL-IDIM-ENGLISH INIT ERROR] stage=%s %s"):format(stage, SPA_INIT.failed[stage]))
			return false
		end
	end
	if type(fn) ~= "function" then
		SPA_INIT.stages[stage] = "MISSING"
		SPA_INIT.criticalFailed = true
		SPA_INIT.failed[stage] = "function unavailable"
		warn(("[SPA-GLOBAL-IDIM-ENGLISH INIT ERROR] stage=%s function unavailable"):format(tostring(stage)))
		return false
	end
	local ok, err = xpcall(fn, debug.traceback)
	if ok then
		SPA_INIT.stages[stage] = "OK"
		print(("[SPA-GLOBAL-IDIM-ENGLISH INIT] %s OK"):format(tostring(stage)))
	else
		SPA_INIT.stages[stage] = "ERROR"
		SPA_INIT.failed[stage] = tostring(err)
		SPA_INIT.criticalFailed = true
		warn(("[SPA-GLOBAL-IDIM-ENGLISH INIT ERROR] stage=%s error=%s"):format(tostring(stage), tostring(err):match("^[^\n]+") or tostring(err)))
		warn(("[SPA-GLOBAL-IDIM-ENGLISH INIT TRACE] stage=%s traceback=\n%s"):format(tostring(stage), tostring(err)))
	end
	return ok
end

SPA_INIT = { stages = {}, failed = {}, criticalFailed = false, ready = false }
SPA_INIT.ui1Ok = _spaInitStage("UI1", _setupUI1)

-- ══════════════════════════════════════════════════════════════
-- ═══  _setupUI2  ══════════════════════════════════════════════
-- ══════════════════════════════════════════════════════════════
function _setupUI2()  -- [SPAV4] Global: frees registers in the main scope

	-- ── Config helper builders ──────────────────────────────────
	local function mkConfigToggleRow(parent, labelTxt, getter, setter, order)
		local row = Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=order; row.Parent=parent
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.6,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text=labelTxt; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local btn=Instance.new("TextButton")
		btn.Size=UDim2.new(0.35,-4,0.7,0); btn.Position=UDim2.new(0.62,0,0.15,0); btn.BorderSizePixel=0
		btn.Font=Enum.Font.GothamBold; btn.TextSize=12; btn.Parent=row
		local bc=Instance.new("UICorner"); bc.CornerRadius=UDim.new(0,3); bc.Parent=btn
		local function paint()
			local v=getter()
			btn.Text=v and "  ON  " or "  OFF  "
			btn.BackgroundColor3=v and Color3.fromRGB(0,120,50) or Color3.fromRGB(80,20,20)
			btn.TextColor3=v and C_GREEN or Color3.fromRGB(255,80,80)
		end
		paint()
		btn.MouseButton1Click:Connect(function() setter(not getter()); paint() end)
	end

	local function mkConfigAdjustRow(parent, labelTxt, getter, setter, step, minV, maxV, onChange, order)
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=order; row.Parent=parent
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.5,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text=labelTxt; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local valLbl=Instance.new("TextLabel")
		valLbl.Size=UDim2.new(0.15,0,1,0); valLbl.Position=UDim2.new(0.5,0,0,0); valLbl.BackgroundTransparency=1
		valLbl.Text=tostring(getter()); valLbl.Font=Enum.Font.GothamBold; valLbl.TextColor3=C_YELLOW; valLbl.TextSize=13; valLbl.Parent=row
		local minus=Instance.new("TextButton")
		minus.Size=UDim2.new(0.15,0,0.7,0); minus.Position=UDim2.new(0.65,0,0.15,0)
		minus.BackgroundColor3=Color3.fromRGB(50,50,60); minus.Text="−"; minus.Font=Enum.Font.GothamBold
		minus.TextColor3=C_WHITE; minus.TextSize=16; minus.BorderSizePixel=0; minus.Parent=row
		local mc=Instance.new("UICorner"); mc.CornerRadius=UDim.new(0,3); mc.Parent=minus
		local plus=Instance.new("TextButton")
		plus.Size=UDim2.new(0.15,0,0.7,0); plus.Position=UDim2.new(0.82,0,0.15,0)
		plus.BackgroundColor3=Color3.fromRGB(50,50,60); plus.Text="+"; plus.Font=Enum.Font.GothamBold
		plus.TextColor3=C_WHITE; plus.TextSize=16; plus.BorderSizePixel=0; plus.Parent=row
		local pc=Instance.new("UICorner"); pc.CornerRadius=UDim.new(0,3); pc.Parent=plus
		local function apply(v)
			setter(v); valLbl.Text=tostring(getter())
			if onChange then onChange(v) end
		end
		minus.MouseButton1Click:Connect(function() apply(mclamp(getter()-step,minV,maxV)) end)
		plus.MouseButton1Click:Connect(function() apply(mclamp(getter()+step,minV,maxV)) end)
	end

	local function mkConfigWPRow(parent, labelTxt, onWP, order)
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=order; row.Parent=parent
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.6,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text=labelTxt; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local btn=Instance.new("TextButton")
		btn.Size=UDim2.new(0.35,-4,0.7,0); btn.Position=UDim2.new(0.62,0,0.15,0)
		btn.BackgroundColor3=Color3.fromRGB(0,80,160); btn.Text="SET WP"
		btn.Font=Enum.Font.GothamBold; btn.TextColor3=C_WHITE; btn.TextSize=11; btn.BorderSizePixel=0; btn.Parent=row
		local bc=Instance.new("UICorner"); bc.CornerRadius=UDim.new(0,3); bc.Parent=btn
		btn.MouseButton1Click:Connect(function()
			local root=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			if root then onWP(root.CFrame) end
		end)
	end

	local function mkConfigActionRow(parent, btnTxt, btnColor, onAction, order)
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=order; row.Parent=parent
		local btn=Instance.new("TextButton")
		btn.Size=UDim2.new(1,-16,0.75,0); btn.Position=UDim2.new(0,8,0.125,0)
		btn.BackgroundColor3=btnColor or C_RED; btn.Text=btnTxt
		btn.Font=Enum.Font.GothamBlack; btn.TextColor3=C_WHITE; btn.TextSize=12; btn.BorderSizePixel=0; btn.Parent=row
		local bc=Instance.new("UICorner"); bc.CornerRadius=UDim.new(0,3); bc.Parent=btn
		btn.MouseButton1Click:Connect(onAction)
	end

	local function rebuildWall(wp, cf, width, height, thickness)
		if not wp then return end
		wp.CFrame = cf * CFrame.Angles(0, mrad(90), 0)
		wp.Size   = Vector3.new(width or WP_WIDTH, height or WP_HEIGHT, thickness or WP_THICKNESS)
	end

	-- ── SETTINGS: Race ─────────────────────────────────────────
	makeSectionHeader(configScroll, "⚙  RACE", 1)
	mkConfigAdjustRow(configScroll, "Max laps", function() return MAX_LAPS end, function(v) MAX_LAPS=v end, 1, 1, 999, function() towerHeaderText.Text = "LAP ?/"..MAX_LAPS; lapNumLabel.Text = "? / "..MAX_LAPS end, 2)
	mkConfigAdjustRow(configScroll, "Max pit stops", function() return MAX_PITS end, function(v) MAX_PITS=v end, 1, 1, 99, nil, 3)

	do
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=4; row.Parent=configScroll
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.5,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text="Speed limit (km/h)"; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local box=Instance.new("TextBox")
		box.Size=UDim2.new(0.25,0,0.75,0); box.Position=UDim2.new(0.55,0,0.125,0)
		box.BackgroundColor3=Color3.fromRGB(40,40,55); box.BorderSizePixel=0
		box.Font=Enum.Font.GothamBold; box.TextColor3=C_YELLOW; box.TextSize=13
		box.Text=tostring(SPEED_LIMIT); box.ClearTextOnFocus=false; box.Parent=row
		local bc=Instance.new("UICorner"); bc.CornerRadius=UDim.new(0,3); bc.Parent=box
		box:GetPropertyChangedSignal("Text"):Connect(function() box.Text=box.Text:gsub("%D","") end)
		box.FocusLost:Connect(function()
			local n=tonumber(box.Text)
			if not n then box.Text=tostring(SPEED_LIMIT); return end
			SPEED_LIMIT=mclamp(n,10,500); box.Text=tostring(SPEED_LIMIT)
		end)
	end

	-- ── SETTINGS: Qualifying Mode ──────────────────────────────
	makeSectionHeader(configScroll, "🏆  QUALIFYING MODE", 5)
	mkConfigToggleRow(configScroll, "Enable qualifying mode",
		function() return QUALY_MODE end,
		function(v)
			if v and RACE_STATE == "RACE" then
				showNotification("🚫 Cannot enable qualifying during a race", C_RED, "🚫", 12)
				return
			end
			QUALY_MODE = v
			if v then
				RACE_STATE = "QUALY"
				QUALY_BEST_TIMES = {}
				FINAL_QUALY_RESULTS = {}
				FINAL_QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
				QUALY_FIA_STATUS = {}
				QUALY_NAMES = {}
				QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
				if resetSessionMarkers then resetSessionMarkers() end
				for _, pl in ipairs(Players:GetPlayers()) do
					local fd = fastLapData[pl.UserId]
					if fd then fd.bestTime = nil; fd.currentLapStarted = false; fd.lastStartTime = nil end
					local ld = lapData[pl.UserId]
					if ld then ld.lapsMade = 0; ld.lastLapTouch = 0 end
					local pd = pitData[pl.UserId]
					if pd then pd.status = "En Pista"; pd.lastPitTouch = 0 end
				end
			elseif RACE_STATE == "QUALY" then
				FINAL_QUALY_RESULTS = {}
				FINAL_QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
				for uid, qualyTime in pairs(QUALY_BEST_TIMES) do
					local pl = Players:GetPlayerByUserId(uid)
					FINAL_QUALY_RESULTS[uid] = { uid = uid, name = QUALY_NAMES[uid] or (pl and getDisplayName(pl) or ("UID " .. tostring(uid))), time = qualyTime, fiaExcluded = QUALY_FIA_STATUS[uid] == true }
				end
				FINAL_QUALY_GLOBAL_FASTEST = { time = QUALY_GLOBAL_FASTEST.time, uid = QUALY_GLOBAL_FASTEST.uid, name = QUALY_GLOBAL_FASTEST.name }
				QUALY_BEST_TIMES = {}
				RACE_STATE = "IDLE"
			end
			_spaLapRuntimeState(v and "QUALY_START" or "QUALY_FINISH")
			SPA_RaceControl:AddEvent(v and "QUALY_START" or "QUALY_FINISH", { category = "QUALY", severity = "INFO", title = v and "🏆 QUALIFYING STARTED" or "🏁 QUALIFYING FINISHED", description = v and "Qualifying mode enabled" or "Qualifying mode ended" })
			if v then
				towerHeader.BackgroundColor3 = Color3.fromRGB(80, 0, 140)
				towerHeaderText.Text = "QUALIFYING "..QUALY_LAPS.." LAP"

			if ENABLE_CHAT_EVENTS and announceRaceEvent and buildQualyChatMessage then
				announceRaceEvent(buildQualyChatMessage())
			end			else
				towerHeader.BackgroundColor3 = towerConfig.headerColor
				towerHeaderText.Text = "LAP 0/"..MAX_LAPS
			end
		end, 6)

	mkConfigAdjustRow(configScroll, "Qualifying laps", function() return QUALY_LAPS end, function(v) QUALY_LAPS = v end, 1, 1, 99, nil, 7)

	mkConfigActionRow(configScroll, "↺  RESET QUALIFYING TIMES", Color3.fromRGB(80,0,120), function()
		fastLapData = {}
		QUALY_BEST_TIMES = {}
		FINAL_QUALY_RESULTS = {}
		FINAL_QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
		QUALY_FIA_STATUS = {}
		QUALY_NAMES = {}
		QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
		if resetSessionMarkers then resetSessionMarkers() end
		for _, pl in ipairs(Players:GetPlayers()) do ensurePlayerData(pl) end
		bestTimeLabel.Text = "--:--.---  |  ---"
		for uid, row in pairs(fastLapsRowCache) do
			local rightLbl = fastLapsRowRefs[uid] and fastLapsRowRefs[uid].rightLbl
			if rightLbl then rightLbl.Text = "NO TIME"; rightLbl.TextColor3= C_GRAY end
		end
	end, 8)

	-- ── SETTINGS: Calibration ──────────────────────────────────
	makeSectionHeader(configScroll, "📡  CALIBRATION", 9)
	do
		local row1=Instance.new("Frame")
		row1.Size=UDim2.new(1,0,0,34); row1.BackgroundColor3=C_BG2; row1.BorderSizePixel=0; row1.LayoutOrder=10; row1.Parent=configScroll
		local lbl1=Instance.new("TextLabel")
		lbl1.Size=UDim2.new(0.55,0,1,0); lbl1.Position=UDim2.new(0,10,0,0); lbl1.BackgroundTransparency=1
		lbl1.Text="Calibration factor"; lbl1.Font=Enum.Font.GothamBold; lbl1.TextColor3=C_WHITE; lbl1.TextSize=12
		lbl1.TextXAlignment=Enum.TextXAlignment.Left; lbl1.Parent=row1
		local box1=Instance.new("TextBox")
		box1.Size=UDim2.new(0.32,0,0.75,0); box1.Position=UDim2.new(0.56,0,0.125,0)
		box1.BackgroundColor3=Color3.fromRGB(40,40,55); box1.BorderSizePixel=0
		box1.Font=Enum.Font.GothamBold; box1.TextColor3=C_YELLOW; box1.TextSize=13
		box1.Text=tostring(CAL_FACTOR); box1.ClearTextOnFocus=false; box1.Parent=row1
		local bc1=Instance.new("UICorner"); bc1.CornerRadius=UDim.new(0,3); bc1.Parent=box1
		box1.FocusLost:Connect(function()
			local n=tonumber(box1.Text)
			if not n then box1.Text=tostring(CAL_FACTOR); return end
			n=mclamp(n,0.01,10); CAL_FACTOR=n; SPEED_CONVERSION_FACTOR=CAL_FACTOR; box1.Text=tostring(n)
		end)

		local row2=Instance.new("Frame")
		row2.Size=UDim2.new(1,0,0,34); row2.BackgroundColor3=C_BG2; row2.BorderSizePixel=0; row2.LayoutOrder=11; row2.Parent=configScroll
		local lbl2=Instance.new("TextLabel")
		lbl2.Size=UDim2.new(0.55,0,1,0); lbl2.Position=UDim2.new(0,10,0,0); lbl2.BackgroundTransparency=1
		lbl2.Text="Calibration offset"; lbl2.Font=Enum.Font.GothamBold; lbl2.TextColor3=C_WHITE; lbl2.TextSize=12
		lbl2.TextXAlignment=Enum.TextXAlignment.Left; lbl2.Parent=row2
		local box2=Instance.new("TextBox")
		box2.Size=UDim2.new(0.32,0,0.75,0); box2.Position=UDim2.new(0.56,0,0.125,0)
		box2.BackgroundColor3=Color3.fromRGB(40,40,55); box2.BorderSizePixel=0
		box2.Font=Enum.Font.GothamBold; box2.TextColor3=C_YELLOW; box2.TextSize=13
		box2.Text=tostring(CAL_OFFSET); box2.ClearTextOnFocus=false; box2.Parent=row2
		local bc2=Instance.new("UICorner"); bc2.CornerRadius=UDim.new(0,3); bc2.Parent=box2
		box2.FocusLost:Connect(function()
			local n=tonumber(box2.Text)
			if not n then box2.Text=tostring(CAL_OFFSET); return end
			CAL_OFFSET=n; box2.Text=tostring(n)
		end)
	end

	-- ── SETTINGS: Detection ────────────────────────────────────
	makeSectionHeader(configScroll, "🏁  DETECTION", 20)
	mkConfigToggleRow(configScroll, "Lap detection",  function() return DETECT_LAPS end,         function(v) DETECT_LAPS=v end,         21)
	mkConfigToggleRow(configScroll, "Pit detection",    function() return DETECT_PITS end,         function(v) DETECT_PITS=v end,         22)
	mkConfigToggleRow(configScroll, "Vehicles only",     function() return showOnlyVehicles end,    function(v) showOnlyVehicles=v end,    23)

	-- ── SETTINGS: Waypoints ────────────────────────────────────
	makeSectionHeader(configScroll, "📐  WAYPOINTS", 30)
	mkConfigToggleRow(configScroll, "Show waypoints", function() return WP_VISIBLE end, function(v) WP_VISIBLE = v; applyWPVisibility() end, 31)
	-- ─── PER-WAYPOINT SIZE (not combined) ───────────────────────
	makeSectionHeader(configScroll, "📐  LAP WP (Start/Finish Line)", 32)
	mkConfigAdjustRow(configScroll, "LAP – Width (studs)", function() return wpCfg.LAP.width end, function(v)
		wpCfg.LAP.width = v
		if lapWall then lapWall.Size = Vector3.new(wpCfg.LAP.width, wpCfg.LAP.height, wpCfg.LAP.thickness) end
	end, 5, 10, 1000, nil, 33)
	mkConfigAdjustRow(configScroll, "LAP – Height (studs)", function() return wpCfg.LAP.height end, function(v)
		wpCfg.LAP.height = v
		if lapWall then lapWall.Size = Vector3.new(wpCfg.LAP.width, wpCfg.LAP.height, wpCfg.LAP.thickness) end
	end, 5, 10, 500, nil, 34)
	mkConfigAdjustRow(configScroll, "LAP – Thickness (studs)", function() return wpCfg.LAP.thickness end, function(v)
		wpCfg.LAP.thickness = v
		if lapWall then lapWall.Size = Vector3.new(wpCfg.LAP.width, wpCfg.LAP.height, wpCfg.LAP.thickness) end
	end, 1, 1, 200, nil, 35)

	makeSectionHeader(configScroll, "📐  PIT IN WP (Pit Entry)", 36)
	mkConfigAdjustRow(configScroll, "PIT IN – Width (studs)", function() return wpCfg.PIT_IN.width end, function(v)
		wpCfg.PIT_IN.width = v
		if pitInWall then pitInWall.Size = Vector3.new(wpCfg.PIT_IN.width, wpCfg.PIT_IN.height, wpCfg.PIT_IN.thickness) end
	end, 5, 10, 1000, nil, 37)
	mkConfigAdjustRow(configScroll, "PIT IN – Height (studs)", function() return wpCfg.PIT_IN.height end, function(v)
		wpCfg.PIT_IN.height = v
		if pitInWall then pitInWall.Size = Vector3.new(wpCfg.PIT_IN.width, wpCfg.PIT_IN.height, wpCfg.PIT_IN.thickness) end
	end, 5, 10, 500, nil, 38)
	mkConfigAdjustRow(configScroll, "PIT IN – Thickness (studs)", function() return wpCfg.PIT_IN.thickness end, function(v)
		wpCfg.PIT_IN.thickness = v
		if pitInWall then pitInWall.Size = Vector3.new(wpCfg.PIT_IN.width, wpCfg.PIT_IN.height, wpCfg.PIT_IN.thickness) end
	end, 1, 1, 200, nil, 39)

	makeSectionHeader(configScroll, "📐  PIT OUT WP (Pit Exit)", 40)
	mkConfigAdjustRow(configScroll, "PIT OUT – Width (studs)", function() return wpCfg.PIT_OUT.width end, function(v)
		wpCfg.PIT_OUT.width = v
		if pitOutWall then pitOutWall.Size = Vector3.new(wpCfg.PIT_OUT.width, wpCfg.PIT_OUT.height, wpCfg.PIT_OUT.thickness) end
	end, 5, 10, 1000, nil, 41)
	mkConfigAdjustRow(configScroll, "PIT OUT – Height (studs)", function() return wpCfg.PIT_OUT.height end, function(v)
		wpCfg.PIT_OUT.height = v
		if pitOutWall then pitOutWall.Size = Vector3.new(wpCfg.PIT_OUT.width, wpCfg.PIT_OUT.height, wpCfg.PIT_OUT.thickness) end
	end, 5, 10, 500, nil, 42)
	mkConfigAdjustRow(configScroll, "PIT OUT – Thickness (studs)", function() return wpCfg.PIT_OUT.thickness end, function(v)
		wpCfg.PIT_OUT.thickness = v
		if pitOutWall then pitOutWall.Size = Vector3.new(wpCfg.PIT_OUT.width, wpCfg.PIT_OUT.height, wpCfg.PIT_OUT.thickness) end
	end, 1, 1, 200, nil, 43)
	mkConfigAdjustRow(configScroll, "Checkpoint radius", function() return CHECKPOINT_RADIUS end, function(v) CHECKPOINT_RADIUS=v end, 10, 100, 600, function()
		lapSphere.Size       = Vector3.new(CHECKPOINT_RADIUS,CHECKPOINT_RADIUS,CHECKPOINT_RADIUS)
		pitEntrySphere.Size  = Vector3.new(CHECKPOINT_RADIUS,CHECKPOINT_RADIUS,CHECKPOINT_RADIUS)
		pitExitSphere.Size   = Vector3.new(CHECKPOINT_RADIUS,CHECKPOINT_RADIUS,CHECKPOINT_RADIUS)
	end, 34)
	mkConfigWPRow(configScroll, "Start/finish line position", function(cf)
		LAP_LINE_CFRAME=cf
		if lapWall    then lapWall.CFrame=cf*CFrame.Angles(0,mrad(90),0)   end
		if lapSphere  then lapSphere.CFrame=cf                               end
		applyWPVisibility()
		_spaLapRuntimeState("LAP_WALL_REPOSITIONED")
	end, 35)
	mkConfigWPRow(configScroll, "Pit entry position", function(cf)
		PIT_ENTRY_CFRAME=cf
		if pitInWall      then pitInWall.CFrame=cf*CFrame.Angles(0,mrad(90),0)   end
		if pitEntrySphere then pitEntrySphere.CFrame=cf                          end
		applyWPVisibility()
	end, 36)
	mkConfigWPRow(configScroll, "Pit exit position", function(cf)
		PIT_EXIT_CFRAME=cf
		if pitOutWall    then pitOutWall.CFrame=cf*CFrame.Angles(0,mrad(90),0)  end
		if pitExitSphere then pitExitSphere.CFrame=cf                           end
		applyWPVisibility()
	end, 37)

	-- ── SETTINGS: Overhead HUD ─────────────────────────────────
	makeSectionHeader(configScroll, "🧠  OVERHEAD HUD", 40)
	mkConfigToggleRow(configScroll, "Show overhead name",    function() return SHOW_HEAD_NAME  end, function(v) SHOW_HEAD_NAME=v  end, 41)
	mkConfigToggleRow(configScroll, "Show overhead speed", function() return SHOW_HEAD_SPEED end, function(v) SHOW_HEAD_SPEED=v end, 42)

	-- ── SETTINGS: Reset ────────────────────────────────────────
	makeSectionHeader(configScroll, "🔄  RESET", 50)
	mkConfigActionRow(configScroll, "RESET LAPS (all)", C_DARKRED, function()
		lapData={}
		for _,pl in ipairs(Players:GetPlayers()) do ensurePlayerData(pl) end
		for uid, cached in pairs(vueltasRowCache) do
			local lc = cached.lapLbl
			if lc then lc.Text = sformat("LAP 0/%d", MAX_LAPS); lc.TextColor3= C_WHITE end
		end
	end, 51)
	mkConfigActionRow(configScroll, "RESET FASTEST LAPS (all)", C_DARKRED, function()
		fastLapData={}
		QUALY_BEST_TIMES = {}
		FINAL_QUALY_RESULTS = {}
		FINAL_QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
		QUALY_FIA_STATUS = {}
		QUALY_NAMES = {}
		QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
		if resetSessionMarkers then resetSessionMarkers() end
		for _,pl in ipairs(Players:GetPlayers()) do ensurePlayerData(pl) end
		bestTimeLabel.Text="--:--.---  |  ---"
		for uid, row in pairs(fastLapsRowCache) do
			local rightLbl = fastLapsRowRefs[uid] and fastLapsRowRefs[uid].rightLbl
			if rightLbl then rightLbl.Text = "NO TIME"; rightLbl.TextColor3= C_GRAY end
		end
	end, 52)
		mkConfigActionRow(configScroll, "RESET PIT STOPS (all)", C_DARKRED, function()
		pitData={}
		for _,pl in ipairs(Players:GetPlayers()) do ensurePlayerData(pl) end
		for uid, row in pairs(boxesRowCache) do
			local rightLbl = boxesRowRefs[uid] and boxesRowRefs[uid].rightLbl
			if rightLbl then rightLbl.Text = sformat("PIT 0/%d", MAX_PITS); rightLbl.TextColor3= C_WHITE end
		end
	end, 53)
	mkConfigActionRow(configScroll, "HIDE HUD (Q)", C_BG2, function()
		if toggleHUD then toggleHUD() end
	end, 54)

	-- ── SETTINGS: Tower ────────────────────────────────────────
	makeSectionHeader(configScroll, "🏆  TIMING TOWER", 60)
	mkConfigToggleRow(configScroll, "Show tower", function() return towerConfig.visible end, function(v) towerConfig.visible=v; applyTowerConfig() end, 61)

	do  -- Tower size
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=62; row.Parent=configScroll
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.45,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text="Tower size"; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local valLbl=Instance.new("TextLabel")
		valLbl.Size=UDim2.new(0.15,0,1,0); valLbl.Position=UDim2.new(0.45,0,0,0); valLbl.BackgroundTransparency=1
		valLbl.Text=sformat("%.1f",TOWER_SCALE); valLbl.Font=Enum.Font.GothamBold; valLbl.TextColor3=C_YELLOW; valLbl.TextSize=13; valLbl.Parent=row
		local minus=Instance.new("TextButton")
		minus.Size=UDim2.new(0.15,0,0.7,0); minus.Position=UDim2.new(0.62,0,0.15,0)
		minus.BackgroundColor3=Color3.fromRGB(50,50,60); minus.Text="−"; minus.Font=Enum.Font.GothamBold
		minus.TextColor3=C_WHITE; minus.TextSize=16; minus.BorderSizePixel=0; minus.Parent=row
		local mc=Instance.new("UICorner"); mc.CornerRadius=UDim.new(0,3); mc.Parent=minus
		local plus=Instance.new("TextButton")
		plus.Size=UDim2.new(0.15,0,0.7,0); plus.Position=UDim2.new(0.80,0,0.15,0)
		plus.BackgroundColor3=Color3.fromRGB(50,50,60); plus.Text="+"; plus.Font=Enum.Font.GothamBold
		plus.TextColor3=C_WHITE; plus.TextSize=16; plus.BorderSizePixel=0; plus.Parent=row
		local pc=Instance.new("UICorner"); pc.CornerRadius=UDim.new(0,3); pc.Parent=plus
		minus.MouseButton1Click:Connect(function()
			TOWER_SCALE=mclamp(mfloor((TOWER_SCALE-0.1)*10+0.5)/10,0.5,3.0)
			valLbl.Text=sformat("%.1f",TOWER_SCALE); applyTowerScale()
		end)
		plus.MouseButton1Click:Connect(function()
			TOWER_SCALE=mclamp(mfloor((TOWER_SCALE+0.1)*10+0.5)/10,0.5,3.0)
			valLbl.Text=sformat("%.1f",TOWER_SCALE); applyTowerScale()
		end)
	end

	do  -- Tower X position
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=63; row.Parent=configScroll
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.45,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text="X position (%)"; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local valLbl=Instance.new("TextLabel")
		valLbl.Size=UDim2.new(0.15,0,1,0); valLbl.Position=UDim2.new(0.45,0,0,0); valLbl.BackgroundTransparency=1
		valLbl.Text=tostring(mround(towerConfig.posX*100)); valLbl.Font=Enum.Font.GothamBold; valLbl.TextColor3=C_YELLOW; valLbl.TextSize=13; valLbl.Parent=row
		local minus=Instance.new("TextButton")
		minus.Size=UDim2.new(0.15,0,0.7,0); minus.Position=UDim2.new(0.62,0,0.15,0)
		minus.BackgroundColor3=Color3.fromRGB(50,50,60); minus.Text="−"; minus.Font=Enum.Font.GothamBold
		minus.TextColor3=C_WHITE; minus.TextSize=16; minus.BorderSizePixel=0; minus.Parent=row
		local mc=Instance.new("UICorner"); mc.CornerRadius=UDim.new(0,3); mc.Parent=minus
		local plus=Instance.new("TextButton")
		plus.Size=UDim2.new(0.15,0,0.7,0); plus.Position=UDim2.new(0.80,0,0.15,0)
		plus.BackgroundColor3=Color3.fromRGB(50,50,60); plus.Text="+"; plus.Font=Enum.Font.GothamBold
		plus.TextColor3=C_WHITE; plus.TextSize=16; plus.BorderSizePixel=0; plus.Parent=row
		local pc=Instance.new("UICorner"); pc.CornerRadius=UDim.new(0,3); pc.Parent=plus
		minus.MouseButton1Click:Connect(function()
			towerConfig.posX=mclamp(towerConfig.posX-0.05,0,1)
			towerConfig.offsetX=-mround(TOWER_WIDTH*TOWER_SCALE)
			valLbl.Text=tostring(mround(towerConfig.posX*100)); applyTowerConfig()
		end)
		plus.MouseButton1Click:Connect(function()
			towerConfig.posX=mclamp(towerConfig.posX+0.05,0,1)
			towerConfig.offsetX=-mround(TOWER_WIDTH*TOWER_SCALE)
			valLbl.Text=tostring(mround(towerConfig.posX*100)); applyTowerConfig()
		end)
	end

	do  -- Tower Y position
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=64; row.Parent=configScroll
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.45,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text="Y position (%)"; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local valLbl=Instance.new("TextLabel")
		valLbl.Size=UDim2.new(0.15,0,1,0); valLbl.Position=UDim2.new(0.45,0,0,0); valLbl.BackgroundTransparency=1
		valLbl.Text=tostring(mround(towerConfig.posY*100)); valLbl.Font=Enum.Font.GothamBold; valLbl.TextColor3=C_YELLOW; valLbl.TextSize=13; valLbl.Parent=row
		local minus=Instance.new("TextButton")
		minus.Size=UDim2.new(0.15,0,0.7,0); minus.Position=UDim2.new(0.62,0,0.15,0)
		minus.BackgroundColor3=Color3.fromRGB(50,50,60); minus.Text="−"; minus.Font=Enum.Font.GothamBold
		minus.TextColor3=C_WHITE; minus.TextSize=16; minus.BorderSizePixel=0; minus.Parent=row
		local mc=Instance.new("UICorner"); mc.CornerRadius=UDim.new(0,3); mc.Parent=minus
		local plus=Instance.new("TextButton")
		plus.Size=UDim2.new(0.15,0,0.7,0); plus.Position=UDim2.new(0.80,0,0.15,0)
		plus.BackgroundColor3=Color3.fromRGB(50,50,60); plus.Text="+"; plus.Font=Enum.Font.GothamBold
		plus.TextColor3=C_WHITE; plus.TextSize=16; plus.BorderSizePixel=0; plus.Parent=row
		local pc=Instance.new("UICorner"); pc.CornerRadius=UDim.new(0,3); pc.Parent=plus
		minus.MouseButton1Click:Connect(function()
			towerConfig.posY=mclamp(towerConfig.posY-0.05,0,1)
			towerConfig.offsetY=12; valLbl.Text=tostring(mround(towerConfig.posY*100)); applyTowerConfig()
		end)
		plus.MouseButton1Click:Connect(function()
			towerConfig.posY=mclamp(towerConfig.posY+0.05,0,1)
			towerConfig.offsetY=12; valLbl.Text=tostring(mround(towerConfig.posY*100)); applyTowerConfig()
		end)
	end

	do  -- Tower header color
		local colorOptions={
			{name="RED",    color=Color3.fromRGB(230,0,0)},
			{name="WHITE",  color=Color3.fromRGB(200,200,200)},
			{name="GREEN",   color=Color3.fromRGB(0,180,70)},
			{name="YELLOW",color=Color3.fromRGB(220,180,0)},
			{name="BLUE",    color=Color3.fromRGB(0,100,210)},
			{name="ORANGE", color=Color3.fromRGB(255,130,0)},
			{name="PURPLE",  color=Color3.fromRGB(140,0,200)},
		}
		local colorIndex=1
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=65; row.Parent=configScroll
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.45,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text="Header color"; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local colorBtn=Instance.new("TextButton")
		colorBtn.Size=UDim2.new(0.50,-8,0.7,0); colorBtn.Position=UDim2.new(0.48,0,0.15,0)
		colorBtn.BackgroundColor3=colorOptions[colorIndex].color
		colorBtn.Text=colorOptions[colorIndex].name
		colorBtn.Font=Enum.Font.GothamBold; colorBtn.TextColor3=C_WHITE; colorBtn.TextSize=11
		colorBtn.BorderSizePixel=0; colorBtn.Parent=row
		local cbc2=Instance.new("UICorner"); cbc2.CornerRadius=UDim.new(0,3); cbc2.Parent=colorBtn
		colorBtn.MouseButton1Click:Connect(function()
			colorIndex=colorIndex%#colorOptions+1
			local opt=colorOptions[colorIndex]
			colorBtn.BackgroundColor3=opt.color; colorBtn.Text=opt.name
			towerConfig.headerColor=opt.color; applyTowerConfig()
		end)
	end

	do  -- Tower title
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=66; row.Parent=configScroll
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.35,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text="Tower title"; lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local input=Instance.new("TextBox")
		input.Size=UDim2.new(0.40,0,0.7,0); input.Position=UDim2.new(0.36,0,0.15,0)
		input.BackgroundColor3=Color3.fromRGB(30,30,40); input.BorderSizePixel=0
		input.Text=towerConfig.titleText; input.Font=Enum.Font.GothamBold
		input.TextColor3=C_YELLOW; input.TextSize=11; input.ClearTextOnFocus=false
		input.TextXAlignment=Enum.TextXAlignment.Left; input.Parent=row
		local tic=Instance.new("UICorner"); tic.CornerRadius=UDim.new(0,3); tic.Parent=input
		local tip=Instance.new("UIPadding"); tip.PaddingLeft=UDim.new(0,4); tip.Parent=input
		local okBtn=Instance.new("TextButton")
		okBtn.Size=UDim2.new(0.20,-4,0.7,0); okBtn.Position=UDim2.new(0.78,0,0.15,0)
		okBtn.BackgroundColor3=Color3.fromRGB(0,100,40); okBtn.Text="✔ OK"
		okBtn.Font=Enum.Font.GothamBold; okBtn.TextColor3=C_WHITE; okBtn.TextSize=11
		okBtn.BorderSizePixel=0; okBtn.Parent=row
		local okc=Instance.new("UICorner"); okc.CornerRadius=UDim.new(0,3); okc.Parent=okBtn
		okBtn.MouseButton1Click:Connect(function()
			if input.Text and input.Text~="" then
				towerConfig.titleText=input.Text
				towerHeaderText.Text=input.Text
			end
		end)
	end

	mkConfigActionRow(configScroll, "↺  RESET TOWER POSITION", Color3.fromRGB(40,40,60), function()
		TOWER_SCALE=1.0
		towerConfig.posX=1; towerConfig.offsetX=-TOWER_WIDTH
		towerConfig.posY=0; towerConfig.offsetY=12
		applyTowerScale(); applyTowerConfig()
	end, 67)

	-- ══════════════════════════════════════════════════════════
	-- LIST UPDATES
	-- ══════════════════════════════════════════════════════════
	local function updateGuiLists()
		if SPA_LapsControl.initialized then SPA_LapsControl:Refresh() end
		local perfStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
		local activeUids = {}
		local allData = {}
		for _, p in ipairs(Players:GetPlayers()) do
			if p then
				local playerOk, playerErr = pcall(function()
					ensurePlayerData(p)
					local uid = p.UserId
					local lap = lapData[uid]
					local pit = pitData[uid]
					local fast = fastLapData[uid]
					local state = PlayerState and PlayerState[uid]
					if not lap or not pit or not fast then error("incomplete race data") end
					-- Visible speed is updated in HB-SPEED; it is not part of the standings.
					-- Avoid recalculating it here so lightweight HUD refreshes do not duplicate work.
					local speed = 0
					-- A temporarily missing Root only prevents geometric checks;
					-- it does not exclude the driver from the HUD or their session data.
					tinsert(allData, { player = p, state = state, lap = lap, pit = pit, fast = fast, speed = speed or 0 })
					activeUids[uid] = true
				end)
				if not playerOk then warnHudError("player_data", p, playerErr) end
			end
		end

		for uid, cached in pairs(vueltasRowCache) do
			if not activeUids[uid] or not cached or not cached.topRow or not cached.topRow.Parent or not cached.btnRow or not cached.btnRow.Parent then
				if cached then safeDestroyGui(cached.topRow); safeDestroyGui(cached.btnRow) end
				vueltasRowCache[uid] = nil
			end
		end
		for uid, row in pairs(boxesRowCache) do
			if not activeUids[uid] or not row or not row.Parent then safeDestroyGui(row); boxesRowCache[uid] = nil; boxesRowRefs[uid] = nil end
		end
		for uid, row in pairs(fastLapsRowCache) do
			if not activeUids[uid] or not row or not row.Parent then safeDestroyGui(row); fastLapsRowCache[uid] = nil; fastLapsRowRefs[uid] = nil end
		end

		local rankParts = { tostring(RACE_STATE), tostring(QUALY_MODE) }
		for _, pd in ipairs(allData) do
			local uid = pd.player.UserId
			HUD_RANK_CACHE.byUid[uid] = pd
			rankParts[#rankParts + 1] = table.concat({ tostring(uid), tostring(pd.lap.lapsMade or 0), tostring(pd.lap.lastLapTouch or 0), tostring(PENALTY_OFFSET[uid] or 0), tostring(pd.fast.bestTime or 0), tostring(QUALY_BEST_TIMES[uid] or 0), tostring(FIA_EXCLUDED[uid] and 1 or 0), tostring(DSQ_DRIVERS[uid] and 1 or 0) }, "|")
		end
		for uid in pairs(HUD_RANK_CACHE.byUid) do if not activeUids[uid] then HUD_RANK_CACHE.byUid[uid] = nil end end
		local rankSignature = table.concat(rankParts, ";")
		local standingsData, qualySorted
		local rankChanged = HUD_RANK_CACHE.signature ~= rankSignature
		if rankChanged then
			tsort(allData, function(a,b)
				local al, bl = a.lap, b.lap
				local la,lb = al.lapsMade or 0, bl.lapsMade or 0
				if la ~= lb then return la > lb end
				local ta = al.lastLapTouch == 0 and math.huge or (al.lastLapTouch or math.huge)
				local tb = bl.lastLapTouch == 0 and math.huge or (bl.lastLapTouch or math.huge)
				ta += PENALTY_OFFSET[a.player.UserId] or 0; tb += PENALTY_OFFSET[b.player.UserId] or 0
				if ta ~= tb then return ta < tb end
				return a.player.Name < b.player.Name
			end)
			HUD_RANK_CACHE.standings = {}
			for i, pd in ipairs(allData) do HUD_RANK_CACHE.standings[i] = pd.player.UserId end
			qualySorted = {}
			for _, pd in ipairs(allData) do qualySorted[#qualySorted + 1] = pd end
			tsort(qualySorted, function(a,b)
				local auid, buid = a.player.UserId, b.player.UserId
				local at = QUALY_MODE and QUALY_BEST_TIMES[auid] or a.fast.bestTime
				local bt = QUALY_MODE and QUALY_BEST_TIMES[buid] or b.fast.bestTime
				if at and bt then return at < bt elseif at then return true elseif bt then return false end
				return a.player.Name < b.player.Name
			end)
			HUD_RANK_CACHE.qualy = {}
			for i, pd in ipairs(qualySorted) do HUD_RANK_CACHE.qualy[i] = pd.player.UserId end
			HUD_RANK_CACHE.signature = rankSignature
		else
			standingsData, qualySorted = {}, {}
			for i, uid in ipairs(HUD_RANK_CACHE.standings) do standingsData[i] = HUD_RANK_CACHE.byUid[uid] end
			for i, uid in ipairs(HUD_RANK_CACHE.qualy) do qualySorted[i] = HUD_RANK_CACHE.byUid[uid] end
		end
		if not standingsData then standingsData = allData end
		allData = standingsData
		CURRENT_STANDINGS_ORDER = HUD_RANK_CACHE.standings
		if rankChanged and RACE_STATE == "RACE" and SPA_RaceControl and SPA_RaceControl.ObserveStandings then
			local ok, err = pcall(SPA_RaceControl.ObserveStandings, SPA_RaceControl, CURRENT_STANDINGS_ORDER)
			if not ok then warnHudError("race_control", nil, err) end
		end
		if rankChanged and RACE_STATE == "RACE" and SPA_RaceControl and SPA_RaceControl.updateHeaderFn then
			local ok, err = pcall(SPA_RaceControl.updateHeaderFn)
			if not ok then warnHudError("race_control_header", nil, err) end
		end
		if rankChanged then
			QUALY_STANDINGS = {}
			for i, pd in ipairs(qualySorted) do QUALY_STANDINGS[i] = { uid = pd.player.UserId, bestTime = QUALY_MODE and QUALY_BEST_TIMES[pd.player.UserId] or nil } end
		end
		local hudSignatureParts = { rankSignature, tostring(TOWER_SCALE), tostring(GAP_MODE_LEAD), tostring(ENABLE_GAP), tostring(towerConfig.visible), tostring(towerConfig.hudMasterVisible) }
		for _, pd in ipairs(allData) do
			local uid, custom = pd.player.UserId, customPlayerData[pd.player.UserId]
			hudSignatureParts[#hudSignatureParts + 1] = table.concat({ tostring(uid), tostring(getDisplayName(pd.player)), tostring(custom and custom.imageId or ""), tostring(custom and custom.color or ""), tostring(pd.pit.status or ""), tostring(pd.pit.pitStopsMade or 0) }, "|")
		end
		local hudSignature = table.concat(hudSignatureParts, ";")
		if HUD_LAST_SIGNATURE == hudSignature then
			SPA_PerfMark("GUI", perfStart, "unchanged")
			return
		end
		HUD_LAST_SIGNATURE = hudSignature

		-- Filter FIA-excluded drivers out of the tower
		-- Destroy any existing row so it disappears cleanly
		for uid2, tRow2 in pairs(towerRows) do
			if FIA_EXCLUDED[uid2] then
				safeDestroyGui(tRow2)
				towerRows[uid2] = nil
				towerRowData[uid2] = nil
			end
		end
		local _towerFiltered = {}
		for _, pd in ipairs(QUALY_MODE and qualySorted or allData) do
			if not FIA_EXCLUDED[pd.player.UserId] then
				table.insert(_towerFiltered, pd)
			end
		end
		local sourceData = _towerFiltered

		local bestQualyTime = (qualySorted[1] and (QUALY_MODE and QUALY_BEST_TIMES[qualySorted[1].player.UserId] or qualySorted[1].fast.bestTime)) or nil
		local towerVisibleUids = {}

		for i, pd in ipairs(sourceData) do
			if i > MAX_PLAYERS_DISPLAY then break end
			local uid     = pd.player.UserId
			towerVisibleUids[uid] = true
			local row     = towerRows[uid]
			local displayName = getDisplayName(pd.player) .. (DSQ_DRIVERS[uid] and " [DSQ]" or "")

			if not row then
				row = getOrCreateTowerRow(uid, displayName, i)
			else
				local existingData = towerRowData[uid]
				if not existingData or existingData.lastLayoutPos ~= i then row.LayoutOrder = i; if existingData then existingData.lastLayoutPos = i end end
			end

			if row then
				local rd = towerRowData[uid]
				if rd then
					if rd.lastPos and rd.lastPos ~= i then animTowerRow(uid, i, rd.lastPos) end
					rd.lastPos = i

					local newName = supper(ssub(displayName,1,8))
					if rd.nameTxt and rd.lastName ~= newName then
						rd.nameTxt.Text = newName
						rd.lastName     = newName
					end
					local nameColor = FIA_EXCLUDED[uid] and C_BLUE or getNameColor(pd.player)
					if rd.lastColor ~= nameColor then
						if rd.nameTxt then rd.nameTxt.TextColor3 = nameColor end
						if rd.teamBar then rd.teamBar.BackgroundColor3 = nameColor end
						rd.lastColor = nameColor
					end

					if rd.posTxt and rd.lastPosNum ~= i then
						rd.posTxt.Text   = tostring(i)
						rd.lastPosNum    = i
					end
					if rd.posFrame then
						if i == 1 then rd.posFrame.BackgroundColor3 = QUALY_MODE and C_F1_PURPLE or C_RED
						elseif i <= 3 then rd.posFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 100)
						else rd.posFrame.BackgroundColor3 = C_WHITE end
					end
					if rd.posTxt then rd.posTxt.TextColor3 = (i <= 3) and C_WHITE or C_BG end

					local lapTxt = rd.lapTxt
					if lapTxt then
						local newLapText, newLapColor
						if QUALY_MODE then
							local qualyTime = QUALY_BEST_TIMES[uid]
							if qualyTime then
								if i == 1 then newLapText = fmtTime(qualyTime); newLapColor = C_F1_PURPLE
								else local delta = qualyTime - (bestQualyTime or qualyTime); newLapText = fmtTimeDelta(delta); newLapColor = C_F1_YELLOW end
							else newLapText = "NO TIME"; newLapColor = C_GRAY end
							local textSize = mclamp(mround(7*TOWER_SCALE), 6, 12); if rd.lastLapTextSize ~= textSize then lapTxt.TextSize = textSize; rd.lastLapTextSize = textSize end
						elseif ENABLE_GAP and i > 1 then
							local refUid = GAP_MODE_LEAD and sourceData[1].player.UserId or sourceData[i-1].player.UserId
							local gapOk, gapResult = pcall(computeGapText, uid, refUid)
							if not gapOk then warnHudError("computeGapText", pd.player, gapResult); gapResult = "---" end
							newLapText = gapResult or "---"; newLapColor = C_YELLOW
							local textSize = mclamp(mround(9*TOWER_SCALE), 7, 16); if rd.lastLapTextSize ~= textSize then lapTxt.TextSize = textSize; rd.lastLapTextSize = textSize end
						else
							newLapText = "L"..(pd.lap.lapsMade or 0); newLapColor = C_GRAY
							local textSize = mclamp(mround(10*TOWER_SCALE), 8, 18); if rd.lastLapTextSize ~= textSize then lapTxt.TextSize = textSize; rd.lastLapTextSize = textSize end
						end
						if rd.lastLap ~= newLapText then
							lapTxt.Text = newLapText
							rd.lastLap  = newLapText
						end
						if rd.lastLapColor ~= newLapColor then lapTxt.TextColor3 = newLapColor; rd.lastLapColor = newLapColor end
					end
				end
			end

			local uid = pd.player.UserId
			if vueltasRowCache[uid] then
				local cached   = vueltasRowCache[uid]
				local cachedTop = cached.topRow
				local cachedBtn = cached.btnRow
				if cachedTop then
					cachedTop.LayoutOrder = i * 10
					local lc = cached.lapLbl
					if lc then
						local ld = lapData[uid] or {lapsMade=0}; local lapText = sformat("LAP %d/%d", ld.lapsMade or 0, MAX_LAPS); local lapColor = (ld.lapsMade or 0)==MAX_LAPS and C_YELLOW or C_WHITE
						if lc.Text ~= lapText then lc.Text = lapText end; if lc.TextColor3 ~= lapColor then lc.TextColor3 = lapColor end
					end
					local nameLbl = cached.nameLbl
					if nameLbl then
						local displayName = getDisplayName(pd.player)..(FIA_EXCLUDED[uid] and "  [FIA]" or "")
						local nameColor = FIA_EXCLUDED[uid] and C_BLUE or getNameColor(pd.player)
						if nameLbl.Text ~= displayName then nameLbl.Text = displayName end; if nameLbl.TextColor3 ~= nameColor then nameLbl.TextColor3 = nameColor end
					end
					local posLbl = cached.posLbl
					if posLbl and posLbl.Text ~= "P"..i then posLbl.Text = "P"..i end
				end
				if cachedBtn then cachedBtn.LayoutOrder = i * 10 + 1 end
			else
				makeVueltasRow(vueltasScroll, i, i, pd.player)
			end

			local displayName2 = getDisplayName(pd.player)..(FIA_EXCLUDED[uid] and "  [FIA]" or "")
			local nameCol2     = FIA_EXCLUDED[uid] and C_BLUE or getNameColor(pd.player)
			local pitText      = sformat("PIT %d/%d", pd.pit.pitStopsMade or 0, MAX_PITS)
			local pitColor     = pd.pit.status=="En Boxes" and C_ORANGE or C_WHITE

			if boxesRowCache[uid] then
				local cachedRow = boxesRowCache[uid]
				local rowRefs = boxesRowRefs[uid]
				cachedRow.LayoutOrder = i
				local nameLbl  = rowRefs and rowRefs.nameLbl
				local posLbl   = rowRefs and rowRefs.posLbl
				local rightLbl = rowRefs and rowRefs.rightLbl
				if nameLbl  then if nameLbl.Text ~= displayName2 then nameLbl.Text = displayName2 end; if nameLbl.TextColor3 ~= nameCol2 then nameLbl.TextColor3 = nameCol2 end end
				if posLbl   and posLbl.Text ~= "P"..i then posLbl.Text = "P"..i end
				if rightLbl then if rightLbl.Text ~= pitText then rightLbl.Text = pitText end; if rightLbl.TextColor3 ~= pitColor then rightLbl.TextColor3 = pitColor end end
			else
				local order = i
				local row = Instance.new("Frame")
				row.Size = UDim2.new(1,0,0,30); row.BackgroundColor3 = order % 2 == 0 and C_BG2 or C_BG; row.BorderSizePixel = 0; row.LayoutOrder = order; row.Parent = boxesScroll
				local bar = Instance.new("Frame")
				bar.Size = UDim2.new(0,3,1,0); bar.BackgroundColor3 = Color3.fromHSV((order*0.13)%1, 0.85, 1); bar.BorderSizePixel = 0; bar.Parent = row
				local posLbl = Instance.new("TextLabel")
				posLbl.Name = "PosLbl"; posLbl.Size = UDim2.new(0,28,1,0); posLbl.Position = UDim2.new(0,6,0,0); posLbl.BackgroundTransparency = 1; posLbl.Text = "P"..i; posLbl.Font = Enum.Font.GothamBlack; posLbl.TextColor3 = C_RED; posLbl.TextSize = 13; posLbl.TextXAlignment = Enum.TextXAlignment.Left; posLbl.Parent = row
				local nameLbl = Instance.new("TextLabel")
				nameLbl.Name = "NameLbl"; nameLbl.Size = UDim2.new(0.5,0,1,0); nameLbl.Position = UDim2.new(0,38,0,0); nameLbl.BackgroundTransparency = 1; nameLbl.Text = displayName2; nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextColor3 = nameCol2; nameLbl.TextSize = 12; nameLbl.TextXAlignment = Enum.TextXAlignment.Left; nameLbl.Parent = row
				local rightLbl = Instance.new("TextLabel")
				rightLbl.Name = "RightLbl"; rightLbl.Size = UDim2.new(0.4,-8,1,0); rightLbl.Position = UDim2.new(0.6,0,0,0); rightLbl.BackgroundTransparency = 1; rightLbl.Text = pitText; rightLbl.Font = Enum.Font.GothamBold; rightLbl.TextColor3 = pitColor; rightLbl.TextSize = 12; rightLbl.TextXAlignment = Enum.TextXAlignment.Right; rightLbl.Parent = row
				local rp = Instance.new("UIPadding"); rp.PaddingRight = UDim.new(0,8); rp.Parent = row
				boxesRowCache[uid] = row
				boxesRowRefs[uid] = { nameLbl = nameLbl, posLbl = posLbl, rightLbl = rightLbl }
			end
		end
		for oldUid, oldRow in pairs(towerRows) do
			if not towerVisibleUids[oldUid] or not oldRow or not oldRow.Parent then
				safeDestroyGui(oldRow); towerRows[oldUid] = nil; towerRowData[oldUid] = nil
			end
		end

		for i, pd in ipairs(qualySorted) do
			local uid       = pd.player.UserId
			local timeText  = pd.fast.bestTime and fmtTime(pd.fast.bestTime) or "NO TIME"
			local timeColor = pd.fast.bestTime and (i==1 and C_GREEN or C_WHITE) or C_GRAY

			if fastLapsRowCache[uid] then
				local cachedRow = fastLapsRowCache[uid]
				local rowRefs = fastLapsRowRefs[uid]
				cachedRow.LayoutOrder = i
				local posLbl   = rowRefs and rowRefs.posLbl
				local nameLbl  = rowRefs and rowRefs.nameLbl
				local rightLbl = rowRefs and rowRefs.rightLbl
				if posLbl and posLbl.Text ~= "P"..i then posLbl.Text = "P"..i end
				if nameLbl then local nm = getDisplayName(pd.player); local nc = getNameColor(pd.player); if nameLbl.Text ~= nm then nameLbl.Text = nm end; if nameLbl.TextColor3 ~= nc then nameLbl.TextColor3 = nc end end
				if rightLbl then if rightLbl.Text ~= timeText then rightLbl.Text = timeText end; if rightLbl.TextColor3 ~= timeColor then rightLbl.TextColor3 = timeColor end end
			else
				local order = i
				local row = Instance.new("Frame")
				row.Size = UDim2.new(1,0,0,30); row.BackgroundColor3 = order % 2 == 0 and C_BG2 or C_BG; row.BorderSizePixel = 0; row.LayoutOrder = order; row.Parent = fastLapsScroll
				local bar = Instance.new("Frame")
				bar.Size = UDim2.new(0,3,1,0); bar.BackgroundColor3 = Color3.fromHSV((order*0.13)%1, 0.85, 1); bar.BorderSizePixel = 0; bar.Parent = row
				local posLbl = Instance.new("TextLabel")
				posLbl.Name = "PosLbl"; posLbl.Size = UDim2.new(0,28,1,0); posLbl.Position = UDim2.new(0,6,0,0); posLbl.BackgroundTransparency = 1; posLbl.Text = "P"..i; posLbl.Font = Enum.Font.GothamBlack; posLbl.TextColor3 = C_RED; posLbl.TextSize = 13; posLbl.TextXAlignment = Enum.TextXAlignment.Left; posLbl.Parent = row
				local nameLbl = Instance.new("TextLabel")
				nameLbl.Name = "NameLbl"; nameLbl.Size = UDim2.new(0.5,0,1,0); nameLbl.Position = UDim2.new(0,38,0,0); nameLbl.BackgroundTransparency = 1; nameLbl.Text = getDisplayName(pd.player); nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextColor3 = getNameColor(pd.player); nameLbl.TextSize = 12; nameLbl.TextXAlignment = Enum.TextXAlignment.Left; nameLbl.Parent = row
				local rightLbl = Instance.new("TextLabel")
				rightLbl.Name = "RightLbl"; rightLbl.Size = UDim2.new(0.4,-8,1,0); rightLbl.Position = UDim2.new(0.6,0,0,0); rightLbl.BackgroundTransparency = 1; rightLbl.Text = timeText; rightLbl.Font = Enum.Font.GothamBold; rightLbl.TextColor3 = timeColor; rightLbl.TextSize = 12; rightLbl.TextXAlignment = Enum.TextXAlignment.Right; rightLbl.Parent = row
				local rp = Instance.new("UIPadding"); rp.PaddingRight = UDim.new(0,8); rp.Parent = row
				fastLapsRowCache[uid] = row
				fastLapsRowRefs[uid] = { nameLbl = nameLbl, posLbl = posLbl, rightLbl = rightLbl }
			end
		end

		local bestSession = RACE_STATE == "QUALY" and QUALY_GLOBAL_FASTEST or (RACE_STATE == "RACE" and RACE_GLOBAL_FASTEST or nil)
		local bestSessionPlayer = bestSession and bestSession.uid and Players:GetPlayerByUserId(bestSession.uid)
		if bestSession and bestSessionPlayer and bestSession.time < math.huge then
			bestTimeLabel.Text = (RACE_STATE == "QUALY" and "QUALIFYING BEST  " or "RACE FASTEST  ") .. fmtTime(bestSession.time) .. "  |  " .. getDisplayName(bestSessionPlayer)
			bestTimeLabel.TextColor3 = RACE_STATE == "QUALY" and C_F1_PURPLE or C_GREEN
		else
			bestTimeLabel.Text = "--:--.---  |  ---"; bestTimeLabel.TextColor3 = C_GRAY
		end

		local leaderLaps = (allData[1] and allData[1].lap.lapsMade) or 0
		if QUALY_MODE then towerHeaderText.Text = "QUALIFYING "..QUALY_LAPS.." LAP"
		else towerHeaderText.Text = "LAP "..leaderLaps.."/"..MAX_LAPS end
		lapNumLabel.Text = leaderLaps.." / "..MAX_LAPS
			SPA_PerfMark("GUI", perfStart)
	end

	previousLapPositions = {}
	SPA_UI2_lapStateLogAt = {}
	SPA_UI2_lastSeenInPitIn  = {}
	SPA_UI2_lastSeenInPitOut = {}
	resetSessionMarkers = function()
		previousLapPositions = {}; SPA_UI2_lapStateLogAt = {}; SPA_UI2_lastSeenInPitIn = {}; SPA_UI2_lastSeenInPitOut = {}; lastSeenInCC = {}; ccDebounce = {}
	end

	local function getLapEffectivePosition(uid, st)
		if st.inVehicle and st.seat and st.seat.Parent then
			local seatOk, seatPosition = pcall(function() return st.seat.Position end)
			if seatOk and seatPosition then return seatPosition, "SEAT", st.seat end
		end
		if st.root and st.root.Parent then
			local rootOk, rootPosition = pcall(function() return st.root.Position end)
			if rootOk and rootPosition then return rootPosition, "ROOT", nil end
		end
		return nil, nil, nil
	end

	local function crossedLapSegment(prevPos, currentPos)
		if not lapWall or not lapWall.Parent or not prevPos or not currentPos then return false, nil end
		local prevLocal = lapWall.CFrame:PointToObjectSpace(prevPos)
		local currentLocal = lapWall.CFrame:PointToObjectSpace(currentPos)
		local crossesPlane = (prevLocal.Z >= 0 and currentLocal.Z < 0) or (prevLocal.Z < 0 and currentLocal.Z >= 0)
		if not crossesPlane then return false, nil end
		local denominator = prevLocal.Z - currentLocal.Z
		if mabs(denominator) < 1e-6 then return false, { prevZ = prevLocal.Z, currentZ = currentLocal.Z, valid = false } end
		local alpha = mclamp(prevLocal.Z / denominator, 0, 1)
		local hit = prevLocal + (currentLocal - prevLocal) * alpha
		local detection = wpCfg.LAP
		local tolerance = detection.detectionTolerance or 0
		local valid = mabs(hit.X) <= (detection.detectionWidth or lapWall.Size.X) / 2 + tolerance
			and mabs(hit.Y) <= (detection.detectionHeight or lapWall.Size.Y) / 2 + tolerance
		return valid, { prevZ = prevLocal.Z, currentZ = currentLocal.Z, hitX = hit.X, hitY = hit.Y, valid = valid }
	end

	local function createSpeedTag(character, p)
		local head = character:FindFirstChild("Head")
		if not head then return end
		local existing = head:FindFirstChild("SpeedTag")
		if existing then return existing end

		local billboard = Instance.new("BillboardGui")
		-- [SPAV4] 3 lines: Name · Speed · Telemetry
		billboard.Name        = "SpeedTag"; billboard.Size = UDim2.new(0,240,0,68); billboard.StudsOffset = Vector3.new(0,3,0); billboard.AlwaysOnTop = true; billboard.MaxDistance = math.huge; billboard.Adornee = head; billboard.Parent = head
		local nameLbl = Instance.new("TextLabel")
		nameLbl.Name = "NameLabel"; nameLbl.Size = UDim2.new(1,0,0.33,0); nameLbl.BackgroundTransparency= 1; nameLbl.TextColor3 = getNameColor(p); nameLbl.TextStrokeColor3 = Color3.fromRGB(0,0,0); nameLbl.TextStrokeTransparency= 0; nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextScaled = true; nameLbl.Text = getDisplayName(p); nameLbl.Parent = billboard
		local speedLbl = Instance.new("TextLabel")
		speedLbl.Name = "SpeedText"; speedLbl.Size = UDim2.new(1,0,0.33,0); speedLbl.Position = UDim2.new(0,0,0.33,0); speedLbl.BackgroundTransparency= 1; speedLbl.TextColor3 = C_WHITE; speedLbl.TextStrokeColor3 = Color3.fromRGB(0,0,0); speedLbl.TextStrokeTransparency= 0; speedLbl.Font = Enum.Font.GothamBold; speedLbl.TextScaled = false; speedLbl.Text = ""; speedLbl.Parent = billboard
		-- Telemetry line (Turbo · Drift · Suspension)
		local telLbl = Instance.new("TextLabel")
		telLbl.Name = "TelemetryText"; telLbl.Size = UDim2.new(1,0,0.34,0); telLbl.Position = UDim2.new(0,0,0.66,0); telLbl.BackgroundTransparency= 1; telLbl.TextColor3 = Color3.fromRGB(160,210,255); telLbl.TextStrokeColor3 = Color3.fromRGB(0,0,0); telLbl.TextStrokeTransparency= 0; telLbl.Font = Enum.Font.GothamBold; telLbl.TextScaled = false; telLbl.Text = ""; telLbl.Parent = billboard
		return billboard
	end

	local function removeSpeedTag(character)
		local head = character:FindFirstChild("Head")
		if head then local tag = head:FindFirstChild("SpeedTag"); if tag then tag:Destroy() end end
	end

	SPA_UI2_alertedPlayers = {}
	-- ══════════════════════════════════════════════════════════
	-- ══════════════════════════════════════════════════════════
-- PLAYERSTATE CACHE (0.06s): a single source of character/
-- humanoid/head/root/seat per player. References are recovered
-- lazily if the Character finishes building after the
-- first cycle or an Instance loses its Parent.
	-- ══════════════════════════════════════════════════════════
	PlayerState = {}
	local _tState = 0
	RunService.Heartbeat:Connect(function(dt)
		_tState += dt
		if _tState < 0.06 then return end
		_tState = 0
		local perfStateStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
		for _, p in ipairs(Players:GetPlayers()) do
			local uid = p.UserId
			local st  = PlayerState[uid]
			if not st then st = {}; PlayerState[uid] = st end
			st.player = p
			local char = p.Character
			if char ~= st.character then
				if st.charAncestryConn then pcall(function() st.charAncestryConn:Disconnect() end); st.charAncestryConn = nil end
				st.character = char
				st.humanoid  = nil
				st.head      = nil
				st.root      = nil
				if char then
					local okConn, conn = pcall(function()
						return char.AncestryChanged:Connect(function(_, parent)
							if not parent then st.humanoid = nil; st.head = nil; st.root = nil; st.seat = nil; st.inVehicle = false end
						end)
					end)
					if okConn then st.charAncestryConn = conn end
				end
			end
			if char then
				if not st.humanoid or not st.humanoid.Parent then
					st.humanoid = char:FindFirstChildOfClass("Humanoid")
				end
				if not st.head or not st.head.Parent then
					st.head = char:FindFirstChild("Head")
				end
				if not st.root or not st.root.Parent then
					st.root = char:FindFirstChild("HumanoidRootPart")
				end
			end
			if st.humanoid and st.humanoid.Parent then
				local seat = st.humanoid.SeatPart
				st.seat      = seat
				st.inVehicle = seat ~= nil and (seat:IsA("VehicleSeat") or seat:IsA("Seat"))
			else
				st.seat = nil; st.inVehicle = false
			end
			if st.root and st.root.Parent then
				local positionOk, position = pcall(function() return st.root.Position end)
				st.position = positionOk and position or nil
			else
				st.position = nil
			end
		end
		-- Remove players who are no longer in the server
		for uid in pairs(PlayerState) do
			if not Players:GetPlayerByUserId(uid) then PlayerState[uid] = nil end
		end
		SPA_PerfMark("PlayerState", perfStateStart)
	end)

	-- ══════════════════════════════════════════════════════════
	-- VEHICLECACHE: discover references once per vehicle instead
	-- of repeatedly looking them up with GetDescendants().
	-- Invalidated only when the player changes seat/vehicle.
	-- ══════════════════════════════════════════════════════════
	VehicleCache = {}

	local function getVehicleRootModel(seat)
		return _telGetRootModel(seat)
	end

	local function destroyVehicleEngineSound(vc)
		if vc and vc.engineSound then
			if vc.audioOwnsSound then pcall(function() vc.engineSound:Destroy() end) end
			vc.engineSound = nil
		end
	end

	local function cleanupVehicleCache(uid, vc)
		if not vc or vc.cleaned then return end
		vc.cleaned = true
		SPA_NoClip:Clear(uid, vc)
		destroyVehicleEngineSound(vc)
		if vc and vc.audioConn then pcall(function() vc.audioConn:Disconnect() end); vc.audioConn = nil end
		if vc and vc.nitrousDescendantConn then pcall(function() vc.nitrousDescendantConn:Disconnect() end); vc.nitrousDescendantConn = nil end
		if vc and vc.nitrousRemovingConn then pcall(function() vc.nitrousRemovingConn:Disconnect() end); vc.nitrousRemovingConn = nil end
		if vc and vc.vehicleRoot and SPA_Telemetry and SPA_Telemetry.suspCache then
			local sc = SPA_Telemetry.suspCache[vc.vehicleRoot]
			if sc and sc.connections then for _, c in ipairs(sc.connections) do pcall(function() c:Disconnect() end) end end
			SPA_Telemetry.suspCache[vc.vehicleRoot] = nil
			local tc = SPA_Telemetry.turboCache[vc.vehicleRoot]
			if tc and tc.connections then for _, c in ipairs(tc.connections) do pcall(function() c:Disconnect() end) end end
			SPA_Telemetry.turboCache[vc.vehicleRoot] = nil
			if SPA_Tires and SPA_Tires.scanCache then SPA_Tires.scanCache[vc.vehicleRoot] = nil end
		end
		groundEffectState[uid] = nil
		if vc then
			vc.nitrousPoint = nil
			vc.nitrousEmitter = nil
			vc.nitrousCacheInvalid = true
			vc.nitrousWasActive = false
			vc.audioState = "EXHAUSTED"; vc.attemptCount = 0; vc.lastAttempt = 0
			vc.audioReady = false; vc.audioLastError = nil
			vc.springConstraints = {}; vc.seat = nil; vc.vehicleRoot = nil
			vc.speedLimitValue = nil
		end
	end

	local function nitroDebug(message)
		if ENABLE_NITRO_DEBUG then warn("[SPA-GLOBAL-IDIM-ENGLISH NITRO DEBUG] " .. tostring(message)) end
	end

	local function refreshNitrousCache(vc, uid, logBuild)
		if not vc or not vc.vehicleRoot then return end
		local vehicleRoot = vc.vehicleRoot
		local point = vehicleRoot:FindFirstChild("NitrousPoint", true)
		if not point then
			local body = vehicleRoot:FindFirstChild("Body", true)
			point = body and body:FindFirstChild("NitrousPoint", true) or nil
		end
		vc.nitrousPoint = point
		vc.nitrousEmitter = nil
		if point then
			if point:IsA("ParticleEmitter") then
				vc.nitrousEmitter = point
			else
				vc.nitrousEmitter = point:FindFirstChildWhichIsA("ParticleEmitter", true)
			end
		end
		vc.nitrousCacheInvalid = false
		if logBuild then
			nitroDebug(("uid=%s vehicle=%s NitrousPoint=%s Emitter=%s"):format(tostring(uid), vehicleRoot:GetFullName(), point and "FOUND" or "NOT_FOUND", vc.nitrousEmitter and "FOUND" or "NOT_FOUND"))
		end
	end

	local function bindNitrousInvalidation(vc)
		if not vc or not vc.vehicleRoot or vc.nitrousDescendantConn then return end
		local vehicleRoot = vc.vehicleRoot
		local function invalidate(obj)
			if obj.Name == "NitrousPoint" or (vc.nitrousPoint and obj:IsDescendantOf(vc.nitrousPoint)) then
				vc.nitrousCacheInvalid = true
			end
		end
		vc.nitrousDescendantConn = vehicleRoot.DescendantAdded:Connect(invalidate)
		vc.nitrousRemovingConn = vehicleRoot.DescendantRemoving:Connect(invalidate)
	end

	local function buildVehicleCache(seat, uid)
		local vc = {
			seat = seat, attemptCount = 0, lastAttempt = 0, audioState = "PENDING",
			audioOwnsSound = false, audioScanned = false,
			seatId = seat:GetFullName(), nitrousWasActive = false, nitrousStateInitialized = false,
			nitrousPoint = nil, nitrousEmitter = nil, nitrousCacheInvalid = true,
			nitrousDescendantConn = nil, nitrousRemovingConn = nil,
			lastGroundCheck = 0, lastSpringScan = 0, springConstraints = {},
			lastAudioScan = 0, engineSound = nil, audioReady = false, audioConn = nil,
		}
		local ok, vehicleModel = pcall(getVehicleRootModel, seat)
		vehicleModel = ok and vehicleModel or seat
		vc.vehicleRoot = vehicleModel
		refreshNitrousCache(vc, uid, true)
		bindNitrousInvalidation(vc)
		vc.speedLimit = getPlayerSpeedLimit(seat)
		local speedEntry = speedLimitCache[vehicleModel] or speedLimitCache[seat]
		vc.speedLimitValue = speedEntry and speedEntry.valueObject or nil
		vc.speedLimitReady = true
		return vc
	end

	local function refreshSpringConstraints(vc, now)
		if not vc or not vc.vehicleRoot or not vc.vehicleRoot.Parent then return end
		if #vc.springConstraints > 0 and now - (vc.lastSpringScan or 0) < 1 then return end
		vc.springConstraints = {}
		for _, obj in ipairs(vc.vehicleRoot:GetDescendants()) do
			if obj:IsA("SpringConstraint") then table.insert(vc.springConstraints, obj) end
		end
		vc.lastSpringScan = now
	end

	local function checkGroundEffect(uid, st, vc, now)
		if not st.inVehicle or not st.seat or not vc or not vc.vehicleRoot then return end
		if now - (vc.lastGroundCheck or 0) < 0.25 then return end
		vc.lastGroundCheck = now
		refreshSpringConstraints(vc, now)
		local illegal, analyzed = nil, 0
		for _, spring in ipairs(vc.springConstraints) do
			if spring and spring.Parent then
				local ok, value = pcall(function() return spring.FreeLength end)
				if ok and type(value) == "number" then
					analyzed += 1
					if value <= 1.6999 and (not illegal or value < illegal) then illegal = value end
				end
			end
		end
		if illegal then
			if not groundEffectState[uid] then
				groundEffectState[uid] = { vehicleId = vc.seatId, value = illegal }
				local pl = Players:GetPlayerByUserId(uid)
				warn(("[SPA-GLOBAL-IDIM-ENGLISH GROUND EFFECT] %s uid=%s FreeLength=%.4f SpringConstraints=%d"):format(pl and pl.Name or tostring(uid), tostring(uid), illegal, analyzed))
				if proposeSanction then
					proposeSanction(uid, "GROUND EFFECT DETECTED", ("Illegal suspension detected: FreeLength <= 1.6999 | Detected FreeLength: %.4f | SpringConstraints checked: %d"):format(illegal, analyzed), "DSQ")
				end
			end
		elseif groundEffectState[uid] then
			groundEffectState[uid] = nil
		end
	end

	local function ensureVehicleEngineSound(uid, st, vc, now)
		SPA_AudioRetry:Step(uid, st, vc, now)
	end

	-- HB-NITRO (0.15s): detect illegal NitrousPoint activation and propose a penalty
	SPA_UI2_tNitro = 0
	RunService.Heartbeat:Connect(function(dt)
		SPA_UI2_tNitro += dt
		if SPA_UI2_tNitro < 0.15 then return end
		SPA_UI2_tNitro = 0
		for uid, st in pairs(PlayerState) do
			if st.inVehicle and st.seat and st.seat.Parent then
				local seatId = st.seat:GetFullName()
				local vc = VehicleCache[uid]
				if not vc or vc.seat ~= st.seat or vc.seatId ~= seatId or vc.vehicleRoot ~= getVehicleRootModel(st.seat) then
					if vc then cleanupVehicleCache(uid, vc) end
					vc = nil; VehicleCache[uid] = nil
					local ok2, built = pcall(buildVehicleCache, st.seat, uid)
					if ok2 then
						vc = built; VehicleCache[uid] = vc
					elseif ENABLE_NITRO_DEBUG then
						warn(("[SPA-GLOBAL-IDIM-ENGLISH NITRO DEBUG] uid=%s buildVehicleCache error=%s"):format(tostring(uid), tostring(built)))
					end
				end
				if vc then
					local now = tick()
					ensureVehicleEngineSound(uid, st, vc, now)
					if SPA_AudioRetry:IsVehicle(st.seat, vc.vehicleRoot, st.character) then
						checkGroundEffect(uid, st, vc, now)
					end
					SPA_NoClip:Step(uid, st, vc, now)
				end
				if vc then
					if vc.nitrousCacheInvalid or (vc.nitrousEmitter and not vc.nitrousEmitter.Parent) or (vc.nitrousPoint and not vc.nitrousPoint.Parent) then
						refreshNitrousCache(vc, uid, false)
					end
					local active = false
					if vc.nitrousPoint and vc.nitrousPoint.Parent then
						local emitter = vc.nitrousEmitter
						if vc.nitrousPoint:IsA("ParticleEmitter") then emitter = vc.nitrousPoint end
						active = emitter ~= nil and emitter.Parent ~= nil and emitter.Enabled
					end
					if vc.nitrousStateInitialized and active ~= vc.nitrousWasActive then
						nitroDebug(("uid=%s active=%s -> %s"):format(tostring(uid), tostring(vc.nitrousWasActive), tostring(active)))
					end
					if active and not vc.nitrousWasActive and PENALTY_CONFIG and proposeSanction then
						proposeSanction(uid, "Boost use",
							"Boost activation detected (prohibited component)")
					end
					vc.nitrousWasActive = active
					vc.nitrousStateInitialized = true
				end
			else
				if VehicleCache[uid] then cleanupVehicleCache(uid, VehicleCache[uid]) end
				VehicleCache[uid] = nil
			end
		end
	end)

	-- HB-SPEED (0.06s): name + actual speed + limit alert
	-- Detects VehicleSeat AND regular Seat. No localChar gate.
	-- ══════════════════════════════════════════════════════════
	SPA_UI2_tHead = 0
	RunService.Heartbeat:Connect(function(dt)
		SPA_UI2_tHead += dt
		if SPA_UI2_tHead < 0.06 then return end
		SPA_UI2_tHead = 0
		for uid, st in pairs(PlayerState) do
			local p    = st.player
			local char = st.character
			local head = st.head
			if not char or not st.humanoid or not head then continue end
			if st.inVehicle then
				local seat = st.seat
				local tag  = createSpeedTag(char, p)
				if not tag then continue end
				tag.Enabled = SHOW_HEAD_NAME or SHOW_HEAD_SPEED
				local nameLbl = tag:FindFirstChild("NameLabel")
				if nameLbl then
					nameLbl.Text       = getDisplayName(p)
					nameLbl.TextColor3 = FIA_EXCLUDED[uid] and C_BLUE or getNameColor(p)
					nameLbl.Visible    = SHOW_HEAD_NAME
				end
				local speedLbl = tag:FindFirstChild("SpeedText")
				if speedLbl then
					local cdS    = customPlayerData[uid]
					local effLim = (cdS and cdS.speedLimit) or SPEED_LIMIT
					-- Actual instantaneous speed and the configured limit are displayed separately.
					local maxSpd = getPlayerSpeedLimit(seat, VehicleCache[uid])
					local currentKmh = toSpeedDisplay(getVehicleSpeed(seat))
					if SHOW_HEAD_SPEED then
						speedLbl.Text      = sformat("SPEED %d km/h  |  LIMIT %.1f km/h", currentKmh, maxSpd)
						local dist         = (head.Position - Camera.CFrame.Position).Magnitude
						speedLbl.TextSize  = mclamp(30*(10/mmax(dist,1)), 14, 40)
						-- Red when the car's MaxSpeed exceeds the operator's limit
						speedLbl.TextColor3= maxSpd > effLim and C_RED or C_WHITE
						speedLbl.Visible   = true
					else
						speedLbl.Text = ""; speedLbl.Visible = false
					end
					-- One alert when the car has an illegal MaxSpeed
					if maxSpd > effLim then
						if not SPA_UI2_alertedPlayers[uid] then
							SPA_UI2_alertedPlayers[uid] = true
							local last = notifiedPlayers[uid]
							if not last or tick()-last > NOTIFICATION_COOLDOWN then
								notifiedPlayers[uid] = tick()
								showSpeedingNotification(getDisplayName(p), maxSpd)
								VIOLATIONS_LOG = VIOLATIONS_LOG or {}
								table.insert(VIOLATIONS_LOG, 1, {
									type = "Excessive speed setting", uid = uid, name = getDisplayName(p),
									detail = ("Configured speed %.1f > limit %.1f"):format(maxSpd, effLim), time = os.date("%H:%M:%S")
								})
								SPA_RaceControl:AddEvent("SPEED", {
									category = "INCIDENTES", severity = "WARN", uid = uid, name = getDisplayName(p),
									speed = currentKmh, limit = effLim, configuredSpeed = maxSpd, title = "⚠ SPEED",
									description = ("%s — Actual speed: %d km/h — Limit: %.1f km/h — Configured speed: %.1f"):format(getDisplayName(p), currentKmh, effLim, maxSpd),
								})
								if #VIOLATIONS_LOG > 200 then table.remove(VIOLATIONS_LOG) end
								if buildViolationsLogList then buildViolationsLogList() end
							end
						end
					else
						SPA_UI2_alertedPlayers[uid] = nil
					end
				end
			else
				_telStopDrift(uid)
				removeSpeedTag(char)
				SPA_UI2_alertedPlayers[uid] = nil
			end
		end
	end)

	-- ══════════════════════════════════════════════════════════
	-- HB-TEL (0.25s): turbo + drift + suspension
	-- Runs slower than speed — telemetry values do not change
	-- at 16 Hz; 4 Hz is sufficient and saves substantial CPU.
	-- ══════════════════════════════════════════════════════════
	local _tTel = 0
	RunService.Heartbeat:Connect(function(dt)
		_tTel += dt
		if _tTel < 0.25 then return end
		_tTel = 0
		local perfTelStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
		for uid, st in pairs(PlayerState) do
			local p = st.player
			if not st.character or not st.inVehicle then continue end
			local seat = st.seat
			local head = st.head
			if not head then continue end
			-- [MEM FIX] Reconnect the drift monitor when the vehicle changes.
			-- Previously stored the seat Instance (driftConns[uid]._seat = seat),
			-- retaining the vehicle in RAM even after destruction. Now only
			-- a plain string identifier is stored for comparison, without retaining
			-- the Instance reference.
			local seatId = seat:GetFullName()
			if not SPA_Telemetry.driftConns[uid] or
			   (SPA_Telemetry.driftConns[uid]._seatId ~= seatId) then
				_telWatchDrift(uid, seat)
				SPA_Telemetry.driftConns[uid]._seatId = seatId
			end
			local tag = head:FindFirstChild("SpeedTag")
			if not tag then continue end
			local telLbl = tag:FindFirstChild("TelemetryText")
			if not telLbl or not SHOW_HEAD_SPEED then continue end
			local turboV = _telGetTurbo(seat)
			local driftV = _telGetDrift(seat, uid)
			local suspV  = _telGetSusp(seat)
			local distT  = (head.Position - Camera.CFrame.Position).Magnitude
			telLbl.Text     = sformat("T:%s  D:%s  S:%s", turboV, driftV, suspV)
			telLbl.TextSize = mclamp(30*(10/mmax(distT,1))*0.7, 9, 28)
			telLbl.Visible  = true
			-- Telemetry alerts
			local cdT = customPlayerData[uid]
			if cdT then
				local now = tick()
				if cdT.maxTurbo then
					local cI = SPA_Telemetry.TURBO_IDX[turboV] or 0
					local mI = SPA_Telemetry.TURBO_IDX[cdT.maxTurbo] or 999
					local ak = uid.."_turbo"
					if cI > mI and (not SPA_Telemetry.alerts[ak] or now-SPA_Telemetry.alerts[ak] > NOTIFICATION_COOLDOWN) then
						SPA_Telemetry.alerts[ak] = now
						showNotification("⚡ "..getDisplayName(p).."  TURBO "..turboV.." > "..cdT.maxTurbo, C_ORANGE, "⚡", 56)
					end
				end
				if cdT.maxSusp then
					local cI2 = SPA_Telemetry.SUSP_IDX[suspV] or 0
					local mI2 = SPA_Telemetry.SUSP_IDX[cdT.maxSusp] or 999
					local ak2 = uid.."_susp"
					if cI2 > mI2 and (not SPA_Telemetry.alerts[ak2] or now-SPA_Telemetry.alerts[ak2] > NOTIFICATION_COOLDOWN) then
						SPA_Telemetry.alerts[ak2] = now
						showNotification("🔧 "..getDisplayName(p).."  SUSP "..suspV.." > "..cdT.maxSusp, C_YELLOW, "🔧", 92)
					end
				end
				if cdT.maxDrift then
					local dNum = tonumber(driftV) or 0
					local ak3  = uid.."_drift"
					if dNum > cdT.maxDrift and (not SPA_Telemetry.alerts[ak3] or now-SPA_Telemetry.alerts[ak3] > NOTIFICATION_COOLDOWN) then
						SPA_Telemetry.alerts[ak3] = now
						showNotification("💨 "..getDisplayName(p).."  DRIFT "..driftV.." > "..tostring(cdT.maxDrift), C_RED, "💨", 128)
					end
				end
			end
		end
		SPA_PerfMark("Telemetry", perfTelStart)
	end)

	-- ── HB-LAP (0.1s): lap, pit and track limits detection ───────
	-- [PERF FIX] Rewritten to avoid Workspace:GetPartsInPart.
	-- Compare HumanoidRootPart position against the wall's
	-- local space (CFrame:PointToObjectSpace) and detect
	-- a plane crossing through a sign change in l3.Z, validated against
	-- the wall's X/Y bounds. No physics overlap queries per frame.
	SPA_UI2_tLap  = 0
	RunService.Heartbeat:Connect(function(dt)
		SPA_UI2_tLap += dt
		if SPA_UI2_tLap >= 0.1 then
			SPA_UI2_tLap = 0
			local perfLapStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
			-- Position cache: taken from PlayerState (already calculated above),
			-- instead of finding HumanoidRootPart again here.
			SPA_UI2_posCache = {}
			for uid, st in pairs(PlayerState) do
				local pos, source, seat = getLapEffectivePosition(uid, st)
				if pos then
					SPA_UI2_posCache[uid] = { position = pos, source = source, seat = seat, player = st.player }
					if source == "SEAT" and lapWall and lapWall.Parent then
						local now = tick()
						if not SPA_UI2_lapStateLogAt[uid] or now - SPA_UI2_lapStateLogAt[uid] >= 2 then
							SPA_UI2_lapStateLogAt[uid] = now
							local localPos = lapWall.CFrame:PointToObjectSpace(pos)
							local stPlayer = st.player
							warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP STATE] uid=%s name=%s source=SEAT position=%s localZ=%.3f raceState=%s detect=%s"):format(tostring(uid), stPlayer and stPlayer.Name or "-", tostring(pos), localPos.Z, tostring(RACE_STATE), tostring(DETECT_LAPS)))
						end
					end
				end
			end
			-- [SESSION GUARD] Lap, pit and track limits tracking run only during Qualy/Race.
			if RACE_STATE ~= "QUALY" and RACE_STATE ~= "RACE" then
				-- Keeping a baseline outside the session prevents counting an artificial
				-- jump when Qualy/Race is enabled.
				for uid, sample in pairs(SPA_UI2_posCache) do previousLapPositions[uid] = sample end
				return
			end

			-- ── Lap/Pit detection ──
			if DETECT_LAPS and lapWall then
				for uid, sample in pairs(SPA_UI2_posCache) do
					local pl = sample.player
					ensurePlayerData(pl)
					local ld  = lapData[uid]
					local fld = fastLapData[uid]
					local pos = sample and sample.position
					if not ld or not fld then
						local missingReason = not ld and "MISSING_LAP_DATA" or "MISSING_FAST_DATA"
						warnHudError("lap_data", pl, missingReason)
						if sample then previousLapPositions[uid] = sample end
						continue
					end
					if pos then
						local previousSample = previousLapPositions[uid]
						local prevPos = previousSample and previousSample.position
						local crossed, crossInfo = false, nil
						local sameSource = previousSample and previousSample.source == sample.source
						local sameSeat = sample.source ~= "SEAT" or (previousSample and previousSample.seat == sample.seat) or false
						if prevPos and sameSource and sameSeat then crossed, crossInfo = crossedLapSegment(prevPos, pos) end
						if crossInfo then
							warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP DEBUG] uid=%s name=%s source=%s prevZ=%.3f currentZ=%.3f hitX=%.3f hitY=%.3f valid=%s"):format(tostring(uid), getDisplayName(pl), tostring(sample.source), crossInfo.prevZ or 0, crossInfo.currentZ or 0, crossInfo.hitX or 0, crossInfo.hitY or 0, tostring(crossInfo.valid == true)))
						end
						if crossInfo and not crossed then
							warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP DEBUG] uid=%s reason=INVALID_GATE"):format(tostring(uid)))
						end
						if crossed and FIA_EXCLUDED[uid] then
							warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP DEBUG] uid=%s reason=FIA_EXCLUDED"):format(tostring(uid)))
						elseif crossed then
							local now = tick()
							local hasRegisteredLap = (ld.lapsMade or 0) > 0 and (ld.lastLapTouch or 0) > 0
							if not hasRegisteredLap or now - ld.lastLapTouch >= DEBOUNCE_TIME then
								-- [QUALY LAP LIMIT] QUALY_LAPS is the maximum number of valid laps per driver.
								if not (RACE_STATE == "QUALY" and (ld.lapsMade or 0) >= QUALY_LAPS) then
								ld.lapsMade      = mmin(ld.lapsMade+1, MAX_LAPS)
								ld.lastLapTouch  = now
								SPA_RaceControl:AddEvent("LAP", {
									category = (QUALY_MODE and RACE_STATE == "QUALY") and "QUALY" or "CARRERA", severity = "INFO", uid = uid, name = getDisplayName(pl),
									lap = ld.lapsMade, title = "🏁 LAP " .. tostring(ld.lapsMade),
									description = getDisplayName(pl) .. " completed the lap",
								})
								if ENABLE_CHAT_EVENTS and announceRaceEvent then
									if RACE_STATE == "QUALY" then
										announceRaceEvent(buildQualyChatMessage())
									else
										announceRaceEvent(buildRaceChatMessage())
									end
								end
									if fld.currentLapStarted and fld.lastStartTime then
										local lapTime = now - fld.lastStartTime
										if not fld.bestTime or lapTime < fld.bestTime then
											fld.bestTime = lapTime
											if QUALY_MODE and RACE_STATE == "QUALY" then
												QUALY_BEST_TIMES[uid] = lapTime
												QUALY_FIA_STATUS[uid] = FIA_EXCLUDED[uid] == true
												QUALY_NAMES[uid] = getDisplayName(pl)
											end
											SPA_RaceControl:AddEvent("FASTEST_LAP", {
												category = (QUALY_MODE and RACE_STATE == "QUALY") and "QUALY" or "CARRERA", severity = "INFO", uid = uid, name = getDisplayName(pl),
												bestTime = fmtTime(lapTime), title = "🟣 FASTEST LAP",
												description = getDisplayName(pl) .. " — " .. fmtTime(lapTime),
											})
										end
									local globalFastest = (QUALY_MODE and RACE_STATE == "QUALY") and QUALY_GLOBAL_FASTEST or RACE_GLOBAL_FASTEST
									if lapTime < globalFastest.time then
										globalFastest.time = lapTime
										globalFastest.uid  = uid
										globalFastest.name = getDisplayName(pl)
										if RACE_STATE == "RACE" then GLOBAL_FASTEST_LAP = RACE_GLOBAL_FASTEST end
										if ENABLE_CHAT_EVENTS and announceRaceEvent then
											announceRaceEvent(("🟣 FASTEST LAP — %s %s"):format(getDisplayName(pl), fmtTime(lapTime)))
										end
									end
									end
									fld.lastStartTime    = now
									fld.currentLapStarted= true
										warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP] uid=%s name=%s source=%s cross=segment lap=%d"):format(tostring(uid), getDisplayName(pl), tostring(sample.source), ld.lapsMade or 0))
								else
									warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP DEBUG] uid=%s reason=QUALY_LIMIT"):format(tostring(uid)))
								end
							else
								warn(("[SPA-GLOBAL-IDIM-ENGLISH LAP DEBUG] uid=%s reason=DEBOUNCE"):format(tostring(uid)))
							end
						end
					end
					if sample then previousLapPositions[uid] = sample end
				end
			end

			if DETECT_PITS and pitInWall and pitOutWall then
				for uid, posSample in pairs(SPA_UI2_posCache) do
					local pl = posSample.player
					ensurePlayerData(pl)
					local pd  = pitData[uid]
					local pos = posSample and posSample.position
					local crossedIn, crossedOut, zIn, zOut = false, false, nil, nil
					if pos then
						local l3In    = pitInWall.CFrame:PointToObjectSpace(pos)
						local inBndIn = mabs(l3In.X) <= pitInWall.Size.X/2 + 4 and mabs(l3In.Y) <= pitInWall.Size.Y/2 + 4
						local prevZIn = SPA_UI2_lastSeenInPitIn[uid]
						zIn = l3In.Z
						crossedIn = inBndIn and prevZIn ~= nil and ((prevZIn >= 0 and zIn < 0) or (prevZIn < 0 and zIn >= 0))

						local l3Out    = pitOutWall.CFrame:PointToObjectSpace(pos)
						local inBndOut = mabs(l3Out.X) <= pitOutWall.Size.X/2 + 4 and mabs(l3Out.Y) <= pitOutWall.Size.Y/2 + 4
						local prevZOut = SPA_UI2_lastSeenInPitOut[uid]
						zOut = l3Out.Z
						crossedOut = inBndOut and prevZOut ~= nil and ((prevZOut >= 0 and zOut < 0) or (prevZOut < 0 and zOut >= 0))
					end
					if not FIA_EXCLUDED[uid] then
						if crossedIn and pd.status == "En Pista" then
							pd.status = "En Boxes"; pd.lastPitTouch= tick()
							SPA_RaceControl:AddEvent("PIT_IN", { category = "BOXES", severity = "INFO", uid = uid, name = getDisplayName(pl), title = "🚗 PIT IN", description = getDisplayName(pl) .. " entered the pits" })
						end
						if crossedOut and pd.status == "En Boxes" then
							local now = tick()
							if now-pd.lastPitTouch >= DEBOUNCE_TIME then
								pd.pitStopsMade = mmin(pd.pitStopsMade+1,MAX_PITS)
								pd.status       = "En Pista"
								pd.lastPitTouch = now
								SPA_RaceControl:AddEvent("PIT_OUT", { category = "BOXES", severity = "INFO", uid = uid, name = getDisplayName(pl), title = "🏎 PIT OUT", description = getDisplayName(pl) .. " exited the pits" })
							end
						end
					end
					SPA_UI2_lastSeenInPitIn[uid]  = pos and zIn  or nil
					SPA_UI2_lastSeenInPitOut[uid] = pos and zOut or nil
				end
			end

			-- ── Integrated track limits detection ──
			if DETECTCC then
				for id, entry in pairs(ccWaypoints) do
					if entry.wall and entry.wall.Parent then
						if not lastSeenInCC[id] then lastSeenInCC[id] = {} end
						for uid, posSample in pairs(SPA_UI2_posCache) do
							local pl = posSample.player
							local pos = posSample and posSample.position
							if pos then
								local l3      = (entry.cframe or entry.wall.CFrame):PointToObjectSpace(pos)
								local inBnd   = mabs(l3.X) <= (entry.halfWidth or entry.wall.Size.X/2) + 4 and mabs(l3.Y) <= (entry.halfHeight or entry.wall.Size.Y/2) + 4
								local prevZ   = lastSeenInCC[id][uid]
								local crossed = inBnd and prevZ ~= nil and ((prevZ >= 0 and l3.Z < 0) or (prevZ < 0 and l3.Z >= 0))

								if crossed then
									local key = tostring(id) .. "_" .. tostring(uid)
									local lastTime = ccDebounce[key] or 0
									local now = tick()

									if now - lastTime > CCDEBOUNCETIME then
										ccDebounce[key] = now
										if not ccData[uid] then ccData[uid] = { total = 0, history = {} } end
										ccData[uid].total = ccData[uid].total + 1

										local lap = lapData[uid] and lapData[uid].lapsMade or 0
										local timeStr = os.date("%H:%M:%S")
										table.insert(ccData[uid].history, 1, {
											wpName = entry.name,
											lap    = lap,
											time   = timeStr
										})
										if #ccData[uid].history > 20 then table.remove(ccData[uid].history, 21) end

										local displayName = getDisplayName(pl)
										SPA_RaceControl:AddEvent("CORNER_CUT", {
											category = "INCIDENTES", severity = "WARN", uid = uid, name = displayName,
											lap = lap, checkpoint = entry.name, title = "🚫 CORNER CUT",
											description = displayName .. " — Lap " .. tostring(lap) .. " — " .. tostring(entry.name),
										})
										showCCNotification("🚫 CORNER CUT — " .. displayName .. " [" .. entry.name .. "]")

										-- Escalating warning / penalty proposal (never applies a penalty automatically)
										if PENALTY_CONFIG and proposeSanction then
											local total = ccData[uid].total
											local limit = PENALTY_CONFIG.ccWarnings
											if total < limit then
												showNotification(("⚠ WARNING %d/%d — %s (track limits)"):format(total, limit, displayName), C_YELLOW, "⚠", 8)
											elseif total == limit then
												proposeSanction(uid, "Accumulated track limits infringements", ("%d track limits infringements (limit: %d)"):format(total, limit))
											end
											-- Potential advantage: flag for review if close behind another car when cutting
											if ENABLE_GAP and getUidAhead then
												local aheadUid = getUidAhead(uid)
												if aheadUid then
													local diff = tonumber((computeGapText(uid, aheadUid):gsub("[^%d%.]","")))
													if diff and diff <= PENALTY_CONFIG.finalGapSec then
														proposeSanction(uid, "Possible advantage from cutting the track",
															("Was %.3fs behind the car ahead when cutting [%s]"):format(diff, entry.name))
													end
												end
											end
										end
									end
								end
								lastSeenInCC[id][uid] = l3.Z
							else
								lastSeenInCC[id][uid] = nil
							end
						end
					end
				end
			end
			SPA_PerfMark("LAP/CC/PIT", perfLapStart)
		end
	end)

	SPA_LapsControl.refreshHUD = updateGuiLists
	task.spawn(function()
		while true do
			local ok, err = xpcall(updateGuiLists, debug.traceback)
			if ok then
				HUD_DIAGNOSTICS.cycles += 1
				HUD_DIAGNOSTICS.lastSuccessfulAt = tick()
			else
				warnHudError("updateGuiLists", nil, err)
			end
			task.wait(0.25)
		end
	end)

	SPA_UI2_cronRunning    = false
	SPA_UI2_cronStartTime  = 0
	SPA_UI2_cronConnection = nil
	local function resetRaceTransientState()
		lapData = {}; pitData = {}; fastLapData = {}
		GLOBAL_FASTEST_LAP = { time = math.huge, uid = nil, name = nil }
		RACE_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
		speedLimitCache = {}
		CURRENT_STANDINGS_ORDER = {}; QUALY_STANDINGS = {}
		HUD_LAST_SIGNATURE = nil
		HUD_RANK_CACHE.signature = nil; HUD_RANK_CACHE.byUid = {}; HUD_RANK_CACHE.standings = {}; HUD_RANK_CACHE.qualy = {}
		PENDING_SANCTIONS = {}; APPLIED_SANCTIONS = {}; VIOLATIONS_LOG = {}
		OVERTAKE_COUNT = {}; ccData = {}; ccDebounce = {}
		if resetSessionMarkers then resetSessionMarkers() end
		if SPA_RaceControl then SPA_RaceControl.lastPositions = {}; SPA_RaceControl.pendingPositions = {}; SPA_RaceControl.rejoiningPositions = {} end
		if VehicleCache then
			-- A new race session does not rearm audio for the same vehicle identity.
			for uid, vc in pairs(VehicleCache) do
				if not vc.seat or not vc.seat.Parent then
					cleanupVehicleCache(uid, vc); VehicleCache[uid] = nil
				else
					SPA_NoClip:Clear(uid, vc)
				end
			end
		end
		groundEffectState = {}
		DSQ_DRIVERS = {}
		if PlayerState then
			for _, st in pairs(PlayerState) do if st.charAncestryConn then pcall(function() st.charAncestryConn:Disconnect() end) end end
			PlayerState = {}
		end
		if SPA_Analysis then SPA_Analysis.data = {} end
		if SPA_Tires then SPA_Tires.current = {}; SPA_Tires._stableTimer = {} end
		if ENABLE_VSC and toggleVSC then toggleVSC() end
		for _, pl in ipairs(Players:GetPlayers()) do ensurePlayerData(pl) end
	end

	makeSectionHeader(configScroll, "🚨  COLLISION SYSTEM", 70)
	mkConfigToggleRow(configScroll, "Enable collisions + replays (CPU+)",
		function() return ENABLE_CRASH_SYSTEM end,
		function(v) ENABLE_CRASH_SYSTEM = v end, 71)

	makeSectionHeader(configScroll, "🧹  RESOURCE CLEANUP", 72)
	local function cleanupResources()
		local activeUids = {}
		for _, p in ipairs(Players:GetPlayers()) do activeUids[p.UserId] = true end

		local cleaned = 0
		local function sweep(tbl)
			if not tbl then return end
			for uid in pairs(tbl) do
				if not activeUids[uid] then tbl[uid] = nil; cleaned += 1 end
			end
		end

		-- Tables by UID: safety net (does not affect active players or ongoing laps)
		for uid, st in pairs(PlayerState) do if not activeUids[uid] and st.charAncestryConn then pcall(function() st.charAncestryConn:Disconnect() end) end end
		for uid, vc in pairs(VehicleCache) do if not activeUids[uid] then cleanupVehicleCache(uid, vc) end end
		sweep(lapData); sweep(pitData); sweep(fastLapData); sweep(lastSpeeds)
		sweep(PlayerState); sweep(VehicleCache)
		if SPA_RaceControl then sweep(SPA_RaceControl.lastPositions); sweep(SPA_RaceControl.pendingPositions); sweep(SPA_RaceControl.rejoiningPositions) end
			sweep(notifiedPlayers); sweep(previousLapPositions); sweep(SPA_UI2_lapStateLogAt); sweep(SPA_UI2_lastSeenInPitIn); sweep(SPA_UI2_lastSeenInPitOut)
		sweep(SPA_UI2_alertedPlayers); sweep(ccData)
		sweep(SPA_Analysis.data); sweep(SPA_Tires.current); sweep(SPA_Tires._stableTimer)
		sweep(SPA_Telemetry.driftConns); sweep(SPA_Telemetry.latestDrift); sweep(groundEffectState); sweep(DSQ_DRIVERS)

		-- Orphaned UI rows (in case PlayerRemoving did not clean them up)
		for uid, row in pairs(towerRows) do
			if not activeUids[uid] then row:Destroy(); towerRows[uid] = nil; cleaned += 1 end
		end
		for uid, cache in pairs(vueltasRowCache) do
			if not activeUids[uid] then
				if cache.topRow then cache.topRow:Destroy() end
				if cache.btnRow then cache.btnRow:Destroy() end
				vueltasRowCache[uid] = nil; cleaned += 1
			end
		end
		for uid, row in pairs(boxesRowCache) do
			if not activeUids[uid] then row:Destroy(); boxesRowCache[uid] = nil; boxesRowRefs[uid] = nil; cleaned += 1 end
		end
		for uid, row in pairs(fastLapsRowCache) do
			if not activeUids[uid] then row:Destroy(); fastLapsRowCache[uid] = nil; fastLapsRowRefs[uid] = nil; cleaned += 1 end
		end

		-- Debounce / track limits markers for players who have left
		for id in pairs(lastSeenInCC) do
			if lastSeenInCC[id] then
				for uid in pairs(lastSeenInCC[id]) do
					if not activeUids[uid] then lastSeenInCC[id][uid] = nil; cleaned += 1 end
				end
			end
		end
		for key in pairs(ccDebounce) do
			local uidStr
			if type(key) == "string" then local _, parsedUid = key:match("^([^_]+)_(%d+)$"); uidStr = parsedUid end
			if uidStr and not activeUids[tonumber(uidStr)] then ccDebounce[key] = nil; cleaned += 1 end
		end

		-- Replay buffers for absent players (already captured events are independent
		-- copies, so deleting these NEVER corrupts a recorded collision)
		local buffersFreed = 0
		for uid in pairs(SPA_Replay.buffers) do
			if not activeUids[uid] then SPA_Replay.buffers[uid] = nil; buffersFreed += 1 end
		end

		-- Explicit memory release (only here, never in an automatic loop)
		collectgarbage("collect")

		showNotification(("🧹 Cleanup: %d entries + %d buffers released"):format(cleaned, buffersFreed),
			Color3.fromRGB(0,150,90), "🧹", 20)
	end
	mkConfigActionRow(configScroll, "🧹  CLEAR NONESSENTIAL RESOURCES", Color3.fromRGB(0,120,90), cleanupResources, 73)

	makeSectionHeader(configScroll, "📏  GAP", 74)
	mkConfigToggleRow(configScroll, "Show gap instead of lap",
		function() return ENABLE_GAP end,
		function(v) ENABLE_GAP = v end, 75)
	mkConfigToggleRow(configScroll, "Gap to leader (OFF = interval to car ahead)",
		function() return GAP_MODE_LEAD end,
		function(v) GAP_MODE_LEAD = v end, 76)

	makeSectionHeader(configScroll, "⚖  PENALTY SETTINGS", 90)
	mkConfigAdjustRow(configScroll, "Track limits infringements before a penalty",
		function() return PENALTY_CONFIG.ccWarnings end,
		function(v) PENALTY_CONFIG.ccWarnings = v end, 1, 1, 20, nil, 91)
	mkConfigAdjustRow(configScroll, "Minor collisions before a penalty",
		function() return PENALTY_CONFIG.crashLeves end,
		function(v) PENALTY_CONFIG.crashLeves = v end, 1, 1, 20, nil, 92)
	mkConfigAdjustRow(configScroll, "Gap (s) to flag a possible track-cutting advantage",
		function() return PENALTY_CONFIG.finalGapSec end,
		function(v) PENALTY_CONFIG.finalGapSec = v end, 1, 1, 10, nil, 93)
	mkConfigAdjustRow(configScroll, "Penalty seconds upon confirmation",
		function() return PENALTY_CONFIG.penaltySeconds end,
		function(v) PENALTY_CONFIG.penaltySeconds = v end, 1, 1, 60, nil, 94)

	local pendingSanctionsHolder = Instance.new("Frame")
	pendingSanctionsHolder.Name = "PendingSanctions"
	pendingSanctionsHolder.Size = UDim2.new(1,0,0,0)
	pendingSanctionsHolder.AutomaticSize = Enum.AutomaticSize.Y
	pendingSanctionsHolder.BackgroundTransparency = 1
	pendingSanctionsHolder.LayoutOrder = 3
	pendingSanctionsHolder.Parent = sancionesScroll
	local pendingLayout = Instance.new("UIListLayout")
	pendingLayout.SortOrder = Enum.SortOrder.LayoutOrder
	pendingLayout.Padding = UDim.new(0,2)
	pendingLayout.Parent = pendingSanctionsHolder

	function buildPendingSanctionsList()
		for _, c in ipairs(pendingSanctionsHolder:GetChildren()) do
			if c:IsA("Frame") then c:Destroy() end
		end
		for idx, s in ipairs(PENDING_SANCTIONS) do
			local row = Instance.new("Frame")
			row.Size = UDim2.new(1,0,0,50); row.BackgroundColor3 = Color3.fromRGB(60,20,20); row.BorderSizePixel=0
			row.LayoutOrder = idx; row.Parent = pendingSanctionsHolder
			local txt = Instance.new("TextLabel")
			txt.Size = UDim2.new(0.6,0,1,0); txt.Position = UDim2.new(0,8,0,0); txt.BackgroundTransparency=1
			txt.Text = ("%s\n%s — %s"):format(s.name, s.reason, s.detail)
			txt.TextWrapped = true; txt.Font = Enum.Font.Gotham; txt.TextColor3 = C_WHITE; txt.TextSize = 11
			txt.TextXAlignment = Enum.TextXAlignment.Left; txt.Parent = row
			local okBtn = Instance.new("TextButton")
			okBtn.Size = UDim2.new(0.18,-4,0.8,0); okBtn.Position = UDim2.new(0.62,0,0.1,0)
			okBtn.BackgroundColor3 = Color3.fromRGB(0,120,50); okBtn.Text="APPLY"; okBtn.Font=Enum.Font.GothamBold
			okBtn.TextColor3=C_WHITE; okBtn.TextSize=10; okBtn.BorderSizePixel=0; okBtn.Parent=row
			local okC = Instance.new("UICorner"); okC.CornerRadius=UDim.new(0,3); okC.Parent=okBtn
			local capturedIdx = idx
			okBtn.MouseButton1Click:Connect(function() applySanction(capturedIdx) end)
			local noBtn = Instance.new("TextButton")
			noBtn.Size = UDim2.new(0.18,-4,0.8,0); noBtn.Position = UDim2.new(0.81,0,0.1,0)
			noBtn.BackgroundColor3 = Color3.fromRGB(80,80,80); noBtn.Text="DISMISS"; noBtn.Font=Enum.Font.GothamBold
			noBtn.TextColor3=C_WHITE; noBtn.TextSize=9; noBtn.BorderSizePixel=0; noBtn.Parent=row
			local noC = Instance.new("UICorner"); noC.CornerRadius=UDim.new(0,3); noC.Parent=noBtn
			noBtn.MouseButton1Click:Connect(function() dismissSanction(capturedIdx) end)
		end
	end

	-- ── Detected infringements log (speed, track limits, collisions, NitrousPoint) ──
	makeSectionHeader(sancionesScroll, "🚩  PENALTIES", 1)
	makeSectionHeader(sancionesScroll, "⏳  PROPOSALS AWAITING CONFIRMATION", 2)
	-- (pendingSanctionsHolder was parented above, LayoutOrder 3)

	makeSectionHeader(sancionesScroll, "📡  DETECTED INFRINGEMENTS", 4)
	VIOLATIONS_LOG = VIOLATIONS_LOG or {}
	local violationsHolder = Instance.new("Frame")
	violationsHolder.Name = "ViolationsLog"
	violationsHolder.Size = UDim2.new(1,0,0,0)
	violationsHolder.AutomaticSize = Enum.AutomaticSize.Y
	violationsHolder.BackgroundTransparency = 1
	violationsHolder.LayoutOrder = 4
	violationsHolder.Parent = sancionesScroll
	local violationsLayout = Instance.new("UIListLayout")
	violationsLayout.SortOrder = Enum.SortOrder.LayoutOrder
	violationsLayout.Padding = UDim.new(0,2)
	violationsLayout.Parent = violationsHolder

	function buildViolationsLogList()
		for _, c in ipairs(violationsHolder:GetChildren()) do
			if c:IsA("TextLabel") then c:Destroy() end
		end
		for idx = 1, mmin(#VIOLATIONS_LOG, 40) do
			local v = VIOLATIONS_LOG[idx]
			local lbl = Instance.new("TextLabel")
			lbl.Size = UDim2.new(1,0,0,26); lbl.BackgroundTransparency = 1
			lbl.Text = ("[%s] %s — %s: %s"):format(v.time, v.name, v.type, v.detail)
			lbl.TextWrapped = true; lbl.Font = Enum.Font.Gotham; lbl.TextSize = 10
			lbl.TextColor3 = C_YELLOW; lbl.TextXAlignment = Enum.TextXAlignment.Left
			lbl.LayoutOrder = idx; lbl.Parent = violationsHolder
		end
	end

	makeSectionHeader(sancionesScroll, "✅  APPLIED PENALTIES", 5)
	local appliedHolder = Instance.new("Frame")
	appliedHolder.Name = "AppliedSanctionsLog"
	appliedHolder.Size = UDim2.new(1,0,0,0)
	appliedHolder.AutomaticSize = Enum.AutomaticSize.Y
	appliedHolder.BackgroundTransparency = 1
	appliedHolder.LayoutOrder = 6
	appliedHolder.Parent = sancionesScroll
	local appliedLayout = Instance.new("UIListLayout")
	appliedLayout.SortOrder = Enum.SortOrder.LayoutOrder
	appliedLayout.Padding = UDim.new(0,2)
	appliedLayout.Parent = appliedHolder

	function buildAppliedSanctionsList()
		for _, c in ipairs(appliedHolder:GetChildren()) do
			if c:IsA("TextLabel") then c:Destroy() end
		end
		for idx, s in ipairs(APPLIED_SANCTIONS) do
			local lbl = Instance.new("TextLabel")
			lbl.Size = UDim2.new(1,0,0,26); lbl.BackgroundTransparency = 1
			local appliedText = s.type == "DSQ" and "DSQ" or ("+" .. tostring(PENALTY_CONFIG.penaltySeconds) .. "s")
			lbl.Text = ("[%s] %s — %s (%s)"):format(s.time, s.name, s.reason, appliedText)
			lbl.TextWrapped = true; lbl.Font = Enum.Font.Gotham; lbl.TextSize = 10
			lbl.TextColor3 = Color3.fromRGB(120,220,150); lbl.TextXAlignment = Enum.TextXAlignment.Left
			lbl.LayoutOrder = idx; lbl.Parent = appliedHolder
		end
	end

	makeSectionHeader(configScroll, "🟡  VIRTUAL SAFETY CAR", 96)
	mkConfigActionRow(configScroll, "🟡  ENABLE / DISABLE VSC", Color3.fromRGB(150,120,0), toggleVSC, 97)

	makeSectionHeader(configScroll, "💬  CHAT ANNOUNCEMENTS", 98)
	mkConfigToggleRow(configScroll, "Announce positions, fastest laps and penalties in chat",
		function() return ENABLE_CHAT_EVENTS end,
		function(v) ENABLE_CHAT_EVENTS = v end, 99)

	makeSectionHeader(configScroll, "📋  POST-RACE REPORT", 100)
	local reportBox = Instance.new("TextBox")
	reportBox.Name = "ReportBox"
	reportBox.Size = UDim2.new(1,-16,0,220)
	reportBox.Position = UDim2.new(0,8,0,0)
	reportBox.BackgroundColor3 = Color3.fromRGB(15,15,20)
	reportBox.TextColor3 = C_WHITE
	reportBox.Font = Enum.Font.Code
	reportBox.TextSize = 11
	reportBox.TextWrapped = true
	reportBox.MultiLine = true
	reportBox.ClearTextOnFocus = false
	reportBox.TextXAlignment = Enum.TextXAlignment.Left
	reportBox.TextYAlignment = Enum.TextYAlignment.Top
	reportBox.Text = "Press GENERATE REPORT when the race ends."
	reportBox.LayoutOrder = 101
	reportBox.Parent = configScroll
	local rbCorner = Instance.new("UICorner"); rbCorner.CornerRadius = UDim.new(0,4); rbCorner.Parent = reportBox

	local function buildPostRaceReport()
		local lines = {}
		table.insert(lines, "🏁 POST-RACE REPORT — SPA-GLOBAL-IDIM-ENGLISH — Administrator CGF1")
		table.insert(lines, os.date("%d/%m/%Y %H:%M"))
		table.insert(lines, "")
		-- [QUALY REPORT FIX] The official source is the current session or its frozen snapshot.
		local qualySource = next(QUALY_BEST_TIMES) and QUALY_BEST_TIMES or FINAL_QUALY_RESULTS
		local finalQualy = {}
		local hasQualyTimes = next(qualySource) ~= nil
		for uid, rawResult in pairs(qualySource) do
			local pl = Players:GetPlayerByUserId(uid)
			local bestTime = type(rawResult) == "table" and rawResult.time or rawResult
			local name = type(rawResult) == "table" and rawResult.name or QUALY_NAMES[uid]
			local excluded = type(rawResult) == "table" and rawResult.fiaExcluded or QUALY_FIA_STATUS[uid]
			if bestTime and not excluded then
				table.insert(finalQualy, { player = pl, name = name or (pl and getDisplayName(pl) or ("UID " .. tostring(uid))), bestTime = bestTime })
			end
		end

		if hasQualyTimes then
			table.insert(lines, "— FINAL QUALIFYING RESULTS —")
			if #finalQualy == 0 then
				table.insert(lines, "All drivers with a recorded time were excluded by the FIA.")
			else
			tsort(finalQualy, function(a, b)
				if a.bestTime and b.bestTime then return a.bestTime < b.bestTime end
				if a.bestTime then return true end
				if b.bestTime then return false end
				return a.name:lower() < b.name:lower()
			end)
			for i, entry in ipairs(finalQualy) do
				local timeTxt = entry.bestTime and fmtTime(entry.bestTime) or "NO TIME"
				 table.insert(lines, ("P%d %s — time: %s"):format(i, entry.name, timeTxt))
			end
			end
		else
			table.insert(lines, "— CURRENT STANDINGS / AVAILABLE RESULTS —")
			-- No qualifying session: never present race fastest laps as qualifying results.
			local raceOrder = {}
			for _, uid in ipairs(CURRENT_STANDINGS_ORDER or {}) do
				if not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid] then
					local pl = Players:GetPlayerByUserId(uid)
					if pl then table.insert(raceOrder, pl) end
				end
			end
			if #raceOrder == 0 then
				for _, pl in ipairs(Players:GetPlayers()) do
					if not FIA_EXCLUDED[pl.UserId] and not DSQ_DRIVERS[pl.UserId] then table.insert(raceOrder, pl) end
				end
			end
			if #raceOrder == 0 then
				table.insert(lines, "No eligible drivers remain after FIA exclusions.")
			else
				for i, pl in ipairs(raceOrder) do
					table.insert(lines, ("P%d %s"):format(i, getDisplayName(pl)))
				end
			end
		end
		table.insert(lines, "")
		table.insert(lines, "— FINAL RACE RESULTS —")
		local finalPosition = 0
		for _, uid in ipairs(CURRENT_STANDINGS_ORDER or {}) do
			local pl = Players:GetPlayerByUserId(uid)
			if pl and not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid] then
				finalPosition += 1
				table.insert(lines, ("P%d %s"):format(finalPosition, getDisplayName(pl)))
			end
		end
		for _, uid in ipairs(CURRENT_STANDINGS_ORDER or {}) do
			local pl = Players:GetPlayerByUserId(uid)
			if pl and DSQ_DRIVERS[uid] then table.insert(lines, ("[DSQ] %s — no valid finishing position"):format(getDisplayName(pl))) end
		end
		table.insert(lines, "")
		table.insert(lines, "— FASTEST QUALIFYING LAP —")
		local qualyFast = next(QUALY_BEST_TIMES) and QUALY_GLOBAL_FASTEST or FINAL_QUALY_GLOBAL_FASTEST
		local qualyFastPlayer = qualyFast and qualyFast.uid and Players:GetPlayerByUserId(qualyFast.uid)
		local qualyFastName = qualyFast and qualyFast.name
		if qualyFast and qualyFast.uid and qualyFast.time and qualyFast.time < math.huge then
			table.insert(lines, ("%s — %s"):format(qualyFastName or (qualyFastPlayer and getDisplayName(qualyFastPlayer) or ("UID " .. tostring(qualyFast.uid))), fmtTime(qualyFast.time)))
		else
			table.insert(lines, "Not recorded.")
		end
		table.insert(lines, "")
		table.insert(lines, "— FASTEST RACE LAP —")
		local raceFast = GLOBAL_FASTEST_LAP
		local raceFastPlayer = raceFast and raceFast.uid and Players:GetPlayerByUserId(raceFast.uid)
		local raceFastName = raceFast and raceFast.name
		if raceFast and raceFast.uid and raceFast.time and raceFast.time < math.huge then
			table.insert(lines, ("%s — %s"):format(raceFastName or (raceFastPlayer and getDisplayName(raceFastPlayer) or ("UID " .. tostring(raceFast.uid))), fmtTime(raceFast.time)))
		else
			table.insert(lines, "Not recorded.")
		end

		table.insert(lines, "")
		table.insert(lines, "— INCIDENTS —")
		local leves, graves = 0, 0
		for _, c in ipairs(SPA_Crash.log) do
			if c.sev == "LEVE" then leves += 1 else graves += 1 end
		end
		table.insert(lines, ("Collisions: %d minor, %d severe"):format(leves, graves))
		local ccTotal = 0
		for _, d in pairs(ccData) do ccTotal += (d.total or 0) end
		table.insert(lines, ("Total track limits infringements: %d"):format(ccTotal))
		local nitroCount = 0
		for _, v in ipairs(VIOLATIONS_LOG or {}) do
			if v.type == "Boost use" then nitroCount += 1 end
		end
		table.insert(lines, ("Boost activations detected: %d"):format(nitroCount))

		table.insert(lines, "")
		table.insert(lines, "— APPLIED PENALTIES —")
		if #APPLIED_SANCTIONS == 0 then table.insert(lines, "None.") end
		for _, s in ipairs(APPLIED_SANCTIONS) do
			local sanctionText = s.type == "DSQ" and "DSQ" or ("+" .. tostring(PENALTY_CONFIG.penaltySeconds) .. "s")
			table.insert(lines, ("%s — %s (%s) [%s]"):format(s.name, s.reason, sanctionText, s.time))
		end

		table.insert(lines, "")
		table.insert(lines, "— DRIVER OF THE DAY CANDIDATES (community vote) —")
		local candidates = {}
		for _, uid in ipairs(CURRENT_STANDINGS_ORDER) do
			local pl = Players:GetPlayerByUserId(uid)
			if pl and not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid] then
				table.insert(candidates, {
					uid = uid, name = getDisplayName(pl),
					overtakes = (OVERTAKE_COUNT and OVERTAKE_COUNT[uid]) or 0,
					fastLap = (fastLapData[uid] and fastLapData[uid].bestTime) or nil,
					cc = (ccData[uid] and ccData[uid].total) or 0,
				})
			end
		end
		tsort(candidates, function(a,b)
			local sa = a.overtakes*10 - a.cc*3 + (a.fastLap and 5 or 0)
			local sb = b.overtakes*10 - b.cc*3 + (b.fastLap and 5 or 0)
			return sa > sb
		end)
		for i = 1, mmin(3, #candidates) do
			local c = candidates[i]
			table.insert(lines, ("%d) %s — %d overtakes, %s incident-free: %s"):format(
				i, c.name, c.overtakes,
				c.fastLap and ("fastest lap "..fmtTime(c.fastLap)) or "no fastest lap",
				c.cc == 0 and "yes" or ("no, "..c.cc.." track limits infringement(s)")
			))
		end
		return table.concat(lines, "\n")
	end
	mkConfigActionRow(configScroll, "📋  GENERATE POST-RACE REPORT", Color3.fromRGB(0,90,140), function()
		reportBox.Text = buildPostRaceReport()
	end, 102)

	-- ── Send the report to your own Discord webhook (pasted by you) ──
	RACE_WEBHOOK_URL = RACE_WEBHOOK_URL or ""
	local webhookBox = Instance.new("TextBox")
	webhookBox.Name = "WebhookBox"
	webhookBox.Size = UDim2.new(1,-16,0,36)
	webhookBox.Position = UDim2.new(0,8,0,0)
	webhookBox.BackgroundColor3 = Color3.fromRGB(25,25,32)
	webhookBox.TextColor3 = C_WHITE
	webhookBox.Font = Enum.Font.Gotham
	webhookBox.TextSize = 12
	webhookBox.ClearTextOnFocus = false
	webhookBox.PlaceholderText = "Paste YOUR Discord webhook here (never someone else's)"
	webhookBox.Text = RACE_WEBHOOK_URL
	webhookBox.TextXAlignment = Enum.TextXAlignment.Left
	webhookBox.LayoutOrder = 103
	webhookBox.Parent = configScroll
	local whCorner = Instance.new("UICorner"); whCorner.CornerRadius = UDim.new(0,4); whCorner.Parent = webhookBox
	webhookBox.FocusLost:Connect(function() RACE_WEBHOOK_URL = webhookBox.Text end)

	function sendReportToDiscord()
		if not RACE_WEBHOOK_URL or RACE_WEBHOOK_URL == "" then
			showNotification("⚠ Paste your Discord webhook first", C_YELLOW, "⚠", 8)
			return
		end
		local text = reportBox.Text
		if not text or text == "" or text == "Press GENERATE REPORT when the race ends." then
			text = buildPostRaceReport()
			reportBox.Text = text
		end
		if #text > 3900 then text = text:sub(1, 3900) .. "\n…(truncated; see the rest in the panel)" end
		local payload = HttpService:JSONEncode({
			embeds = {{
				title = "🏁 Post-Race Report — SPA-GLOBAL-IDIM-ENGLISH — Administrator CGF1",
				description = text,
				color = 15158332,
			}}
		})
		task.spawn(function()
			local accepted = false
			local statusCode = nil
			local ok, err = pcall(function()
				local http_request = request or http_request or (syn and syn.request) or (http and http.request)
				if not http_request then
					error("This executor does not support HTTP requests (request/http_request/syn.request).")
				end
				local response = http_request({
					Url = RACE_WEBHOOK_URL,
					Method = "POST",
					Headers = { ["Content-Type"] = "application/json" },
					Body = payload,
				})
				if type(response) == "table" then
					statusCode = tonumber(response.StatusCode or response.Status or response.status_code)
					accepted = statusCode ~= nil and statusCode >= 200 and statusCode < 300
				end
			end)
			if ok and accepted then
				showNotification("📤 Report sent to Discord", Color3.fromRGB(0,150,90), "📤", 10)
			else
				showNotification("❌ Discord did not accept the report", C_RED, "❌", 10)
				warn("[SPA-GLOBAL-IDIM-ENGLISH] Webhook error:", err or ("Unaccepted HTTP status: " .. tostring(statusCode)))
			end
		end)
	end
	mkConfigActionRow(configScroll, "📤  SEND REPORT TO DISCORD", Color3.fromRGB(88,101,242), sendReportToDiscord, 104)

	makeSectionHeader(configScroll, "🏆  SEASON REPORT", 106)
	SEASON_POINTS_TABLE = {25,18,15,12,10,8,6,4,2,1}
	SEASON_STANDINGS = SEASON_STANDINGS or {}  -- [uid] = {name=..., points=...}

	mkConfigActionRow(configScroll, "➕  ADD THIS RACE TO THE SEASON", Color3.fromRGB(0,90,140), function()
		local pointsPosition = 0
		for _, uid in ipairs(CURRENT_STANDINGS_ORDER) do
			local pl = Players:GetPlayerByUserId(uid)
			if pl and not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid] then
				pointsPosition += 1
				local pts = SEASON_POINTS_TABLE[pointsPosition] or 0
				SEASON_STANDINGS[uid] = SEASON_STANDINGS[uid] or { name = getDisplayName(pl), points = 0 }
				SEASON_STANDINGS[uid].name    = getDisplayName(pl)
				SEASON_STANDINGS[uid].points  = SEASON_STANDINGS[uid].points + pts
			end
		end
		showNotification("🏆 Race added to the championship", Color3.fromRGB(0,150,90), "🏆", 10)
	end, 107)

	mkConfigActionRow(configScroll, "📋  GENERATE SEASON REPORT", Color3.fromRGB(0,90,140), function()
		local rows = {}
		for uid, d in pairs(SEASON_STANDINGS) do table.insert(rows, d) end
		tsort(rows, function(a,b) return a.points > b.points end)
		local lines = { "🏆 CHAMPIONSHIP — SPA-GLOBAL-IDIM-ENGLISH — Administrator CGF1", os.date("%d/%m/%Y"), "" }
		for i, d in ipairs(rows) do
			table.insert(lines, i..". "..d.name.." — "..d.points.." pts")
		end
		reportBox.Text = table.concat(lines, "\n")
	end, 108)

	makeSectionHeader(configScroll, "🔔  NOTIFICATIONS", 78)
	mkConfigToggleRow(configScroll, "Show notifications",
		function() return NOTIF_ENABLED end,
		function(v) NOTIF_ENABLED = v end, 79)

	makeSectionHeader(configScroll, "⏱  RACE TIMER", 80)
	do
		local cronRow = Instance.new("Frame")
		cronRow.Size=UDim2.new(1,0,0,44); cronRow.BackgroundColor3=C_BG2; cronRow.BorderSizePixel=0; cronRow.LayoutOrder=81; cronRow.Parent=configScroll

		local cronBtn = Instance.new("TextButton")
		cronBtn.Size=UDim2.new(0.42,-8,0.72,0); cronBtn.Position=UDim2.new(0,8,0.14,0)
		cronBtn.BackgroundColor3=Color3.fromRGB(0,120,50); cronBtn.Text="▶  START"
		cronBtn.Font=Enum.Font.GothamBold; cronBtn.TextColor3=C_WHITE; cronBtn.TextSize=12
		cronBtn.BorderSizePixel=0; cronBtn.Parent=cronRow
		local cronBtnC=Instance.new("UICorner"); cronBtnC.CornerRadius=UDim.new(0,3); cronBtnC.Parent=cronBtn

		local cronDisplay=Instance.new("Frame")
		cronDisplay.Size=UDim2.new(0.52,-8,0.72,0); cronDisplay.Position=UDim2.new(0.46,0,0.14,0)
		cronDisplay.BackgroundColor3=Color3.fromRGB(0,0,0); cronDisplay.BorderSizePixel=0; cronDisplay.Parent=cronRow
		local cronDisplayC=Instance.new("UICorner"); cronDisplayC.CornerRadius=UDim.new(0,3); cronDisplayC.Parent=cronDisplay

		local cronLbl=Instance.new("TextLabel")
		cronLbl.Size=UDim2.new(1,0,1,0); cronLbl.BackgroundTransparency=1
		cronLbl.Text="--:--.---"; cronLbl.Font=Enum.Font.GothamBlack
		cronLbl.TextColor3=C_GREEN; cronLbl.TextSize=14; cronLbl.Parent=cronDisplay
		local cronLblP=Instance.new("UIPadding"); cronLblP.PaddingLeft=UDim.new(0,6); cronLblP.Parent=cronDisplay

		cronBtn.MouseButton1Click:Connect(function()
			if not SPA_UI2_cronRunning then
				if SPA_UI2_cronConnection then SPA_UI2_cronConnection:Disconnect(); SPA_UI2_cronConnection = nil end
				if RACE_STATE == "FINISHED" then
					resetRaceTransientState()
					FINAL_QUALY_RESULTS = {}; FINAL_QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }; QUALY_BEST_TIMES = {}; QUALY_FIA_STATUS = {}; QUALY_NAMES = {}
				end
				SPA_UI2_cronRunning    = true
				SPA_UI2_cronStartTime  = tick()
				-- Single QUALY → RACE transition and immutable historical snapshot.
				if QUALY_MODE and RACE_STATE == "QUALY" then
					FINAL_QUALY_RESULTS = {}
					for uid, qualyTime in pairs(QUALY_BEST_TIMES) do
						local pl = Players:GetPlayerByUserId(uid)
						FINAL_QUALY_RESULTS[uid] = {
							uid = uid, name = QUALY_NAMES[uid] or (pl and getDisplayName(pl) or ("UID " .. tostring(uid))),
							time = qualyTime, fiaExcluded = QUALY_FIA_STATUS[uid] == true,
						}
					end
					FINAL_QUALY_GLOBAL_FASTEST = { time = QUALY_GLOBAL_FASTEST.time, uid = QUALY_GLOBAL_FASTEST.uid, name = QUALY_GLOBAL_FASTEST.name }
					QUALY_BEST_TIMES = {}
					QUALY_MODE = false
					RACE_STATE = "RACE"
					towerHeader.BackgroundColor3 = towerConfig.headerColor
					towerHeaderText.Text = "LAP 0/" .. tostring(MAX_LAPS)
					SPA_RaceControl:AddEvent("QUALY_FINISH", { category = "QUALY", severity = "INFO", title = "🏁 QUALIFYING FINISHED", description = "Qualifying results frozen at race start" })
				else
					RACE_STATE = "RACE"
				end
				resetRaceTransientState()
				_spaLapRuntimeState("RACE_START")
				SPA_RaceControl:AddEvent("RACE_START", { category = "FLAGS", severity = "INFO", title = "🟢 RACE STARTED", description = "Race timer started" })
				cronBtn.Text   = "■  STOP"
				cronBtn.BackgroundColor3 = Color3.fromRGB(160,20,20)
				cronLbl.Text   = "0:00.000"
				cronLbl.TextColor3 = C_YELLOW
				SPA_UI2_cronConnection = RunService.Heartbeat:Connect(function()
					local e    = tick()-SPA_UI2_cronStartTime
					local mins = mfloor(e/60)
					local secs = e%60
					cronLbl.Text = sformat("%d:%06.3f",mins,secs)
				end)
			else
				SPA_UI2_cronRunning = false
				QUALY_MODE = false
				RACE_STATE = "FINISHED"
				_spaLapRuntimeState("RACE_FINISH")
				SPA_RaceControl:AddEvent("RACE_FINISH", { category = "FLAGS", severity = "INFO", title = "🏁 RACE FINISHED", description = "Race timer stopped" })
				if SPA_UI2_cronConnection then SPA_UI2_cronConnection:Disconnect(); SPA_UI2_cronConnection=nil end
				local e    = tick()-SPA_UI2_cronStartTime
				local mins = mfloor(e/60)
				local secs = e%60
				cronLbl.Text       = sformat("%d:%06.3f",mins,secs)
				cronLbl.TextColor3 = C_GREEN
				cronBtn.Text       = "▶  START"
				cronBtn.BackgroundColor3 = Color3.fromRGB(0,120,50)
			end
		end)
	end

	-- ═══ CHAT ANNOUNCEMENTS (key events only: fastest laps and penalties) ═══
	-- (ENABLE_CHAT_EVENTS was initialized above, before the CONFIG UI)
	local function _buildCurrentQualyChatStandings()
		local list = {}
		for _, pl in ipairs(Players:GetPlayers()) do
			if not FIA_EXCLUDED[pl.UserId] then
				table.insert(list, { player = pl, bestTime = QUALY_BEST_TIMES[pl.UserId] })
			end
		end
		tsort(list, function(a, b)
			local at, bt = a.bestTime, b.bestTime
			if at and bt then return at < bt end
			if at then return true end
			if bt then return false end
			return a.player.Name:lower() < b.player.Name:lower()
		end)
		return list
	end

	function buildQualyChatMessage()
		local standings = _buildCurrentQualyChatStandings()
		local lines = { "🏆 Current standings:" }
		for i, entry in ipairs(standings) do
			local timeTxt = entry.bestTime and fmtTime(entry.bestTime) or "NO TIME"
			table.insert(lines, ("P%d %s time: %s"):format(i, getDisplayName(entry.player), timeTxt))
		end
		return table.concat(lines, "\n")
	end

	function buildRaceChatMessage()
		local lines = { "🏁 Current positions:" }
		local publicPos = 0
		for _, uid in ipairs(CURRENT_STANDINGS_ORDER) do
			local pl = Players:GetPlayerByUserId(uid)
			if pl and not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid] then
				publicPos += 1
				table.insert(lines, ("P%d %s"):format(publicPos, getDisplayName(pl)))
			end
		end
		return table.concat(lines, "\n")
	end

	function announceRaceEvent(msg)
		if not ENABLE_CHAT_EVENTS or not msg or msg == "" then return end
		task.spawn(function()
			local lines = {}
			for line in tostring(msg):gmatch("[^\n]+") do
				table.insert(lines, line)
			end
			if #lines == 0 then return end

			-- Batch lines to avoid a huge message when there are many drivers.
			local batches, batch = {}, ""
			for _, line in ipairs(lines) do
				if batch == "" then
					batch = line
				elseif #batch + #line + 1 <= 180 then
					batch = batch .. "\n" .. line
				else
					table.insert(batches, batch)
					batch = line
				end
			end
			if batch ~= "" then table.insert(batches, batch) end

			for _, payload in ipairs(batches) do
				local sent = false
				local ok = pcall(function()
					local tcs = game:GetService("TextChatService")
					local channels = tcs:FindFirstChild("TextChannels")
					local channel = channels and channels:FindFirstChild("RBXGeneral")
					if channel then
						channel:SendAsync(payload)
						sent = true
					end
				end)
				if not ok or not sent then
					pcall(function()
						local head = player.Character and player.Character:FindFirstChild("Head")
						if head then game:GetService("Chat"):Chat(head, payload, Enum.ChatColor.White) end
					end)
				end
				task.wait(0.15)
			end
		end)
	end

	-- ═══ VSC (Virtual Safety Car) ═══
	-- (ENABLE_VSC was initialized above, before the CONFIG UI)
	SPA_UI2_vscOriginalLimit = nil
	function toggleVSC()
		ENABLE_VSC = not ENABLE_VSC
		SPA_RaceControl:AddEvent(ENABLE_VSC and "VSC_ON" or "VSC_OFF", { category = "FLAGS", severity = "INFO", title = ENABLE_VSC and "🟡 VSC DEPLOYED" or "🟢 VSC WITHDRAWN", description = ENABLE_VSC and "Virtual Safety Car deployed" or "Virtual Safety Car withdrawn" })
		if ENABLE_VSC then
			SPA_UI2_vscOriginalLimit = SPEED_LIMIT
			SPEED_LIMIT = mclamp(math.min(SPEED_LIMIT, 40), 10, 500)
			showNotification("🟡 VSC DEPLOYED — speed limit temporarily reduced", C_YELLOW, "🟡", 20)
			if ENABLE_CHAT_EVENTS then announceRaceEvent("🟡 VIRTUAL SAFETY CAR — reduce speed") end
		else
			if SPA_UI2_vscOriginalLimit then SPEED_LIMIT = SPA_UI2_vscOriginalLimit end
			showNotification("🟢 VSC ENDED", C_GREEN, "🟢", 15)
			if ENABLE_CHAT_EVENTS then announceRaceEvent("🟢 VSC ENDED — racing may resume") end
		end
	end

	-- ═══ PENALTY SYSTEM (settings + proposals, never automatic) ═══
	-- (PENALTY_CONFIG, PENALTY_OFFSET, PENDING_SANCTIONS, APPLIED_SANCTIONS and
	--  CURRENT_STANDINGS_ORDER were initialized above, before the CONFIG UI)

	function getUidAhead(uid)
		for i, u in ipairs(CURRENT_STANDINGS_ORDER) do
			if u == uid then return (i > 1) and CURRENT_STANDINGS_ORDER[i-1] or nil end
		end
		return nil
	end

	function proposeSanction(uid, reason, detail, sanctionType)
		if sanctionType == "DSQ" and DSQ_DRIVERS[uid] then return end
		-- Avoid proposing the same penalty twice consecutively for the same driver
		for _, s in ipairs(PENDING_SANCTIONS) do
			if s.uid == uid and s.reason == reason and sanctionType ~= "DSQ" then return end
		end
		local pl = Players:GetPlayerByUserId(uid)
		local name = pl and getDisplayName(pl) or ("UID "..uid)
		table.insert(PENDING_SANCTIONS, {
			uid = uid, name = name,
			reason = reason, detail = detail, type = sanctionType or "PENALTY", time = os.date("%H:%M:%S")
		})
		VIOLATIONS_LOG = VIOLATIONS_LOG or {}
		table.insert(VIOLATIONS_LOG, 1, { type = reason, uid = uid, name = name, detail = detail, time = os.date("%H:%M:%S") })
		if #VIOLATIONS_LOG > 200 then table.remove(VIOLATIONS_LOG) end
		if reason == "Boost use" then
			SPA_RaceControl:AddEvent("BOOST", { category = "INCIDENTES", severity = "WARN", uid = uid, name = name, title = "⚡ BOOST", description = name .. " — Boost use detected" })
		end
		if sanctionType == "DSQ" then
			SPA_RaceControl:AddEvent("DSQ_PROPOSED", { category = "SANCIONES", severity = "WARN", uid = uid, name = name, title = "⛔ DSQ PROPOSED", description = name .. " — GROUND EFFECT DETECTED" })
		end
		SPA_RaceControl:AddEvent("SANCTION_PROPOSED", { category = "SANCIONES", severity = "WARN", uid = uid, name = name, reason = reason, detail = detail, title = "🚩 PENALTY PROPOSED", description = name .. " — " .. tostring(reason) })
		showNotification(("🚩 PENALTY PROPOSED — %s: %s"):format(name, reason), C_RED, "🚩", 15)
		if buildPendingSanctionsList then buildPendingSanctionsList() end
		if buildViolationsLogList then buildViolationsLogList() end
	end

	function applySanction(index)
		local s = table.remove(PENDING_SANCTIONS, index)
		if not s then return end
		if s.type == "DSQ" then
			DSQ_DRIVERS[s.uid] = true
		else
			PENALTY_OFFSET[s.uid] = (PENALTY_OFFSET[s.uid] or 0) + PENALTY_CONFIG.penaltySeconds
		end
		table.insert(APPLIED_SANCTIONS, s)
		if s.type == "DSQ" then
			SPA_RaceControl:AddEvent("DSQ", { category = "SANCIONES", severity = "WARN", uid = s.uid, name = s.name, title = "⛔ DSQ", description = s.name .. " — GROUND EFFECT DETECTED" })
			showNotification(("⛔ DSQ — GROUND EFFECT DETECTED — %s"):format(s.name), C_RED, "⛔", 15)
			if ENABLE_CHAT_EVENTS then announceRaceEvent(("⛔ DSQ — GROUND EFFECT DETECTED — %s"):format(s.name)) end
		else
			SPA_RaceControl:AddEvent("SANCTION_APPLIED", { category = "SANCIONES", severity = "INFO", uid = s.uid, name = s.name, reason = s.reason, title = "✅ PENALTY APPLIED", description = s.name .. " — " .. tostring(s.reason) .. " — +" .. tostring(PENALTY_CONFIG.penaltySeconds) .. "s" })
			showNotification(("✅ Penalty applied: %s (+%ds)"):format(s.name, PENALTY_CONFIG.penaltySeconds), Color3.fromRGB(0,150,90), "✅", 12)
			if ENABLE_CHAT_EVENTS then announceRaceEvent(("⚠️ PENALTY: %s +%ds — %s"):format(s.name, PENALTY_CONFIG.penaltySeconds, s.reason)) end
		end
		if buildPendingSanctionsList then buildPendingSanctionsList() end
		if buildAppliedSanctionsList then buildAppliedSanctionsList() end
	end

	function dismissSanction(index)
		local dismissed = table.remove(PENDING_SANCTIONS, index)
		if dismissed then SPA_RaceControl:AddEvent("SANCTION_DISMISSED", { category = "SANCIONES", severity = "INFO", uid = dismissed.uid, name = dismissed.name, reason = dismissed.reason, title = "❌ PENALTY DISMISSED", description = dismissed.name }) end
		if buildPendingSanctionsList then buildPendingSanctionsList() end
	end

	-- ═══ GAP SYSTEM (leader + car ahead) ═══
	-- (ENABLE_GAP and GAP_MODE_LEAD were initialized above, before the CONFIG UI) -- true = gap to leader; false = interval to car ahead
	SPA_UI2_lastLapsMadeSeenGap   = {}
	SPA_UI2_lapCompletionRaceTime = {}
	SPA_UI2_tGap = 0
	RunService.Heartbeat:Connect(function(dt)
		if not ENABLE_GAP or not SPA_UI2_cronRunning then return end
		SPA_UI2_tGap += dt
		if SPA_UI2_tGap < 0.2 then return end
		SPA_UI2_tGap = 0
		local nowRace = tick() - SPA_UI2_cronStartTime
		for _, pl in ipairs(Players:GetPlayers()) do
			local uid = pl.UserId
			local ld  = lapData[uid]
			if ld then
				local prevLaps = SPA_UI2_lastLapsMadeSeenGap[uid] or 0
				if ld.lapsMade > prevLaps then
					SPA_UI2_lapCompletionRaceTime[uid] = nowRace
					SPA_UI2_lastLapsMadeSeenGap[uid]   = ld.lapsMade
				end
			end
		end
	end)

	function computeGapText(uid, refUid)
		if not refUid or refUid == uid then return "LEADER" end
		local ld, refLd = lapData[uid], lapData[refUid]
		if not ld or not refLd then return "---" end
		local lapDiff = refLd.lapsMade - ld.lapsMade
		if lapDiff > 0 then
			return "+"..lapDiff.." LAP"..(lapDiff > 1 and "S" or "")
		end
		local t1, t2 = SPA_UI2_lapCompletionRaceTime[uid], SPA_UI2_lapCompletionRaceTime[refUid]
		if not t1 or not t2 then return "---" end
		local diff = t1 - t2
		if diff <= 0.001 then return "LEADER" end
		return "+"..sformat("%.3f", diff)
	end

	SPA_UI2_towerVisible = true
	function toggleHUD()
		SPA_UI2_towerVisible = not SPA_UI2_towerVisible
		towerConfig.hudMasterVisible = SPA_UI2_towerVisible  -- [SPAV4 fix] Synchronize the tower banner/background
		towerContainer.Visible = SPA_UI2_towerVisible and towerConfig.visible
		lapPanel.Visible       = SPA_UI2_towerVisible
	end

	floatBtn.MouseButton1Click:Connect(function() mainFrame.Visible = not mainFrame.Visible end)
	closeBtn.MouseButton1Click:Connect(function() mainFrame.Visible = false end)

	UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode == Enum.KeyCode.Q then toggleHUD() end
	end)

	Players.PlayerRemoving:Connect(function(pl)
		local uid = pl.UserId
		lapData[uid]=nil; pitData[uid]=nil; fastLapData[uid]=nil
		lastSpeeds[uid]=nil; notifiedPlayers[uid]=nil
		if PlayerState and PlayerState[uid] then
			if PlayerState[uid].charAncestryConn then pcall(function() PlayerState[uid].charAncestryConn:Disconnect() end) end
			PlayerState[uid] = nil
		end
		if VehicleCache and VehicleCache[uid] then cleanupVehicleCache(uid, VehicleCache[uid]); VehicleCache[uid] = nil end
		groundEffectState[uid] = nil
		DSQ_DRIVERS[uid] = nil
		if SPA_RaceControl then SPA_RaceControl.lastPositions[uid] = nil; SPA_RaceControl.pendingPositions[uid] = nil; SPA_RaceControl.rejoiningPositions[uid] = nil end
		OVERTAKE_COUNT[uid] = nil
		previousLapPositions[uid]=nil; SPA_UI2_lapStateLogAt[uid]=nil; SPA_UI2_lastSeenInPitIn[uid]=nil; SPA_UI2_lastSeenInPitOut[uid]=nil
		FIA_EXCLUDED[uid]=nil; customPlayerData[uid]=nil; SPA_UI2_alertedPlayers[uid]=nil
		if towerRows[uid] then towerRows[uid]:Destroy(); towerRows[uid]=nil end
		if towerRowData[uid] then towerRowData[uid]=nil end
		if vueltasRowCache[uid] then
			if vueltasRowCache[uid].topRow then vueltasRowCache[uid].topRow:Destroy() end
			if vueltasRowCache[uid].btnRow then vueltasRowCache[uid].btnRow:Destroy() end
			vueltasRowCache[uid] = nil
		end
		if boxesRowCache[uid] then boxesRowCache[uid]:Destroy(); boxesRowCache[uid] = nil; boxesRowRefs[uid] = nil end
		if fastLapsRowCache[uid] then fastLapsRowCache[uid]:Destroy(); fastLapsRowCache[uid] = nil; fastLapsRowRefs[uid] = nil end

		-- Track limits cleanup
		ccData[uid] = nil
		for id, _ in pairs(lastSeenInCC) do if lastSeenInCC[id] then lastSeenInCC[id][uid] = nil end end
		for key, _ in pairs(ccDebounce) do
			local keyUid
			if type(key) == "string" then local _, parsedUid = key:match("^([^_]+)_(%d+)$"); keyUid = parsedUid end
			if keyUid and tonumber(keyUid) == uid then ccDebounce[key] = nil end
		end
	end)
	_spaLapRuntimeState("INIT")
end
SPA_INIT.ui2Ok = _spaInitStage("UI2", _setupUI2, { "UI1" })
SPA_INIT.audioOk = _spaInitStage("AUDIO RETRY", function()
	assert(type(SPA_AudioRetry.Step) == "function" and VehicleCache, "audio/cache unavailable")
	SPA_AudioRetry.initialized = true
end, { "UI2" })
SPA_INIT.noclipOk = _spaInitStage("NOCLIP", function()
	assert(PlayerState and VehicleCache and type(proposeSanction) == "function", "NoClip dependencies unavailable")
	SPA_NoClip.initialized = true
end, { "UI2", "AUDIO RETRY" })
SPA_INIT.lapsControlOk = _spaInitStage("LAPS CONTROL", function()
	SPA_LapsControl:Init()
end, { "UI2" })
SPA_INIT.collisionOk = _spaInitStage("COLLISION", _setupCollisionDetection, { "UI2" })
SPA_INIT.analysisOk = _spaInitStage("ANALYSIS", _setupAnalysisDetection, { "UI2" })
SPA_INIT.replayOk = _spaInitStage("REPLAY", _setupReplayDetection, { "UI2", "COLLISION", "ANALYSIS" })

-- ══════════════════════════════════════════════════════════════
-- ═══  _setupCCUI (Anti Corner Cut UI) ═════════════════════════
-- ══════════════════════════════════════════════════════════════
function _setupCCUI()  -- [SPAV4] Global: frees registers in the main scope
	local ccGui = Instance.new("ScreenGui")
	ccGui.Name = "SPACCANTICC"
	ccGui.ResetOnSpawn = false
	ccGui.DisplayOrder = 55
	ccGui.Parent = playerGui

	local ccBtn = Instance.new("TextButton")
	ccBtn.Size = UDim2.new(0, 54, 0, 44)
	ccBtn.Position = UDim2.new(0, 14, 0.5, 34) -- Directly below SPA
	ccBtn.BackgroundColor3 = Color3.fromRGB(180, 130, 0)
	ccBtn.Text = "CC"
	ccBtn.TextColor3 = C_WHITE
	ccBtn.Font = Enum.Font.GothamBlack
	ccBtn.TextSize = 13
	ccBtn.BorderSizePixel = 0
	ccBtn.Parent = ccGui
	Instance.new("UICorner", ccBtn).CornerRadius = UDim.new(0, 4)

	local ccBtnLine = Instance.new("Frame")
	ccBtnLine.Size = UDim2.new(1, 0, 0, 3)
	ccBtnLine.Position = UDim2.new(0, 0, 1, -3)
	ccBtnLine.BackgroundColor3 = CCWPCOLOR
	ccBtnLine.BackgroundTransparency = 0.3
	ccBtnLine.BorderSizePixel = 0
	ccBtnLine.Parent = ccBtn

	local ccPanel = Instance.new("Frame")
	ccPanel.Size = UDim2.new(0.6, 0, 0.65, 0)
	ccPanel.Position = UDim2.new(0.5, 0, 0.5, 0)
	ccPanel.AnchorPoint = Vector2.new(0.5, 0.5)
	ccPanel.BackgroundColor3 = C_BG
	ccPanel.BorderSizePixel = 0
	ccPanel.Visible = false
	ccPanel.Parent = ccGui
	Instance.new("UICorner", ccPanel).CornerRadius = UDim.new(0, 6)
	Glass.registerModal(ccPanel)

	local topAccent = Instance.new("Frame")
	topAccent.Size = UDim2.new(1, 0, 0, 3)
	topAccent.BackgroundColor3 = CCWPCOLOR
	topAccent.BorderSizePixel = 0
	topAccent.Parent = ccPanel

	local titleBar = Instance.new("Frame")
	titleBar.Size = UDim2.new(1, 0, 0, 38)
	titleBar.Position = UDim2.new(0, 0, 0, 3)
	titleBar.BackgroundColor3 = C_BG2
	titleBar.BorderSizePixel = 0
	titleBar.Parent = ccPanel

	local titleTxt = Instance.new("TextLabel")
	titleTxt.Size = UDim2.new(0.75, 0, 1, 0)
	titleTxt.Position = UDim2.new(0, 14, 0, 0)
	titleTxt.BackgroundTransparency = 1
	titleTxt.Text = "SPA-GLOBAL-IDIM-ENGLISH — TRACK LIMITS"
	titleTxt.Font = Enum.Font.GothamBlack
	titleTxt.TextColor3 = CCWPCOLOR
	titleTxt.TextSize = 13
	titleTxt.TextXAlignment = Enum.TextXAlignment.Left
	titleTxt.Parent = titleBar

	local closeBtn = Instance.new("TextButton")
	closeBtn.Size = UDim2.new(0, 32, 0, 28)
	closeBtn.Position = UDim2.new(1, -38, 0, 5)
	closeBtn.BackgroundColor3 = C_RED
	closeBtn.Text = "✕"
	closeBtn.TextColor3 = C_WHITE
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.TextSize = 14
	closeBtn.BorderSizePixel = 0
	closeBtn.Parent = titleBar
	Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 3)

	local tabNames = {"WP CC", "REGISTROS CC", "CONFIG CC"}
	local tabButtons = {}
	local tabFrames  = {}
	local currentCCTab = "WP CC"

	local tabBar = Instance.new("Frame")
	tabBar.Size = UDim2.new(1, 0, 0, 32)
	tabBar.Position = UDim2.new(0, 0, 0, 41)
	tabBar.BackgroundColor3 = C_BG2
	tabBar.BorderSizePixel = 0
	tabBar.Parent = ccPanel

	local tabLayout = Instance.new("UIListLayout")
	tabLayout.FillDirection = Enum.FillDirection.Horizontal
	tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tabLayout.Parent = tabBar

	local function createScrollList(parent)
		local scroll = Instance.new("ScrollingFrame")
		scroll.Size                 = UDim2.new(1, 0, 1, 0)
		scroll.BackgroundColor3     = C_BG
		scroll.BorderSizePixel      = 0
		scroll.CanvasSize           = UDim2.new(0, 0, 0, 0)
		scroll.ScrollingDirection   = Enum.ScrollingDirection.Y
		scroll.ScrollBarThickness   = 8
		scroll.ScrollBarImageColor3 = CCWPCOLOR
		scroll.ElasticBehavior      = Enum.ElasticBehavior.Always
		scroll.Parent = parent
		local layout = Instance.new("UIListLayout")
		layout.Padding   = UDim.new(0, 2)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Parent    = scroll
		-- Infinite scroll: AbsoluteContentSize listener
		local function _syncCC()
			scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 24)
		end
		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(_syncCC)
		task.defer(_syncCC)
		return scroll
	end

	for i, tabName in ipairs(tabNames) do
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1/#tabNames, 0, 1, 0)
		btn.BackgroundColor3 = (tabName == currentCCTab) and CCWPCOLOR or C_BG2
		btn.Text = SPA_ENGLISH_LABELS[tabName] or tabName
		btn.TextColor3 = (tabName == currentCCTab) and Color3.fromRGB(0,0,0) or C_GRAY
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 11
		btn.BorderSizePixel = 0
		btn.LayoutOrder = i
		btn.Parent = tabBar
		tabButtons[tabName] = btn

		local indicator = Instance.new("Frame")
		indicator.Name = "Indicator"
		indicator.Size = UDim2.new(1, 0, 0, 2)
		indicator.Position = UDim2.new(0, 0, 1, -2)
		indicator.BackgroundColor3 = (tabName == currentCCTab) and CCWPCOLOR or C_BG2
		indicator.BorderSizePixel = 0
		indicator.Parent = btn

		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -16, 1, -82)
		frame.Position = UDim2.new(0, 8, 0, 74)
		frame.BackgroundTransparency = 1
		frame.Visible = (tabName == currentCCTab)
		frame.Parent = ccPanel
		tabFrames[tabName] = frame
	end

	local wpCCScroll     = createScrollList(tabFrames["WP CC"])
	local regCCScroll    = createScrollList(tabFrames["REGISTROS CC"])
	local configCCScroll = createScrollList(tabFrames["CONFIG CC"])

	local function makeCCSectionHeader(parent, text, order)
		local h = Instance.new("Frame")
		h.Size = UDim2.new(1, 0, 0, 22)
		h.BackgroundColor3 = Color3.fromRGB(100, 80, 0)
		h.BorderSizePixel = 0
		h.LayoutOrder = order
		h.Parent = parent
		local lbl = Instance.new("TextLabel")
		lbl.Size = UDim2.new(1, -12, 1, 0)
		lbl.Position = UDim2.new(0, 10, 0, 0)
		lbl.BackgroundTransparency = 1
		lbl.Text = text
		lbl.Font = Enum.Font.GothamBlack
		lbl.TextColor3 = CCWPCOLOR
		lbl.TextSize = 11
		lbl.TextXAlignment = Enum.TextXAlignment.Left
		lbl.Parent = h
	end

	-- Forward declarations
	local buildWpCCList, buildRegCCList, buildConfigCCList

	function buildWpCCList()
		for _, c in ipairs(wpCCScroll:GetChildren()) do if c:IsA("Frame") or c:IsA("TextLabel") or c:IsA("TextButton") then c:Destroy() end end

		local topRow = Instance.new("Frame"); topRow.Size = UDim2.new(1, 0, 0, 48); topRow.BackgroundColor3 = Color3.fromRGB(14, 14, 22); topRow.BorderSizePixel = 0; topRow.LayoutOrder = 0; topRow.Parent = wpCCScroll
		local infoLbl = Instance.new("TextLabel"); infoLbl.Size = UDim2.new(0.62, 0, 1, 0); infoLbl.Position = UDim2.new(0, 10, 0, 0); infoLbl.BackgroundTransparency = 1; infoLbl.Text = "Place the waypoint at the corner you want to monitor"; infoLbl.Font = Enum.Font.GothamBold; infoLbl.TextColor3 = C_GRAY; infoLbl.TextSize = 11; infoLbl.TextXAlignment = Enum.TextXAlignment.Left; infoLbl.TextWrapped = true; infoLbl.Parent = topRow
		local toggleBtn = Instance.new("TextButton"); toggleBtn.Size = UDim2.new(0.33, -8, 0.65, 0); toggleBtn.Position = UDim2.new(0.65, 0, 0.175, 0); toggleBtn.BackgroundColor3 = DETECTCC and Color3.fromRGB(0, 120, 50) or Color3.fromRGB(80, 20, 20); toggleBtn.Text = DETECTCC and "DETECT: ON" or "DETECT: OFF"; toggleBtn.Font = Enum.Font.GothamBold; toggleBtn.TextColor3 = DETECTCC and C_GREEN or Color3.fromRGB(255, 80, 80); toggleBtn.TextSize = 10; toggleBtn.BorderSizePixel = 0; toggleBtn.Parent = topRow; Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 3)

		toggleBtn.MouseButton1Click:Connect(function()
			DETECTCC = not DETECTCC
			toggleBtn.BackgroundColor3 = DETECTCC and Color3.fromRGB(0, 120, 50) or Color3.fromRGB(80, 20, 20)
			toggleBtn.Text = DETECTCC and "DETECT: ON" or "DETECT: OFF"
			toggleBtn.TextColor3 = DETECTCC and C_GREEN or Color3.fromRGB(255, 80, 80)
		end)

		makeCCSectionHeader(wpCCScroll, "ADD TRACK LIMITS WAYPOINT", 1)
		local addRow = Instance.new("Frame"); addRow.Size = UDim2.new(1, 0, 0, 130); addRow.BackgroundColor3 = C_BG2; addRow.BorderSizePixel = 0; addRow.LayoutOrder = 2; addRow.Parent = wpCCScroll
		local nameBox = Instance.new("TextBox"); nameBox.Size = UDim2.new(0.52, -8, 0, 26); nameBox.Position = UDim2.new(0, 8, 0, 6); nameBox.BackgroundColor3 = Color3.fromRGB(30, 30, 45); nameBox.BorderSizePixel = 0; nameBox.Font = Enum.Font.GothamBold; nameBox.TextColor3 = C_YELLOW; nameBox.TextSize = 12; nameBox.Text = ""; nameBox.PlaceholderText = "Corner name (e.g. Turn 3)"; nameBox.ClearTextOnFocus = false; nameBox.TextXAlignment = Enum.TextXAlignment.Left; nameBox.Parent = addRow; Instance.new("UICorner", nameBox).CornerRadius = UDim.new(0, 3); local nbp = Instance.new("UIPadding"); nbp.PaddingLeft = UDim.new(0, 6); nbp.Parent = nameBox
		local setBtn = Instance.new("TextButton"); setBtn.Size = UDim2.new(0.44, -8, 0, 26); setBtn.Position = UDim2.new(0.54, 0, 0, 6); setBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 160); setBtn.Text = "SET WP CC"; setBtn.Font = Enum.Font.GothamBold; setBtn.TextColor3 = C_WHITE; setBtn.TextSize = 11; setBtn.BorderSizePixel = 0; setBtn.Parent = addRow; Instance.new("UICorner", setBtn).CornerRadius = UDim.new(0, 3)

		local function makeSliderRow(labelText, getVal, setVal, minV, maxV, yPos)
			local sliderLbl = Instance.new("TextLabel"); sliderLbl.Size = UDim2.new(0.26, 0, 0, 20); sliderLbl.Position = UDim2.new(0, 8, 0, yPos); sliderLbl.BackgroundTransparency = 1; sliderLbl.Text = labelText; sliderLbl.Font = Enum.Font.GothamBold; sliderLbl.TextColor3 = C_GRAY; sliderLbl.TextSize = 10; sliderLbl.TextXAlignment = Enum.TextXAlignment.Left; sliderLbl.Parent = addRow
			local minusBtn = Instance.new("TextButton"); minusBtn.Size = UDim2.new(0, 22, 0, 20); minusBtn.Position = UDim2.new(0.27, 0, 0, yPos); minusBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 0); minusBtn.Text = "-"; minusBtn.Font = Enum.Font.GothamBlack; minusBtn.TextColor3 = C_YELLOW; minusBtn.TextSize = 14; minusBtn.BorderSizePixel = 0; minusBtn.Parent = addRow; Instance.new("UICorner", minusBtn).CornerRadius = UDim.new(0, 3)
			local valLbl = Instance.new("TextLabel"); valLbl.Size = UDim2.new(0.17, 0, 0, 20); valLbl.Position = UDim2.new(0.27, 26, 0, yPos); valLbl.BackgroundColor3 = Color3.fromRGB(20, 20, 32); valLbl.BorderSizePixel = 0; valLbl.Text = tostring(getVal()); valLbl.Font = Enum.Font.GothamBlack; valLbl.TextColor3 = C_WHITE; valLbl.TextSize = 11; valLbl.TextXAlignment = Enum.TextXAlignment.Center; valLbl.Parent = addRow; Instance.new("UICorner", valLbl).CornerRadius = UDim.new(0, 3)
			local plusBtn = Instance.new("TextButton"); plusBtn.Size = UDim2.new(0, 22, 0, 20); plusBtn.Position = UDim2.new(0.27, 62, 0, yPos); plusBtn.BackgroundColor3 = Color3.fromRGB(0, 70, 30); plusBtn.Text = "+"; plusBtn.Font = Enum.Font.GothamBlack; plusBtn.TextColor3 = C_GREEN; plusBtn.TextSize = 14; plusBtn.BorderSizePixel = 0; plusBtn.Parent = addRow; Instance.new("UICorner", plusBtn).CornerRadius = UDim.new(0, 3)
			local notaLbl2 = Instance.new("TextLabel"); notaLbl2.Size = UDim2.new(0.42, -4, 0, 20); notaLbl2.Position = UDim2.new(0.57, 4, 0, yPos); notaLbl2.BackgroundTransparency = 1; notaLbl2.Text = "studs"; notaLbl2.Font = Enum.Font.GothamBold; notaLbl2.TextColor3 = Color3.fromRGB(80, 70, 40); notaLbl2.TextSize = 10; notaLbl2.TextXAlignment = Enum.TextXAlignment.Left; notaLbl2.Parent = addRow
			local step = math.max(1, math.ceil((maxV - minV) / 20))
			minusBtn.MouseButton1Click:Connect(function() setVal(math.max(minV, getVal() - step)); valLbl.Text = tostring(getVal()) end)
			plusBtn.MouseButton1Click:Connect(function() setVal(math.min(maxV, getVal() + step)); valLbl.Text = tostring(getVal()) end)
		end

		makeSliderRow("WIDTH:", function() return CCWPWIDTH end, function(v) CCWPWIDTH=v end, 20, 500, 40)
		makeSliderRow("HEIGHT:", function() return CCWPHEIGHT end, function(v) CCWPHEIGHT=v end, 10, 400, 65)
		makeSliderRow("THICKNESS:", function() return CCWPTHICKNESS end, function(v) CCWPTHICKNESS=v end, 2, 50, 90)

		local notaGeneral = Instance.new("TextLabel"); notaGeneral.Size = UDim2.new(1, -12, 0, 16); notaGeneral.Position = UDim2.new(0, 8, 0, 112); notaGeneral.BackgroundTransparency = 1; notaGeneral.Text = "* Values apply to the next waypoint you place"; notaGeneral.Font = Enum.Font.GothamBold; notaGeneral.TextColor3 = Color3.fromRGB(90, 80, 40); notaGeneral.TextSize = 9; notaGeneral.TextXAlignment = Enum.TextXAlignment.Left; notaGeneral.Parent = addRow

		setBtn.MouseButton1Click:Connect(function()
			local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			if not root then return end
			local wpName = nameBox.Text ~= "" and nameBox.Text or ("WP_CC_" .. (ccWpCounter + 1))
			ccWpCounter = ccWpCounter + 1
			local id = ccWpCounter
			local wall = createCCWall(id, wpName, root.CFrame)
			ccWaypoints[id] = { name = wpName, wall = wall, cframe = wall.CFrame, halfWidth = wall.Size.X / 2, halfHeight = wall.Size.Y / 2 }
			lastSeenInCC[id] = {}
			nameBox.Text = ""
			buildWpCCList()
		end)

		local count = 0
		for _ in pairs(ccWaypoints) do count = count + 1 end
		makeCCSectionHeader(wpCCScroll, count == 0 and "ACTIVE WAYPOINTS (none)" or ("ACTIVE WAYPOINTS (" .. count .. ")"), 3)

		if count > 0 then
			local order = 10
			for id, entry in pairs(ccWaypoints) do
				local row = Instance.new("Frame"); row.Size = UDim2.new(1, 0, 0, 38); row.BackgroundColor3 = C_BG2; row.BorderSizePixel = 0; row.LayoutOrder = order; row.Parent = wpCCScroll; order = order + 1
				local sideBar = Instance.new("Frame"); sideBar.Size = UDim2.new(0, 4, 1, 0); sideBar.BackgroundColor3 = CCWPCOLOR; sideBar.BorderSizePixel = 0; sideBar.Parent = row
				local iconLbl = Instance.new("TextLabel"); iconLbl.Size = UDim2.new(0, 28, 1, 0); iconLbl.Position = UDim2.new(0, 8, 0, 0); iconLbl.BackgroundTransparency = 1; iconLbl.Text = "📍"; iconLbl.TextScaled = true; iconLbl.Font = Enum.Font.GothamBold; iconLbl.TextColor3 = CCWPCOLOR; iconLbl.Parent = row
				local nameLbl = Instance.new("TextLabel"); nameLbl.Size = UDim2.new(0.55, 0, 1, 0); nameLbl.Position = UDim2.new(0, 42, 0, 0); nameLbl.BackgroundTransparency = 1; nameLbl.Text = entry.name; nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextColor3 = C_WHITE; nameLbl.TextSize = 12; nameLbl.TextXAlignment = Enum.TextXAlignment.Left; nameLbl.Parent = row
				local idLbl = Instance.new("TextLabel"); idLbl.Size = UDim2.new(0.12, 0, 1, 0); idLbl.Position = UDim2.new(0.57, 0, 0, 0); idLbl.BackgroundTransparency = 1; idLbl.Text = "#" .. id; idLbl.Font = Enum.Font.GothamBold; idLbl.TextColor3 = C_GRAY; idLbl.TextSize = 10; idLbl.TextXAlignment = Enum.TextXAlignment.Center; idLbl.Parent = row
				local quitarBtn = Instance.new("TextButton"); quitarBtn.Size = UDim2.new(0.26, -8, 0.7, 0); quitarBtn.Position = UDim2.new(0.72, 0, 0.15, 0); quitarBtn.BackgroundColor3 = C_DARKRED; quitarBtn.Text = "✕ REMOVE"; quitarBtn.Font = Enum.Font.GothamBold; quitarBtn.TextColor3 = C_WHITE; quitarBtn.TextSize = 10; quitarBtn.BorderSizePixel = 0; quitarBtn.Parent = row; Instance.new("UICorner", quitarBtn).CornerRadius = UDim.new(0, 3)

				local capturedId = id
				quitarBtn.MouseButton1Click:Connect(function() removeCCWall(capturedId); buildWpCCList() end)
			end
		end

		local clearRow = Instance.new("Frame"); clearRow.Size = UDim2.new(1, 0, 0, 38); clearRow.BackgroundColor3 = C_BG; clearRow.BorderSizePixel = 0; clearRow.LayoutOrder = 999; clearRow.Parent = wpCCScroll
		local clearBtn = Instance.new("TextButton"); clearBtn.Size = UDim2.new(1, -16, 0.75, 0); clearBtn.Position = UDim2.new(0, 8, 0.125, 0); clearBtn.BackgroundColor3 = C_DARKRED; clearBtn.Text = "🗑 REMOVE ALL TRACK LIMITS WAYPOINTS"; clearBtn.Font = Enum.Font.GothamBlack; clearBtn.TextColor3 = C_WHITE; clearBtn.TextSize = 11; clearBtn.BorderSizePixel = 0; clearBtn.Parent = clearRow; Instance.new("UICorner", clearBtn).CornerRadius = UDim.new(0, 3)
		clearBtn.MouseButton1Click:Connect(function() for id, _ in pairs(ccWaypoints) do removeCCWall(id) end; buildWpCCList() end)
	end

	function buildRegCCList()
		for _, c in ipairs(regCCScroll:GetChildren()) do if c:IsA("Frame") or c:IsA("TextLabel") or c:IsA("TextButton") then c:Destroy() end end
		makeCCSectionHeader(regCCScroll, "TRACK LIMITS LOG BY DRIVER", 0)

		local allPlayers = Players:GetPlayers()
		if #allPlayers == 0 then
			local emptyLbl = Instance.new("TextLabel"); emptyLbl.Size = UDim2.new(1, 0, 0, 40); emptyLbl.BackgroundTransparency = 1; emptyLbl.Text = "No players in the server"; emptyLbl.TextColor3 = C_GRAY; emptyLbl.Font = Enum.Font.GothamBold; emptyLbl.TextSize = 13; emptyLbl.LayoutOrder = 1; emptyLbl.Parent = regCCScroll
			return
		end

		local order = 1
		for _, pl in ipairs(allPlayers) do
			local uid = pl.UserId
			local data = ccData[uid] or { total = 0, history = {} }
			local total = data.total
			local displayName = getDisplayName(pl)

			local row = Instance.new("Frame"); row.Size = UDim2.new(1, 0, 0, 40); row.BackgroundColor3 = total > 0 and Color3.fromRGB(20, 15, 5) or C_BG2; row.BorderSizePixel = 0; row.LayoutOrder = order; row.Parent = regCCScroll; order = order + 1
			local sideBar = Instance.new("Frame"); sideBar.Size = UDim2.new(0, 4, 1, 0); sideBar.BackgroundColor3 = total > 0 and CCWPCOLOR or C_GRAY; sideBar.BorderSizePixel = 0; sideBar.Parent = row
			local nameLbl = Instance.new("TextLabel"); nameLbl.Size = UDim2.new(0.5, 0, 1, 0); nameLbl.Position = UDim2.new(0, 14, 0, 0); nameLbl.BackgroundTransparency = 1; nameLbl.Text = displayName; nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextColor3 = total > 0 and C_YELLOW or C_WHITE; nameLbl.TextSize = 12; nameLbl.TextXAlignment = Enum.TextXAlignment.Left; nameLbl.Parent = row
			local countLbl = Instance.new("TextLabel"); countLbl.Size = UDim2.new(0.2, 0, 1, 0); countLbl.Position = UDim2.new(0.5, 0, 0, 0); countLbl.BackgroundTransparency = 1; countLbl.Text = total > 0 and ("⚠️ x" .. total) or "✔ 0"; countLbl.Font = Enum.Font.GothamBlack; countLbl.TextColor3 = total > 0 and CCWPCOLOR or C_GREEN; countLbl.TextSize = 13; countLbl.Parent = row
			local resetBtn = Instance.new("TextButton"); resetBtn.Size = UDim2.new(0.24, -8, 0.65, 0); resetBtn.Position = UDim2.new(0.74, 0, 0.175, 0); resetBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 0); resetBtn.Text = "RESET"; resetBtn.Font = Enum.Font.GothamBold; resetBtn.TextColor3 = C_YELLOW; resetBtn.TextSize = 10; resetBtn.BorderSizePixel = 0; resetBtn.Parent = row; Instance.new("UICorner", resetBtn).CornerRadius = UDim.new(0, 3)

			local capturedUid = uid
			resetBtn.MouseButton1Click:Connect(function() ccData[capturedUid] = { total = 0, history = {} }; buildRegCCList() end)

			if total > 0 and #data.history > 0 then
				for hi, entry in ipairs(data.history) do
					if hi > 10 then break end
					local histRow = Instance.new("Frame"); histRow.Size = UDim2.new(1, 0, 0, 24); histRow.BackgroundColor3 = Color3.fromRGB(12, 10, 3); histRow.BorderSizePixel = 0; histRow.LayoutOrder = order; histRow.Parent = regCCScroll; order = order + 1
					local indent = Instance.new("Frame"); indent.Size = UDim2.new(0, 2, 1, 0); indent.Position = UDim2.new(0, 12, 0, 0); indent.BackgroundColor3 = CCWPCOLOR; indent.BackgroundTransparency = 0.6; indent.BorderSizePixel = 0; indent.Parent = histRow
					local histLbl = Instance.new("TextLabel"); histLbl.Size = UDim2.new(1, -24, 1, 0); histLbl.Position = UDim2.new(0, 22, 0, 0); histLbl.BackgroundTransparency = 1; histLbl.Text = entry.time .. "  |  " .. entry.wpName .. "  |  LAP " .. entry.lap; histLbl.Font = Enum.Font.GothamBold; histLbl.TextColor3 = C_GRAY; histLbl.TextSize = 10; histLbl.TextXAlignment = Enum.TextXAlignment.Left; histLbl.Parent = histRow
				end
				local sep = Instance.new("Frame"); sep.Size = UDim2.new(1, 0, 0, 4); sep.BackgroundColor3 = Color3.fromRGB(40, 30, 0); sep.BorderSizePixel = 0; sep.LayoutOrder = order; sep.Parent = regCCScroll; order = order + 1
			end
		end

		local clearRow = Instance.new("Frame"); clearRow.Size = UDim2.new(1, 0, 0, 38); clearRow.BackgroundColor3 = C_BG; clearRow.BorderSizePixel = 0; clearRow.LayoutOrder = 9999; clearRow.Parent = regCCScroll
		local clearAllBtn = Instance.new("TextButton"); clearAllBtn.Size = UDim2.new(1, -16, 0.75, 0); clearAllBtn.Position = UDim2.new(0, 8, 0.125, 0); clearAllBtn.BackgroundColor3 = C_DARKRED; clearAllBtn.Text = "🗑 RESET ALL TRACK LIMITS LOGS"; clearAllBtn.Font = Enum.Font.GothamBlack; clearAllBtn.TextColor3 = C_WHITE; clearAllBtn.TextSize = 11; clearAllBtn.BorderSizePixel = 0; clearAllBtn.Parent = clearRow; Instance.new("UICorner", clearAllBtn).CornerRadius = UDim.new(0, 3)
		clearAllBtn.MouseButton1Click:Connect(function() for uid, _ in pairs(ccData) do ccData[uid] = { total = 0, history = {} } end; buildRegCCList() end)
	end

	function buildConfigCCList()
		for _, c in ipairs(configCCScroll:GetChildren()) do if c:IsA("Frame") or c:IsA("TextLabel") or c:IsA("TextButton") then c:Destroy() end end
		makeCCSectionHeader(configCCScroll, "⚙  TRACK LIMITS SETTINGS", 0)

		local function makeToggleRow(parent, labelText, getVal, setVal, order)
			local row = Instance.new("Frame"); row.Size = UDim2.new(1, 0, 0, 34); row.BackgroundColor3 = C_BG2; row.BorderSizePixel = 0; row.LayoutOrder = order; row.Parent = parent
			local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(0.62, 0, 1, 0); lbl.Position = UDim2.new(0, 10, 0, 0); lbl.BackgroundTransparency = 1; lbl.Text = labelText; lbl.Font = Enum.Font.GothamBold; lbl.TextColor3 = C_WHITE; lbl.TextSize = 12; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = row
			local togBtn = Instance.new("TextButton"); togBtn.Size = UDim2.new(0.33, -8, 0.65, 0); togBtn.Position = UDim2.new(0.65, 0, 0.175, 0); togBtn.BorderSizePixel = 0; togBtn.Font = Enum.Font.GothamBold; togBtn.TextSize = 11; togBtn.Parent = row; Instance.new("UICorner", togBtn).CornerRadius = UDim.new(0, 3)
			local function refresh() local v = getVal(); togBtn.BackgroundColor3 = v and Color3.fromRGB(0,120,50) or Color3.fromRGB(80,20,20); togBtn.TextColor3 = v and C_GREEN or Color3.fromRGB(255,80,80); togBtn.Text = v and "ON" or "OFF" end
			refresh(); togBtn.MouseButton1Click:Connect(function() setVal(not getVal()); refresh() end)
		end

		local function makeAdjustRow(parent, labelText, getVal, setVal, step, minV, maxV, onChange, order)
			local row = Instance.new("Frame"); row.Size = UDim2.new(1, 0, 0, 34); row.BackgroundColor3 = C_BG2; row.BorderSizePixel = 0; row.LayoutOrder = order; row.Parent = parent
			local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(0.42, 0, 1, 0); lbl.Position = UDim2.new(0, 10, 0, 0); lbl.BackgroundTransparency = 1; lbl.Text = labelText; lbl.Font = Enum.Font.GothamBold; lbl.TextColor3 = C_WHITE; lbl.TextSize = 12; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = row
			local minusBtn = Instance.new("TextButton"); minusBtn.Size = UDim2.new(0, 28, 0.7, 0); minusBtn.Position = UDim2.new(0.44, 0, 0.15, 0); minusBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 0); minusBtn.Text = "-"; minusBtn.Font = Enum.Font.GothamBlack; minusBtn.TextColor3 = C_YELLOW; minusBtn.TextSize = 16; minusBtn.BorderSizePixel = 0; minusBtn.Parent = row; Instance.new("UICorner", minusBtn).CornerRadius = UDim.new(0, 3)
			local valLbl = Instance.new("TextLabel"); valLbl.Size = UDim2.new(0.2, 0, 0.7, 0); valLbl.Position = UDim2.new(0.44, 32, 0.15, 0); valLbl.BackgroundColor3 = Color3.fromRGB(20, 20, 32); valLbl.BorderSizePixel = 0; valLbl.Text = tostring(getVal()); valLbl.Font = Enum.Font.GothamBlack; valLbl.TextColor3 = C_WHITE; valLbl.TextSize = 12; valLbl.TextXAlignment = Enum.TextXAlignment.Center; valLbl.Parent = row; Instance.new("UICorner", valLbl).CornerRadius = UDim.new(0, 3)
			local plusBtn = Instance.new("TextButton"); plusBtn.Size = UDim2.new(0, 28, 0.7, 0); plusBtn.Position = UDim2.new(0.65, 4, 0.15, 0); plusBtn.BackgroundColor3 = Color3.fromRGB(0, 70, 30); plusBtn.Text = "+"; plusBtn.Font = Enum.Font.GothamBlack; plusBtn.TextColor3 = C_GREEN; plusBtn.TextSize = 16; plusBtn.BorderSizePixel = 0; plusBtn.Parent = row; Instance.new("UICorner", plusBtn).CornerRadius = UDim.new(0, 3)
			local studsLbl = Instance.new("TextLabel"); studsLbl.Size = UDim2.new(0.28, -8, 1, 0); studsLbl.Position = UDim2.new(0.71, 0, 0, 0); studsLbl.BackgroundTransparency = 1; studsLbl.Text = "studs"; studsLbl.Font = Enum.Font.GothamBold; studsLbl.TextColor3 = Color3.fromRGB(80, 70, 40); studsLbl.TextSize = 10; studsLbl.TextXAlignment = Enum.TextXAlignment.Left; studsLbl.Parent = row
			minusBtn.MouseButton1Click:Connect(function() setVal(math.max(minV, getVal() - step)); valLbl.Text = tostring(getVal()); if onChange then onChange() end end)
			plusBtn.MouseButton1Click:Connect(function() setVal(math.min(maxV, getVal() + step)); valLbl.Text = tostring(getVal()); if onChange then onChange() end end)
		end

		makeToggleRow(configCCScroll, "Track limits detection enabled", function() return DETECTCC end, function(v) DETECTCC = v end, 1)
		makeToggleRow(configCCScroll, "👁  Show track limits waypoints", function() return SHOW_WAYPOINTS_CC end, function(v) SHOW_WAYPOINTS_CC = v; applyWPVisibilityCC() end, 2)
		makeCCSectionHeader(configCCScroll, "⏱  DEBOUNCE (seconds between detections)", 3)
		makeAdjustRow(configCCScroll, "Debounce time", function() return CCDEBOUNCETIME end, function(v) CCDEBOUNCETIME = v end, 1, 1, 30, nil, 4)
		makeCCSectionHeader(configCCScroll, "📐  DEFAULT WAYPOINT SIZE", 5)
		makeAdjustRow(configCCScroll, "Waypoint width", function() return CCWPWIDTH end, function(v) CCWPWIDTH = v end, 5, 20, 500, nil, 6)
		makeAdjustRow(configCCScroll, "Waypoint height", function() return CCWPHEIGHT end, function(v) CCWPHEIGHT = v end, 5, 10, 400, nil, 7)
		makeAdjustRow(configCCScroll, "Waypoint thickness", function() return CCWPTHICKNESS end, function(v) CCWPTHICKNESS = v end, 1, 2, 50, nil, 8)

		local notaRow = Instance.new("Frame"); notaRow.Size = UDim2.new(1, 0, 0, 28); notaRow.BackgroundColor3 = Color3.fromRGB(30, 25, 5); notaRow.BorderSizePixel = 0; notaRow.LayoutOrder = 9; notaRow.Parent = configCCScroll
		local notaLbl = Instance.new("TextLabel"); notaLbl.Size = UDim2.new(1, -12, 1, 0); notaLbl.Position = UDim2.new(0, 10, 0, 0); notaLbl.BackgroundTransparency = 1; notaLbl.Text = "ℹ  Size values apply to new waypoints"; notaLbl.Font = Enum.Font.GothamBold; notaLbl.TextColor3 = Color3.fromRGB(140, 120, 50); notaLbl.TextSize = 10; notaLbl.TextXAlignment = Enum.TextXAlignment.Left; notaLbl.Parent = notaRow
	end

	for _, btn in pairs(tabButtons) do
		btn.MouseButton1Click:Connect(function()
			currentCCTab = btn.Text
			for name, f in pairs(tabFrames) do
				local isActive = (name == currentCCTab)
				f.Visible = isActive
				tabButtons[name].BackgroundColor3 = isActive and CCWPCOLOR or C_BG2
				tabButtons[name].TextColor3 = isActive and Color3.fromRGB(0,0,0) or C_GRAY
				local ind = tabButtons[name]:FindFirstChild("Indicator")
				if ind then ind.BackgroundColor3 = isActive and CCWPCOLOR or C_BG2 end
			end
			if currentCCTab == "WP CC" then buildWpCCList() elseif currentCCTab == "REGISTROS CC" then buildRegCCList() elseif currentCCTab == "CONFIG CC" then buildConfigCCList() end
		end)
	end

	ccBtn.MouseButton1Click:Connect(function()
		ccPanel.Visible = not ccPanel.Visible
		if ccPanel.Visible then
			if currentCCTab == "WP CC" then buildWpCCList() elseif currentCCTab == "REGISTROS CC" then buildRegCCList() elseif currentCCTab == "CONFIG CC" then buildConfigCCList() end
		end
	end)

	closeBtn.MouseButton1Click:Connect(function() ccPanel.Visible = false end)

	task.spawn(function()
		while true do
			task.wait(1)
			if ccPanel.Visible and currentCCTab == "REGISTROS CC" then buildRegCCList() end
		end
	end)

	buildWpCCList()
end

SPA_INIT.ccUiOk = _spaInitStage("CC_UI", _setupCCUI, { "UI2" })

-- ════════════════════════════════════════════════════════════════
-- ███  _setupTireSystem — TIRES tab + compound detection  █████
-- ════════════════════════════════════════════════════════════════
function _setupTireSystem()
	local tireFrame = tabFrames["LLANTAS"]
	if not tireFrame then return end

	-- ── Main scroll area ────────────────────────────────────────
	local tireScroll = Instance.new("ScrollingFrame")
	tireScroll.Size                 = UDim2.new(1, 0, 1, 0)
	tireScroll.BackgroundColor3     = C_BG
	tireScroll.BorderSizePixel      = 0
	tireScroll.CanvasSize           = UDim2.new(0, 0, 0, 0)
	tireScroll.ScrollingDirection   = Enum.ScrollingDirection.Y
	tireScroll.ScrollBarThickness   = 10
	tireScroll.ScrollBarImageColor3 = C_ORANGE
	tireScroll.ElasticBehavior      = Enum.ElasticBehavior.Always
	tireScroll.Parent               = tireFrame

	local tireLayout = Instance.new("UIListLayout")
	tireLayout.Padding   = UDim.new(0, 2)
	tireLayout.SortOrder = Enum.SortOrder.LayoutOrder
	tireLayout.Parent    = tireScroll

	local function _syncTire()
		tireScroll.CanvasSize = UDim2.new(0, 0, 0, tireLayout.AbsoluteContentSize.Y + 24)
	end
	tireLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(_syncTire)
	task.defer(_syncTire)

	-- ── Visual order of compounds in the selector ──────────────
	local TIRE_ORDER = { "SUPERSOFT", "SOFT", "MEDIUM", "HARD", "INTERMEDIATE", "FULL WET" }
	local tireByName = {}
	for id, cpd in pairs(SPA_Tires.COMPOUNDS) do tireByName[cpd.name] = cpd end

	-- ── UI rebuild ──────────────────────────────────────────────
	local function rebuildTireUI()
		for _, c in ipairs(tireScroll:GetChildren()) do
			if not c:IsA("UIListLayout") then c:Destroy() end
		end

		-- Section: current status ────────────────────────────────────
		local hdrCur = Instance.new("Frame")
		hdrCur.Size = UDim2.new(1, 0, 0, 22); hdrCur.BackgroundColor3 = Color3.fromRGB(0, 40, 80)
		hdrCur.BorderSizePixel = 0; hdrCur.LayoutOrder = 0; hdrCur.Parent = tireScroll
		local hdrCurLbl = Instance.new("TextLabel")
		hdrCurLbl.Size = UDim2.new(1, -12, 1, 0); hdrCurLbl.Position = UDim2.new(0, 10, 0, 0)
		hdrCurLbl.BackgroundTransparency = 1; hdrCurLbl.Text = "🏎  CURRENT TIRE COMPOUND BY DRIVER"
		hdrCurLbl.Font = Enum.Font.GothamBlack; hdrCurLbl.TextColor3 = Color3.fromRGB(100, 180, 255)
		hdrCurLbl.TextSize = 11; hdrCurLbl.TextXAlignment = Enum.TextXAlignment.Left; hdrCurLbl.Parent = hdrCur

		local allPl = Players:GetPlayers()
		for i, p in ipairs(allPl) do
			local uid    = p.UserId
			local cur    = SPA_Tires.current[uid]
			local inPit  = pitData[uid] and pitData[uid].status == "En Boxes"

			local row = Instance.new("Frame")
			row.Size = UDim2.new(1, 0, 0, 44); row.BackgroundColor3 = i%2==0 and C_BG2 or C_BG
			row.BackgroundTransparency = 0.1; row.BorderSizePixel = 0; row.LayoutOrder = i; row.Parent = tireScroll

			local sideBar = Instance.new("Frame")
			sideBar.Size = UDim2.new(0, 4, 1, 0); sideBar.BackgroundColor3 = cur and cur.color or C_GRAY
			sideBar.BorderSizePixel = 0; sideBar.Parent = row

			local nameLbl = Instance.new("TextLabel")
			nameLbl.Size = UDim2.new(0.34, 0, 1, 0); nameLbl.Position = UDim2.new(0, 14, 0, 0)
			nameLbl.BackgroundTransparency = 1; nameLbl.Text = getDisplayName(p)
			nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextColor3 = getNameColor(p)
			nameLbl.TextSize = 12; nameLbl.TextXAlignment = Enum.TextXAlignment.Left; nameLbl.Parent = row

			local pitLbl = Instance.new("TextLabel")
			pitLbl.Size = UDim2.new(0.18, 0, 1, 0); pitLbl.Position = UDim2.new(0.34, 0, 0, 0)
			pitLbl.BackgroundTransparency = 1; pitLbl.Text = inPit and "🔧 PIT" or "🏁 TRACK"
			pitLbl.Font = Enum.Font.GothamBold; pitLbl.TextColor3 = inPit and C_ORANGE or C_GREEN
			pitLbl.TextSize = 11; pitLbl.TextXAlignment = Enum.TextXAlignment.Center; pitLbl.Parent = row

			local cpIcon = Instance.new("TextLabel")
			cpIcon.Size = UDim2.new(0, 22, 1, 0); cpIcon.Position = UDim2.new(0.52, 0, 0, 0)
			cpIcon.BackgroundTransparency = 1; cpIcon.Text = cur and cur.icon or "❓"
			cpIcon.Font = Enum.Font.GothamBold; cpIcon.TextScaled = true; cpIcon.Parent = row

			local cpLbl = Instance.new("TextLabel")
			cpLbl.Size = UDim2.new(0.25, 0, 1, 0); cpLbl.Position = UDim2.new(0.57, 0, 0, 0)
			cpLbl.BackgroundTransparency = 1; cpLbl.Text = cur and cur.name or "NO DATA"
			cpLbl.Font = Enum.Font.GothamBlack; cpLbl.TextColor3 = cur and cur.color or C_GRAY
			cpLbl.TextSize = 12; cpLbl.TextXAlignment = Enum.TextXAlignment.Left; cpLbl.Parent = row

			-- SET button (in pits only): open the compound selector
			if inPit then
				local setBtn = Instance.new("TextButton")
				setBtn.Size = UDim2.new(0.12, -4, 0.7, 0); setBtn.Position = UDim2.new(0.87, 0, 0.15, 0)
				setBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 160); setBtn.Text = "SET"
				setBtn.Font = Enum.Font.GothamBold; setBtn.TextColor3 = C_WHITE
				setBtn.TextSize = 10; setBtn.BorderSizePixel = 0; setBtn.Parent = row
				Instance.new("UICorner", setBtn).CornerRadius = UDim.new(0, 3)

				local captP, captUid = p, uid
				setBtn.MouseButton1Click:Connect(function()
					-- Destroy the previous selector if one exists
					local prev = tireFrame:FindFirstChild("TireSel_"..captUid)
					if prev then prev:Destroy(); return end

					local sel = Instance.new("Frame")
					sel.Name = "TireSel_"..captUid
					sel.Size = UDim2.new(0, 220, 0, 30 + #TIRE_ORDER * 34)
					sel.Position = UDim2.new(0.5, -110, 0, 48)
					sel.BackgroundColor3 = C_BG2; sel.BackgroundTransparency = 0.05
					sel.BorderSizePixel = 0; sel.ZIndex = 20; sel.Parent = tireFrame
					Instance.new("UICorner", sel).CornerRadius = UDim.new(0, 8)
					Glass.registerModal(sel)

					local selHdr = Instance.new("TextLabel")
					selHdr.Size = UDim2.new(1, 0, 0, 28); selHdr.BackgroundColor3 = C_RED
					selHdr.BackgroundTransparency = 0; selHdr.BorderSizePixel = 0
					selHdr.Text = "🔧 TIRE CHANGE — " .. getDisplayName(captP)
					selHdr.Font = Enum.Font.GothamBold; selHdr.TextColor3 = C_WHITE
					selHdr.TextSize = 10; selHdr.ZIndex = 21; selHdr.Parent = sel
					Instance.new("UICorner", selHdr).CornerRadius = UDim.new(0, 8)

					for idx, cname in ipairs(TIRE_ORDER) do
						local cpd = tireByName[cname]
						if not cpd then continue end
						local btn2 = Instance.new("TextButton")
						btn2.Size = UDim2.new(1, 0, 0, 32)
						btn2.Position = UDim2.new(0, 0, 0, 28 + (idx-1)*34)
						btn2.BackgroundColor3 = cpd.color; btn2.BackgroundTransparency = 0.75
						btn2.Text = cpd.icon .. "  " .. cpd.name
						btn2.Font = Enum.Font.GothamBlack; btn2.TextColor3 = cpd.color
						btn2.TextSize = 12; btn2.BorderSizePixel = 0; btn2.ZIndex = 21; btn2.Parent = sel

						local captCpd = cpd
						btn2.MouseButton1Click:Connect(function()
							local oldCpd = SPA_Tires.current[captUid]
							if not oldCpd or oldCpd.name ~= captCpd.name then
								SPA_Tires.current[captUid] = captCpd
								local isInPit = pitData[captUid] and pitData[captUid].status == "En Boxes"
								_tirLogChange(captP, oldCpd, captCpd, isInPit)
							end
							sel:Destroy()
						end)
					end

					local closeSelBtn = Instance.new("TextButton")
					closeSelBtn.Size = UDim2.new(0, 22, 0, 22)
					closeSelBtn.Position = UDim2.new(1, -24, 0, 3)
					closeSelBtn.BackgroundColor3 = C_DARKRED; closeSelBtn.Text = "✕"
					closeSelBtn.Font = Enum.Font.GothamBold; closeSelBtn.TextColor3 = C_WHITE
					closeSelBtn.TextSize = 11; closeSelBtn.BorderSizePixel = 0
					closeSelBtn.ZIndex = 22; closeSelBtn.Parent = sel
					Instance.new("UICorner", closeSelBtn).CornerRadius = UDim.new(0, 4)
					closeSelBtn.MouseButton1Click:Connect(function() sel:Destroy() end)
				end)
			end
		end

		-- Section: history ───────────────────────────────────────────
		local hdrHist = Instance.new("Frame")
		hdrHist.Size = UDim2.new(1, 0, 0, 22); hdrHist.BackgroundColor3 = Color3.fromRGB(60, 35, 0)
		hdrHist.BorderSizePixel = 0; hdrHist.LayoutOrder = 100; hdrHist.Parent = tireScroll
		local hdrHistLbl = Instance.new("TextLabel")
		hdrHistLbl.Size = UDim2.new(1, -12, 1, 0); hdrHistLbl.Position = UDim2.new(0, 10, 0, 0)
		hdrHistLbl.BackgroundTransparency = 1
		hdrHistLbl.Text = "📋  CHANGE HISTORY (" .. #SPA_Tires.log .. ")"
		hdrHistLbl.Font = Enum.Font.GothamBlack; hdrHistLbl.TextColor3 = C_ORANGE
		hdrHistLbl.TextSize = 11; hdrHistLbl.TextXAlignment = Enum.TextXAlignment.Left; hdrHistLbl.Parent = hdrHist

		if #SPA_Tires.log == 0 then
			local noHist = Instance.new("TextLabel")
			noHist.Size = UDim2.new(1, 0, 0, 40); noHist.BackgroundTransparency = 1
			noHist.Text = "No changes recorded yet"; noHist.Font = Enum.Font.GothamBold
			noHist.TextColor3 = C_GRAY; noHist.TextSize = 12; noHist.LayoutOrder = 101; noHist.Parent = tireScroll
		end

		for idx, entry in ipairs(SPA_Tires.log) do
			local card = Instance.new("Frame")
			card.Size = UDim2.new(1, 0, 0, 54)
			card.BackgroundColor3 = idx%2==0 and C_BG2 or C_BG
			card.BackgroundTransparency = 0.12; card.BorderSizePixel = 0
			card.LayoutOrder = 100 + idx; card.Parent = tireScroll

			local bar = Instance.new("Frame")
			bar.Size = UDim2.new(0, 4, 1, 0); bar.BackgroundColor3 = entry.newColor
			bar.BorderSizePixel = 0; bar.Parent = card

			local timeLbl = Instance.new("TextLabel")
			timeLbl.Size = UDim2.new(0, 58, 0, 18); timeLbl.Position = UDim2.new(0, 10, 0, 4)
			timeLbl.BackgroundTransparency = 1; timeLbl.Text = entry.time
			timeLbl.Font = Enum.Font.GothamBold; timeLbl.TextColor3 = C_GRAY
			timeLbl.TextSize = 10; timeLbl.TextXAlignment = Enum.TextXAlignment.Left; timeLbl.Parent = card

			local locBg = Instance.new("Frame")
			locBg.Size = UDim2.new(0, 54, 0, 16); locBg.Position = UDim2.new(0, 70, 0, 5)
			locBg.BackgroundColor3 = entry.inPit and Color3.fromRGB(40,25,0) or Color3.fromRGB(0,35,15)
			locBg.BorderSizePixel = 0; locBg.Parent = card
			Instance.new("UICorner", locBg).CornerRadius = UDim.new(0, 4)
			local locLbl = Instance.new("TextLabel")
			locLbl.Size = UDim2.new(1, 0, 1, 0); locLbl.BackgroundTransparency = 1
			locLbl.Text = entry.inPit and "🔧 PIT" or "🏁 TRACK"
			locLbl.Font = Enum.Font.GothamBold; locLbl.TextColor3 = entry.inPit and C_ORANGE or C_GREEN
			locLbl.TextSize = 9; locLbl.Parent = locBg

			local lapBadge = Instance.new("TextLabel")
			lapBadge.Size = UDim2.new(0, 46, 0, 16); lapBadge.Position = UDim2.new(0, 126, 0, 5)
			lapBadge.BackgroundTransparency = 1; lapBadge.Text = "LAP " .. entry.lap
			lapBadge.Font = Enum.Font.GothamBold; lapBadge.TextColor3 = C_GRAY
			lapBadge.TextSize = 9; lapBadge.TextXAlignment = Enum.TextXAlignment.Left; lapBadge.Parent = card

			local nameLbl2 = Instance.new("TextLabel")
			nameLbl2.Size = UDim2.new(0.45, 0, 0, 18); nameLbl2.Position = UDim2.new(0, 10, 0, 24)
			nameLbl2.BackgroundTransparency = 1; nameLbl2.Text = "👤 " .. entry.name
			nameLbl2.Font = Enum.Font.GothamBold; nameLbl2.TextColor3 = C_WHITE
			nameLbl2.TextSize = 11; nameLbl2.TextXAlignment = Enum.TextXAlignment.Left; nameLbl2.Parent = card

			local changeLbl = Instance.new("TextLabel")
			changeLbl.Size = UDim2.new(0.52, -8, 0, 18); changeLbl.Position = UDim2.new(0.47, 0, 0, 24)
			changeLbl.BackgroundTransparency = 1
			changeLbl.Text = entry.oldIcon .. " " .. entry.oldName .. "  →  " .. entry.newIcon .. " " .. entry.newName
			changeLbl.Font = Enum.Font.GothamBold; changeLbl.TextColor3 = entry.newColor
			changeLbl.TextSize = 11; changeLbl.TextXAlignment = Enum.TextXAlignment.Right
			changeLbl.TextTruncate = Enum.TextTruncate.AtEnd; changeLbl.Parent = card
			local rp = Instance.new("UIPadding"); rp.PaddingRight = UDim.new(0, 8); rp.Parent = card
		end

		-- Clear history button
		local clrRow = Instance.new("Frame")
		clrRow.Size = UDim2.new(1, 0, 0, 36); clrRow.BackgroundColor3 = C_BG
		clrRow.BackgroundTransparency = 0.1; clrRow.BorderSizePixel = 0
		clrRow.LayoutOrder = 9999; clrRow.Parent = tireScroll
		local clrBtn = Instance.new("TextButton")
		clrBtn.Size = UDim2.new(1, -16, 0.75, 0); clrBtn.Position = UDim2.new(0, 8, 0.125, 0)
		clrBtn.BackgroundColor3 = C_DARKRED; clrBtn.Text = "🗑  CLEAR TIRE HISTORY"
		clrBtn.Font = Enum.Font.GothamBlack; clrBtn.TextColor3 = C_WHITE
		clrBtn.TextSize = 11; clrBtn.BorderSizePixel = 0; clrBtn.Parent = clrRow
		Instance.new("UICorner", clrBtn).CornerRadius = UDim.new(0, 3)
		clrBtn.MouseButton1Click:Connect(function() SPA_Tires.log = {}; rebuildTireUI() end)

		_syncTire()
	end

	SPA_Tires.rebuildFn = rebuildTireUI

	-- ── Heartbeat: automatic compound detection ────────────────
	-- Read each driver's active VehicleSeat approximately every 0.5 s.
	-- Log a recognized compound when it differs from the recorded one.
	local _tTire = 0
	RunService.Heartbeat:Connect(function(dt)
		_tTire += dt
		if _tTire < 0.5 then return end
		_tTire = 0
		for _, p in ipairs(Players:GetPlayers()) do
			local uid  = p.UserId
			if FIA_EXCLUDED[uid] then continue end
			local char = p.Character
			if not char then continue end
			local hum  = char:FindFirstChildOfClass("Humanoid")
			if not hum then continue end
			local seat = hum.SeatPart
			if not seat or not (seat:IsA("VehicleSeat") or seat:IsA("Seat")) or seat.Occupant ~= hum then continue end
			local cpd = _tirGetCompound(seat)
			if not cpd then continue end   -- Unknown ID → ignore
			local prev = SPA_Tires.current[uid]
			if not prev or prev.name ~= cpd.name then
				-- [SPAM FIX] Do not notify immediately: wait until the driver
				-- has used the same compound for STABLE_TIME seconds to avoid
				-- spam while passing through intermediate compounds.
				local st = SPA_Tires._stableTimer[uid]
				if not st or st.cpd ~= cpd.name then
					-- New or changed compound: restart the timer
					SPA_Tires._stableTimer[uid] = { cpd = cpd.name, since = tick() }
				else
					-- Same compound: check whether STABLE_TIME has elapsed
					if tick() - st.since >= SPA_Tires.STABLE_TIME then
						-- Stable → record and notify ONCE
						SPA_Tires.current[uid] = cpd
						SPA_Tires._stableTimer[uid] = nil
						local isInPit = pitData[uid] and pitData[uid].status == "En Boxes"
						_tirLogChange(p, prev, cpd, isInPit)
					end
				end
			else
				-- Same compound as recorded → clear the pending timer
				SPA_Tires._stableTimer[uid] = nil
			end
		end
	end)

	-- Clean up state on departure
	Players.PlayerRemoving:Connect(function(pl)
		SPA_Tires.current[pl.UserId] = nil
		SPA_Tires._stableTimer[pl.UserId] = nil  -- [SPAM FIX] Clear the timer
		_telStopDrift(pl.UserId)                 -- [DRIFT FIX] Clear the friction monitor
	end)

	rebuildTireUI()

	-- Periodic updates while the tab is visible
	task.spawn(function()
		while tireFrame.Parent do
			task.wait(1)
			if tireFrame.Visible then rebuildTireUI() end
		end
	end)
end
SPA_INIT.tiresOk = _spaInitStage("TIRES", _setupTireSystem, { "UI2" })

-- ███ Apply the iOS Glassmorphism interface to ALL GUIs ███████
SPA_INIT.glassOk = _spaInitStage("GLASS_APPLY", Glass and Glass.apply, { "UI1", "UI2", "CC_UI", "TIRES", "LAPS CONTROL" })
SPA_INIT.ready = SPA_INIT.ui1Ok and SPA_INIT.ui2Ok and SPA_INIT.collisionOk and SPA_INIT.analysisOk and SPA_INIT.replayOk and SPA_INIT.ccUiOk and SPA_INIT.tiresOk and SPA_INIT.glassOk and SPA_INIT.audioOk and SPA_INIT.noclipOk and SPA_INIT.lapsControlOk and not SPA_INIT.criticalFailed
if SPA_INIT.ready then
	print("✅ SPA-GLOBAL-IDIM-ENGLISH — RACE CONTROL SYSTEM (Unified)")
	print("🏁 Native track limits monitoring integrated without memory leaks")
	print("🍏 SPA-GLOBAL-IDIM-ENGLISH — iOS Glassmorphism interface applied (frosted glass + blur)")
else
	warn("[SPA-GLOBAL-IDIM-ENGLISH INIT INCOMPLETE] SPA-GLOBAL-IDIM-ENGLISH was not marked as ready; check the failed stages.")
end
