-- =====================================================
-- SPA-CONTROL HUB v4 | F1 2025 Style | LocalScript
-- v4: flecha ABAJO = mirar atrás al instante (cámara onboard)
-- Pon este script en StarterPlayerScripts
-- =====================================================

local Players              = game:GetService("Players")
local RunService           = game:GetService("RunService")
local TweenService         = game:GetService("TweenService")
local ContextActionService = game:GetService("ContextActionService")
local UserInputService     = game:GetService("UserInputService")
local Workspace            = game:GetService("Workspace")

local player    = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local CAMERA    = Workspace.CurrentCamera

-- =====================================================
-- COLORES GLOBALES
-- =====================================================
local HC = {
	accent     = Color3.fromRGB(230, 0, 0),
	darkAccent = Color3.fromRGB(100, 0, 0),
	bg         = Color3.fromRGB(8, 8, 12),
	bg2        = Color3.fromRGB(18, 18, 24),
	white      = Color3.fromRGB(255, 255, 255),
	gray       = Color3.fromRGB(120, 120, 130),
	yellow     = Color3.fromRGB(255, 200, 0),
	green      = Color3.fromRGB(0, 210, 90),
}

-- =====================================================
-- VARIABLES DEL DETECTOR (sistema original)
-- =====================================================
local CAL_FACTOR         = 0.6437
local CAL_OFFSET         = 0
local masterSpeedLimit   = 70
local alertedPlayers     = {}
local speedHistory       = {}
local showTags           = true

-- =====================================================
-- VARIABLES PANEL
-- =====================================================
local isOpen     = false
local currentTab = "ONBOARD"

-- Cámara Onboard
local onboardEnabled = false
local onboardChar    = nil

-- =====================================================
-- HELPERS UI
-- =====================================================
local function corner(parent, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 4)
	c.Parent = parent
end

local function padLeft(parent, v)
	local p = Instance.new("UIPadding")
	p.PaddingLeft = UDim.new(0, v)
	p.Parent = parent
end

-- =====================================================
-- FUNCIONES VELOCÍMETRO (sistema original)
-- =====================================================
local function createSpeedTag(character, plr)
	local head = character:FindFirstChild("Head")
	if not head then return end
	if head:FindFirstChild("SpeedTag") then return head.SpeedTag end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "SpeedTag"
	billboard.Size = UDim2.new(0, 150, 0, 35)
	billboard.StudsOffset = Vector3.new(0, 3, 0)
	billboard.AlwaysOnTop = true
	billboard.MaxDistance = math.huge
	billboard.Adornee = head
	billboard.Parent = head

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Name = "NameLabel"
	nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
	nameLabel.BackgroundTransparency = 1
	nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	nameLabel.TextStrokeTransparency = 0
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.TextScaled = true
	nameLabel.Text = plr.DisplayName
	nameLabel.Parent = billboard

	local speedLabel = Instance.new("TextLabel")
	speedLabel.Name = "SpeedText"
	speedLabel.Size = UDim2.new(1, 0, 0.5, 0)
	speedLabel.Position = UDim2.new(0, 0, 0.5, 0)
	speedLabel.BackgroundTransparency = 1
	speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	speedLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	speedLabel.TextStrokeTransparency = 0
	speedLabel.Font = Enum.Font.GothamBold
	speedLabel.TextScaled = false
	speedLabel.Text = ""
	speedLabel.Parent = billboard

	return billboard
end

local function removeSpeedTag(character)
	local head = character:FindFirstChild("Head")
	if head then
		local tag = head:FindFirstChild("SpeedTag")
		if tag then tag:Destroy() end
	end
end

local function toSpeedDisplay(studs)
	return math.floor(studs * 0.28 * 3.6 * CAL_FACTOR + CAL_OFFSET + 0.5)
end

local function getVehicleSpeed(seat)
	if not seat then return 0 end
	local ok, mag = pcall(function()
		if seat.AssemblyLinearVelocity then
			return seat.AssemblyLinearVelocity.Magnitude
		else
			return seat.Velocity.Magnitude
		end
	end)
	if ok and mag then return mag else return 0 end
end

local function getPlayerSpeedLimit(seat)
	for _, v in pairs(seat:GetChildren()) do
		if v:IsA("NumberValue") and (v.Name:lower():find("speed") or v.Name:lower():find("limit")) then
			return math.floor(v.Value * 10 + 0.5) / 10
		end
	end
	return 0
end

-- =====================================================
-- MOTOR Y DERRAPE (solo jugador local sentado)
-- =====================================================
local ENGINE_SOUND_ID = "rbxassetid://131453640492630"
local DRIFT_MIN_SPEED = 18
local DRIFT_MIN_LATERAL_SPEED = 5
local MAX_DRIFT_WHEELS = 8
local activeEffectsSeat, activeEngineSound = nil, nil
local activeDriftAttachments, activeDriftEmitters = {}, {}
local replacedEngineState = nil
local createdEngineSound = false
local WHEEL_NAME_HINTS = {"wheel", "tire", "tyre", "llanta", "rueda", "neumatico", "neumático"}
local ENGINE_NAME_HINTS = {"engine", "motor", "idle", "rev", "rpm", "drive", "car"}

local function isWheelPart(instance)
	if not instance:IsA("BasePart") then return false end
	local name = instance.Name:lower()
	for _, hint in ipairs(WHEEL_NAME_HINTS) do
		if name:find(hint, 1, true) then return true end
	end
	return false
end

local function findVehicleModel(seat)
	local model = seat:FindFirstAncestorOfClass("Model")
	if not model then return nil end
	local fallback = model
	for _ = 1, 4 do
		for _, descendant in ipairs(model:GetDescendants()) do
			if isWheelPart(descendant) then return model end
		end
		if not model.Parent or not model.Parent:IsA("Model") then break end
		model = model.Parent
	end
	return fallback
end

local function findVehicleWheels(seat)
	local model = findVehicleModel(seat)
	if not model then return {} end
	local wheels = {}
	for _, descendant in ipairs(model:GetDescendants()) do
		if isWheelPart(descendant) then
			table.insert(wheels, descendant)
			if #wheels >= MAX_DRIFT_WHEELS then break end
		end
	end
	if #wheels == 0 then
		for _, descendant in ipairs(model:GetDescendants()) do
			if descendant:IsA("Part") and descendant.Shape == Enum.PartType.Cylinder then
				local side = math.max(descendant.Size.X, descendant.Size.Y, descendant.Size.Z)
				if side >= 1 and side <= 8 and descendant.Position.Y <= seat.Position.Y + 2 then
					table.insert(wheels, descendant)
					if #wheels >= MAX_DRIFT_WHEELS then break end
				end
			end
		end
	end
	return wheels
end

local function findBodyContainer(vehicleModel)
	if not vehicleModel then return nil, false end
	local bodyHints = {body = true, carbody = true, chassis = true, carroceria = true, ["carrocería"] = true}
	for _, descendant in ipairs(vehicleModel:GetDescendants()) do
		if (descendant:IsA("Model") or descendant:IsA("BasePart"))
			and bodyHints[descendant.Name:lower():gsub("[%s_%-]", "")] then
			return descendant, true
		end
	end
	return vehicleModel, false
end

local function findSoundParent(container, seat)
	if container and container:IsA("BasePart") then return container end
	if container and container:IsA("Model") then
		if container.PrimaryPart then return container.PrimaryPart end
		local part = container:FindFirstChildWhichIsA("BasePart", true)
		if part then return part end
	end
	return seat
end

local function findEngineSound(container, allowAnySound)
	if not container then return nil end
	local fallback = nil
	for _, descendant in ipairs(container:GetDescendants()) do
		if descendant:IsA("Sound") then
			fallback = fallback or descendant
			local lowerName = descendant.Name:lower()
			for _, hint in ipairs(ENGINE_NAME_HINTS) do
				if lowerName:find(hint, 1, true) then return descendant end
			end
		end
	end
	return allowAnySound and fallback or nil
end

local function clearVehicleEffects()
	for _, emitter in ipairs(activeDriftEmitters) do
		if emitter.Parent then emitter.Enabled = false; emitter:Clear() end
	end
	for _, attachment in ipairs(activeDriftAttachments) do
		if attachment.Parent then attachment:Destroy() end
	end
	table.clear(activeDriftEmitters)
	table.clear(activeDriftAttachments)
	if activeEngineSound then
		activeEngineSound:Stop()
		if replacedEngineState and replacedEngineState.sound == activeEngineSound and activeEngineSound.Parent then
			activeEngineSound.SoundId = replacedEngineState.soundId
			activeEngineSound.Looped = replacedEngineState.looped
			activeEngineSound.Volume = replacedEngineState.volume
			activeEngineSound.PlaybackSpeed = replacedEngineState.playbackSpeed
			activeEngineSound.RollOffMode = replacedEngineState.rollOffMode
			activeEngineSound.RollOffMinDistance = replacedEngineState.rollOffMinDistance
			activeEngineSound.RollOffMaxDistance = replacedEngineState.rollOffMaxDistance
			if replacedEngineState.wasPlaying then activeEngineSound:Play() end
		elseif createdEngineSound then
			activeEngineSound:Destroy()
		end
		activeEngineSound = nil
	end
	replacedEngineState = nil
	createdEngineSound = false
	activeEffectsSeat = nil
end

local function createDriftEmitter(wheel)
	local attachment = Instance.new("Attachment")
	attachment.Name = "SPA_DriftAttachment"
	local radius = math.max(wheel.Size.X, wheel.Size.Y, wheel.Size.Z) * 0.5
	attachment.Position = wheel.CFrame:PointToObjectSpace(wheel.Position - Vector3.new(0, radius, 0))
	attachment.Parent = wheel
	local emitter = Instance.new("ParticleEmitter")
	emitter.Name = "SPA_DriftSmoke"
	emitter.Texture = "rbxasset://textures/particles/smoke_main.dds"
	emitter.Enabled = false
	emitter.Rate = 0
	emitter.Lifetime = NumberRange.new(0.35, 0.8)
	emitter.Speed = NumberRange.new(1, 4)
	emitter.Drag = 2
	emitter.Acceleration = Vector3.new(0, 4, 0)
	emitter.SpreadAngle = Vector2.new(35, 35)
	emitter.Rotation = NumberRange.new(0, 360)
	emitter.RotSpeed = NumberRange.new(-70, 70)
	emitter.Color = ColorSequence.new(Color3.fromRGB(210, 210, 210), Color3.fromRGB(95, 95, 95))
	emitter.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(0.7, 0.55), NumberSequenceKeypoint.new(1, 1),
	})
	emitter.Size = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(0.55, 1.2), NumberSequenceKeypoint.new(1, 2.1),
	})
	emitter.VelocityInheritance = 0.2
	emitter.Parent = attachment
	table.insert(activeDriftAttachments, attachment)
	table.insert(activeDriftEmitters, emitter)
end

local function startVehicleEffects(seat)
	clearVehicleEffects()
	activeEffectsSeat = seat
	local vehicleModel = findVehicleModel(seat)
	local bodyContainer, isRealBody = findBodyContainer(vehicleModel)
	local soundParent = findSoundParent(bodyContainer, seat)
	local sound = findEngineSound(bodyContainer, isRealBody)
	if sound then
		replacedEngineState = {
			sound = sound,
			soundId = sound.SoundId,
			looped = sound.Looped,
			volume = sound.Volume,
			playbackSpeed = sound.PlaybackSpeed,
			rollOffMode = sound.RollOffMode,
			rollOffMinDistance = sound.RollOffMinDistance,
			rollOffMaxDistance = sound.RollOffMaxDistance,
			wasPlaying = sound.IsPlaying,
		}
		sound:Stop()
	else
		sound = Instance.new("Sound")
		sound.Name = "SPA_LocalEngineSound"
		sound.Parent = soundParent
		createdEngineSound = true
	end
	sound.SoundId = ENGINE_SOUND_ID
	sound.Looped = true
	sound.Volume = 1
	sound.PlaybackSpeed = 0
	sound.RollOffMode = Enum.RollOffMode.InverseTapered
	sound.RollOffMinDistance = 8
	sound.RollOffMaxDistance = 120
	sound:Play()
	activeEngineSound = sound
	for _, wheel in ipairs(findVehicleWheels(seat)) do createDriftEmitter(wheel) end
end

local function updateVehicleEffects(deltaTime)
	local seat = activeEffectsSeat
	if not seat or not seat.Parent then clearVehicleEffects(); return end
	local velocity = seat.AssemblyLinearVelocity
	local speed = velocity.Magnitude
	local lateralSpeed = math.abs(seat.CFrame:VectorToObjectSpace(velocity).X)
	local steer = seat:IsA("VehicleSeat") and math.abs(seat.SteerFloat) or 0
	local throttle = seat:IsA("VehicleSeat") and math.abs(seat.ThrottleFloat) or 0
	if activeEngineSound then
		local targetSpeed = math.clamp(0.72 + speed / 115 + throttle * 0.22, 0.72, 1.85)
		local targetVolume = math.clamp(0.26 + speed / 180 + throttle * 0.12, 0.26, 0.9)
		local blend = math.clamp(deltaTime * 5, 0, 1)
		activeEngineSound.PlaybackSpeed += (targetSpeed - activeEngineSound.PlaybackSpeed) * blend
		activeEngineSound.Volume += (targetVolume - activeEngineSound.Volume) * blend
	end
	local drifting = speed >= DRIFT_MIN_SPEED
		and ((steer >= 0.6 and speed >= 26) or lateralSpeed >= DRIFT_MIN_LATERAL_SPEED)
	local intensity = math.clamp(math.max(lateralSpeed / 18, steer * speed / 65), 0, 1)
	for _, emitter in ipairs(activeDriftEmitters) do
		emitter.Enabled = drifting
		emitter.Rate = drifting and (12 + 55 * intensity) or 0
	end
end

-- =====================================================
-- RADAR DE PROXIMIDAD ESTILO ASSETTO CORSA
-- =====================================================
local RADAR_RANGE = 120
local RADAR_RADIUS = 76
local radarBlips = {}
local radarAccumulator = 0

local previousRadar = playerGui:FindFirstChild("SPA_PROXIMITY_RADAR")
if previousRadar then previousRadar:Destroy() end

local radarGui = Instance.new("ScreenGui")
radarGui.Name = "SPA_PROXIMITY_RADAR"
radarGui.ResetOnSpawn = false
radarGui.IgnoreGuiInset = true
radarGui.DisplayOrder = 120
radarGui.Parent = playerGui

local radarPanel = Instance.new("Frame")
radarPanel.Size = UDim2.new(0, 190, 0, 210)
radarPanel.Position = UDim2.new(0.5, -95, 1, -225)
radarPanel.BackgroundColor3 = Color3.fromRGB(7, 9, 13)
radarPanel.BackgroundTransparency = 0.18
radarPanel.BorderSizePixel = 0
radarPanel.Visible = false
radarPanel.Parent = radarGui
corner(radarPanel, 8)

local radarStroke = Instance.new("UIStroke")
radarStroke.Color = Color3.fromRGB(95, 105, 120)
radarStroke.Transparency = 0.25
radarStroke.Thickness = 1.5
radarStroke.Parent = radarPanel

local radarTitle = Instance.new("TextLabel")
radarTitle.Size = UDim2.new(1, -12, 0, 24)
radarTitle.Position = UDim2.new(0, 6, 0, 2)
radarTitle.BackgroundTransparency = 1
radarTitle.Text = "PROXIMITY RADAR"
radarTitle.Font = Enum.Font.GothamBlack
radarTitle.TextColor3 = Color3.fromRGB(210, 215, 225)
radarTitle.TextSize = 11
radarTitle.Parent = radarPanel

local radarArea = Instance.new("Frame")
radarArea.Size = UDim2.new(0, 170, 0, 170)
radarArea.Position = UDim2.new(0, 10, 0, 27)
radarArea.BackgroundColor3 = Color3.fromRGB(14, 17, 22)
radarArea.BackgroundTransparency = 0.12
radarArea.BorderSizePixel = 0
radarArea.ClipsDescendants = true
radarArea.Parent = radarPanel
corner(radarArea, 6)

local function makeRadarLine(size, position)
	local line = Instance.new("Frame")
	line.Size = size
	line.Position = position
	line.BackgroundColor3 = Color3.fromRGB(105, 115, 130)
	line.BackgroundTransparency = 0.72
	line.BorderSizePixel = 0
	line.Parent = radarArea
end

makeRadarLine(UDim2.new(1, 0, 0, 1), UDim2.new(0, 0, 0.5, 0))
makeRadarLine(UDim2.new(0, 1, 1, 0), UDim2.new(0.5, 0, 0, 0))

for _, scale in ipairs({0.5, 0.98}) do
	local ring = Instance.new("Frame")
	ring.AnchorPoint = Vector2.new(0.5, 0.5)
	ring.Size = UDim2.new(scale, 0, scale, 0)
	ring.Position = UDim2.new(0.5, 0, 0.5, 0)
	ring.BackgroundTransparency = 1
	ring.BorderSizePixel = 0
	ring.Parent = radarArea
	corner(ring, 999)
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(105, 115, 130)
	stroke.Transparency = 0.68
	stroke.Thickness = 1
	stroke.Parent = ring
end

local ownCar = Instance.new("Frame")
ownCar.AnchorPoint = Vector2.new(0.5, 0.5)
ownCar.Size = UDim2.new(0, 12, 0, 24)
ownCar.Position = UDim2.new(0.5, 0, 0.5, 0)
ownCar.BackgroundColor3 = Color3.fromRGB(45, 220, 115)
ownCar.BorderSizePixel = 0
ownCar.ZIndex = 5
ownCar.Parent = radarArea
corner(ownCar, 3)

local radarLegend = Instance.new("TextLabel")
radarLegend.Size = UDim2.new(1, -12, 0, 12)
radarLegend.Position = UDim2.new(0, 6, 1, -14)
radarLegend.BackgroundTransparency = 1
radarLegend.Text = "VERDE: TÚ   •   AMARILLO: CERCA   •   ROJO: PELIGRO"
radarLegend.Font = Enum.Font.GothamBold
radarLegend.TextColor3 = Color3.fromRGB(135, 145, 160)
radarLegend.TextSize = 8
radarLegend.Parent = radarPanel

local function getRadarBlip(otherPlayer)
	local existing = radarBlips[otherPlayer]
	if existing and existing.Parent then return existing end

	local blip = Instance.new("Frame")
	blip.Name = "Radar_" .. otherPlayer.Name
	blip.AnchorPoint = Vector2.new(0.5, 0.5)
	blip.Size = UDim2.new(0, 11, 0, 21)
	blip.BackgroundColor3 = Color3.fromRGB(235, 235, 240)
	blip.BorderSizePixel = 0
	blip.ZIndex = 4
	blip.Visible = false
	blip.Parent = radarArea
	corner(blip, 3)

	local nameLabel = Instance.new("TextLabel")
	nameLabel.AnchorPoint = Vector2.new(0.5, 1)
	nameLabel.Size = UDim2.new(0, 72, 0, 12)
	nameLabel.Position = UDim2.new(0.5, 0, 0, -2)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = otherPlayer.DisplayName
	nameLabel.TextColor3 = Color3.fromRGB(220, 225, 235)
	nameLabel.TextStrokeTransparency = 0.45
	nameLabel.Font = Enum.Font.GothamBold
	nameLabel.TextSize = 8
	nameLabel.ZIndex = 5
	nameLabel.Parent = blip

	radarBlips[otherPlayer] = blip
	return blip
end

local function hideRadarBlips()
	for _, blip in pairs(radarBlips) do blip.Visible = false end
end

local function updateProximityRadar(seat, deltaTime)
	if not seat or not seat.Parent then
		radarPanel.Visible = false
		hideRadarBlips()
		radarAccumulator = 0
		return
	end

	radarPanel.Visible = true
	radarAccumulator += deltaTime
	if radarAccumulator < 0.05 then return end
	radarAccumulator = 0

	local nearestDistance = math.huge
	local visiblePlayers = {}
	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if otherPlayer ~= player then
			local character = otherPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			local root = character and character:FindFirstChild("HumanoidRootPart")
			local targetPart = (humanoid and humanoid.SeatPart) or root
			local blip = getRadarBlip(otherPlayer)
			visiblePlayers[otherPlayer] = true

			if targetPart and targetPart:IsA("BasePart") then
				local localOffset = seat.CFrame:VectorToObjectSpace(targetPart.Position - seat.Position)
				local distance = Vector2.new(localOffset.X, localOffset.Z).Magnitude
				nearestDistance = math.min(nearestDistance, distance)
				if distance <= RADAR_RANGE then
					local x = math.clamp(localOffset.X / RADAR_RANGE * RADAR_RADIUS, -RADAR_RADIUS, RADAR_RADIUS)
					local y = math.clamp(localOffset.Z / RADAR_RANGE * RADAR_RADIUS, -RADAR_RADIUS, RADAR_RADIUS)
					blip.Position = UDim2.new(0.5, x, 0.5, y)
					local relativeLook = seat.CFrame:VectorToObjectSpace(targetPart.CFrame.LookVector)
					blip.Rotation = math.deg(math.atan2(relativeLook.X, -relativeLook.Z))
					blip.BackgroundColor3 = distance < 15 and Color3.fromRGB(255, 55, 55)
						or (distance < 30 and Color3.fromRGB(255, 195, 35) or Color3.fromRGB(225, 230, 240))
					blip.Visible = true
				else
					blip.Visible = false
				end
			else
				blip.Visible = false
			end
		end
	end

	for otherPlayer, blip in pairs(radarBlips) do
		if not visiblePlayers[otherPlayer] then blip.Visible = false end
	end

	if nearestDistance < 15 then
		radarTitle.Text = "⚠ PROXIMIDAD CRÍTICA"
		radarTitle.TextColor3 = Color3.fromRGB(255, 70, 70)
		radarStroke.Color = Color3.fromRGB(255, 55, 55)
	elseif nearestDistance < 30 then
		radarTitle.Text = "PROXIMITY RADAR • PRECAUCIÓN"
		radarTitle.TextColor3 = Color3.fromRGB(255, 200, 55)
		radarStroke.Color = Color3.fromRGB(255, 190, 45)
	else
		radarTitle.Text = "PROXIMITY RADAR"
		radarTitle.TextColor3 = Color3.fromRGB(210, 215, 225)
		radarStroke.Color = Color3.fromRGB(95, 105, 120)
	end
end

Players.PlayerRemoving:Connect(function(leavingPlayer)
	local blip = radarBlips[leavingPlayer]
	if blip then blip:Destroy(); radarBlips[leavingPlayer] = nil end
end)

-- =====================================================
-- NOTIFICACIÓN DE ALERTA
-- =====================================================
local activeAlerts = {}
local function showAlert(message, color, icon, yOff)
	color = color or Color3.fromRGB(230, 0, 0)
	icon  = icon  or "⚠"
	yOff  = yOff  or 20

	local g = Instance.new("ScreenGui")
	g.ResetOnSpawn = false
	g.DisplayOrder = 200
	g.Parent = playerGui

	local f = Instance.new("Frame")
	f.Size = UDim2.new(0, 400, 0, 46)
	f.Position = UDim2.new(0.5, -200, 0, yOff - 30)
	f.BackgroundColor3 = HC.bg
	f.BackgroundTransparency = 1
	f.BorderSizePixel = 0
	f.Parent = g
	corner(f, 4)

	local acc = Instance.new("Frame")
	acc.Size = UDim2.new(0, 4, 1, 0)
	acc.BackgroundColor3 = color
	acc.BorderSizePixel = 0
	acc.Parent = f

	local ico = Instance.new("TextLabel")
	ico.Size = UDim2.new(0, 36, 1, 0)
	ico.Position = UDim2.new(0, 8, 0, 0)
	ico.BackgroundTransparency = 1
	ico.Text = icon
	ico.TextScaled = true
	ico.Font = Enum.Font.GothamBold
	ico.TextColor3 = color
	ico.Parent = f

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -52, 1, 0)
	lbl.Position = UDim2.new(0, 50, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Font = Enum.Font.GothamBold
	lbl.TextScaled = true
	lbl.TextColor3 = HC.white
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.Text = message
	lbl.Parent = f

	TweenService:Create(f, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, -200, 0, yOff),
		BackgroundTransparency = 0.08,
	}):Play()

	table.insert(activeAlerts, f)
	for i, af in ipairs(activeAlerts) do
		af.Position = UDim2.new(0.5, -200, 0, yOff + (i-1)*52)
	end

	task.delay(4.6, function()
		local t = TweenService:Create(f, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			Position = UDim2.new(0.5, -200, 0, yOff - 20),
			BackgroundTransparency = 1,
		})
		t:Play()
		t.Completed:Connect(function()
			for i, af in ipairs(activeAlerts) do
				if af == f then table.remove(activeAlerts, i) break end
			end
			g:Destroy()
		end)
	end)
end

-- =====================================================
-- HISTORIAL (lista interna)
-- =====================================================
local historialEntries = {}
local historialListRef = nil -- referencia al ScrollingFrame, asignada abajo

local function addToHistory(playerName, speed)
	local timeStr = os.date("%H:%M:%S")
	local entry = { text = string.format("[%s] %s: %.1f km/h", timeStr, playerName, speed) }
	table.insert(historialEntries, 1, entry)
	if #historialEntries > 60 then table.remove(historialEntries) end

	if historialListRef then
		-- Refrescar lista
		for _, c in ipairs(historialListRef:GetChildren()) do
			if c:IsA("TextLabel") then c:Destroy() end
		end
		for idx, e in ipairs(historialEntries) do
			local lbl = Instance.new("TextLabel")
			lbl.Size = UDim2.new(1, -8, 0, 22)
			lbl.BackgroundTransparency = 1
			lbl.TextColor3 = HC.white
			lbl.Font = Enum.Font.Gotham
			lbl.TextSize = 11
			lbl.TextXAlignment = Enum.TextXAlignment.Left
			lbl.Text = e.text
			lbl.LayoutOrder = idx
			lbl.Parent = historialListRef
		end
	end
end

-- =====================================================
-- HEARTBEAT – detector de velocidad (sistema original)
-- =====================================================
RunService.Heartbeat:Connect(function()
	for _, plr in pairs(Players:GetPlayers()) do
		local char = plr.Character
		if not char then continue end
		local humanoid = char:FindFirstChild("Humanoid")
		local head     = char:FindFirstChild("Head")
		if not humanoid or not head then continue end

		local seat = humanoid.SeatPart
		if seat and seat:IsA("VehicleSeat") and seat.Occupant == humanoid then
			local tag = createSpeedTag(char, plr)
			if not tag then continue end
			tag.Enabled = showTags
			local textLabel = tag:FindFirstChild("SpeedText")
			if textLabel then
				local currentSpeed = toSpeedDisplay(getVehicleSpeed(seat))
				local limit        = getPlayerSpeedLimit(seat)
				textLabel.Text = string.format("%d / %.1f", currentSpeed, limit)

				local dist     = (head.Position - CAMERA.CFrame.Position).Magnitude
				local baseSize = 30
				local sz       = math.clamp(baseSize * (10 / dist), 14, 40)
				textLabel.TextSize = sz

				if limit > masterSpeedLimit and not alertedPlayers[plr] then
					alertedPlayers[plr] = true
					addToHistory(plr.DisplayName, limit)
					warn(plr.DisplayName .. " superó los límites de velocidad")
					showAlert(plr.DisplayName .. " superó " .. masterSpeedLimit .. " km/h", HC.accent, "⚠", 20)
				elseif limit <= masterSpeedLimit then
					alertedPlayers[plr] = nil
				end
			end
		else
			removeSpeedTag(char)
		end
	end
end)

RunService.Heartbeat:Connect(function(deltaTime)
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	local seat = humanoid and humanoid.SeatPart or nil
	local validSeat = seat and (seat:IsA("Seat") or seat:IsA("VehicleSeat"))
	if validSeat and seat ~= activeEffectsSeat then
		startVehicleEffects(seat)
	elseif not validSeat and activeEffectsSeat then
		clearVehicleEffects()
	end
	if activeEffectsSeat then updateVehicleEffects(deltaTime) end
	updateProximityRadar(validSeat and seat or nil, deltaTime)
end)

-- =====================================================
-- PANTALLA DE CARGA
-- =====================================================
local loadGui = Instance.new("ScreenGui")
loadGui.Name = "SPA_LOADING"
loadGui.ResetOnSpawn = false
loadGui.DisplayOrder = 999
loadGui.Parent = playerGui

local loadBg = Instance.new("Frame")
loadBg.Size = UDim2.new(1, 0, 1, 0)
loadBg.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
loadBg.BorderSizePixel = 0
loadBg.Parent = loadGui

local topLine = Instance.new("Frame")
topLine.Size = UDim2.new(0, 0, 0, 3)
topLine.BackgroundColor3 = HC.accent
topLine.BorderSizePixel = 0
topLine.Parent = loadBg

local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(0.6, 0, 0.12, 0)
loadTitle.Position = UDim2.new(0.2, 0, 0.36, 0)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "SPA-CONTROL HUB"
loadTitle.TextColor3 = HC.white
loadTitle.Font = Enum.Font.GothamBlack
loadTitle.TextScaled = true
loadTitle.Parent = loadBg

local loadSub = Instance.new("TextLabel")
loadSub.Size = UDim2.new(0.4, 0, 0.05, 0)
loadSub.Position = UDim2.new(0.3, 0, 0.51, 0)
loadSub.BackgroundTransparency = 1
loadSub.Text = "RACE CONTROL SYSTEM"
loadSub.TextColor3 = HC.accent
loadSub.Font = Enum.Font.GothamBold
loadSub.TextScaled = true
loadSub.Parent = loadBg

local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.4, 0, 0, 4)
barBg.Position = UDim2.new(0.3, 0, 0.62, 0)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
barBg.BorderSizePixel = 0
barBg.Parent = loadBg
corner(barBg, 2)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = HC.accent
barFill.BorderSizePixel = 0
barFill.Parent = barBg
corner(barFill, 2)

task.spawn(function()
	TweenService:Create(topLine, TweenInfo.new(0.5, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 0, 3)}):Play()
	task.wait(0.3)
	TweenService:Create(barFill, TweenInfo.new(2.5, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 1, 0)}):Play()
	task.wait(3)
	TweenService:Create(loadBg,    TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
	TweenService:Create(loadTitle, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
	TweenService:Create(loadSub,   TweenInfo.new(0.4), {TextTransparency = 1}):Play()
	task.wait(0.5)
	loadGui:Destroy()
end)

task.wait(3.5)

-- =====================================================
-- GUI PRINCIPAL
-- =====================================================
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "SPA_CONTROL_HUB"
mainGui.ResetOnSpawn = false
mainGui.DisplayOrder = 50
mainGui.IgnoreGuiInset = true
mainGui.Parent = playerGui

-- Overlay oscuro
local overlay = Instance.new("TextButton")
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
overlay.BackgroundTransparency = 0.55
overlay.BorderSizePixel = 0
overlay.Text = ""
overlay.Visible = false
overlay.ZIndex = 48
overlay.Parent = mainGui

-- Botón flotante SPA
local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 54, 0, 54)
floatBtn.Position = UDim2.new(0, 14, 0.5, -27)
floatBtn.BackgroundColor3 = HC.accent
floatBtn.Text = "SPA"
floatBtn.TextColor3 = HC.white
floatBtn.Font = Enum.Font.GothamBlack
floatBtn.TextSize = 13
floatBtn.BorderSizePixel = 0
floatBtn.ZIndex = 5
floatBtn.Parent = mainGui
corner(floatBtn, 4)

local fbLine = Instance.new("Frame")
fbLine.Size = UDim2.new(1, 0, 0, 3)
fbLine.Position = UDim2.new(0, 0, 1, -3)
fbLine.BackgroundColor3 = HC.white
fbLine.BackgroundTransparency = 0.5
fbLine.BorderSizePixel = 0
fbLine.ZIndex = 6
fbLine.Parent = floatBtn

-- Marco principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.72, 0, 0.82, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = HC.bg
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.ZIndex = 49
mainFrame.Parent = mainGui
corner(mainFrame, 6)

local topAccent = Instance.new("Frame")
topAccent.Size = UDim2.new(1, 0, 0, 3)
topAccent.BackgroundColor3 = HC.accent
topAccent.BorderSizePixel = 0
topAccent.ZIndex = 50
topAccent.Parent = mainFrame

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 38)
titleBar.Position = UDim2.new(0, 0, 0, 3)
titleBar.BackgroundColor3 = HC.bg2
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 50
titleBar.Parent = mainFrame

local titleTxt = Instance.new("TextLabel")
titleTxt.Size = UDim2.new(0.7, 0, 1, 0)
titleTxt.Position = UDim2.new(0, 14, 0, 0)
titleTxt.BackgroundTransparency = 1
titleTxt.Text = "SPA-CONTROL HUB"
titleTxt.Font = Enum.Font.GothamBlack
titleTxt.TextColor3 = HC.white
titleTxt.TextSize = 14
titleTxt.TextXAlignment = Enum.TextXAlignment.Left
titleTxt.ZIndex = 51
titleTxt.Parent = titleBar

local closeBtnMain = Instance.new("TextButton")
closeBtnMain.Size = UDim2.new(0, 32, 0, 28)
closeBtnMain.Position = UDim2.new(1, -38, 0, 5)
closeBtnMain.BackgroundColor3 = HC.accent
closeBtnMain.Text = "✕"
closeBtnMain.TextColor3 = HC.white
closeBtnMain.Font = Enum.Font.GothamBold
closeBtnMain.TextSize = 14
closeBtnMain.BorderSizePixel = 0
closeBtnMain.ZIndex = 51
closeBtnMain.Parent = titleBar
corner(closeBtnMain, 3)

-- =====================================================
-- PESTAÑAS: ONBOARD | CONFIG | HISTORIAL
-- =====================================================
local TABS = {"ONBOARD", "CONFIG", "HISTORIAL"}
local tabButtons = {}
local tabFrames  = {}

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, 0, 0, 32)
tabBar.Position = UDim2.new(0, 0, 0, 41)
tabBar.BackgroundColor3 = HC.bg2
tabBar.BorderSizePixel = 0
tabBar.ZIndex = 50
tabBar.Parent = mainFrame

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Parent = tabBar

local function switchTab(name)
	currentTab = name
	for n, f in pairs(tabFrames) do
		f.Visible = (n == name)
		tabButtons[n].BackgroundColor3 = (n == name) and HC.accent or HC.bg2
		tabButtons[n].TextColor3 = (n == name) and HC.white or HC.gray
		local ind = tabButtons[n]:FindFirstChild("Ind")
		if ind then
			ind.BackgroundColor3 = (n == name) and HC.white or HC.bg2
		end
	end
end

for i, tabName in ipairs(TABS) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1 / #TABS, 0, 1, 0)
	btn.BackgroundColor3 = (tabName == currentTab) and HC.accent or HC.bg2
	btn.Text = tabName
	btn.TextColor3 = (tabName == currentTab) and HC.white or HC.gray
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 11
	btn.BorderSizePixel = 0
	btn.LayoutOrder = i
	btn.ZIndex = 51
	btn.Parent = tabBar
	tabButtons[tabName] = btn

	local ind = Instance.new("Frame")
	ind.Name = "Ind"
	ind.Size = UDim2.new(1, 0, 0, 2)
	ind.Position = UDim2.new(0, 0, 1, -2)
	ind.BackgroundColor3 = (tabName == currentTab) and HC.white or HC.bg2
	ind.BorderSizePixel = 0
	ind.ZIndex = 52
	ind.Parent = btn

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, -16, 1, -82)
	frame.Position = UDim2.new(0, 8, 0, 74)
	frame.BackgroundTransparency = 1
	frame.Visible = (tabName == currentTab)
	frame.ZIndex = 50
	frame.Parent = mainFrame
	tabFrames[tabName] = frame

	btn.MouseButton1Click:Connect(function() switchTab(tabName) end)
end

local function makeScroll(parent)
	local s = Instance.new("ScrollingFrame")
	s.Size = UDim2.new(1, 0, 1, 0)
	s.BackgroundColor3 = HC.bg
	s.BorderSizePixel = 0
	s.AutomaticCanvasSize = Enum.AutomaticSize.Y
	s.CanvasSize = UDim2.new(0, 0, 0, 0)
	s.ScrollBarThickness = 3
	s.ScrollBarImageColor3 = HC.accent
	s.ZIndex = 51
	s.Parent = parent
	local l = Instance.new("UIListLayout")
	l.Padding = UDim.new(0, 2)
	l.Parent = s
	return s
end

local function makeSectionHdr(parent, text, order)
	local h = Instance.new("Frame")
	h.Size = UDim2.new(1, 0, 0, 24)
	h.BackgroundColor3 = HC.darkAccent
	h.BorderSizePixel = 0
	h.LayoutOrder = order
	h.ZIndex = 52
	h.Parent = parent
	corner(h, 3)
	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, -10, 1, 0)
	lbl.Position = UDim2.new(0, 10, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = text
	lbl.Font = Enum.Font.GothamBlack
	lbl.TextColor3 = HC.white
	lbl.TextSize = 11
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.ZIndex = 53
	lbl.Parent = h
end

local onboardScroll  = makeScroll(tabFrames["ONBOARD"])
local configScroll   = makeScroll(tabFrames["CONFIG"])
local historialScroll = makeScroll(tabFrames["HISTORIAL"])
historialListRef = historialScroll

-- =====================================================
-- PESTAÑA HISTORIAL
-- =====================================================
local histHdr = Instance.new("Frame")
histHdr.Size = UDim2.new(1, 0, 0, 44)
histHdr.BackgroundColor3 = HC.accent
histHdr.BorderSizePixel = 0
histHdr.LayoutOrder = 0
histHdr.ZIndex = 52
histHdr.Parent = historialScroll
corner(histHdr, 4)

local histHdrTxt = Instance.new("TextLabel")
histHdrTxt.Size = UDim2.new(1, -10, 1, 0)
histHdrTxt.Position = UDim2.new(0, 12, 0, 0)
histHdrTxt.BackgroundTransparency = 1
histHdrTxt.Text = "⚠  HISTORIAL DE EXCESOS"
histHdrTxt.Font = Enum.Font.GothamBlack
histHdrTxt.TextColor3 = HC.white
histHdrTxt.TextSize = 14
histHdrTxt.TextXAlignment = Enum.TextXAlignment.Left
histHdrTxt.ZIndex = 53
histHdrTxt.Parent = histHdr

local histClearRow = Instance.new("Frame")
histClearRow.Size = UDim2.new(1, 0, 0, 34)
histClearRow.BackgroundColor3 = HC.bg
histClearRow.BorderSizePixel = 0
histClearRow.LayoutOrder = 1
histClearRow.ZIndex = 52
histClearRow.Parent = historialScroll

local histClearBtn = Instance.new("TextButton")
histClearBtn.Size = UDim2.new(1, -16, 0, 24)
histClearBtn.Position = UDim2.new(0, 8, 0.5, -12)
histClearBtn.BackgroundColor3 = HC.darkAccent
histClearBtn.Text = "🗑  LIMPIAR HISTORIAL"
histClearBtn.Font = Enum.Font.GothamBold
histClearBtn.TextColor3 = HC.white
histClearBtn.TextSize = 11
histClearBtn.BorderSizePixel = 0
histClearBtn.ZIndex = 53
histClearBtn.Parent = histClearRow
corner(histClearBtn, 4)

histClearBtn.MouseButton1Click:Connect(function()
	historialEntries = {}
	for _, c in ipairs(historialScroll:GetChildren()) do
		if c:IsA("TextLabel") then c:Destroy() end
	end
end)

-- =====================================================
-- PESTAÑA CONFIG
-- =====================================================
local COLOR_PALETTE = {
	{name = "ROJO",     color = Color3.fromRGB(230, 0, 0)},
	{name = "AZUL",     color = Color3.fromRGB(0, 100, 210)},
	{name = "VERDE",    color = Color3.fromRGB(0, 200, 80)},
	{name = "NARANJA",  color = Color3.fromRGB(255, 130, 0)},
	{name = "MORADO",   color = Color3.fromRGB(160, 0, 220)},
	{name = "CYAN",     color = Color3.fromRGB(0, 210, 220)},
	{name = "ROSA",     color = Color3.fromRGB(255, 60, 160)},
	{name = "AMARILLO", color = Color3.fromRGB(255, 200, 0)},
	{name = "BLANCO",   color = Color3.fromRGB(220, 220, 230)},
}

local function applyAccent(c)
	HC.accent = c
	HC.darkAccent = Color3.fromRGB(
		math.floor(c.R * 255 * 0.45),
		math.floor(c.G * 255 * 0.45),
		math.floor(c.B * 255 * 0.45)
	)
	topAccent.BackgroundColor3    = c
	floatBtn.BackgroundColor3     = c
	closeBtnMain.BackgroundColor3 = c
	barFill.BackgroundColor3      = c
	for n, tabBtn in pairs(tabButtons) do
		if n == currentTab then tabBtn.BackgroundColor3 = c end
	end
end

-- Sección: Límite de velocidad
makeSectionHdr(configScroll, "⚙  LÍMITE DE VELOCIDAD (KM/H)", 1)

local speedRow = Instance.new("Frame")
speedRow.Size = UDim2.new(1, 0, 0, 56)
speedRow.BackgroundColor3 = HC.bg2
speedRow.BorderSizePixel = 0
speedRow.LayoutOrder = 2
speedRow.ZIndex = 52
speedRow.Parent = configScroll

local speedDesc = Instance.new("TextLabel")
speedDesc.Size = UDim2.new(1, -10, 0, 20)
speedDesc.Position = UDim2.new(0, 10, 0, 4)
speedDesc.BackgroundTransparency = 1
speedDesc.Text = "Límite global de velocidad"
speedDesc.Font = Enum.Font.Gotham
speedDesc.TextColor3 = HC.gray
speedDesc.TextSize = 11
speedDesc.TextXAlignment = Enum.TextXAlignment.Left
speedDesc.ZIndex = 53
speedDesc.Parent = speedRow

local speedBox = Instance.new("TextBox")
speedBox.Size = UDim2.new(0, 80, 0, 26)
speedBox.Position = UDim2.new(0, 10, 0, 26)
speedBox.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
speedBox.BorderSizePixel = 0
speedBox.Font = Enum.Font.GothamBold
speedBox.TextColor3 = HC.white
speedBox.TextSize = 14
speedBox.Text = tostring(masterSpeedLimit)
speedBox.PlaceholderText = "70"
speedBox.ClearTextOnFocus = false
speedBox.ZIndex = 53
speedBox.Parent = speedRow
corner(speedBox, 4)
padLeft(speedBox, 6)

local speedApplyBtn = Instance.new("TextButton")
speedApplyBtn.Size = UDim2.new(0, 90, 0, 26)
speedApplyBtn.Position = UDim2.new(0, 100, 0, 26)
speedApplyBtn.BackgroundColor3 = HC.accent
speedApplyBtn.Text = "APLICAR"
speedApplyBtn.Font = Enum.Font.GothamBold
speedApplyBtn.TextColor3 = HC.white
speedApplyBtn.TextSize = 11
speedApplyBtn.BorderSizePixel = 0
speedApplyBtn.ZIndex = 53
speedApplyBtn.Parent = speedRow
corner(speedApplyBtn, 4)

speedApplyBtn.MouseButton1Click:Connect(function()
	local val = tonumber(speedBox.Text)
	if val and val > 0 then
		masterSpeedLimit = val
		alertedPlayers = {}
		showAlert("LÍMITE: " .. val .. " KM/H", HC.accent, "🚦", 20)
	end
end)

-- También al perder foco igual que el script original
speedBox.FocusLost:Connect(function()
	local val = tonumber(speedBox.Text)
	if val and val > 0 then
		masterSpeedLimit = val
		alertedPlayers = {}
	end
end)

-- Sección: Tags encima de la cabeza
makeSectionHdr(configScroll, "👁  VELOCIDAD SOBRE LA CABEZA", 3)

local tagRow = Instance.new("Frame")
tagRow.Size = UDim2.new(1, 0, 0, 54)
tagRow.BackgroundColor3 = HC.bg2
tagRow.BorderSizePixel = 0
tagRow.LayoutOrder = 4
tagRow.ZIndex = 52
tagRow.Parent = configScroll

local tagDesc = Instance.new("TextLabel")
tagDesc.Size = UDim2.new(1, -10, 0, 20)
tagDesc.Position = UDim2.new(0, 10, 0, 4)
tagDesc.BackgroundTransparency = 1
tagDesc.Text = "Nombre + velocidad flotando sobre cada piloto en vehículo"
tagDesc.Font = Enum.Font.Gotham
tagDesc.TextColor3 = HC.gray
tagDesc.TextSize = 11
tagDesc.TextWrapped = true
tagDesc.TextXAlignment = Enum.TextXAlignment.Left
tagDesc.ZIndex = 53
tagDesc.Parent = tagRow

local tagToggle = Instance.new("TextButton")
tagToggle.Size = UDim2.new(0, 130, 0, 26)
tagToggle.Position = UDim2.new(0, 10, 0, 24)
tagToggle.BackgroundColor3 = Color3.fromRGB(0, 130, 50)
tagToggle.Text = "● ACTIVADO"
tagToggle.Font = Enum.Font.GothamBold
tagToggle.TextColor3 = HC.white
tagToggle.TextSize = 11
tagToggle.BorderSizePixel = 0
tagToggle.ZIndex = 53
tagToggle.Parent = tagRow
corner(tagToggle, 4)

tagToggle.MouseButton1Click:Connect(function()
	showTags = not showTags
	tagToggle.Text = showTags and "● ACTIVADO" or "● DESACTIVADO"
	tagToggle.BackgroundColor3 = showTags and Color3.fromRGB(0, 130, 50) or HC.darkAccent
	for _, plr in pairs(Players:GetPlayers()) do
		local char = plr.Character
		if char and char:FindFirstChild("Head") then
			local tag = char.Head:FindFirstChild("SpeedTag")
			if tag then tag.Enabled = showTags end
		end
	end
	showAlert("Tags: " .. (showTags and "ON" or "OFF"), showTags and Color3.fromRGB(0, 180, 60) or HC.gray, "👁", 20)
end)

-- Sección: Color del hub
makeSectionHdr(configScroll, "🎨  COLOR DEL HUB", 5)

local colorInfoRow = Instance.new("Frame")
colorInfoRow.Size = UDim2.new(1, 0, 0, 28)
colorInfoRow.BackgroundColor3 = HC.bg2
colorInfoRow.BorderSizePixel = 0
colorInfoRow.LayoutOrder = 6
colorInfoRow.ZIndex = 52
colorInfoRow.Parent = configScroll

local colorInfoTxt = Instance.new("TextLabel")
colorInfoTxt.Size = UDim2.new(1, -10, 1, 0)
colorInfoTxt.Position = UDim2.new(0, 10, 0, 0)
colorInfoTxt.BackgroundTransparency = 1
colorInfoTxt.Text = "Selecciona un color para cambiar todo el hub"
colorInfoTxt.Font = Enum.Font.Gotham
colorInfoTxt.TextColor3 = HC.gray
colorInfoTxt.TextSize = 11
colorInfoTxt.TextXAlignment = Enum.TextXAlignment.Left
colorInfoTxt.ZIndex = 53
colorInfoTxt.Parent = colorInfoRow

local colorGridFrame = Instance.new("Frame")
colorGridFrame.Size = UDim2.new(1, 0, 0, 0)
colorGridFrame.AutomaticSize = Enum.AutomaticSize.Y
colorGridFrame.BackgroundColor3 = HC.bg
colorGridFrame.BorderSizePixel = 0
colorGridFrame.LayoutOrder = 7
colorGridFrame.ZIndex = 52
colorGridFrame.Parent = configScroll

local colorPad = Instance.new("UIPadding")
colorPad.PaddingTop    = UDim.new(0, 6)
colorPad.PaddingBottom = UDim.new(0, 6)
colorPad.PaddingLeft   = UDim.new(0, 6)
colorPad.PaddingRight  = UDim.new(0, 6)
colorPad.Parent = colorGridFrame

local colorGrid = Instance.new("UIGridLayout")
colorGrid.CellSize    = UDim2.new(0, 88, 0, 30)
colorGrid.CellPadding = UDim2.new(0, 4, 0, 4)
colorGrid.Parent = colorGridFrame

for _, opt in ipairs(COLOR_PALETTE) do
	local cb = Instance.new("TextButton")
	cb.BackgroundColor3 = opt.color
	cb.Text = opt.name
	cb.Font = Enum.Font.GothamBold
	cb.TextColor3 = Color3.fromRGB(0, 0, 0)
	cb.TextSize = 11
	cb.BorderSizePixel = 0
	cb.ZIndex = 53
	cb.Parent = colorGridFrame
	corner(cb, 4)
	cb.MouseButton1Click:Connect(function()
		applyAccent(opt.color)
		showAlert("COLOR: " .. opt.name, opt.color, "🎨", 20)
	end)
end

-- =====================================================
-- CÁMARA ONBOARD
-- =====================================================
local CAMERA_BIND_NAME = "SPAOnboardCamera"
local CAMERA_OFFSET_X       = 0
local CAMERA_OFFSET_Y       = 4.0
local CAMERA_OFFSET_Z       = 0.5
local CAMERA_PITCH          = -20
local CAMERA_BASE_YAW       = 0
local CAMERA_ROLL           = 0
local CAMERA_REAR_YAW       = 180
local CAMERA_FOV            = 100
local CAMERA_FOCUS_DISTANCE = 100

-- Configuración editable de la cámara
makeSectionHdr(configScroll, "🎥  AJUSTES DE CÁMARA ONBOARD", 8)
local cameraConfigRow = Instance.new("Frame")
cameraConfigRow.Size = UDim2.new(1, 0, 0, 286)
cameraConfigRow.BackgroundColor3 = HC.bg2
cameraConfigRow.BorderSizePixel = 0
cameraConfigRow.LayoutOrder = 9
cameraConfigRow.ZIndex = 52
cameraConfigRow.Parent = configScroll
corner(cameraConfigRow, 4)

local cameraConfigInfo = Instance.new("TextLabel")
cameraConfigInfo.Size = UDim2.new(1, -16, 0, 24)
cameraConfigInfo.Position = UDim2.new(0, 8, 0, 4)
cameraConfigInfo.BackgroundTransparency = 1
cameraConfigInfo.Text = "Modifica la posición, rotación, vista trasera y campo visual"
cameraConfigInfo.Font = Enum.Font.Gotham
cameraConfigInfo.TextColor3 = HC.gray
cameraConfigInfo.TextSize = 10
cameraConfigInfo.TextXAlignment = Enum.TextXAlignment.Left
cameraConfigInfo.ZIndex = 53
cameraConfigInfo.Parent = cameraConfigRow

local cameraBoxes = {}
local function makeCameraBox(key, labelText, value, column, row)
	local xScale = column == 0 and 0 or 0.5
	local xOffset = column == 0 and 8 or 4
	local yOffset = 30 + row * 44
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(0.5, -12, 0, 14)
	label.Position = UDim2.new(xScale, xOffset, 0, yOffset)
	label.BackgroundTransparency = 1
	label.Text = labelText
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = HC.gray
	label.TextSize = 9
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.ZIndex = 53
	label.Parent = cameraConfigRow
	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0.5, -12, 0, 25)
	box.Position = UDim2.new(xScale, xOffset, 0, yOffset + 15)
	box.BackgroundColor3 = Color3.fromRGB(28, 28, 40)
	box.BorderSizePixel = 0
	box.ClearTextOnFocus = false
	box.Text = tostring(value)
	box.PlaceholderText = tostring(value)
	box.Font = Enum.Font.GothamBold
	box.TextColor3 = HC.white
	box.TextSize = 11
	box.TextXAlignment = Enum.TextXAlignment.Left
	box.ZIndex = 53
	box.Parent = cameraConfigRow
	corner(box, 4)
	padLeft(box, 6)
	cameraBoxes[key] = box
end

makeCameraBox("offsetX", "POSICIÓN X  (-50 a 50)", CAMERA_OFFSET_X, 0, 0)
makeCameraBox("offsetY", "ALTURA Y  (-50 a 50)", CAMERA_OFFSET_Y, 1, 0)
makeCameraBox("offsetZ", "DISTANCIA Z  (-50 a 50)", CAMERA_OFFSET_Z, 0, 1)
makeCameraBox("pitch", "PITCH / INCLINACIÓN", CAMERA_PITCH, 1, 1)
makeCameraBox("baseYaw", "YAW BASE", CAMERA_BASE_YAW, 0, 2)
makeCameraBox("roll", "ROLL / GIRO LATERAL", CAMERA_ROLL, 1, 2)
makeCameraBox("rearYaw", "GIRO VISTA TRASERA", CAMERA_REAR_YAW, 0, 3)
makeCameraBox("fov", "FOV / CAMPO VISUAL (1-120)", CAMERA_FOV, 1, 3)
makeCameraBox("focus", "DISTANCIA DE FOCO", CAMERA_FOCUS_DISTANCE, 0, 4)

local function readCameraNumber(key, minimum, maximum)
	local value = tonumber(cameraBoxes[key].Text)
	if not value or value < minimum or value > maximum then return nil end
	return value
end

local function refreshCameraBoxes()
	cameraBoxes.offsetX.Text = tostring(CAMERA_OFFSET_X)
	cameraBoxes.offsetY.Text = tostring(CAMERA_OFFSET_Y)
	cameraBoxes.offsetZ.Text = tostring(CAMERA_OFFSET_Z)
	cameraBoxes.pitch.Text = tostring(CAMERA_PITCH)
	cameraBoxes.baseYaw.Text = tostring(CAMERA_BASE_YAW)
	cameraBoxes.roll.Text = tostring(CAMERA_ROLL)
	cameraBoxes.rearYaw.Text = tostring(CAMERA_REAR_YAW)
	cameraBoxes.fov.Text = tostring(CAMERA_FOV)
	cameraBoxes.focus.Text = tostring(CAMERA_FOCUS_DISTANCE)
end

local cameraApplyBtn = Instance.new("TextButton")
cameraApplyBtn.Size = UDim2.new(0.5, -12, 0, 27)
cameraApplyBtn.Position = UDim2.new(0, 8, 1, -34)
cameraApplyBtn.BackgroundColor3 = HC.accent
cameraApplyBtn.Text = "APLICAR CÁMARA"
cameraApplyBtn.Font = Enum.Font.GothamBold
cameraApplyBtn.TextColor3 = HC.white
cameraApplyBtn.TextSize = 10
cameraApplyBtn.BorderSizePixel = 0
cameraApplyBtn.ZIndex = 53
cameraApplyBtn.Parent = cameraConfigRow
corner(cameraApplyBtn, 4)

local cameraResetBtn = Instance.new("TextButton")
cameraResetBtn.Size = UDim2.new(0.5, -12, 0, 27)
cameraResetBtn.Position = UDim2.new(0.5, 4, 1, -34)
cameraResetBtn.BackgroundColor3 = HC.darkAccent
cameraResetBtn.Text = "RESTAURAR"
cameraResetBtn.Font = Enum.Font.GothamBold
cameraResetBtn.TextColor3 = HC.white
cameraResetBtn.TextSize = 10
cameraResetBtn.BorderSizePixel = 0
cameraResetBtn.ZIndex = 53
cameraResetBtn.Parent = cameraConfigRow
corner(cameraResetBtn, 4)

cameraApplyBtn.MouseButton1Click:Connect(function()
	local offsetX = readCameraNumber("offsetX", -50, 50)
	local offsetY = readCameraNumber("offsetY", -50, 50)
	local offsetZ = readCameraNumber("offsetZ", -50, 50)
	local pitch = readCameraNumber("pitch", -89, 89)
	local baseYaw = readCameraNumber("baseYaw", -180, 180)
	local roll = readCameraNumber("roll", -180, 180)
	local rearYaw = readCameraNumber("rearYaw", -360, 360)
	local fov = readCameraNumber("fov", 1, 120)
	local focus = readCameraNumber("focus", 1, 2000)
	if offsetX == nil or offsetY == nil or offsetZ == nil or pitch == nil
		or baseYaw == nil or roll == nil or rearYaw == nil or fov == nil or focus == nil then
		showAlert("VALORES DE CÁMARA INVÁLIDOS", HC.accent, "⚠", 20)
		return
	end
	CAMERA_OFFSET_X, CAMERA_OFFSET_Y, CAMERA_OFFSET_Z = offsetX, offsetY, offsetZ
	CAMERA_PITCH, CAMERA_BASE_YAW, CAMERA_ROLL = pitch, baseYaw, roll
	CAMERA_REAR_YAW, CAMERA_FOV, CAMERA_FOCUS_DISTANCE = rearYaw, fov, focus
	refreshCameraBoxes()
	showAlert("CÁMARA ACTUALIZADA", HC.accent, "🎥", 20)
end)

cameraResetBtn.MouseButton1Click:Connect(function()
	CAMERA_OFFSET_X, CAMERA_OFFSET_Y, CAMERA_OFFSET_Z = 0, 2.8, 0.5
	CAMERA_PITCH, CAMERA_BASE_YAW, CAMERA_ROLL = -20, 0, 0
	CAMERA_REAR_YAW, CAMERA_FOV, CAMERA_FOCUS_DISTANCE = 180, 100, 100
	refreshCameraBoxes()
	showAlert("CÁMARA RESTAURADA", HC.gray, "↺", 20)
end)

-- ---------- Mirar atrás (cruceta abajo de Xbox o flecha abajo del teclado) ----------
local LOOKBACK_KEYBOARD_KEY = Enum.KeyCode.Down
local LOOKBACK_GAMEPAD_KEY  = Enum.KeyCode.DPadDown

local function isLookBackPressed()
	if UserInputService:IsKeyDown(LOOKBACK_KEYBOARD_KEY) then return true end
	for _, gamepad in ipairs(UserInputService:GetConnectedGamepads()) do
		if UserInputService:IsGamepadButtonDown(gamepad, LOOKBACK_GAMEPAD_KEY) then return true end
	end
	return false
end

local function updateOnboardCamera()
	if not onboardEnabled or not onboardChar or not onboardChar.Parent then return end
	local root = onboardChar:FindFirstChild("HumanoidRootPart")
	if not root then return end
	CAMERA = Workspace.CurrentCamera
	if not CAMERA then return end
	CAMERA.CameraType = Enum.CameraType.Scriptable
	local yaw = CAMERA_BASE_YAW + (isLookBackPressed() and CAMERA_REAR_YAW or 0)
	local cameraCFrame = root.CFrame
		* CFrame.new(CAMERA_OFFSET_X, CAMERA_OFFSET_Y, CAMERA_OFFSET_Z)
		* CFrame.Angles(0, math.rad(yaw), 0)
		* CFrame.Angles(math.rad(CAMERA_PITCH), 0, math.rad(CAMERA_ROLL))
	CAMERA.CFrame = cameraCFrame
	CAMERA.Focus = CFrame.new(cameraCFrame.Position + cameraCFrame.LookVector * CAMERA_FOCUS_DISTANCE)
	CAMERA.FieldOfView = CAMERA_FOV
end

local function enableOnboard()
	local char = player.Character
	if not char or not char.Parent then return false end
	onboardChar = char
	CAMERA = Workspace.CurrentCamera
	if not CAMERA then return false end
	CAMERA.CameraType = Enum.CameraType.Scriptable
	if not onboardEnabled then
		onboardEnabled = true
		RunService:UnbindFromRenderStep(CAMERA_BIND_NAME)
		RunService:BindToRenderStep(CAMERA_BIND_NAME, Enum.RenderPriority.Last.Value + 1, updateOnboardCamera)
	end
	updateOnboardCamera()
	return true
end

local function disableOnboard()
	if not onboardEnabled then return end
	onboardEnabled = false
	onboardChar = nil
	RunService:UnbindFromRenderStep(CAMERA_BIND_NAME)
	CAMERA.CameraType = Enum.CameraType.Custom
	local char = player.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then CAMERA.CameraSubject = hum end
	end
end

-- =====================================================
-- PESTAÑA ONBOARD
-- =====================================================
local onboardHdr = Instance.new("Frame")
onboardHdr.Size = UDim2.new(1, 0, 0, 44)
onboardHdr.BackgroundColor3 = HC.accent
onboardHdr.BorderSizePixel = 0
onboardHdr.LayoutOrder = 0
onboardHdr.ZIndex = 52
onboardHdr.Parent = onboardScroll
corner(onboardHdr, 4)

local onboardHdrTxt = Instance.new("TextLabel")
onboardHdrTxt.Size = UDim2.new(1, -10, 1, 0)
onboardHdrTxt.Position = UDim2.new(0, 12, 0, 0)
onboardHdrTxt.BackgroundTransparency = 1
onboardHdrTxt.Text = "🎥  ONBOARD  —  Cámara F1 25"
onboardHdrTxt.Font = Enum.Font.GothamBlack
onboardHdrTxt.TextColor3 = HC.white
onboardHdrTxt.TextSize = 14
onboardHdrTxt.TextXAlignment = Enum.TextXAlignment.Left
onboardHdrTxt.ZIndex = 53
onboardHdrTxt.Parent = onboardHdr

local onboardInfo = Instance.new("Frame")
onboardInfo.Size = UDim2.new(1, 0, 0, 28)
onboardInfo.BackgroundColor3 = HC.bg2
onboardInfo.BorderSizePixel = 0
onboardInfo.LayoutOrder = 1
onboardInfo.ZIndex = 52
onboardInfo.Parent = onboardScroll

local onboardInfoTxt = Instance.new("TextLabel")
onboardInfoTxt.Size = UDim2.new(1, -10, 1, 0)
onboardInfoTxt.Position = UDim2.new(0, 10, 0, 0)
onboardInfoTxt.BackgroundTransparency = 1
onboardInfoTxt.Text = "Mantén D-pad ↓ del control para mirar atrás"
onboardInfoTxt.Font = Enum.Font.Gotham
onboardInfoTxt.TextColor3 = HC.gray
onboardInfoTxt.TextSize = 11
onboardInfoTxt.TextXAlignment = Enum.TextXAlignment.Left
onboardInfoTxt.ZIndex = 53
onboardInfoTxt.Parent = onboardInfo

local disableRow = Instance.new("Frame")
disableRow.Size = UDim2.new(1, 0, 0, 36)
disableRow.BackgroundColor3 = HC.bg
disableRow.BorderSizePixel = 0
disableRow.LayoutOrder = 2
disableRow.ZIndex = 52
disableRow.Parent = onboardScroll

local disableBtn = Instance.new("TextButton")
disableBtn.Size = UDim2.new(1, -16, 0, 26)
disableBtn.Position = UDim2.new(0, 8, 0.5, -13)
disableBtn.BackgroundColor3 = HC.darkAccent
disableBtn.Text = "📷  DESACTIVAR CÁMARA"
disableBtn.Font = Enum.Font.GothamBold
disableBtn.TextColor3 = HC.white
disableBtn.TextSize = 11
disableBtn.BorderSizePixel = 0
disableBtn.ZIndex = 53
disableBtn.Parent = disableRow
corner(disableBtn, 4)
disableBtn.MouseButton1Click:Connect(function()
	disableOnboard()
	showAlert("Cámara normal restaurada", HC.gray, "📷", 20)
end)

local pilotSepHdr = Instance.new("Frame")
pilotSepHdr.Size = UDim2.new(1, 0, 0, 22)
pilotSepHdr.BackgroundColor3 = HC.darkAccent
pilotSepHdr.BorderSizePixel = 0
pilotSepHdr.LayoutOrder = 3
pilotSepHdr.ZIndex = 52
pilotSepHdr.Parent = onboardScroll
corner(pilotSepHdr, 3)

local pilotSepTxt = Instance.new("TextLabel")
pilotSepTxt.Size = UDim2.new(1, -10, 1, 0)
pilotSepTxt.Position = UDim2.new(0, 10, 0, 0)
pilotSepTxt.BackgroundTransparency = 1
pilotSepTxt.Text = "TU CÁMARA"
pilotSepTxt.Font = Enum.Font.GothamBlack
pilotSepTxt.TextColor3 = HC.white
pilotSepTxt.TextSize = 11
pilotSepTxt.TextXAlignment = Enum.TextXAlignment.Left
pilotSepTxt.ZIndex = 53
pilotSepTxt.Parent = pilotSepHdr

local cardContainer = Instance.new("Frame")
cardContainer.Name = "PlayerCards"
cardContainer.Size = UDim2.new(1, 0, 0, 0)
cardContainer.AutomaticSize = Enum.AutomaticSize.Y
cardContainer.BackgroundTransparency = 1
cardContainer.LayoutOrder = 4
cardContainer.ZIndex = 52
cardContainer.Parent = onboardScroll

local cardList = Instance.new("UIListLayout")
cardList.Padding = UDim.new(0, 4)
cardList.Parent = cardContainer

local function buildOnboardList()
	for _, c in ipairs(cardContainer:GetChildren()) do
		if c:IsA("TextButton") or c:IsA("Frame") then c:Destroy() end
	end
	local allPlayers = {player}
	for i, plr in ipairs(allPlayers) do
		local isMe   = (plr == player)
		local isLive = onboardEnabled and onboardChar ~= nil and plr.Character == onboardChar

		local card = Instance.new("TextButton")
		card.Size = UDim2.new(1, 0, 0, 52)
		card.BackgroundColor3 = isLive and Color3.fromRGB(45, 8, 8)
			or (isMe and Color3.fromRGB(30, 28, 10) or HC.bg2)
		card.BorderSizePixel = 0
		card.Text = ""
		card.LayoutOrder = i
		card.AutoButtonColor = false
		card.ZIndex = 53
		card.Parent = cardContainer
		corner(card, 6)

		if isLive then
			local stroke = Instance.new("UIStroke")
			stroke.Color = HC.accent
			stroke.Thickness = 1.5
			stroke.Parent = card
		end

		local numBg = Instance.new("Frame")
		numBg.Size = UDim2.new(0, 32, 0, 32)
		numBg.Position = UDim2.new(0, 10, 0.5, -16)
		numBg.BackgroundColor3 = HC.accent
		numBg.BorderSizePixel = 0
		numBg.ZIndex = 54
		numBg.Parent = card
		corner(numBg, 4)

		local numL = Instance.new("TextLabel")
		numL.Size = UDim2.new(1, 0, 1, 0)
		numL.BackgroundTransparency = 1
		numL.Text = tostring(i)
		numL.Font = Enum.Font.GothamBlack
		numL.TextColor3 = HC.white
		numL.TextSize = 13
		numL.ZIndex = 55
		numL.Parent = numBg

		local nameL = Instance.new("TextLabel")
		nameL.Size = UDim2.new(1, -110, 0, 20)
		nameL.Position = UDim2.new(0, 52, 0, 7)
		nameL.BackgroundTransparency = 1
		nameL.Text = plr.DisplayName or plr.Name
		nameL.Font = Enum.Font.GothamBold
		nameL.TextColor3 = isMe and HC.yellow or HC.white
		nameL.TextSize = 13
		nameL.TextXAlignment = Enum.TextXAlignment.Left
		nameL.TextTruncate = Enum.TextTruncate.AtEnd
		nameL.ZIndex = 54
		nameL.Parent = card

		local userL = Instance.new("TextLabel")
		userL.Size = UDim2.new(1, -110, 0, 14)
		userL.Position = UDim2.new(0, 52, 0, 28)
		userL.BackgroundTransparency = 1
		userL.Text = "@" .. plr.Name
		userL.Font = Enum.Font.Gotham
		userL.TextColor3 = HC.gray
		userL.TextSize = 10
		userL.TextXAlignment = Enum.TextXAlignment.Left
		userL.TextTruncate = Enum.TextTruncate.AtEnd
		userL.ZIndex = 54
		userL.Parent = card

		if isMe then
			local tag = Instance.new("TextLabel")
			tag.Size = UDim2.new(0, 30, 0, 18)
			tag.AnchorPoint = Vector2.new(1, 0.5)
			tag.Position = UDim2.new(1, -10, 0.5, 0)
			tag.BackgroundColor3 = HC.yellow
			tag.BorderSizePixel = 0
			tag.Text = "TÚ"
			tag.TextColor3 = Color3.fromRGB(0, 0, 0)
			tag.TextSize = 9
			tag.Font = Enum.Font.GothamBold
			tag.ZIndex = 55
			tag.Parent = card
			corner(tag, 3)
		elseif isLive then
			local tag = Instance.new("TextLabel")
			tag.Size = UDim2.new(0, 44, 0, 18)
			tag.AnchorPoint = Vector2.new(1, 0.5)
			tag.Position = UDim2.new(1, -10, 0.5, 0)
			tag.BackgroundColor3 = HC.accent
			tag.BorderSizePixel = 0
			tag.Text = "● LIVE"
			tag.TextColor3 = HC.white
			tag.TextSize = 9
			tag.Font = Enum.Font.GothamBold
			tag.ZIndex = 55
			tag.Parent = card
			corner(tag, 3)
		end

		card.MouseEnter:Connect(function()
			if not isLive then card.BackgroundColor3 = Color3.fromRGB(38, 18, 18) end
		end)
		card.MouseLeave:Connect(function()
			if not isLive then
				card.BackgroundColor3 = isMe and Color3.fromRGB(30, 28, 10) or HC.bg2
			end
		end)
		card.Activated:Connect(function()
			if enableOnboard() then showAlert("Onboard propio activado", HC.accent, "🎥", 20) end
			task.wait(0.05)
			buildOnboardList()
		end)
	end
end

-- =====================================================
-- ABRIR / CERRAR PANEL
-- =====================================================
local function openPanel(tab)
	isOpen = true
	overlay.Visible = true
	mainFrame.Visible = true
	buildOnboardList()
	if tab then switchTab(tab) end
end

local function closePanel()
	isOpen = false
	overlay.Visible = false
	mainFrame.Visible = false
end

floatBtn.MouseButton1Click:Connect(function()
	if isOpen then closePanel() else openPanel(nil) end
end)
closeBtnMain.MouseButton1Click:Connect(closePanel)
overlay.MouseButton1Click:Connect(closePanel)

-- =====================================================
-- TECLAS
-- =====================================================
ContextActionService:BindAction("ToggleSPAHub",
	function(_, inputState, _)
		if inputState == Enum.UserInputState.Begin then
			if isOpen then closePanel() else openPanel(nil) end
		end
		return Enum.ContextActionResult.Pass
	end,
	false, Enum.KeyCode.M
)

ContextActionService:BindAction("ToggleOnboardTab",
	function(_, inputState, _)
		if inputState == Enum.UserInputState.Begin then
			if isOpen and currentTab == "ONBOARD" then
				closePanel()
			else
				openPanel("ONBOARD")
			end
		end
		return Enum.ContextActionResult.Pass
	end,
	false, Enum.KeyCode.T, Enum.KeyCode.ButtonY
)

-- Cámara onboard propia habilitada por defecto y restaurada tras cada respawn.
player.CharacterAdded:Connect(function()
	task.defer(function()
		enableOnboard()
		if isOpen then buildOnboardList() end
	end)
end)

if player.Character then enableOnboard() end

-- =====================================================
-- REFRESH AUTOMÁTICO
-- =====================================================
task.spawn(function()
	while task.wait(2) do
		if isOpen and currentTab == "ONBOARD" then
			buildOnboardList()
		end
	end
end)

Players.PlayerAdded:Connect(function()
	task.wait(1)
	if isOpen then buildOnboardList() end
end)
Players.PlayerRemoving:Connect(function()
	task.wait(0.2)
	if isOpen then buildOnboardList() end
end)

print("✅ SPA-CONTROL HUB v4 cargado")
print("   Onboard propio automático | D-pad abajo de Xbox = mirar atrás")