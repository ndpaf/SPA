-- SPA-GLOBAL V2.23
-- V2.22.8: scalable rain density, intensity presets, track wetness and storm effects.
-- First-launch transmission calibration, fixed-speed audio and Discord Race Control remain intact.
-- V2.22.4: Brookhaven Drift calibrated from PhysicalWheel friction values.
-- Stable multi-wheel reactive detection; RAW is never displayed as a Drift level.
-- KNOWN LIMITATION: physical 2.0 is shared by Drift 1.4/1.5; no verified secondary signal.
-- FIA COLLABORATIVE RACE CONTROL · ONE RACE. ONE CONTROL ROOM.
-- TRACK TIMING & MOBILE CONTROL HOTFIX · V2.22.1
-- Presentation-only labels. Internal keys and user-provided content stay unchanged.
SPA_ENGLISH_LABELS = {
	["Choques leves acumulados"] = "Accumulated minor collisions",
	["Nivel 1"] = "Level 1",
	["Nivel 2"] = "Level 2",
	["Nivel 3"] = "Level 3",
	["Nivel 4"] = "Level 4",
	["Nivel 0"] = "Level 0",
	["Sin lím"] = "No limit",
	["BLANDA"] = "SOFT",
	["SUPER BLANDA"] = "SUPERSOFT",
	["INTERMEDIA"] = "INTERMEDIATE",
	["MEDIA"] = "MEDIUM",
	["DURA"] = "HARD",
	["NoClip detectado"] = "NoClip detected",
	["Max Vueltas"] = "Max laps",
	["Max Boxes"] = "Max pit stops",
	["Activar Modo Qualy"] = "Enable qualifying mode",
	["Vueltas Qualy"] = "Qualifying laps",
	["↺  RESETEAR TIEMPOS QUALY"] = "↺  RESET QUALIFYING TIMES",
	["Detección Vueltas"] = "Lap detection",
	["Detección Boxes"] = "Pit detection",
	["Solo Vehículos"] = "Vehicles only",
	["Mostrar Waypoints"] = "Show waypoints",
	["LAP – Ancho (studs)"] = "LAP – Width (studs)",
	["LAP – Alto (studs)"] = "LAP – Height (studs)",
	["LAP – Grosor (studs)"] = "LAP – Thickness (studs)",
	["PIT IN – Ancho (studs)"] = "PIT IN – Width (studs)",
	["PIT IN – Alto (studs)"] = "PIT IN – Height (studs)",
	["PIT IN – Grosor (studs)"] = "PIT IN – Thickness (studs)",
	["PIT OUT – Ancho (studs)"] = "PIT OUT – Width (studs)",
	["PIT OUT – Alto (studs)"] = "PIT OUT – Height (studs)",
	["PIT OUT – Grosor (studs)"] = "PIT OUT – Thickness (studs)",
	["Radio Checkpoint"] = "Checkpoint radius",
	["Posición Meta/Vuelta"] = "Start/finish line position",
	["Posición Entrada Boxes"] = "Pit entry position",
	["Posición Salida Boxes"] = "Pit exit position",
	["Mostrar nombre sobre cabeza"] = "Show overhead name",
	["Mostrar velocidad sobre cabeza"] = "Show overhead speed",
	["RESETEAR VUELTAS (todos)"] = "RESET LAPS (all)",
	["RESETEAR FAST LAPS (todos)"] = "RESET FASTEST LAPS (all)",
	["RESETEAR BOXES (todos)"] = "RESET PIT STOPS (all)",
	["OCULTAR HUD (Q)"] = "HIDE HUD (Q)",
	["Mostrar Torre"] = "Show tower",
	["↺  RESETEAR POSICIÓN TORRE"] = "↺  RESET TOWER POSITION",
	["EFECTO SUELO DETECTADO"] = "GROUND EFFECT DETECTED",
	["Uso de Boost"] = "Boost use",
	["Exceso de Speed"] = "Excessive speed setting",
	["Corner cuts acumulados"] = "Accumulated track limits infringements",
	["Posible ventaja por corte"] = "Possible advantage from cutting the track",
	["Activar choques + repeticiones (CPU+)"] = "Enable collisions + replays (CPU+)",
	["🧹  LIMPIAR RECURSOS NO ESENCIALES"] = "🧹  CLEAR NONESSENTIAL RESOURCES",
	["Mostrar gap en vez de vuelta"] = "Show gap instead of lap",
	["Gap al líder (OFF = gap al de adelante)"] = "Gap to leader (OFF = interval to car ahead)",
	["Corner cuts antes de sanción"] = "Track limits infringements before a penalty",
	["Choques leves antes de sanción"] = "Minor collisions before a penalty",
	["Gap (s) para marcar ventaja por corte"] = "Gap (s) to flag a possible track-cutting advantage",
	["Segundos de penalización al confirmar"] = "Penalty seconds upon confirmation",
	["🟡  ACTIVAR / DESACTIVAR VSC"] = "🟡  ENABLE / DISABLE VSC",
	["📋  GENERAR INFORME POST-CARRERA"] = "📋  GENERATE POST-RACE REPORT",
	["📤  ENVIAR INFORME A DISCORD"] = "📤  SEND REPORT TO DISCORD",
	["➕  SUMAR ESTA CARRERA A LA TEMPORADA"] = "➕  ADD THIS RACE TO THE SEASON",
	["📋  GENERAR REPORTE DE TEMPORADA"] = "📋  GENERATE SEASON REPORT",
	["Mostrar notificaciones"] = "Show notifications",
	["Activar DRS"] = "Enable DRS",
	["Vuelta inicial DRS"] = "DRS starting lap",
	["GAP DRS (s)"] = "DRS GAP (s)",
	["Bonus DRS"] = "DRS bonus",
	["Sanciones DRS"] = "DRS penalties",
	["Anuncios DRS"] = "DRS announcements",
	["Zonas DRS visibles"] = "Show DRS zones",
	["DRS ancho"] = "DRS width",
	["DRS altura"] = "DRS height",
	["Detección hasta END: fondo"] = "Detection depth (extend to END)",
	["ELIMINAR ÚLTIMA ZONA DRS"] = "DELETE LAST DRS ZONE",
	["ELIMINAR TODAS LAS ZONAS DRS"] = "DELETE ALL DRS ZONES",
	["Activar OT"] = "Enable OT",
	["GAP OT (s)"] = "OT GAP (s)",
	["Zona OT visible"] = "Show OT zone",
	["OT ancho"] = "OT width",
	["OT altura"] = "OT height",
	["OT fondo"] = "OT depth",
	["+ CREAR ZONA OT"] = "+ CREATE OT ZONE",
	["ELIMINAR ZONA OT"] = "DELETE OT ZONE",
	["Control de velocidad en boxes"] = "Pit lane speed monitoring",
	["Reducción en boxes"] = "Pit lane speed reduction",
	["Anunciar eventos, vueltas rápidas y sanciones en el chat"] = "Announce events, fastest laps and penalties in chat",
	["VUELTAS"] = "LAPS",
	["BOXES"] = "PITS",
	["FAST LAPS"] = "FASTEST LAPS",
	["CONFIG"] = "SETTINGS",
	["CHOQUES"] = "COLLISIONS",
	["ANÁLISIS"] = "ANALYSIS",
	["LLANTAS"] = "TIRES",
	["SANCIONES"] = "PENALTIES",
	["CARRERA"] = "RACE",
	["TODOS"] = "ALL",
	["INCIDENTES"] = "INCIDENTS",
	["QUALY"] = "QUALIFYING",
	["WP CC"] = "WAYPOINTS",
	["REGISTROS CC"] = "TRACK LIMITS LOG",
	["CONFIG CC"] = "SETTINGS",
	["CONTACTO"] = "CONTACT",
	["ALCANCE"] = "REAR-END",
	["LATERAL"] = "SIDE CONTACT",
	["FRONTAL"] = "HEAD-ON",
	["FUERTE"] = "SEVERE",
	["MODERADO"] = "MODERATE",
	["LEVE"] = "MINOR",
	["MURO"] = "WALL",
	["PERMITIDO"] = "PERMITTED",
	["SIN PERMISO"] = "WITHOUT PERMISSION",
	["ACTIVADO"] = "ACTIVATED",
	["EXCESO"] = "SPEEDING",
	["En Pista"] = "On Track",
	["En Boxes"] = "In Pits",
	["VELOCIDAD"] = "SPEED",
	["VUELO"] = "AIRBORNE",
	["SOSPECHOSO"] = "SUSPICIOUS",
	["ALERTA"] = "ALERT",
	["Carrera"] = "Race",
	["Clasificación"] = "Qualifying",
	["Circuitos y Waypoints"] = "Tracks and Waypoints",
	["Telemetría"] = "Telemetry",
	["Neumáticos"] = "Tires",
	["Replay / Análisis"] = "Replay / Analysis",
	["Configuración"] = "Settings",
	["Recorrido completo"] = "Full walkthrough",
	["BLANCO"] = "WHITE",
	["ROJO"] = "RED",
	["AZUL"] = "BLUE",
	["VERDE"] = "GREEN",
	["AMARILLO"] = "YELLOW",
	["NARANJA"] = "ORANGE",
	["MORADO"] = "PURPLE",
	["ROSA"] = "PINK",
	["GRIS"] = "GRAY",
	["EXCESO DE VELOCIDAD EN BOXES"] = "PIT LANE SPEEDING",
	["DRS PERMITIDO"] = "DRS PERMITTED",
	["DRS SIN PERMISO"] = "DRS WITHOUT PERMISSION",
	["DRS ACTIVADO"] = "DRS ACTIVATED",
	["DRS EXCESO"] = "DRS SPEEDING",
	["OT PERMITIDO"] = "OT PERMITTED",
	["OT SIN PERMISO"] = "OT WITHOUT PERMISSION",
	["OT ACTIVADO"] = "OT ACTIVATED",
	["OT EXCESO"] = "OT SPEEDING",
	["PIT PERMITIDO"] = "PIT PERMITTED",
	["PIT SIN PERMISO"] = "PIT WITHOUT PERMISSION",
	["PIT ACTIVADO"] = "PIT ACTIVATED",
	["PIT EXCESO"] = "PIT SPEEDING",
}
function SPA_EnglishLabel(value)
	return SPA_ENGLISH_LABELS[value] or value
end

SPA_VERSION = "2.23"
SPA_V222 = { version = SPA_VERSION }
SPA_V221 = { version = SPA_VERSION, connect = {}, services = {} }
SPA_Session = SPA_Session or { generation = 0, sessionId = nil, state = "IDLE", startedAt = nil, finishedAt = nil, archive = {}, MAX_ARCHIVE = 5 }
SPA_Scheduler = SPA_Scheduler or { jobs = {} }
function SPA_Scheduler:Register(name,interval,step) self.jobs[name]={interval=interval,step=step,active=true,last=0} end
function SPA_Scheduler:SetActive(name,active) if self.jobs[name] then self.jobs[name].active=active==true end end
-- Public HTTPS endpoint; leave blank to keep SPA offline. Never put secrets here.
SPA_CONNECT_BASE_URL = SPA_CONNECT_BASE_URL or ""
-- CONTROL CENTER / TUTORIAL MODE / SPA TRACK SYSTEM
SPA_V220 = { controls = {}, configRefresh = {}, stages = {}, loadingDone = false }

-- ╔══════════════════════════════════════════════════════════════════╗
-- ║  SPA-GLOBAL V2.20 · DRS / OT / PIT LIMITER                    ║
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
-- ============================================================
-- SPA VEHICLE AUDIO IDS
-- Paste only your own Roblox audio asset IDs in this section.
-- ============================================================
SPA_IDLE_SOUND_ID       = SPA_IDLE_SOUND_ID or "rbxassetid://105052546255484"
SPA_DRIVE_SOUND_ID      = SPA_DRIVE_SOUND_ID or "rbxassetid://131453640492630"
SPA_SHIFT_SOUND_ID      = SPA_SHIFT_SOUND_ID or "rbxassetid://116482222395784"
SPA_SKID_SOUND_ID       = SPA_SKID_SOUND_ID or ""
SPA_IDLE_VOLUME         = SPA_IDLE_VOLUME or 1.0
SPA_DRIVE_VOLUME        = SPA_DRIVE_VOLUME or 3.0
SPA_SHIFT_VOLUME        = SPA_SHIFT_VOLUME or 1.2
SPA_SKID_VOLUME         = SPA_SKID_VOLUME or 1.5
SPA_ENGINE_START_SPEED  = SPA_ENGINE_START_SPEED or 30
SPA_VEHICLE_AUDIO_ENABLED = SPA_VEHICLE_AUDIO_ENABLED ~= false
SPA_SHIFT_SOUNDS_ENABLED  = SPA_SHIFT_SOUNDS_ENABLED ~= false
SPA_SKID_FX_ENABLED       = SPA_SKID_FX_ENABLED ~= false
SPA_SKID_SMOKE_ENABLED    = SPA_SKID_SMOKE_ENABLED ~= false
SPA_EFFECT_MODE          = (SPA_EFFECT_MODE=="OFF" or SPA_EFFECT_MODE=="NORMAL" or SPA_EFFECT_MODE=="RAIN") and SPA_EFFECT_MODE or "NORMAL"
SPA_RAIN_INTENSITY       = (SPA_RAIN_INTENSITY=="LIGHT" or SPA_RAIN_INTENSITY=="HEAVY" or SPA_RAIN_INTENSITY=="STORM") and SPA_RAIN_INTENSITY or "HEAVY"
SPA_RAIN_DENSITY_MULTIPLIER = math.clamp(tonumber(SPA_RAIN_DENSITY_MULTIPLIER) or 10,1,20)
SPA_TRACK_DRYING_SECONDS = math.clamp(tonumber(SPA_TRACK_DRYING_SECONDS) or 300,180,480)
SPA_THUNDER_SOUND_ID     = SPA_THUNDER_SOUND_ID or ""
SPA_THUNDER_VOLUME       = math.clamp(tonumber(SPA_THUNDER_VOLUME) or 1.5,0,5)
SPA_LEAGUE_NAME         = SPA_LEAGUE_NAME or ""
SPA_DISCORD_WEBHOOK_URL = SPA_DISCORD_WEBHOOK_URL or ""
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
ENABLE_DRIFT_DEBUG             = false
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
		warn(("[SPA PERF SPIKE] module=%s duration=%.2fms%s"):format(moduleName, elapsed, extra and (" " .. tostring(extra)) or ""))
	end
	if now - (SPA_PERF.lastLog or 0) >= 10 then
		SPA_PERF.lastLog = now
		local parts = {}
		for name, d in pairs(SPA_PERF.samples) do
			parts[#parts + 1] = ("%s=%.2fms"):format(name, d.last or 0)
		end
		warn("[SPA PERF] " .. table.concat(parts, " "))
	end
end

-- V2.22.8: grouped competitive audit; it never stores secrets or visual data.
SPA_AUDIT_CONFIG = SPA_AUDIT_CONFIG or { pending = {}, sequence = 0 }
SPA_COMPETITIVE_CONFIG = SPA_COMPETITIVE_CONFIG or {
	["Max Vueltas"]=true,["Max Boxes"]=true,["Activar Modo Qualy"]=true,["Vueltas Qualy"]=true,
	["Detección Vueltas"]=true,["Detección Boxes"]=true,["Solo Vehículos"]=true,["Radio Checkpoint"]=true,
	["Activar choques + repeticiones (CPU+)"]=true,["Corner cuts antes de sanción"]=true,
	["Choques leves antes de sanción"]=true,["Gap (s) para marcar ventaja por corte"]=true,
	["Segundos de penalización al confirmar"]=true,["Activar DRS"]=true,["Vuelta inicial DRS"]=true,
	["GAP DRS (s)"]=true,["Bonus DRS"]=true,["Sanciones DRS"]=true,["Activar OT"]=true,
	["GAP OT (s)"]=true,["Control de velocidad en boxes"]=true,["Reducción en boxes"]=true,
	["Track limits detection enabled"]=true,["Debounce CC"]=true,["Ancho CC"]=true,["Alto CC"]=true,["Grosor CC"]=true,
	["Vehicle Audio"]=true,["Idle Volume"]=true,["Drive Volume"]=true,["Drive Start Speed"]=true,
	["Shift Sounds"]=true,["Shift Volume"]=true,["Skid FX"]=true,["Skid Volume"]=true,["Skid Smoke"]=true,
}
function SPA_AuditConfigChange(label, oldValue, newValue, immediate)
	if not SPA_COMPETITIVE_CONFIG[label] or tostring(oldValue)==tostring(newValue) then return end
	SPA_AUDIT_CONFIG.sequence += 1
	local seq=SPA_AUDIT_CONFIG.sequence
	local pending=SPA_AUDIT_CONFIG.pending[label]
	if not pending then pending={oldValue=oldValue}; SPA_AUDIT_CONFIG.pending[label]=pending end
	pending.newValue=newValue; pending.sequence=seq
	local function publish()
		local current=SPA_AUDIT_CONFIG.pending[label]
		if not current or current.sequence~=seq then return end
		SPA_AUDIT_CONFIG.pending[label]=nil
		if SPA_RaceControl then SPA_RaceControl:AddEvent("CONFIG_CHANGED",{
			category="CONFIG",severity="INFO",name=player and player.Name or "Operator",operator=player and player.Name or "Operator",
			configuration=label,oldValue=current.oldValue,newValue=current.newValue,title="⚙ CONFIG CHANGE",
			description=("%s: %s → %s"):format(label,tostring(current.oldValue),tostring(current.newValue)),
		}) end
	end
	if immediate then publish() else task.delay(0.75,publish) end
end
function SPA_AuditWaypoint(kind, cf)
	if not SPA_RaceControl or not cf then return end
	local p=cf.Position
	SPA_RaceControl:AddEvent("WAYPOINT_CONFIGURED",{
		category="CONFIG",severity="INFO",name=player and player.Name or "Operator",operator=player and player.Name or "Operator",
		waypoint=tostring(kind),position={x=math.round(p.X*10)/10,y=math.round(p.Y*10)/10,z=math.round(p.Z*10)/10},
		title="📍 WAYPOINT CONFIGURED",description=("%s · X %.1f Y %.1f Z %.1f"):format(tostring(kind),p.X,p.Y,p.Z),
	})
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
		warn(("[SPA HUD] stage=%s uid=%s name=%s error=%s"):format(tostring(stage), tostring(uid), tostring(name), message))
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
	gui.Name="SPA_NOTIFICATION"
	gui.ResetOnSpawn = false
	gui.DisplayOrder = 200
	gui.Parent = playerGui

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, math.min(420,Camera.ViewportSize.X-24), 0, 60)
	frame.AnchorPoint=Vector2.new(0.5,0)
	frame.Position = UDim2.new(0.5, 0, 0, yOffset or 20)
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

	frame.Position = UDim2.new(0.5, 0, 0, (yOffset or 20) - 30)
	frame.BackgroundTransparency = 1
	local tweenIn = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, 0, 0, yOffset or 20),
		BackgroundTransparency = 0.1
	})
	tweenIn:Play()

	task.delay(NOTIFICATION_DURATION - 0.4, function()
		local tweenOut = TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			Position = UDim2.new(0.5, 0, 0, (yOffset or 20) - 20),
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

-- V2.22.1 TIMING CORE: shared registration, frame-swept gates; no HTTP.
SPA_Timing = { gates={}, states={}, traces={}, last={}, best={}, overall={}, mode="LEGACY" }
function GetWaypointPlacementCFrame(source)
	local root=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	source=source or (root and root.CFrame)
	assert(source,"Operator position unavailable")
	local look=source.LookVector; local flat=Vector3.new(look.X,0,look.Z)
	if flat.Magnitude<0.001 then
		local fallback=root and root.CFrame.LookVector or Vector3.new(0,0,-1)
		flat=Vector3.new(fallback.X,0,fallback.Z)
		if flat.Magnitude<0.001 then flat=Vector3.new(0,0,-1) end
	end
	-- Placement +90 is relative to the horizontal operator heading.
	-- Legacy walls add their own +90 mesh-axis transform (X is the long axis).
	-- Direct DRS/OT frames undo that placement offset once at their adapter.
	return CFrame.lookAt(source.Position,source.Position+flat.Unit)*CFrame.Angles(0,math.rad(90),0)
end
function SPA_Timing:Mode()
	local n=0; for i=1,3 do local p=self.gates[i]; if p and p.Parent then n+=1 end end
	return n==3 and "SECTORS" or (n==0 and "LEGACY" or "INCOMPLETE")
end
function SPA_Timing:Reset(uid,clearResults)
	if uid then
		self.states[uid]=nil; self.traces[uid]=nil
		if fastLapData[uid] then fastLapData[uid].currentLapStarted=false; fastLapData[uid].lastStartTime=nil end
		if clearResults then self.last[uid]=nil; self.best[uid]=nil end
	else
		self.states={}; self.traces={}
		for _,f in pairs(fastLapData) do f.currentLapStarted=false; f.lastStartTime=nil end
		if clearResults then self.last={}; self.best={}; self.overall={} end
	end
end
function SPA_Timing:SetGate(index,cf)
	assert(RACE_STATE~="RACE" and RACE_STATE~="QUALY","End the active session before editing timing gates")
	assert(index>=1 and index<=3,"Invalid sector")
	local old=self.gates[index]
	local p=cf and createWall("SPA_SECTOR_"..index,C_BLUE,cf,Vector3.new(wpCfg.LAP.width,wpCfg.LAP.height,wpCfg.LAP.thickness)) or nil
	self.gates[index]=p; if old then old:Destroy() end
	if cf and SPA_AuditWaypoint then SPA_AuditWaypoint("SECTOR "..tostring(index),cf) end
	self:Reset(nil,true)
end
function SPA_Timing:Cross(part,a,b,detection)
	if not part or not part.Parent then return nil end
	local x,y=part.CFrame:PointToObjectSpace(a),part.CFrame:PointToObjectSpace(b)
	if (x.Z>=0)==(y.Z>=0) or math.abs(x.Z-y.Z)<1e-8 then return nil end
	local alpha=x.Z/(x.Z-y.Z); local hit=x+(y-x)*alpha
	local tol=detection and detection.detectionTolerance or 0
	local width=detection and detection.detectionWidth or part.Size.X
	local height=detection and detection.detectionHeight or part.Size.Y
	if math.abs(hit.X)<=width/2+tol and math.abs(hit.Y)<=height/2+tol then return alpha end
end
function SPA_Timing:Record(pl,now,lapTime)
	ensurePlayerData(pl); local uid=pl.UserId; local ld,fld=lapData[uid],fastLapData[uid]
	if RACE_STATE=="QUALY" and ld.lapsMade>=QUALY_LAPS then return false end
	ld.lapsMade=math.min(ld.lapsMade+1,MAX_LAPS); ld.lastLapTouch=now
	SPA_RaceControl:AddEvent("LAP",{category=RACE_STATE=="QUALY" and "QUALY" or "CARRERA",severity="INFO",uid=uid,name=getDisplayName(pl),lap=ld.lapsMade,title="🏁 LAP "..ld.lapsMade,description=getDisplayName(pl).." completed the lap"})
	SPA_RaceModes:OnLap(uid,ld.lapsMade)
	if lapTime and lapTime>0 then
		fld.lastTime=lapTime
		if not fld.bestTime or lapTime<fld.bestTime then
			fld.bestTime=lapTime
			if QUALY_MODE and RACE_STATE=="QUALY" then QUALY_BEST_TIMES[uid]=lapTime; QUALY_FIA_STATUS[uid]=FIA_EXCLUDED[uid]==true; QUALY_NAMES[uid]=getDisplayName(pl) end
			SPA_RaceControl:AddEvent("FASTEST_LAP",{category=RACE_STATE=="QUALY" and "QUALY" or "CARRERA",severity="INFO",uid=uid,name=getDisplayName(pl),bestTime=fmtTime(lapTime),title="🟣 FASTEST LAP",description=getDisplayName(pl).." — "..fmtTime(lapTime)})
		end
		local best=RACE_STATE=="QUALY" and QUALY_GLOBAL_FASTEST or RACE_GLOBAL_FASTEST
		if lapTime<best.time then
			best.time=lapTime; best.uid=uid; best.name=getDisplayName(pl)
			if RACE_STATE=="RACE" then GLOBAL_FASTEST_LAP=RACE_GLOBAL_FASTEST end
			SPA_RaceControl:AddEvent(RACE_STATE=="QUALY" and "PROVISIONAL_POLE" or "GLOBAL_FASTEST_LAP",{
				category=RACE_STATE=="QUALY" and "QUALY" or "CARRERA",severity="INFO",uid=uid,
				name=getDisplayName(pl),lap=ld.lapsMade,time=fmtTime(lapTime),timeSeconds=lapTime,
				title=RACE_STATE=="QUALY" and "PROVISIONAL POLE" or "GLOBAL FASTEST LAP",
				description=getDisplayName(pl).." — "..fmtTime(lapTime),
			})
			if ENABLE_CHAT_EVENTS and announceRaceEvent then announceRaceEvent(("🟣 FASTEST LAP — %s %s"):format(getDisplayName(pl),fmtTime(lapTime))) end
		end
	end
	fld.lastStartTime=now; fld.currentLapStarted=true
	HUD_LAST_SIGNATURE=nil; HUD_RANK_CACHE.signature=nil
	return true
end
function SPA_Timing:Hit(pl,gate,at)
	local uid=pl.UserId; ensurePlayerData(pl)
	local s=self.states[uid] or {stage="WAITING_META",touches={}}; self.states[uid]=s
	if s.touches[gate] and at-s.touches[gate]<DEBOUNCE_TIME then return end
	s.touches[gate]=at
	if gate==0 then
		if self.mode~="SECTORS" then
			local f=fastLapData[uid]
			self:Record(pl,at,f.currentLapStarted and f.lastStartTime and at-f.lastStartTime or nil)
		elseif s.stage=="WAITING_FINISH" then
			local full=at-s.lapStart; local final=at-s.sector3At
			local sum=s.sector1Time+s.sector2Time+s.sector3Time+final
			if final>0 and full>DEBOUNCE_TIME and math.abs(sum-full)<0.00001 and self:Record(pl,at,full) then
				local result={s.sector1Time,s.sector2Time,s.sector3Time,finalSplit=final,lapTime=full,name=getDisplayName(pl)}
				self.last[uid]=result; self.best[uid]=self.best[uid] or {}
				for i=1,3 do
					self.best[uid][i]=math.min(self.best[uid][i] or math.huge,result[i])
					if not self.overall[i] or result[i]<self.overall[i].time then self.overall[i]={time=result[i],uid=uid,name=getDisplayName(pl)} end
				end
				SPA_RaceControl:AddEvent("LAP_SECTORS",{category=RACE_STATE=="QUALY" and "QUALY" or "CARRERA",uid=uid,name=getDisplayName(pl),title="LAP COMPLETE",description=("S1 %.3f · S2 %.3f · S3 %.3f · LAP %s"):format(result[1],result[2],result[3],fmtTime(full)),detail=("FINAL FINISH-LINE SPLIT %.3f"):format(final)})
			end
		elseif s.stage~="WAITING_META" then
			SPA_RaceControl:AddEvent("INVALID_LAP",{category="INCIDENTES",uid=uid,title="INVALID SECTOR SEQUENCE",description=getDisplayName(pl).." · missing/out-of-order sector"})
		end
		self.states[uid]={stage="WAITING_S1",lapStart=at,touches=s.touches}
		fastLapData[uid].lastStartTime=at; fastLapData[uid].currentLapStarted=true
	elseif self.mode=="SECTORS" and s.stage~="WAITING_META" then
		if s.stage~="WAITING_S"..gate then s.stage="INVALID"; return end
		local previous=gate==1 and s.lapStart or s["sector"..(gate-1).."At"]
		if not previous or at<=previous then s.stage="INVALID"; return end
		s["sector"..gate.."At"]=at; s["sector"..gate.."Time"]=at-previous
		s.stage=gate==3 and "WAITING_FINISH" or "WAITING_S"..(gate+1)
	end
end
function SPA_Timing:Sample(pl,part,character,now)
	local uid=pl.UserId; local pos=part.Position; local prior=self.traces[uid]
	local velocity=part.AssemblyLinearVelocity.Magnitude
	local current={part=part,character=character,pos=pos,at=now,velocity=velocity}
	if prior and prior.part==part and prior.character==character then
		local dt=now-prior.at
		local maxDistance=math.max(20,((prior.velocity or velocity)+velocity)*0.5*math.max(dt,0)*2.5+8)
		if dt<=0 or dt>1 or (pos-prior.pos).Magnitude>maxDistance then self:Reset(uid)
		else
			local hits={}
			for gate=0,(self.mode=="SECTORS" and 3 or 0) do
				local p=gate==0 and lapWall or self.gates[gate]
				local alpha=self:Cross(p,prior.pos,pos,gate==0 and wpCfg.LAP or nil)
				if alpha then table.insert(hits,{gate=gate,at=prior.at+dt*alpha}) end
			end
			table.sort(hits,function(a,b) if a.at==b.at then return a.gate<b.gate end; return a.at<b.at end)
			for _,hit in ipairs(hits) do self:Hit(pl,hit.gate,hit.at) end
		end
	elseif prior then self:Reset(uid) end
	self.traces[uid]=current
end
function SPA_Timing:Update(now)
	local mode=self:Mode()
	if self.mode~=mode or self.session~=RACE_STATE then
		self:Reset(nil,RACE_STATE=="RACE" or RACE_STATE=="QUALY"); self.mode=mode; self.session=RACE_STATE
	end
	if not DETECT_LAPS or (RACE_STATE~="RACE" and RACE_STATE~="QUALY") then
		if next(self.traces) then self:Reset() end; return
	end
	for uid,st in pairs(PlayerState or {}) do
		local hum=st.humanoid
		local part=hum and hum.SeatPart or st.root
		if st.player and st.player.Character==st.character and hum and hum.Health>0 and part and part.Parent and not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid] then
			self:Sample(st.player,part,st.character,now)
		else self:Reset(uid) end
	end
end
function SPA_Timing:Report()
	local lines={"— BEST VALID SECTORS —"}
	for i=1,3 do local b=self.overall[i]; table.insert(lines,"S"..i.."  "..(b and (b.name.." · "..string.format("%.3f",b.time)) or "—")) end
	return table.concat(lines,"\n")
end
-- END V2.22.1 TIMING CORE

function _spaLapRuntimeState(reason)
	local cf = lapWall and lapWall.CFrame
	if not cf then
		warn(("[SPA LAP STATE] reason=%s state=%s detect=%s wall=missing"):format(tostring(reason), tostring(RACE_STATE), tostring(DETECT_LAPS)))
		return
	end
	warn(("[SPA LAP STATE] reason=%s state=%s detect=%s wallPos=%s look=%s up=%s"):format(
		tostring(reason), tostring(RACE_STATE), tostring(DETECT_LAPS), tostring(cf.Position), tostring(cf.LookVector), tostring(cf.UpVector)))
end

local function applyWPVisibility()
	local t = WP_VISIBLE and 0.4 or 1
	if lapWall    then lapWall.Transparency    = t end
	if pitInWall  then pitInWall.Transparency  = t end
	if pitOutWall then pitOutWall.Transparency = t end
	for _,p in pairs(SPA_Timing.gates) do if p.Parent then p.Transparency=t end end
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
centerContainer.Size = UDim2.new(0.92, 0, 0, 210)
centerContainer.AnchorPoint=Vector2.new(0.5,0.5)
centerContainer.Position = UDim2.fromScale(0.5,0.5)
Instance.new("UISizeConstraint",centerContainer).MaxSize=Vector2.new(420,210)
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
logoText.Text = "SPA-GLOBAL V" .. SPA_VERSION
logoText.TextScaled = true
logoText.TextColor3 = Color3.fromRGB(255, 255, 255)
logoText.Font = Enum.Font.GothamBlack
logoText.TextSize = 48
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
	SPA_V220.loadingDone = true
	if SPA_ControlCenter and SPA_ControlCenter.initialized then SPA_ControlCenter:Open() end
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
	titleText   = "SPA GLOBAL",
	visible     = true,
	hudMasterVisible = true,  -- [SPAV4] Master HUD visibility (Q key), without a new local
}

towerContainer = Instance.new("ScrollingFrame")
towerContainer.CanvasSize=UDim2.new()
towerContainer.ScrollingDirection=Enum.ScrollingDirection.Y
towerContainer.ScrollBarThickness=6
towerContainer.ScrollBarImageColor3=C_RED
towerContainer.BorderSizePixel=0
towerContainer.Active=true
towerContainer.Name = "TowerContainer"
towerContainer.Size = UDim2.new(0, TOWER_WIDTH, 0, 30)
towerContainer.Position = UDim2.new(towerConfig.posX, towerConfig.offsetX, towerConfig.posY, towerConfig.offsetY)
towerContainer.BackgroundTransparency = 1
towerContainer.ClipsDescendants = true
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
	if SPA_Mobile then
		tw=towerContainer.Size.X.Offset
		local p=towerContainer.Position
		topPos=UDim2.new(p.X.Scale,p.X.Offset,p.Y.Scale,p.Y.Offset-46)
		bottomPos=UDim2.new(p.X.Scale,p.X.Offset,p.Y.Scale,p.Y.Offset-2)
		bottomH=math.min(bottomH,towerContainer.Size.Y.Offset+2)
	end
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
titleTxt.Text = "SPA-GLOBAL V" .. SPA_VERSION .. "  —  RACE CONTROL"
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
	listeners = {},
	nextListener = 0,
	lastPositions = {},
	pendingPositions = {},
	rejoiningPositions = {},
	POSITION_DEBOUNCE = 0.75,
	suppressNextPositionChange = false,
}

function SPA_RaceControl:Subscribe(callback)
	assert(type(callback)=="function","Race Control subscriber must be a function")
	self.nextListener+=1
	local id=self.nextListener
	self.listeners[id]=callback
	return {Disconnect=function() self.listeners[id]=nil end}
end

function SPA_RaceControl:AddEvent(eventType, data)
	local ok, event = pcall(function()
		data = type(data) == "table" and data or {}
		self.nextId += 1
		local item = {
			id = self.nextId,
			type = tostring(eventType or "EVENT"),
			timestamp = tick(),
			clockText = os.date("%H:%M:%S"),
			sessionGeneration = SPA_Session and SPA_Session.generation or 0,
			sessionId = SPA_Session and SPA_Session.sessionId or nil,
		}
		for key, value in pairs(data) do
			if key ~= "id" and key ~= "timestamp" and key ~= "clockText" then item[key] = value end
		end
		tinsert(self.events, 1, item)
		while #self.events > self.MAX_EVENTS do table.remove(self.events) end
		if self.onEventFn then pcall(self.onEventFn, item) end
		for _,listener in pairs(self.listeners) do
			local listenerOK,listenerError=pcall(listener,item)
			if not listenerOK then warn("[SPA_RaceControl] Subscriber error:",listenerError) end
		end
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
	title.BackgroundTransparency = 1; title.Text = "ADMINISTRATOR CGF1 — RACE CONTROL"
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
	local detailScroll=createScrollingList(detail); detailScroll.Position=UDim2.fromOffset(8,8); detailScroll.Size=UDim2.new(1,-16,1,-62); detailScroll.ZIndex=21
	local detailText = Instance.new("TextLabel")
	detailText.Size = UDim2.new(1, -16, 1, -42); detailText.Position = UDim2.new(0, 8, 0, 8)
	detailText.BackgroundTransparency = 1; detailText.TextWrapped = true; detailText.TextYAlignment = Enum.TextYAlignment.Top
	detailText.Font = Enum.Font.Gotham; detailText.TextSize = 12; detailText.TextColor3 = C_WHITE
	detailText.TextXAlignment = Enum.TextXAlignment.Left; detailText.ZIndex = 21; detailText.Size=UDim2.new(1,-12,0,180); detailText.AutomaticSize=Enum.AutomaticSize.Y; detailText.Parent = detailScroll
	local closeDetail = Instance.new("TextButton")
	closeDetail.Size = UDim2.new(0, 110, 0, 44); closeDetail.Position = UDim2.new(1, -118, 1, -50)
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
			if event.reason then table.insert(lines, "Reason: " .. tostring(SPA_EnglishLabel(event.reason))) end
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
		SPA_Timing:Reset(uid,true)
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
		if SPA_PitsControl and not SPA_PitsControl:CanEdit() then return end
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

-- V2.22.1 ONBOARD CORE: one ordered roster for keyboard, menu and touch.
SPA_Onboard = { drivers={}, current=nil, departing={}, active=false }
function SPA_Onboard:Valid(pl)
	local char=pl and pl.Character
	local hum=char and char:FindFirstChildOfClass("Humanoid")
	return pl and pl~=player and pl.Parent and not self.departing[pl.UserId] and not FIA_EXCLUDED[pl.UserId] and not DSQ_DRIVERS[pl.UserId]
		and char and char:FindFirstChild("HumanoidRootPart") and hum and hum.Health>0
end
function SPA_Onboard:Refresh()
	self.drivers=Players:GetPlayers()
	table.sort(self.drivers,function(a,b) return a.UserId<b.UserId end)
end
function SPA_Onboard:Switch(direction)
	if not self.active then return end
	local n=#self.drivers; local at=direction>0 and 0 or 1
	for i,pl in ipairs(self.drivers) do if pl==self.current then at=i; break end end
	for step=1,n do
		local index=((at-1+direction*step)%n)+1; local pl=self.drivers[index]
		if self:Valid(pl) then self.setDriver(pl,index); return end
	end
	self.stop()
end
function SPA_Onboard:Paint()
	if not self.touch then return end
	self.touch.Visible=self.active and UserInputService.TouchEnabled
	local pos=nil; for i,uid in ipairs(CURRENT_STANDINGS_ORDER) do if self.current and uid==self.current.UserId then pos=i; break end end
	self.touchLabel.Text=self.current and ((pos and ("P"..pos.." · ") or "")..getDisplayName(self.current)) or "NO DRIVER"
end
function SPA_Onboard:BuildTouch()
	local row=Instance.new("Frame"); row.Name="SPA_OnboardTouch"; row.Size=UDim2.new(0.92,0,0,60)
	row.AnchorPoint=Vector2.new(0.5,0.5); row.Position=UDim2.fromScale(0.5,0.62); row.BackgroundTransparency=1; row.Visible=false; row.Parent=mainGui
	local limit=Instance.new("UISizeConstraint"); limit.MaxSize=Vector2.new(500,60); limit.Parent=row
	self.touch=row
	local label=Instance.new("TextLabel"); label.Size=UDim2.new(1,-136,1,0); label.Position=UDim2.fromOffset(68,0)
	label.BackgroundColor3=C_BG; label.BackgroundTransparency=0.2; label.TextColor3=C_WHITE; label.TextWrapped=true; label.TextSize=14; label.Font=Enum.Font.GothamBold; label.Parent=row; self.touchLabel=label
	for i,direction in ipairs({-1,1}) do
		local b=Instance.new("TextButton"); b.Name=direction<0 and "PreviousDriver" or "NextDriver"
		b.Size=UDim2.fromOffset(60,60); b.Position=UDim2.new(i-1,i==1 and 0 or -60,0,0)
		b.BackgroundColor3=C_BG2; b.BackgroundTransparency=0.15; b.Text=direction<0 and "◀" or "▶"; b.TextColor3=C_WHITE; b.Font=Enum.Font.GothamBlack; b.TextSize=26; b.AutoButtonColor=true; b.Parent=row
		Instance.new("UICorner",b).CornerRadius=UDim.new(0,10)
		b.Activated:Connect(function() self:Switch(direction) end)
	end
	UserInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(function() self:Paint() end)
end
-- END V2.22.1 ONBOARD CORE

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
		{name="BLANCO",   color=Color3.fromRGB(255,255,255)},
		{name="ROJO",     color=Color3.fromRGB(230,0,0)},
		{name="AZUL",     color=Color3.fromRGB(0,120,255)},
		{name="VERDE",    color=Color3.fromRGB(0,210,90)},
		{name="AMARILLO", color=Color3.fromRGB(255,200,0)},
		{name="NARANJA",  color=Color3.fromRGB(255,130,0)},
		{name="MORADO",   color=Color3.fromRGB(160,0,220)},
		{name="CYAN",     color=Color3.fromRGB(0,220,220)},
		{name="ROSA",     color=Color3.fromRGB(255,80,180)},
		{name="GRIS",     color=Color3.fromRGB(160,160,170)},
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
			colorBtn.Text = SPA_EnglishLabel(COLOR_PALETTE[colorIdx].name)
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
				colorBtn.Text = SPA_EnglishLabel(opt.name)
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
				local oldValue=customPlayerData[uid].speedLimit
				customPlayerData[uid].speedLimit=n; spdBox.Text=n and tostring(n) or ""
				if tostring(oldValue)~=tostring(n) then SPA_RaceControl:AddEvent("DRIVER_SPEED_LIMIT_CHANGED",{category="CONFIG",severity="INFO",uid=uid,name=getDisplayName(plr),operator=player.Name,oldValue=oldValue,newValue=n,title="DRIVER SPEED LIMIT",description=getDisplayName(plr)..": "..tostring(oldValue or "GLOBAL").." → "..tostring(n or "GLOBAL")}) end
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
			trbBtn.Text=SPA_EnglishLabel(SPA_Telemetry.TURBO_CYCLE[trbIdx]); trbBtn.Parent=row
			Instance.new("UICorner",trbBtn).CornerRadius=UDim.new(0,3)
			trbBtn.MouseButton1Click:Connect(function()
				trbIdx=trbIdx%#SPA_Telemetry.TURBO_CYCLE+1
				trbBtn.Text=SPA_EnglishLabel(SPA_Telemetry.TURBO_CYCLE[trbIdx])
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
			spBtn.Text=SPA_EnglishLabel(SPA_Telemetry.SUSP_CYCLE[spIdx]); spBtn.Parent=row
			Instance.new("UICorner",spBtn).CornerRadius=UDim.new(0,3)
			spBtn.MouseButton1Click:Connect(function()
				spIdx=spIdx%#SPA_Telemetry.SUSP_CYCLE+1
				spBtn.Text=SPA_EnglishLabel(SPA_Telemetry.SUSP_CYCLE[spIdx])
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
			drfBox.PlaceholderText="e.g. 1.0"; drfBox.ClearTextOnFocus=false
			drfBox.TextXAlignment=Enum.TextXAlignment.Left; drfBox.Parent=row
			Instance.new("UICorner",drfBox).CornerRadius=UDim.new(0,3)
			drfBox.FocusLost:Connect(function()
				local valid,n=_telValidateDriftLimit(drfBox.Text)
				if not valid then
					local previous=customPlayerData[uid] and customPlayerData[uid].maxDrift
					drfBox.Text=previous and tostring(previous) or ""
					showNotification("MAX DRIFT: 0.1–1.5 · blank = unlimited",C_RED,"💨",20)
					return
				end
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
		if not SPA_Onboard:Valid(plr) then return end
		if not isSpectating then
			isSpectating = true
			originalCameraType    = Camera.CameraType
			originalCameraSubject = Camera.CameraSubject

			spectRenderConnection = RunService.RenderStepped:Connect(function()
				if not (isSpectating and targetSpectPlayer) then return end
				if not SPA_Onboard:Valid(targetSpectPlayer) then SPA_Onboard:Switch(1); return end
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
		SPA_Onboard.current=plr; SPA_Onboard.active=true; SPA_Onboard:Paint()

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
		SPA_Onboard.active=false; SPA_Onboard.current=nil; SPA_Onboard:Paint()
		for _, btn in ipairs(onboardScroll:GetChildren()) do
			if btn:IsA("TextButton") and btn.Name:match("^OB_") then btn.BackgroundColor3 = C_BG2 end
		end
	end

	SPA_Onboard.setDriver=spectatePlayerFunc; SPA_Onboard.stop=stopSpectatingFunc
	SPA_Onboard:Refresh(); SPA_Onboard:BuildTouch()
	local function cycleSpectateTarget(direction) SPA_Onboard:Switch(direction) end

	local function buildOnboardList()
		for _, c in ipairs(onboardScroll:GetChildren()) do
			if c:IsA("TextButton") or c:IsA("TextLabel") or c:IsA("Frame") then c:Destroy() end
		end
		makeSectionHeader(onboardScroll, "📹  TRACKING CAMERA", 0)
		if SPA_Timing.panel then SPA_Timing:AddOnboardShortcut() end
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
	Players.PlayerAdded:Connect(function() SPA_Onboard:Refresh(); task.wait(1); buildOnboardList() end)
	Players.PlayerRemoving:Connect(function(pl)
		SPA_Onboard.departing[pl.UserId]=true
		if targetSpectPlayer==pl then SPA_Onboard:Switch(1) end
		task.defer(function() SPA_Onboard:Refresh(); buildOnboardList(); SPA_Onboard.departing[pl.UserId]=nil end)
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
	candidates= {},
	states    = {},
	CELL_SIZE = 50,
	CANDIDATE_WINDOW = 0.35,
	log       = {},
	scratch   = { impacted = {}, impactedList = {}, processed = {} },
	rebuildFn = nil,
	uiDirty   = true,
	uiVisible = false,
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

function SPA_Crash:RefreshUI()
	self.uiDirty=true
	if self.uiVisible and self.rebuildFn then self.rebuildFn(); self.uiDirty=false end
end

function SPA_Crash:RecordPair(uidA,a,uidB,b,dist,impactMag)
	local key=uidA<uidB and (uidA.."_"..uidB) or (uidB.."_"..uidA); local now=tick()
	if self.pairCD[key] and now-self.pairCD[key]<self.COOLDOWN_PAIR then return false end
	self.pairCD[key]=now
	local tipo=_crashType(a.vel,a.pos,b.pos); local sev,sevColor=_crashSeverity(impactMag)
	local nA=getDisplayName(a.player); local nB=getDisplayName(b.player)
	local kmhA=mfloor(a.vel.Magnitude*0.28*3.6*CAL_FACTOR+0.5); local kmhB=mfloor(b.vel.Magnitude*0.28*3.6*CAL_FACTOR+0.5)
	table.insert(self.log,1,{time=os.date("%H:%M:%S"),type=tipo,sev=sev,sevColor=sevColor,nameA=nA,nameB=nB,speedA=kmhA,speedB=kmhB,delta=mfloor(impactMag),dist=mfloor(dist),wall=false})
	if #self.log>self.MAX_LOG then table.remove(self.log) end
	SPA_RaceControl:AddEvent("CRASH",{category="INCIDENTES",severity="WARN",uid=uidA,uidA=uidA,uidB=uidB,name=nA.." ↔ "..nB,severityName=sev,title="💥 INCIDENT",description=nA.." ↔ "..nB.." — "..SPA_EnglishLabel(tipo).." — ΔV "..tostring(mfloor(impactMag)),lap=lapData[uidA] and lapData[uidA].lapsMade or 0,speed=kmhA,evidence="PAIR_DISTANCE_CLOSING_DV"})
	if SPA_VehicleAudio then SPA_VehicleAudio:OnCrash(uidA,sev); SPA_VehicleAudio:OnCrash(uidB,sev) end
	if _rpCapture then _rpCapture(uidA,nA,uidB,nB,impactMag,(a.pos+b.pos)*0.5) end
	self.states[uidA]={state="CONFIRMED",at=now}; self.states[uidB]={state="CONFIRMED",at=now}
	task.defer(function() self.states[uidA]={state="COOLDOWN",untilAt=now+self.COOLDOWN_PAIR}; self.states[uidB]={state="COOLDOWN",untilAt=now+self.COOLDOWN_PAIR} end)
	self:RefreshUI(); return true
end

function SPA_Crash:RecordWall(uid,a,hit,impactMag)
	local now=tick(); if self.wallCD[uid] and now-self.wallCD[uid]<self.COOLDOWN_WALL then return false end
	self.wallCD[uid]=now
	local sev,sevColor=_crashSeverity(impactMag); local nA=getDisplayName(a.player); local kmhA=mfloor(a.prevVel.Magnitude*0.28*3.6*CAL_FACTOR+0.5)
	table.insert(self.log,1,{time=os.date("%H:%M:%S"),type="MURO",sev=sev,sevColor=sevColor,nameA=nA,nameB=nil,speedA=kmhA,speedB=0,delta=mfloor(impactMag),dist=hit.Distance,wall=true})
	if #self.log>self.MAX_LOG then table.remove(self.log) end
	SPA_RaceControl:AddEvent("CRASH",{category="INCIDENTES",severity="WARN",uid=uid,name=nA,severityName=sev,title="💥 INCIDENT",description=nA.." — WALL — ΔV "..tostring(mfloor(impactMag)),lap=lapData[uid] and lapData[uid].lapsMade or 0,speed=kmhA,evidence="STATIC_RAYCAST_NORMAL_DV"})
	if SPA_VehicleAudio then SPA_VehicleAudio:OnCrash(uid,sev) end
	if _rpCapture then _rpCapture(uid,nA,nil,nil,impactMag,a.pos) end
	self.states[uid]={state="CONFIRMED",at=now}; task.defer(function() self.states[uid]={state="COOLDOWN",untilAt=now+self.COOLDOWN_WALL} end)
	self:RefreshUI(); return true
end

function _setupCollisionDetection()
	local _tCrash = 0
	RunService.Heartbeat:Connect(function(dt)
		if not ENABLE_CRASH_SYSTEM then return end
		_tCrash += dt
		if _tCrash < 0.1 then return end   -- 10 Hz — less load than before (previously 20 Hz)
		_tCrash = 0
		local perfCrashStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil; local now=tick(); local buckets={}
		for uid,st in pairs(PlayerState) do
			local vel=st.inVehicle and st.velocity; local pos=st.vehiclePosition
			if FIA_EXCLUDED[uid] or not vel or not pos or (pitData[uid] and pitData[uid].status=="En Boxes") then SPA_Crash.prevVel[uid]=nil; SPA_Crash.candidates[uid]=nil; SPA_Crash.states[uid]={state="IDLE"}; continue end
			local prevVel=SPA_Crash.prevVel[uid] or vel; local prevPos=SPA_Crash.prevPos and SPA_Crash.prevPos[uid] or pos
			SPA_Crash.prevVel[uid]=vel; SPA_Crash.prevPos=SPA_Crash.prevPos or {}; SPA_Crash.prevPos[uid]=pos
			local data={uid=uid,player=st.player,pos=pos,prevPos=prevPos,vel=vel,prevVel=prevVel,delta=(vel-prevVel).Magnitude,seat=st.seat}
			local crashState=SPA_Crash.states[uid]
			if not crashState or (crashState.state=="COOLDOWN" and now>=(crashState.untilAt or 0)) then SPA_Crash.states[uid]={state="IDLE"} end
			local cell=math.floor(pos.X/SPA_Crash.CELL_SIZE)..":"..math.floor(pos.Z/SPA_Crash.CELL_SIZE); buckets[cell]=buckets[cell] or {}; buckets[cell][#buckets[cell]+1]=data
			local vertical=mabs((vel-prevVel).Y); local moved=(pos-prevPos).Magnitude; local ld=lapData[uid]
			if data.delta>=SPA_Crash.THRESHOLD and math.max(vel.Magnitude,prevVel.Magnitude)>=SPA_Crash.MIN_SPEED and vertical<data.delta*0.68 and moved<80 and not (ld and ld.lastLapTouch and now-ld.lastLapTouch<SPA_Crash.GRACE_LAP) then
				data.state="CANDIDATE"; data.at=now; data.expires=now+SPA_Crash.CANDIDATE_WINDOW; SPA_Crash.candidates[uid]=data; SPA_Crash.states[uid]=data
				if SPA_Replay and SPA_Replay.Activate then SPA_Replay:Activate(uid,now+SPA_Replay.POST_SEC) end
			end
		end
		SPA_PerfMark("CrashCandidate",perfCrashStart)
		local perfConfirmStart=ENABLE_PERF_DIAGNOSTICS and os.clock() or nil; local processed={}
		for uid,a in pairs(SPA_Crash.candidates) do
			if a.expires<now then SPA_Crash.candidates[uid]=nil; SPA_Crash.states[uid]={state="IDLE"}; continue end
			local cx,cz=math.floor(a.pos.X/SPA_Crash.CELL_SIZE),math.floor(a.pos.Z/SPA_Crash.CELL_SIZE); local confirmed=false
			for dx=-1,1 do for dz=-1,1 do
				for _,b in ipairs(buckets[(cx+dx)..":"..(cz+dz)] or {}) do
					if b.uid==uid or processed[b.uid] then continue end
					local dist=(a.pos-b.pos).Magnitude; if dist>SPA_Crash.RADIUS or dist<0.01 then continue end
					local dir=(b.pos-a.pos).Unit; local closing=(a.prevVel-b.prevVel):Dot(dir); local priorDist=(a.prevPos-b.prevPos).Magnitude
					if b.delta>=SPA_Crash.THRESHOLD*0.35 and closing>=6 and priorDist>=dist-0.5 then
						local impact=math.max(a.delta,b.delta,(a.prevVel-b.prevVel).Magnitude*0.6)
						if SPA_Crash:RecordPair(uid,a,b.uid,b,dist,impact) then processed[uid]=true; processed[b.uid]=true; SPA_Crash.candidates[b.uid]=nil; confirmed=true end
						break
					end
				end
				if confirmed then break end
			end end; if confirmed then SPA_Crash.candidates[uid]=nil; continue end
			local motion=a.pos-a.prevPos
			if motion.Magnitude>=0.5 and motion.Magnitude<=30 then
				local params=RaycastParams.new(); params.FilterType=Enum.RaycastFilterType.Exclude; params.FilterDescendantsInstances={a.player.Character,_telGetRootModel(a.seat)}; params.IgnoreWater=true
				local ray=Workspace:Raycast(a.prevPos,motion.Unit*(motion.Magnitude+2),params)
				if ray and ray.Instance and ray.Instance:IsA("BasePart") and ray.Instance.Anchored and ray.Instance.CanCollide and a.prevVel.Magnitude>0 then
					local opposed=ray.Normal:Dot(a.prevVel.Unit)<-0.45
					if opposed and ray.Distance<=motion.Magnitude+2 and SPA_Crash:RecordWall(uid,a,ray,a.delta) then processed[uid]=true; SPA_Crash.candidates[uid]=nil end
				end
			end
		end
		SPA_PerfMark("CrashConfirm",perfConfirmStart); SPA_PerfMark("Crash",perfCrashStart)
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
	SPA_Crash.uiVisible=choquesFrame.Visible
	choquesFrame:GetPropertyChangedSignal("Visible"):Connect(function()
		SPA_Crash.uiVisible=choquesFrame.Visible
		if choquesFrame.Visible and SPA_Crash.uiDirty then rebuildChoquesUI(); SPA_Crash.uiDirty=false end
	end)
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
	uiDirty      = true,
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

		for uid in pairs(SPA_Analysis.data) do
			if not PlayerState[uid] then SPA_Analysis.data[uid] = nil; dirty = true end
		end

		for uid,st in pairs(PlayerState) do
			local p=st.player
			if p == player then continue end  -- Do not analyze the local player
			local hrp=st.root; local hum=st.humanoid
			if not hrp or not hum then continue end

			local d       = _initData(uid)
			local pos     = hrp.Position
			local speed   = st.characterSpeed or 0
			local inVeh=st.inVehicle

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

		if dirty then
			SPA_Analysis.uiDirty=true
			if SPA_Analysis.rebuildFn and tabFrames["ANÁLISIS"] and tabFrames["ANÁLISIS"].Visible then SPA_Analysis.rebuildFn(); SPA_Analysis.uiDirty=false end
		end
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
		SPA_Analysis.uiDirty=false
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
	analFrame:GetPropertyChangedSignal("Visible"):Connect(function()
		if analFrame.Visible and (SPA_Analysis.uiDirty or (SPA_Replay and SPA_Replay.uiDirty)) then rebuildAnalUI(); if SPA_Replay then SPA_Replay.uiDirty=false end end
	end)
end

-- ════════════════════════════════════════════════════════════════
-- ███  SPA TELEMETRY · TURBO · DRIFT · SUSPENSION (SPAV4)  █████
-- Globals → 0 new top-level locals.
-- ════════════════════════════════════════════════════════════════
SPA_Telemetry = {
	DRIFT_EPSILON = 0.01,
	DRIFT_SETTLE_TIME = 0.10,
	DRIFT_UNKNOWN_HOLD = 0.15,
	DRIFT_PHYSICAL_TO_SPA = {
		{physical=0.15,spa=0.1}, {physical=0.30,spa=0.2}, {physical=0.45,spa=0.3},
		{physical=0.60,spa=0.4}, {physical=0.75,spa=0.5}, {physical=0.90,spa=0.6},
		{physical=1.05,spa=0.7}, {physical=1.20,spa=0.8}, {physical=1.35,spa=0.9},
		{physical=1.50,spa=1.0}, {physical=1.65,spa=1.1}, {physical=1.80,spa=1.2},
		{physical=1.95,spa=1.3}, {physical=2.00,minimum=1.4,maximum=1.5},
	},
	SUSP_LEVELS  = {{1.7,"Nivel 1"},{2.5,"Nivel 2"},{2.0,"Nivel 3"},{3.0,"Nivel 4"}},
	TURBO_LEVELS = {{11.3,"Nivel 0"},{27.9,"Nivel 1"},{44.5,"Nivel 2"},{61.1,"Nivel 3"}},
	TURBO_CYCLE  = {"Sin lím","Nivel 0","Nivel 1","Nivel 2","Nivel 3"},
	SUSP_CYCLE   = {"Sin lím","Nivel 1","Nivel 2","Nivel 3","Nivel 4"},
	TURBO_IDX    = {["Nivel 0"]=1,["Nivel 1"]=2,["Nivel 2"]=3,["Nivel 3"]=4},
	SUSP_IDX     = {["Nivel 1"]=1,["Nivel 2"]=2,["Nivel 3"]=3,["Nivel 4"]=4},
	alerts       = {},
	-- RAW physical friction selected by initial consensus or the latest settled wheel event.
	-- Wheel changes are reactive; contradictory transitions are briefly coalesced.
	-- No remapped/display value is ever stored in latestDrift.
	latestDrift  = {},
	suspCache    = {},
	turboCache   = {},
	-- [DRIFT FIX] Active connections per UID (disconnect when leaving the vehicle)
	driftConns   = {},
	current      = {},
	rootBySeat   = setmetatable({},{__mode="k"}),
}

function _telGetRootModel(seat)
	if not seat then return nil end
	local cachedRoot=SPA_Telemetry.rootBySeat[seat]
	if cachedRoot and cachedRoot.Parent and (seat==cachedRoot or seat:IsDescendantOf(cachedRoot)) then return cachedRoot end
	-- Score ancestors and prefer the complete vehicle model, not a wheel/seat submodel.
	local assembly = seat.AssemblyRootPart
	local cur = seat.Parent
	local nearest,best,bestScore=nil,nil,-math.huge
	while cur and cur ~= Workspace do
		if cur:IsA("Model") then
			nearest = nearest or cur
			local score=0
			if seat:IsDescendantOf(cur) then score+=3 end
			if assembly and assembly:IsDescendantOf(cur) then score+=2 end
			if cur:FindFirstChild("Wheels",true) then score+=4 end
			if cur:FindFirstChild("Body",true) then score+=3 end
			if cur:FindFirstChild("Chassis",true) then score+=3 end
			if cur:FindFirstChild("PhysicalWheel",true) then score+=3 end
			if #cur:GetChildren()<2 then score-=4 end
			if score>bestScore then best,bestScore=cur,score end
		end
		cur = cur.Parent
	end
	return (bestScore>=7 and best) or nearest or seat
end

-- PhysicalWheel calibration supplied for V2.22.4. Never round RAW before matching.
function _telPhysicalToDrift(raw)
	if type(raw) ~= "number" or raw ~= raw or mabs(raw) == math.huge then return nil,"UNKNOWN" end
	local best, distance = nil, math.huge
	for _,entry in ipairs(SPA_Telemetry.DRIFT_PHYSICAL_TO_SPA) do
		local delta=mabs(raw-entry.physical)
		if delta<=SPA_Telemetry.DRIFT_EPSILON and delta<distance then best=entry; distance=delta end
	end
	if not best then return nil,"UNKNOWN" end
	if best.spa then return best.spa,"RESOLVED",best.spa,best.spa,best.physical end
	-- No verified secondary vehicle signal is available in this project.
	-- Names/attributes/remotes alone are not evidence of the visible 1.4/1.5 setting.
	return nil,"AMBIGUOUS_MAX",best.minimum,best.maximum,best.physical
end

-- Receives a resolved SPA value, never PhysicalWheel RAW.
function _telFormatDrift(value,status)
	if status=="AMBIGUOUS_MAX" then return "1.4/1.5" end
	if type(value)~="number" or value~=value or mabs(value)==math.huge then return "N/A" end
	return sformat("%.1f",value)
end

function _telValidateDriftLimit(text)
	if type(text)~="string" then return false end
	if text:match("^%s*$") then return true,nil end
	local value=tonumber(text)
	if not value or value~=value or value<0.1 or value>1.5 then return false end
	return true,value
end

function _telDriftExceeds(lower,upper,limit)
	if type(limit)~="number" or limit~=limit or limit<0.1 or limit>1.5 then return false,"INVALID_LIMIT" end
	if not lower or not upper then return false,"UNKNOWN" end
	if lower>limit then return true,"VIOLATION" end
	if upper>limit then return false,"AMBIGUOUS" end
	return false,"WITHIN_LIMIT"
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

-- Read-only reactive Drift: one initial scan, then wheel/property lifecycle signals.
function _telReadDriftFriction(part)
	local okCustom,custom=pcall(function() return part.CustomPhysicalProperties end)
	if okCustom and custom and type(custom.Friction)=="number" and custom.Friction==custom.Friction then return custom.Friction,"CUSTOM" end
	local okCurrent,current=pcall(function() return part.CurrentPhysicalProperties end)
	if okCurrent and current and type(current.Friction)=="number" and current.Friction==current.Friction then return current.Friction,"CURRENT" end
	return nil,"UNAVAILABLE"
end

function SPA_Telemetry:IsDriftWheel(part,root)
	if not part or not part:IsA("BasePart") then return false,nil end
	local name=part.Name:lower()
	if name=="physicalwheel" or name:find("physicalwheel",1,true) then return true,"PHYSICALWHEEL" end
	local inWheels=false; local node=part.Parent
	while node and node~=root do if node.Name:lower()=="wheels" then inWheels=true; break end; node=node.Parent end
	if not inWheels then return false,nil end
	local rear=name:find("rear",1,true) or name:find("back",1,true) or name=="rl" or name=="rr" or name:find("leftrear",1,true) or name:find("rightrear",1,true)
	local customOk,custom=pcall(function() return part.CustomPhysicalProperties end)
	if rear and customOk and custom then return true,"REAR_PHYSICAL" end
	return false,nil
end

function SPA_Telemetry:DiscoverDriftWheels(seat,vehicleRoot)
	local root=vehicleRoot or _telGetRootModel(seat); local found={}
	if not root then return found end
	local anchor=(root:IsA("Model") and root.PrimaryPart) or seat
	for _,part in ipairs(root:GetDescendants()) do
		local valid,evidence=self:IsDriftWheel(part,root)
		if valid then
			local raw,source=_telReadDriftFriction(part); local localZ=0
			pcall(function() localZ=anchor.CFrame:PointToObjectSpace(part.Position).Z end)
			local n=part.Name:lower(); local rear=n:find("rear",1,true) or n:find("back",1,true) or n=="rl" or n=="rr" or localZ>0.2
			found[#found+1]={part=part,raw=raw,source=source,role=rear and "REAR" or "OTHER",evidence=evidence,localZ=localZ}
		end
	end
	return found
end

function _telDriftCancelTimer(state)
	if state.timer then pcall(task.cancel,state.timer); state.timer=nil end
end

function _telDriftRefresh(state)
	if SPA_Telemetry.driftConns[state.key]~=state then return end
	local groups,total,largest={},0,nil
	local rawMin,rawMax=math.huge,-math.huge
	for _,wheel in pairs(state.wheels) do
		total+=1
		local raw=wheel.raw
		if raw then rawMin=math.min(rawMin,raw); rawMax=math.max(rawMax,raw) end
		local _,_,_,_,physical=_telPhysicalToDrift(raw)
		if physical then
			local group=groups[physical]
			if not group then group={count=0,raw=raw,wheel=wheel}; groups[physical]=group end
			group.count+=1; group.raw=math.min(group.raw,raw) -- actual observation, not an average
			if not largest or group.count>largest.count then largest=group end
		end
	end
	local recent=state.lastChanged and state.wheels[state.lastChanged]
	local _,_,_,_,recentPhysical=_telPhysicalToDrift(recent and recent.raw)
	local chosen,chosenWheel=nil,nil; local authority="UNRESOLVED"
	if recentPhysical then chosen=recent.raw; chosenWheel=recent; authority="RECENT_CHANGED" end
	if not chosen then
		local rearGroups,rearLargest={},nil
		for _,wheel in pairs(state.wheels) do
			local _,_,_,_,physical=_telPhysicalToDrift(wheel.raw)
			if wheel.role=="REAR" and physical then
				local g=rearGroups[physical] or {count=0,raw=wheel.raw,wheel=wheel}; rearGroups[physical]=g; g.count+=1
				if not rearLargest or g.count>rearLargest.count then rearLargest=g end
			end
		end
		if rearLargest then chosen=rearLargest.raw; chosenWheel=rearLargest.wheel; authority="REAR_CLUSTER" end
	end
	if not chosen and largest then chosen=largest.raw; chosenWheel=largest.wheel; authority="STABLE_CLUSTER" end

	if total==0 then
		_telDriftCancelTimer(state); state.pendingSince=nil; state.pending=false; state.stableRaw=nil
		SPA_Telemetry.latestDrift[state.key]=nil
		return
	end
	if chosen and recent and recentPhysical then
		-- Contradictory updates coalesce for 100 ms. Unknowns retain the previous
		-- same-vehicle display for at most 150 ms, without issuing stale alerts.
		state.pendingSince=state.pendingSince or tick()
		local delay=chosen and SPA_Telemetry.DRIFT_SETTLE_TIME or SPA_Telemetry.DRIFT_UNKNOWN_HOLD
		local remaining=delay-(tick()-state.pendingSince)
		if remaining>0.000001 then
			state.pending=true
			if not state.timer then
				state.timer=task.delay(remaining,function()
					state.timer=nil
					if SPA_Telemetry.driftConns[state.key]==state then _telDriftRefresh(state) end
				end)
			end
			return
		end
	end
	_telDriftCancelTimer(state); state.pendingSince=nil; state.pending=false
	-- An unknown but uniform RAW is retained as RAW; the matcher still returns N/A.
	if not chosen and rawMin~=math.huge and rawMax-rawMin<=SPA_Telemetry.DRIFT_EPSILON then chosen=rawMin end
	SPA_Telemetry.latestDrift[state.key]=chosen
	local resolved,status,low,high=_telPhysicalToDrift(chosen)
	state.stableRaw=status~="UNKNOWN" and chosen or nil
	state.diagnostics={root=state.root and state.root:GetFullName() or "N/A",wheelCount=total,raw=chosen,source=chosenWheel and chosenWheel.source or nil,role=chosenWheel and chosenWheel.role or authority,resolved=resolved,low=low,high=high,status=status,authority=authority}
end

local function _telStopDrift(uid)
	local state=SPA_Telemetry.driftConns[uid]
	SPA_Telemetry.driftConns[uid]=nil; SPA_Telemetry.latestDrift[uid]=nil
	if not state then return end
	_telDriftCancelTimer(state)
	for _,connection in ipairs(state) do connection:Disconnect() end
	for _,wheel in pairs(state.wheels) do
		for _,connection in ipairs(wheel.connections) do connection:Disconnect() end
	end
	state.wheels={}; state.lastChanged=nil; state.stableRaw=nil; state.seatRef[1]=nil
end

local function _telWatchDrift(uid,seat)
	_telStopDrift(uid)
	local state={key=uid,seatRef=setmetatable({seat},{__mode="v"}),wheels={}}
	SPA_Telemetry.driftConns[uid]=state
	local root=_telGetRootModel(seat)
	if not root then return end
	state.root=root
	local vc=VehicleCache and VehicleCache[uid]
	local function remove(part)
		local wheel=state.wheels[part]
		if not wheel then return end
		for _,connection in ipairs(wheel.connections) do connection:Disconnect() end
		state.wheels[part]=nil
		if vc and vc.driftWheels then for i=#vc.driftWheels,1,-1 do if vc.driftWheels[i].part==part then table.remove(vc.driftWheels,i) end end end
		if state.lastChanged==part then state.lastChanged=nil end
		_telDriftRefresh(state)
	end
	local function attach(part,record)
		local valid,evidence=SPA_Telemetry:IsDriftWheel(part,root)
		if state.wheels[part] or not valid then return end
		local raw,source=_telReadDriftFriction(part); local role=record and record.role
		if not role then
			local n=part.Name:lower(); local anchor=(root:IsA("Model") and root.PrimaryPart) or seat; local localZ=0; pcall(function() localZ=anchor.CFrame:PointToObjectSpace(part.Position).Z end)
			role=(n:find("rear",1,true) or n:find("back",1,true) or n=="rl" or n=="rr" or localZ>0.2) and "REAR" or "OTHER"
			record={part=part,raw=raw,source=source,role=role,evidence=evidence,localZ=localZ}; if vc then vc.driftWheels=vc.driftWheels or {}; vc.driftWheels[#vc.driftWheels+1]=record end
		end
		local wheel={raw=raw,source=source,role=role,evidence=evidence,connections={}}
		state.wheels[part]=wheel
		table.insert(wheel.connections,part:GetPropertyChangedSignal("CustomPhysicalProperties"):Connect(function()
			if SPA_Telemetry.driftConns[uid]~=state or state.wheels[part]~=wheel then return end
			local previous=wheel.raw; local nextRaw,nextSource=_telReadDriftFriction(part); wheel.raw=nextRaw; wheel.source=nextSource
			local _,oldStatus,_,_,oldMatch=_telPhysicalToDrift(previous)
			local _,newStatus,_,_,newMatch=_telPhysicalToDrift(nextRaw)
			if oldMatch~=newMatch or oldStatus~=newStatus or (nextRaw and previous and mabs(nextRaw-previous)>0.001) then
				state.lastChanged=part
				_telDriftRefresh(state)
			end
		end))
		table.insert(wheel.connections,part.Destroying:Connect(function() remove(part) end))
	end
	-- Subscribe before the initial scan, including initially empty/recreated Wheels folders.
	table.insert(state,root.DescendantAdded:Connect(function(part)
		if SPA_Telemetry.driftConns[uid]~=state then return end
		attach(part); if state.wheels[part] then _telDriftRefresh(state) end
	end))
	table.insert(state,root.DescendantRemoving:Connect(remove))
	local function stop() if SPA_Telemetry.driftConns[uid]==state then _telStopDrift(uid) end end
	table.insert(state,root.Destroying:Connect(stop))
	table.insert(state,seat.Destroying:Connect(stop))
	table.insert(state,seat.AncestryChanged:Connect(function()
		if seat~=root and not seat:IsDescendantOf(root) then stop() end
	end))
	table.insert(state,root.AncestryChanged:Connect(function()
		if not root:IsDescendantOf(Workspace) then stop() end
	end))
	local discovered=SPA_Telemetry:DiscoverDriftWheels(seat,root)
	if vc and vc.vehicleRoot==root then vc.driftWheels=discovered end
	for _,record in ipairs(discovered) do attach(record.part,record) end
	_telDriftRefresh(state)
end

function _telGetDrift(seat,uid)
	if not seat or not seat.Parent then
		if uid then _telStopDrift(uid) end
		return "N/A",nil,nil,"UNKNOWN"
	end
	-- UID-less callers share a seat-keyed watcher: no repeated fallback scans.
	local key=uid or seat
	local state=SPA_Telemetry.driftConns[key]
	if not state or state.seatRef[1]~=seat then
		_telWatchDrift(key,seat); state=SPA_Telemetry.driftConns[key]
	end
	local raw=state.pending and state.stableRaw or SPA_Telemetry.latestDrift[key]
	local value,status,lower,upper=_telPhysicalToDrift(raw)
	if state.pending then return _telFormatDrift(value,status),nil,nil,"TRANSITION" end
	return _telFormatDrift(value,status),lower,upper,status
end

function SPA_Telemetry:Diagnostics(uid)
	local state=self.driftConns[uid]; local d=state and state.diagnostics
	if not d then return "DRIFT · UNRESOLVED · no cached wheel evidence" end
	return ("DRIFT · %s\nRoot: %s\nWheels: %d · RAW: %s · Source: %s · Role: %s\nResolved: %s · Range: %s/%s"):format(tostring(d.status),tostring(d.root),d.wheelCount or 0,tostring(d.raw),tostring(d.source or "N/A"),tostring(d.role or "N/A"),tostring(d.resolved or "N/A"),tostring(d.low or "N/A"),tostring(d.high or "N/A"))
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
		["11262113208"] = { name = "BLANDA",      icon = "🔴", color = Color3.fromRGB(230, 30,  30)  },
		["11262228611"] = { name = "FULL WET",     icon = "🔵", color = Color3.fromRGB(10,  100, 255) },
		["11262205570"] = { name = "SUPER BLANDA", icon = "🟣", color = Color3.fromRGB(191, 90,  242) },
		["11262199449"] = { name = "INTERMEDIA",   icon = "🟢", color = Color3.fromRGB(48,  209, 88)  },
		["11262217221"] = { name = "MEDIA",        icon = "🟡", color = Color3.fromRGB(255, 214, 10)  },
		["4504219366"]  = { name = "DURA",         icon = "⚪", color = Color3.fromRGB(210, 210, 215) },
	},
	current   = {},   -- [uid] = { name, icon, color }
	log       = {},   -- change history (newest first)
	MAX_LOG      = 80,
	rebuildFn    = nil,
	-- [SPAM FIX] Time a compound must remain stable before notification
	STABLE_TIME  = 2.0,   -- seconds of stability before triggering a notification
	_stableTimer = {},    -- [uid] = {cpd=compound, since=tick()}
	scanCache   = {},     -- [root] = {at=timestamp, value=compound}
	uiDirty    = true,
	frame      = nil,
}

function _tirGetCompound(seat)
	local root = _telGetRootModel(seat)
	if not root then return nil end
	local cached = SPA_Tires.scanCache[root]
	if not cached or cached.invalid then
		if cached and cached.connections then for _,conn in ipairs(cached.connections) do pcall(function() conn:Disconnect() end) end end
		cached={sources={},connections={},invalid=false}
		local function invalidate() cached.invalid=true end
		cached.connections[#cached.connections+1]=root.DescendantAdded:Connect(invalidate)
		cached.connections[#cached.connections+1]=root.DescendantRemoving:Connect(invalidate)
		for _,part in ipairs(root:GetDescendants()) do
			if part:IsA("BasePart") then
				local nm=part.Name:lower()
				if nm:find("physicalwheel",1,true) or nm:find("wheel",1,true) then
					if part:IsA("MeshPart") then cached.sources[#cached.sources+1]={object=part,property="TextureID"}; cached.connections[#cached.connections+1]=part:GetPropertyChangedSignal("TextureID"):Connect(invalidate) end
					for _,child in ipairs(part:GetChildren()) do
						if child:IsA("Decal") or child:IsA("Texture") then cached.sources[#cached.sources+1]={object=child,property="Texture"}; cached.connections[#cached.connections+1]=child:GetPropertyChangedSignal("Texture"):Connect(invalidate) end
					end
				end
			end
		end
		SPA_Tires.scanCache[root]=cached
	end
	for _,source in ipairs(cached.sources) do
		if source.object.Parent then
			local ok,value=pcall(function() return source.object[source.property] end); local id=ok and value and tostring(value):match("%d+")
			if id and SPA_Tires.COMPOUNDS[id] then return SPA_Tires.COMPOUNDS[id] end
		end
	end
	return nil
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
	showNotification(newCpd.icon .. "  " .. getDisplayName(p) .. "  →  " .. SPA_EnglishLabel(newCpd.name) .. "  [" .. locStr .. "]", newCpd.color, newCpd.icon, 164)
	SPA_Tires.uiDirty=true
	SPA_RaceControl:AddEvent("TYRE_CHANGED",{category="CARRERA",severity="INFO",uid=uid,name=getDisplayName(p),title="TYRE CHANGED",description=SPA_EnglishLabel(oldCpd and oldCpd.name or "N/A").." → "..SPA_EnglishLabel(newCpd.name),lap=lap})
	if SPA_Tires.rebuildFn and SPA_Tires.frame and SPA_Tires.frame.Visible then SPA_Tires.rebuildFn(); SPA_Tires.uiDirty=false end
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
	BUF_HZ     = 15,
	PRE_HZ     = 4,
	HIFI_HZ    = 15,
	MIN_DV     = 8,     -- minimum Δv to capture (includes glancing contact)
	COOLDOWN   = 3,     -- seconds between captures for the same pair
	MAX_EVENTS = 15,    -- maximum events stored in ANALYSIS
	buffers    = {},    -- [uid] → sample table {pos,vel,t}
	hifi       = {},
	active     = {},
	pairCD     = {},    -- ["uidA_uidB"] = tick() of the last capture
	events     = {},    -- list of captured events
	rebuildFn  = nil,
	uiDirty    = true,
}

function _rpRingPush(ring,sample,capacity)
	if not ring then ring={data={},head=0,count=0,capacity=capacity} end
	ring.capacity=capacity
	local last=ring.count>0 and ring.data[ring.head] or nil
	if last and (sample.pos-last.pos).Magnitude<0.03 and (sample.vel-last.vel).Magnitude<0.1 then ring.data[ring.head]=sample; return ring end
	ring.head=ring.head%capacity+1; ring.data[ring.head]=sample; ring.count=math.min(ring.count+1,capacity)
	return ring
end

function _rpRingSnap(ring)
	local out={}; if not ring or ring.count==0 then return out end
	local first=(ring.head-ring.count+ring.capacity)%ring.capacity+1
	for i=0,ring.count-1 do out[#out+1]=ring.data[(first+i-1)%ring.capacity+1] end
	return out
end

function _rpBufPush(uid,pos,vel,rot,hifi)
	local source=hifi and SPA_Replay.hifi or SPA_Replay.buffers; local hz=hifi and SPA_Replay.HIFI_HZ or SPA_Replay.PRE_HZ
	source[uid]=_rpRingPush(source[uid],{pos=pos,vel=vel,rot=rot,t=tick()},math.ceil(SPA_Replay.BUF_SEC*hz))
end

function _rpBufSnap(uid)
	local snap=_rpRingSnap(SPA_Replay.buffers[uid]); local high=_rpRingSnap(SPA_Replay.hifi[uid])
	for _,sample in ipairs(high) do snap[#snap+1]=sample end
	table.sort(snap,function(a,b) return a.t<b.t end)
	return snap
end

function SPA_Replay:Activate(uid,untilAt)
	self.active[uid]=math.max(self.active[uid] or 0,untilAt or (tick()+self.POST_SEC))
end

-- Capture a contact event and store it in events
function _rpCapture(uidA, nameA, uidB, nameB, dv, posImp)
	local now = tick()
	local key = uidB and (uidA < uidB and (uidA .. "_" .. uidB) or (uidB .. "_" .. uidA)) or (uidA.."_WALL")
	if SPA_Replay.pairCD[key] and now - SPA_Replay.pairCD[key] < SPA_Replay.COOLDOWN then return end
	SPA_Replay.pairCD[key] = now
	SPA_Replay:Activate(uidA,now+SPA_Replay.POST_SEC+0.25); if uidB then SPA_Replay:Activate(uidB,now+SPA_Replay.POST_SEC+0.25) end

	-- [POST FIX] Save the PRE-impact buffer now and, after POST_SEC,
	-- append only post-impact samples to show what happened afterward.
	local impactAt = now
	local generation=SPA_Session and SPA_Session.generation or 0
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
		if SPA_Session and SPA_Session.generation~=generation then return end
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
		SPA_Replay.uiDirty=true
		if SPA_Replay.rebuildFn and tabFrames["ANÁLISIS"] and tabFrames["ANÁLISIS"].Visible then SPA_Replay.rebuildFn(); SPA_Replay.uiDirty=false end
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

	-- Lightweight prebuffer for all; high fidelity only for confirmable candidates.
	local _tBuf,_tPre = 0,0
	RunService.Heartbeat:Connect(function(dt)
		if not ENABLE_CRASH_SYSTEM then return end
		_tBuf += dt; _tPre += dt
		if _tBuf < 1/SPA_Replay.HIFI_HZ then return end
		_tBuf=0; local now=tick(); local doPre=_tPre>=1/SPA_Replay.PRE_HZ; if doPre then _tPre=0 end
		local perfPreStart = doPre and ENABLE_PERF_DIAGNOSTICS and os.clock() or nil; local perfHiStart=ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
		for uid, st in pairs(PlayerState) do
			if not st.inVehicle or not st.vehiclePosition or not st.velocity or not st.seatCFrame then continue end
			local cf=st.seatCFrame; local rotOnly=CFrame.fromMatrix(Vector3.zero,cf.XVector,cf.YVector,cf.ZVector)
			if doPre then _rpBufPush(uid,st.vehiclePosition,st.velocity,rotOnly,false) end
			if (SPA_Replay.active[uid] or 0)>=now then _rpBufPush(uid,st.vehiclePosition,st.velocity,rotOnly,true) else SPA_Replay.active[uid]=nil end
		end
		SPA_PerfMark("ReplayPrebuffer",perfPreStart); SPA_PerfMark("ReplayHiFi",perfHiStart)
	end)

	-- UI in the ANALYSIS tab
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
		SPA_Replay.uiDirty=false
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


-- V2.22.8: audio, calibration and visual effects; no new Heartbeats.
SPA_MANAGED_AUDIO = {SPA_IDLE_SOUND=true,SPA_DRIVE_SOUND=true,SPA_SHIFT_SOUND=true,SPA_SKID_SOUND=true}
SPA_AudioRetry = { MAX_ATTEMPTS = 5, INTERVAL = 0.5, initialized = false }

function SPA_AudioRetry:IsManaged(sound)
	return sound and sound:IsA("Sound") and (SPA_MANAGED_AUDIO[sound.Name] or sound:GetAttribute("SPAManagedAudio")==true)
end

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
		warn(("[SPA AUDIO] uid=%s %s"):format(tostring(uid), message))
	end
end

function SPA_AudioRetry:IsOriginalDrivingSound(sound)
	if not sound or not sound:IsA("Sound") or self:IsManaged(sound) then return false end
	local name=string.lower(sound.Name)
	for _,excluded in ipairs({"horn","bocina","siren","radio","music","ui","door","alarm","lock","beep"}) do
		if name:find(excluded,1,true) then return false end
	end
	for _,driving in ipairs({"engine","motor","vehicle","drive","acceleration","accelerate","rpm","exhaust","transmission","gear","skid","tire","tyre"}) do
		if name:find(driving,1,true) then return true end
	end
	return false
end

function SPA_AudioRetry:RemoveOriginalDrivingSound(sound)
	if not self:IsOriginalDrivingSound(sound) then return end
	pcall(function() sound:Stop(); sound:Destroy() end)
end

function SPA_AudioRetry:TakeControl(uid,st,vc)
	if vc.audioScanned then return true end
	if not self:IsVehicle(st.seat,vc.vehicleRoot,st.character) then vc.audioLastError="seat has no valid physical vehicle"; return false end
	vc.audioScanned=true
	for _,obj in ipairs(vc.vehicleRoot:GetDescendants()) do self:RemoveOriginalDrivingSound(obj) end
	if not vc.audioConn then
		vc.audioConn=vc.vehicleRoot.DescendantAdded:Connect(function(obj)
			if SPA_AudioRetry:IsManaged(obj) then
				if obj.Name=="SPA_IDLE_SOUND" then vc.idleSound=vc.idleSound or obj end
				if obj.Name=="SPA_DRIVE_SOUND" then vc.driveSound=vc.driveSound or obj end
				if obj.Name=="SPA_SHIFT_SOUND" then vc.shiftSound=vc.shiftSound or obj end
				if obj.Name=="SPA_SKID_SOUND" then vc.skidSound=vc.skidSound or obj end
			elseif SPA_AudioRetry:IsOriginalDrivingSound(obj) then
				task.defer(function() if obj.Parent then SPA_AudioRetry:RemoveOriginalDrivingSound(obj) end end)
			end
		end)
	end
	vc.audioReady=true; vc.audioState="READY"; vc.audioLastError=nil
	self:Log(uid,"READY · original driving audio replaced")
	return true
end

function SPA_AudioRetry:Step(uid, st, vc, now)
	if not self.initialized or not vc or vc.cleaned or vc.audioState=="READY" then return end
	if vc.attemptCount>0 and now-vc.lastAttempt<self.INTERVAL then return end
	vc.attemptCount+=1; vc.lastAttempt=now; vc.audioState="ATTEMPTING"
	local ok,err=xpcall(function()
		if self:TakeControl(uid,st,vc) and SPA_VehicleAudio then SPA_VehicleAudio:Build(uid,vc) end
	end,debug.traceback)
	if not ok then
		vc.audioLastError=tostring(err); vc.audioState=vc.attemptCount>=self.MAX_ATTEMPTS and "EXHAUSTED" or "PENDING"
		self:Log(uid,"error="..tostring(err))
	end
end

-- Dynamic engine, simulated gearbox and persistent skid effects. This module is
-- stepped from HB-SPEED, so it adds no independent Heartbeat connection.
SPA_VehicleAudio = {
	START_SPEED=30,STOP_SPEED=27,SHIFT_COUNT=8,SHIFT_COOLDOWN=0.20,
	SKID_MIN_SPEED=35,SKID_MIN_ANGLE=22,GROUND_INTERVAL=0.12,EMIT_INTERVAL=0.10,
}

-- V2.22.8: scalable weather uses one camera emitter and the existing wheel emitters.
-- No vehicle physics properties are read or written by these modules.
SPA_WeatherFX = {
	mode="CLEAR",intensity=SPA_RAIN_INTENSITY,trackWetness=0,densityCurrent=0,densityTarget=0,
	originalLighting=nil,color=nil,atmosphere=nil,clouds=nil,rainPart=nil,rainAttachment=nil,rainEmitter=nil,
	generation=0,lastStepAt=nil,lastWetness=0,nextThunderAt=0,lightningActive=false,
}

SPA_StormFX = { thunder=nil }

function SPA_WeatherFX:IntensityMultiplier(intensity)
	local scale=({LIGHT=0.3,HEAVY=1,STORM=1.4})[intensity or self.intensity] or 1
	return SPA_RAIN_DENSITY_MULTIPLIER*scale
end

function SPA_WeatherFX:WetnessStatus()
	local wetness=math.clamp(self.trackWetness or 0,0,1)
	if wetness>=0.9 then return "SOAKED" elseif wetness>=0.65 then return "VERY WET" elseif wetness>=0.35 then return "WET" elseif wetness>0.02 then return "DAMP" end
	return "DRY"
end

function SPA_WeatherFX:AddEvent(kind,data)
	if not SPA_RaceControl then return end
	data=type(data)=="table" and data or {}
	data.category=data.category or "WEATHER"; data.severity=data.severity or "INFO"
	data.operator=data.operator or (player and player.Name or "Operator")
	data.name=data.name or data.operator; data.weather=data.weather or self.intensity
	data.wetness=math.floor(math.clamp(self.trackWetness or 0,0,1)*100+0.5)
	SPA_RaceControl:AddEvent(kind,data)
end

function SPA_WeatherFX:CaptureLighting()
	if self.originalLighting then return end
	local lighting=game:GetService("Lighting")
	self.originalLighting={
		Brightness=lighting.Brightness,ExposureCompensation=lighting.ExposureCompensation,
		Ambient=lighting.Ambient,OutdoorAmbient=lighting.OutdoorAmbient,
		FogColor=lighting.FogColor,FogStart=lighting.FogStart,FogEnd=lighting.FogEnd,
	}
end

function SPA_WeatherFX:Owned(parent,name,className)
	local found=parent:FindFirstChild(name)
	if found and found:IsA(className) and found:GetAttribute("SPAWeatherOwned")==true then return found end
	local object=Instance.new(className); object.Name=name; object:SetAttribute("SPAWeatherOwned",true); object.Parent=parent
	return object
end

function SPA_WeatherFX:Ensure()
	local lighting=game:GetService("Lighting")
	if not self.color or not self.color.Parent then
		self.color=self:Owned(lighting,"SPA_RAIN_COLOR","ColorCorrectionEffect")
		self.color.Brightness=0; self.color.Contrast=0; self.color.Saturation=0; self.color.TintColor=Color3.new(1,1,1)
	end
	self.color.Enabled=true
	if not self.atmosphere or not self.atmosphere.Parent then
		self.atmosphere=self:Owned(lighting,"SPA_RAIN_ATMOSPHERE","Atmosphere")
		self.atmosphere.Density=0; self.atmosphere.Haze=0; self.atmosphere.Glare=0
	end
	local terrain=Workspace.Terrain
	if not self.clouds or not self.clouds.Parent then
		self.clouds=self:Owned(terrain,"SPA_RAIN_CLOUDS","Clouds")
		self.clouds.Cover=0; self.clouds.Density=0; self.clouds.Color=Color3.new(1,1,1)
	end
	if not self.rainPart or not self.rainPart.Parent then
		self.rainPart=Instance.new("Part"); self.rainPart.Name="SPA_RAIN_CAMERA_FX"; self.rainPart:SetAttribute("SPAWeatherOwned",true)
		self.rainPart.Size=Vector3.new(54,1,54); self.rainPart.Transparency=1; self.rainPart.Anchored=true
		self.rainPart.CanCollide=false; self.rainPart.CanTouch=false; self.rainPart.CanQuery=false; self.rainPart.Parent=Workspace
		self.rainAttachment=nil
		self.rainEmitter=Instance.new("ParticleEmitter"); self.rainEmitter.Name="SPA_RAIN_CAMERA_DROPS"; self.rainEmitter.Parent=self.rainPart
		self.rainEmitter.Texture="rbxasset://textures/particles/sparkles_main.dds"
		self.rainEmitter.Enabled=false; self.rainEmitter.Rate=0; self.rainEmitter.Lifetime=NumberRange.new(0.38,0.62)
		self.rainEmitter.Speed=NumberRange.new(75,105); self.rainEmitter.Acceleration=Vector3.new(0,-45,0)
		self.rainEmitter.EmissionDirection=Enum.NormalId.Bottom; self.rainEmitter.SpreadAngle=Vector2.new(8,8)
		self.rainEmitter.Shape=Enum.ParticleEmitterShape.Box; self.rainEmitter.ShapeStyle=Enum.ParticleEmitterShapeStyle.Volume
		self.rainEmitter.LightInfluence=1; self.rainEmitter.LockedToPart=false
		self.rainEmitter.Color=ColorSequence.new(Color3.fromRGB(220,230,235),Color3.fromRGB(245,248,250))
		self.rainEmitter.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.35),NumberSequenceKeypoint.new(0.8,0.55),NumberSequenceKeypoint.new(1,1)})
		self.rainEmitter.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.07),NumberSequenceKeypoint.new(1,0.03)})
	end
end

function SPA_WeatherFX:Tween(instance,properties,duration)
	if not instance or not instance.Parent then return nil end
	local ok,tween=pcall(function()
		return TweenService:Create(instance,TweenInfo.new(duration or 1,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),properties)
	end)
	if ok and tween then tween:Play(); return tween end
	return nil
end

function SPA_WeatherFX:ApplyRainTargets(duration)
	if not self.originalLighting then return end
	self:Ensure(); self.color.Enabled=true
	local lighting=game:GetService("Lighting"); local original=self.originalLighting
	local profile=({
		LIGHT={dark=0.80,exposure=-0.18,mix=0.24,fog=120,fogEnd=1100,colorBright=-0.04,contrast=0.07,saturation=-0.16,atmosphere=0.18,haze=0.8,cover=0.68,cloudDensity=0.42},
		HEAVY={dark=0.68,exposure=-0.32,mix=0.40,fog=90,fogEnd=850,colorBright=-0.08,contrast=0.12,saturation=-0.28,atmosphere=0.28,haze=1.35,cover=0.90,cloudDensity=0.62},
		STORM={dark=0.52,exposure=-0.48,mix=0.58,fog=65,fogEnd=650,colorBright=-0.13,contrast=0.17,saturation=-0.38,atmosphere=0.36,haze=1.85,cover=1,cloudDensity=0.82},
	})[self.intensity]
	self:Tween(lighting,{
		Brightness=math.max(0,original.Brightness*profile.dark),ExposureCompensation=original.ExposureCompensation+profile.exposure,
		Ambient=original.Ambient:Lerp(Color3.fromRGB(82,92,104),profile.mix),OutdoorAmbient=original.OutdoorAmbient:Lerp(Color3.fromRGB(96,107,120),profile.mix),
		FogColor=original.FogColor:Lerp(Color3.fromRGB(155,170,184),profile.mix),FogStart=math.min(original.FogStart,profile.fog),FogEnd=math.min(original.FogEnd,profile.fogEnd),
	},duration or 3)
	self:Tween(self.color,{Brightness=profile.colorBright,Contrast=profile.contrast,Saturation=profile.saturation,TintColor=Color3.fromRGB(200,214,226)},duration or 3)
	self:Tween(self.atmosphere,{Density=profile.atmosphere,Haze=profile.haze,Glare=0,Color=Color3.fromRGB(190,205,216),Decay=Color3.fromRGB(96,110,126)},duration or 3)
	self:Tween(self.clouds,{Cover=profile.cover,Density=profile.cloudDensity,Color=Color3.fromRGB(182,192,202)},duration or 3)
end

function SPA_WeatherFX:SetIntensity(intensity)
	assert(intensity=="LIGHT" or intensity=="HEAVY" or intensity=="STORM","Rain intensity must be LIGHT, HEAVY or STORM")
	if self.intensity==intensity then return false end
	local previous=self.intensity; self.intensity=intensity; SPA_RAIN_INTENSITY=intensity
	if self.mode=="RAIN" then
		self.densityTarget=self:IntensityMultiplier(intensity); self:ApplyRainTargets(3)
		self:AddEvent("RAIN_INTENSITY_CHANGED",{oldValue=previous,newValue=intensity,title="🌧 RAIN INTENSITY",description=("Rain intensity: %s → %s"):format(previous,intensity)})
		if intensity=="STORM" then
			self.nextThunderAt=tick()+math.random(18,50)
			self:AddEvent("STORM_STARTED",{oldValue=previous,newValue=intensity,title="⛈ STORM STARTED",description="Storm conditions are now active."})
		end
	end
	if SPA_ControlCenter and SPA_ControlCenter.RefreshEffects then SPA_ControlCenter:RefreshEffects() end
	return true
end

function SPA_WeatherFX:SetMode(mode)
	assert(mode=="CLEAR" or mode=="RAIN","Invalid weather mode")
	if self.mode==mode then return false end
	local perfStart=ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
	self.generation+=1; local generation=self.generation; local lighting=game:GetService("Lighting")
	if mode=="RAIN" then
		self:CaptureLighting(); self:Ensure(); self.mode="RAIN"; self.intensity=SPA_RAIN_INTENSITY
		self.densityTarget=self:IntensityMultiplier(); self.lastStepAt=tick(); self:ApplyRainTargets(3)
		self.rainEmitter.Enabled=true
		self.nextThunderAt=self.intensity=="STORM" and tick()+math.random(18,50) or 0
	else
		self.mode="CLEAR"; self.densityTarget=0; self.nextThunderAt=0
		if self.originalLighting then self:Tween(lighting,self.originalLighting,3) end
		self:Tween(self.color,{Brightness=0,Contrast=0,Saturation=0,TintColor=Color3.new(1,1,1)},3)
		self:Tween(self.atmosphere,{Density=0,Haze=0,Glare=0},3)
		self:Tween(self.clouds,{Cover=0,Density=0},3)
		task.delay(3.05,function()
			if self.generation==generation and self.mode=="CLEAR" and self.color and self.color.Parent then self.color.Enabled=false end
		end)
	end
	SPA_PerfMark("WeatherFX",perfStart,mode)
	return true
end

function SPA_WeatherFX:WetnessEvents(previous,current)
	local upward=current>previous
	local thresholds=upward and {0.25,0.50,0.75,1.00} or {0.75,0.50,0.25,0}
	for _,threshold in ipairs(thresholds) do
		local crossed=upward and previous<threshold and current>=threshold or (not upward and previous>threshold and current<=threshold)
		if crossed then
			self:AddEvent("TRACK_WETNESS",{level=math.floor(threshold*100+0.5),direction=upward and "RISING" or "DRYING",title="💧 TRACK WETNESS",description=("Track wetness %s: %d%%"):format(upward and "reached" or "fell to",math.floor(threshold*100+0.5))})
		end
	end
end

function SPA_StormFX:Flash()
	if SPA_WeatherFX.mode~="RAIN" or SPA_WeatherFX.intensity~="STORM" or SPA_WeatherFX.lightningActive then return end
	SPA_WeatherFX.lightningActive=true
	local lighting=game:GetService("Lighting"); local color=SPA_WeatherFX.color
	local oldExposure=lighting.ExposureCompensation; local oldBrightness=color and color.Brightness or 0
	lighting.ExposureCompensation=oldExposure+0.85
	if color and color.Parent then color.Brightness=math.min(0.22,oldBrightness+0.30) end
	if type(SPA_THUNDER_SOUND_ID)=="string" and SPA_THUNDER_SOUND_ID:match("^rbxassetid://%d+$") then
		local soundService=game:GetService("SoundService")
		if not self.thunder or not self.thunder.Parent then
			self.thunder=Instance.new("Sound"); self.thunder.Name="SPA_STORM_THUNDER"; self.thunder:SetAttribute("SPAWeatherOwned",true); self.thunder.Parent=soundService
		end
		self.thunder.SoundId=SPA_THUNDER_SOUND_ID; self.thunder.Volume=SPA_THUNDER_VOLUME; self.thunder.PlaybackSpeed=1.0; self.thunder.TimePosition=0; self.thunder:Play()
	end
	task.delay(math.random(8,20)/100,function()
		if SPA_WeatherFX.mode=="RAIN" and SPA_WeatherFX.intensity=="STORM" then
			lighting.ExposureCompensation=oldExposure
			if color and color.Parent then color.Brightness=oldBrightness end
		end
		SPA_WeatherFX.lightningActive=false
	end)
end

function SPA_WeatherFX:Step()
	local now=tick(); local dt=math.clamp(now-(self.lastStepAt or now),0,0.25); self.lastStepAt=now
	local perfStart=ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
	local densityDelta=self.densityTarget-self.densityCurrent
	local densityStep=SPA_RAIN_DENSITY_MULTIPLIER*1.4*dt/3
	self.densityCurrent+=math.clamp(densityDelta,-densityStep,densityStep)
	local previous=self.trackWetness
	if self.mode=="RAIN" then
		local soakSeconds=({LIGHT=180,HEAVY=90,STORM=60})[self.intensity] or 90
		self.trackWetness=math.clamp(previous+dt/soakSeconds,0,1)
	else
		self.trackWetness=math.clamp(previous-dt/SPA_TRACK_DRYING_SECONDS,0,1)
	end
	if self.trackWetness~=previous then self:WetnessEvents(previous,self.trackWetness) end
	if self.rainPart and self.rainPart.Parent then
		local camera=Workspace.CurrentCamera
		if camera then self.rainPart.CFrame=CFrame.new(camera.CFrame.Position+Vector3.new(0,12,0)) end
		if self.rainEmitter then
			local onboard=SPA_Onboard and SPA_Onboard.active and 1.3 or 1
			self.rainEmitter.Rate=math.min(1800,115*self.densityCurrent*onboard)
			self.rainEmitter.Enabled=SPA_EFFECT_MODE~="OFF" and self.densityCurrent>0.05 and self.rainEmitter.Rate>1
		end
	end
	if self.mode=="RAIN" and self.intensity=="STORM" and self.nextThunderAt>0 and now>=self.nextThunderAt then
		self.nextThunderAt=now+math.random(18,50); SPA_StormFX:Flash()
	end
	if SPA_ControlCenter and SPA_ControlCenter.initialized and SPA_ControlCenter.panel and SPA_ControlCenter.panel.Visible and now-(self.lastHomeRefresh or 0)>=0.25 then
		self.lastHomeRefresh=now; SPA_ControlCenter:RefreshEffects()
	end
	SPA_PerfMark("RainFX",perfStart)
end

function SPA_WeatherFX:Cleanup()
	self.generation+=1; self.mode="CLEAR"; self.densityTarget=0; self.densityCurrent=0; self.nextThunderAt=0
	local lighting=game:GetService("Lighting")
	if self.originalLighting then
		for property,value in pairs(self.originalLighting) do pcall(function() lighting[property]=value end) end
	end
	for _,object in ipairs({self.color,self.atmosphere,self.clouds,self.rainPart}) do
		if object and object.Parent and object:GetAttribute("SPAWeatherOwned")==true then pcall(function() object:Destroy() end) end
	end
	if SPA_StormFX.thunder and SPA_StormFX.thunder.Parent and SPA_StormFX.thunder:GetAttribute("SPAWeatherOwned")==true then pcall(function() SPA_StormFX.thunder:Destroy() end) end
	SPA_StormFX.thunder=nil
	self.color=nil; self.atmosphere=nil; self.clouds=nil; self.rainPart=nil; self.rainAttachment=nil; self.rainEmitter=nil
end

SPA_Effects = { VALID={OFF=true,NORMAL=true,RAIN=true},RAIN_MAX_RATE=180,RAIN_MAX_BURST=80 }

function SPA_Effects:LOD(uid,vc,now)
	if now-(vc.lastFxLodCheck or 0)<0.25 then return vc.fxLod or 1 end
	vc.lastFxLodCheck=now
	if SPA_Onboard and SPA_Onboard.active and SPA_Onboard.current and SPA_Onboard.current.UserId==uid then vc.fxLod=1; return 1 end
	local camera=Workspace.CurrentCamera
	local distance=(camera and vc.seat and vc.seat.Parent) and (camera.CFrame.Position-vc.seat.Position).Magnitude or 0
	vc.fxDistance=distance
	vc.fxLod=distance<=125 and 1 or (distance<=250 and 0.75 or (distance<=400 and 0.40 or (distance<=600 and 0.15 or 0)))
	return vc.fxLod
end

function SPA_Effects:ApplyVehicle(vc)
	if not vc then return end
	vc.skidStrongActive=false
	for _,emitter in ipairs(vc.skidEmitters or {}) do
		if emitter and emitter.Parent then emitter.Enabled=false; emitter.Rate=0 end
	end
end

function SPA_Effects:SetMode(mode)
	assert(self.VALID[mode]==true,"Effect mode must be OFF, NORMAL or RAIN")
	if SPA_EFFECT_MODE==mode then return false end
	local perfStart=ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
	local previous=SPA_EFFECT_MODE; SPA_EFFECT_MODE=mode
	local weatherChanged=SPA_WeatherFX:SetMode(mode=="RAIN" and "RAIN" or "CLEAR")
	for _,vc in pairs(VehicleCache or {}) do self:ApplyVehicle(vc) end
	if weatherChanged then
		local kind=mode=="RAIN" and "RAIN_STARTED" or (previous=="RAIN" and "RAIN_STOPPED" or "WEATHER_CHANGED")
		SPA_WeatherFX:AddEvent(kind,{oldValue=previous,newValue=mode,previous=previous,mode=mode,title=mode=="RAIN" and "🌧 RAIN STARTED" or (previous=="RAIN" and "🌤 RAIN STOPPED" or "🌦 WEATHER CHANGE"),description=("Vehicle & Weather Effects: %s → %s"):format(previous,mode)})
	end
	if SPA_ControlCenter and SPA_ControlCenter.RefreshEffects then SPA_ControlCenter:RefreshEffects() end
	showNotification(("Vehicle & Weather Effects: %s"):format(mode),mode=="RAIN" and C_BLUE or (mode=="NORMAL" and C_GREEN or C_GRAY),"🌦",5)
	SPA_PerfMark("VehicleFX",perfStart,previous.."->"..mode)
	return true
end

function SPA_Effects:SetRainIntensity(intensity)
	local changed=SPA_WeatherFX:SetIntensity(intensity)
	if changed then showNotification(("Rain intensity: %s"):format(intensity),intensity=="STORM" and C_RED or C_BLUE,intensity=="STORM" and "⛈" or "🌧",5) end
	return changed
end

if SPA_EFFECT_MODE=="RAIN" then SPA_WeatherFX:SetMode("RAIN") end

function SPA_VehicleAudio:ValidSoundId(value)
	return type(value)=="string" and value:match("^rbxassetid://%d+$")~=nil
end

function SPA_VehicleAudio:ManagedSound(parent,name,soundId,looped,volume,vc,ownerKey)
	if not parent then return nil end
	local sound=parent:FindFirstChild(name)
	if sound and not sound:IsA("Sound") then sound=nil end
	if not sound then
		sound=Instance.new("Sound"); sound.Name=name; sound.Parent=parent
	end
	sound:SetAttribute("SPAManagedAudio",true); vc[ownerKey]=true
	sound.SoundId=self:ValidSoundId(soundId) and soundId or ""
	sound.Looped=looped==true; sound.Volume=volume or 0; sound.PlaybackSpeed=1.0
	return sound
end

function SPA_VehicleAudio:BuildThresholds(vc,topSpeed)
	if vc.shiftTop and math.abs(vc.shiftTop-topSpeed)<0.05 and vc.gearThresholds then return end
	vc.shiftTop=topSpeed; vc.gearThresholds={}; vc.shiftThresholds=vc.gearThresholds
	local startSpeed=tonumber(SPA_ENGINE_START_SPEED) or self.START_SPEED
	local finish=math.max(startSpeed+8,topSpeed*0.95)
	for index=1,self.SHIFT_COUNT do
		vc.gearThresholds[index]=startSpeed+(finish-startSpeed)*(index/self.SHIFT_COUNT)
	end
end

function SPA_VehicleAudio:ResetCalibration(vc)
	if not vc then return end
	vc.gearCalibrated=false; vc.calibrationActive=false; vc.calibrationArmed=false
	vc.calibrationStartedAt=nil; vc.calibrationSamples={}; vc.calibrationPeakSpeed=0
	vc.calibrationLowSpeed=nil; vc.detectedTopSpeed=nil; vc.gearThresholds=nil; vc.shiftThresholds=nil; vc.shiftTop=nil
	vc.currentGear=1; vc.lastGear=1; vc.simGear=1; vc.previousSpeed=0; vc.lastShiftAt=0
	vc.shiftRunReady=false; vc.audioStoppedSince=nil; vc.calibrationBlockedUntil=0
end

function SPA_VehicleAudio:CalibrationBlocked(uid,vc,now)
	local drs=DRS_STATE and DRS_STATE[uid]; local ot=OT_STATE and OT_STATE[uid]
	local pit=pitData and pitData[uid] and pitData[uid].status=="En Boxes"
	local pitState=SPA_PitLimiter and SPA_PitLimiter.states and SPA_PitLimiter.states[uid]
	return (drs and drs.active) or (ot and ot.active) or pit or (pitState and pitState.active)
		or vc.nitrousWasActive==true or (vc.skidIntensity or 0)>=0.55
		or now<(vc.skidForcedUntil or vc.forcedSkidUntil or 0) or now<(vc.calibrationBlockedUntil or 0)
end

function SPA_VehicleAudio:ObserveCalibration(uid,vc,now,speed,teleported)
	if vc.gearCalibrated then return end
	local startSpeed=tonumber(SPA_ENGINE_START_SPEED) or self.START_SPEED
	if teleported then
		table.clear(vc.calibrationSamples); vc.calibrationBlockedUntil=now+0.5
		return
	end
	if speed<startSpeed then table.clear(vc.calibrationSamples); return end
	vc.calibrationActive=true; vc.calibrationStartedAt=vc.calibrationStartedAt or now
	if self:CalibrationBlocked(uid,vc,now) then table.clear(vc.calibrationSamples); return end
	vc.calibrationLowSpeed=math.min(vc.calibrationLowSpeed or speed,speed)
	vc.calibrationPeakSpeed=math.max(vc.calibrationPeakSpeed or 0,speed)
	if vc.calibrationPeakSpeed-vc.calibrationLowSpeed>=25 then vc.calibrationArmed=true end
	local samples=vc.calibrationSamples
	samples[#samples+1]={speed=speed,time=now}
	while samples[1] and now-samples[1].time>4.0 do table.remove(samples,1) end
	if not vc.calibrationArmed or #samples<40 or now-samples[1].time<3.85 then return end
	local bins={}
	for _,sample in ipairs(samples) do
		local bin=math.floor(sample.speed+0.5); bins[bin]=(bins[bin] or 0)+1
	end
	local bestBin,bestCount=nil,0
	for bin in pairs(bins) do
		local count=0
		for offset=-2,2 do count+=bins[bin+offset] or 0 end
		if count>bestCount then bestBin=bin; bestCount=count end
	end
	if not bestBin then return end
	local total,inliers=0,0
	for _,sample in ipairs(samples) do
		if math.abs(sample.speed-bestBin)<=2 then total+=sample.speed; inliers+=1 end
	end
	if inliers/#samples<0.85 then return end
	local candidate=inliers>0 and total/inliers or bestBin
	local slope=math.abs(samples[#samples].speed-samples[1].speed)
	if slope>2.5 or candidate<(vc.calibrationPeakSpeed or candidate)*0.95 then return end
	vc.detectedTopSpeed=candidate; vc.gearCalibrated=true; vc.calibrationActive=false
	vc.calibrationSamples={}; vc.currentGear=1; vc.lastGear=1; vc.simGear=1; vc.shiftRunReady=false
	self:BuildThresholds(vc,candidate)
	showNotification(("Transmission calibrated · %.1f studs/s · 8 shifts"):format(candidate),C_GREEN,"⚙",6)
end

function SPA_VehicleAudio:GearAtSpeed(vc,speed)
	local gear=1
	for _,threshold in ipairs(vc.gearThresholds or {}) do if speed>=threshold then gear+=1 end end
	return math.clamp(gear,1,self.SHIFT_COUNT+1)
end

function SPA_VehicleAudio:FindWheels(vc)
	vc.skidWheels={}; vc.skidAttachments={}; vc.skidEmitters={}; vc.skidOwnedEmitters={}
	if not vc.vehicleRoot then return end
	local candidates={}
	for _,obj in ipairs(vc.vehicleRoot:GetDescendants()) do
		if obj:IsA("BasePart") then
			local lower=string.lower(obj.Name)
			if obj.Name=="PhysicalWheel" or lower:find("wheel",1,true) or lower:find("tire",1,true) then
				candidates[#candidates+1]=obj
			end
		end
	end
	table.sort(candidates,function(a,b)
		local an=string.lower(a:GetFullName()); local bn=string.lower(b:GetFullName())
		local ar=(an:find("rear",1,true) or an:find("back",1,true) or an:match("[^%w]r[lr][^%w]*$")) and 0 or (a.Name=="PhysicalWheel" and 1 or 2)
		local br=(bn:find("rear",1,true) or bn:find("back",1,true) or bn:match("[^%w]r[lr][^%w]*$")) and 0 or (b.Name=="PhysicalWheel" and 1 or 2)
		if ar~=br then return ar<br end
		return an<bn
	end)
	for _,wheel in ipairs(candidates) do
		if #vc.skidWheels>=4 then break end
		local duplicate=false
		for _,existing in ipairs(vc.skidWheels) do
			if existing==wheel then duplicate=true; break end
		end
		if not duplicate then
			vc.skidWheels[#vc.skidWheels+1]=wheel
			local attachment=wheel:FindFirstChild("SPA_SKID_ATTACHMENT")
			if attachment and (not attachment:IsA("Attachment") or attachment:GetAttribute("SPAManagedSkid")~=true) then attachment=nil end
			if not attachment then attachment=Instance.new("Attachment"); attachment.Name="SPA_SKID_ATTACHMENT"; attachment.Parent=wheel; attachment:SetAttribute("SPAManagedSkid",true); vc.audioOwnsSkidParts=true end
			vc.audioOwnsSkidParts=true
			attachment.Position=Vector3.new(0,-wheel.Size.Y*0.48,0)
			local emitter=attachment:FindFirstChild("SPA_SKID_SMOKE")
			if emitter and (not emitter:IsA("ParticleEmitter") or emitter:GetAttribute("SPAManagedSkid")~=true) then emitter=nil end
			if not emitter then emitter=Instance.new("ParticleEmitter"); emitter.Name="SPA_SKID_SMOKE"; emitter.Parent=attachment; emitter:SetAttribute("SPAManagedSkid",true) end
			vc.skidOwnedEmitters[#vc.skidOwnedEmitters+1]=emitter
			emitter.Texture="rbxasset://textures/particles/smoke_main.dds"
			emitter.Color=ColorSequence.new(Color3.fromRGB(225,225,225),Color3.fromRGB(115,115,115))
			emitter.LightInfluence=0.25
			emitter.Enabled=false; emitter.Rate=0; emitter.Lifetime=NumberRange.new(0.28,0.5); emitter.Speed=NumberRange.new(1,3)
			emitter.SpreadAngle=Vector2.new(35,35); emitter.Drag=2; emitter.Acceleration=Vector3.new(0,2,0)
			emitter.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.35),NumberSequenceKeypoint.new(1,1)})
			emitter.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.45),NumberSequenceKeypoint.new(1,1.35)})
			vc.skidAttachments[#vc.skidAttachments+1]=attachment; vc.skidEmitters[#vc.skidEmitters+1]=emitter
		end
	end
	vc.skidRayParams=RaycastParams.new(); vc.skidRayParams.FilterType=Enum.RaycastFilterType.Exclude
	vc.skidRayParams.FilterDescendantsInstances={vc.vehicleRoot}; vc.skidRayParams.IgnoreWater=true
	vc.wheels=vc.skidWheels
end

function SPA_VehicleAudio:Build(uid,vc)
	if not vc or vc.vehicleAudioBuilt then return end
	vc.vehicleAudioBuilt=true; self:ResetCalibration(vc)
	vc.filteredSpeed=0; vc.lastAudioSpeed=0
	vc.skidActive=false; vc.skidIntensity=0; vc.skidForcedUntil=0; vc.forcedSkidUntil=0; vc.forcedSkidIntensity=0
	vc.fxLaunchArmed=false; vc.fxLaunchStartedAt=nil; vc.lastLaunchBurst=0; vc.lastBrakeBurst=0; vc.lastRainCrashBurst=0; vc.lastCrashAt=0
	vc.idleSound=self:ManagedSound(vc.seat,"SPA_IDLE_SOUND",SPA_IDLE_SOUND_ID,true,0,vc,"audioOwnsIdle")
	vc.driveSound=self:ManagedSound(vc.seat,"SPA_DRIVE_SOUND",SPA_DRIVE_SOUND_ID,true,0,vc,"audioOwnsDrive")
	vc.shiftSound=self:ManagedSound(vc.seat,"SPA_SHIFT_SOUND",SPA_SHIFT_SOUND_ID,false,SPA_SHIFT_VOLUME,vc,"audioOwnsShift")
	vc.skidSound=self:ManagedSound(vc.seat,"SPA_SKID_SOUND",SPA_SKID_SOUND_ID,true,0,vc,"audioOwnsSkid")
	self:FindWheels(vc)
end

function SPA_VehicleAudio:Grounded(vc,now)
	if now-(vc.lastSkidGroundCheck or 0)<self.GROUND_INTERVAL then return vc.skidGrounded==true end
	vc.lastSkidGroundCheck=now; vc.skidGrounded=false
	for _,wheel in ipairs(vc.skidWheels or {}) do
		if wheel.Parent and Workspace:Raycast(wheel.Position,Vector3.new(0,-math.max(2,wheel.Size.Y+1),0),vc.skidRayParams) then
			vc.skidGrounded=true; break
		end
	end
	return vc.skidGrounded
end

function SPA_VehicleAudio:OnCrash(uid,severity)
	local vc=VehicleCache and VehicleCache[uid]
	if not vc then return end
	local duration=severity=="FUERTE" and 1.25 or (severity=="MODERADO" and 0.8 or 0.4)
	vc.skidForcedUntil=math.max(vc.skidForcedUntil or 0,tick()+duration); vc.forcedSkidUntil=vc.skidForcedUntil
	vc.forcedSkidIntensity=severity=="FUERTE" and 1 or (severity=="MODERADO" and 0.8 or 0.6)
	local now=tick(); vc.lastCrashAt=now
	local raining=SPA_EFFECT_MODE=="RAIN"
	if raining and (severity=="FUERTE" or severity=="MODERADO") and now-(vc.lastRainCrashBurst or 0)>=2 then
		vc.lastRainCrashBurst=now; vc.rainCrashBurst=severity=="FUERTE" and 3 or 2
	end
	if not vc.gearCalibrated then
		table.clear(vc.calibrationSamples or {}); vc.calibrationBlockedUntil=vc.skidForcedUntil
	end
end

function SPA_VehicleAudio:PlayShift(vc)
	vc.shiftDipUntil=tick()+0.14
	if SPA_VEHICLE_AUDIO_ENABLED and SPA_SHIFT_SOUNDS_ENABLED and vc.shiftSound and self:ValidSoundId(SPA_SHIFT_SOUND_ID) then
		vc.shiftSound.SoundId=SPA_SHIFT_SOUND_ID; vc.shiftSound.Volume=SPA_SHIFT_VOLUME
		vc.shiftSound.PlaybackSpeed=1.0
		vc.shiftSound.TimePosition=0; vc.shiftSound:Play()
	end
end

function SPA_VehicleAudio:ObserveConfigured(uid,st,vc,value,now)
	value=tonumber(value); if not value then return end
	if not vc.configObserved then vc.configObserved=value; vc.configCandidate=value; vc.configCandidateAt=now; return end
	if math.abs(value-(vc.configCandidate or value))>0.05 then vc.configCandidate=value; vc.configCandidateAt=now; return end
	if now-(vc.configCandidateAt or now)<0.3 or math.abs(value-vc.configObserved)<=0.05 then return end
	local old=vc.configObserved; vc.configObserved=value
	local pit=pitData[uid] and pitData[uid].status=="En Boxes"
	local drsState=DRS_STATE and DRS_STATE[uid]; local otState=OT_STATE and OT_STATE[uid]
	local context=pit and "PIT" or ((drsState and (drsState.active or drsState.permitted)) and "DRS" or ((otState and (otState.active or otState.permitted)) and "OT" or "NORMAL"))
	SPA_RaceControl:AddEvent("VEHICLE_SPEED_CONFIG_CHANGED",{category="CONFIG",severity="INFO",uid=uid,name=st.player and getDisplayName(st.player) or tostring(uid),oldValue=old,newValue=value,context=context,title="VEHICLE SPEED CONFIG",description=("%.2f → %.2f · %s"):format(old,value,context)})
end

function SPA_VehicleAudio:StepSkid(uid,st,vc,now,dt,speed)
	local perfStart=ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
	local intensity=0; local slipAngle=0
	if SPA_SKID_FX_ENABLED and st.seat and speed>=30 then
		local velocity=st.seat.AssemblyLinearVelocity; local flat=Vector3.new(velocity.X,0,velocity.Z)
		local look=st.seat.CFrame.LookVector; look=Vector3.new(look.X,0,look.Z)
		local right=st.seat.CFrame.RightVector; right=Vector3.new(right.X,0,right.Z)
		if flat.Magnitude>1 and look.Magnitude>0.1 then
			local forward=math.abs(flat.Unit:Dot(look.Unit)); slipAngle=math.deg(math.acos(math.clamp(forward,-1,1)))
			local lateralRatio=right.Magnitude>0.1 and math.abs(flat.Unit:Dot(right.Unit)) or 0
			local angular=math.abs(st.seat.AssemblyAngularVelocity.Y)
			intensity=math.clamp(math.max((slipAngle-15)/35,(lateralRatio-0.20)/0.65,(angular-0.55)/4.2),0,1)
		end
	end
	if now<(vc.skidForcedUntil or vc.forcedSkidUntil or 0) then intensity=math.max(intensity,vc.forcedSkidIntensity or 0.6) end
	vc.skidIntensity=(vc.skidIntensity or 0)+(intensity-(vc.skidIntensity or 0))*math.clamp(dt*(intensity>0 and 12 or 6),0,1)
	intensity=vc.skidIntensity; vc.skidActive=intensity>0.04
	local rain=SPA_EFFECT_MODE=="RAIN"; local visualMode=SPA_EFFECT_MODE~="OFF"
	local wetness=SPA_WeatherFX and math.clamp(SPA_WeatherFX.trackWetness or 0,0,1) or 0
	local wet=visualMode and (rain or wetness>0.02)
	local densityMultiplier=rain and math.max(0,SPA_WeatherFX.densityCurrent or 0) or wetness*SPA_RAIN_DENSITY_MULTIPLIER
	local target=(SPA_SKID_FX_ENABLED and intensity or 0)*SPA_SKID_VOLUME*(wet and 1.25 or 1)
	vc.skidVolume=(vc.skidVolume or 0)+(target-(vc.skidVolume or 0))*math.clamp(dt*10,0,1)
	if vc.skidSound then
		vc.skidSound.SoundId=self:ValidSoundId(SPA_SKID_SOUND_ID) and SPA_SKID_SOUND_ID or ""
		vc.skidSound.Volume=vc.skidVolume; vc.skidSound.PlaybackSpeed=1.0
		if vc.skidVolume>0.01 and self:ValidSoundId(SPA_SKID_SOUND_ID) then if not vc.skidSound.IsPlaying then vc.skidSound:Play() end elseif vc.skidSound.IsPlaying and vc.skidVolume<0.005 then vc.skidSound:Stop() end
	end
	local grounded=self:Grounded(vc,now)
	local lod=SPA_Effects:LOD(uid,vc,now)
	local speedWake=wet and math.clamp((speed-8)/82,0,1) or 0
	local rainIntensity=wet and math.clamp(speedWake*math.max(wetness,0.25)+intensity*0.7,0,1) or 0
	local visualIntensity=wet and rainIntensity or intensity
	local smokeActive=visualMode and SPA_SKID_FX_ENABLED and SPA_SKID_SMOKE_ENABLED and grounded and (wet and speed>8 or intensity>0.04)
	local previousSpeed=vc.previousSpeed or speed; local deceleration=previousSpeed-speed
	if speed<=3 then vc.fxLaunchArmed=true; vc.fxLaunchStartedAt=nil
	elseif vc.fxLaunchArmed and not vc.fxLaunchStartedAt then vc.fxLaunchStartedAt=now end
	local launchBurst=visualMode and vc.fxLaunchArmed and speed>=35 and now-(vc.fxLaunchStartedAt or now)<=2 and now-(vc.lastLaunchBurst or 0)>=3
	local brakeBurst=wet and deceleration>=7 and speed>12 and now-(vc.lastBrakeBurst or 0)>=0.8 and now-(vc.lastCrashAt or 0)>=0.35
	for index,emitter in ipairs(vc.skidEmitters or {}) do
		if emitter.Parent then
			local rate=wet and math.min(SPA_Effects.RAIN_MAX_RATE,(2+visualIntensity*16)*densityMultiplier)*lod or (18+intensity*150)*lod
			emitter.Enabled=smokeActive and lod>0; emitter.Rate=smokeActive and rate or 0
			local attachment=vc.skidAttachments and vc.skidAttachments[index]; local wheel=vc.skidWheels and vc.skidWheels[index]
			if wet then
				emitter.Color=ColorSequence.new(Color3.fromRGB(238,244,248),Color3.fromRGB(190,205,215))
				emitter.Lifetime=NumberRange.new(0.38+speedWake*0.28+visualIntensity*0.12,0.68+speedWake*0.62+visualIntensity*0.28)
				emitter.Speed=NumberRange.new(7+visualIntensity*7,12+visualIntensity*12)
				emitter.SpreadAngle=Vector2.new(24+visualIntensity*18,24+visualIntensity*18)
				emitter.Drag=0.8; emitter.Acceleration=Vector3.new(0,12+visualIntensity*9,0)
				emitter.Orientation=Enum.ParticleOrientation.VelocityParallel
				emitter.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.2),NumberSequenceKeypoint.new(0.62,0.48),NumberSequenceKeypoint.new(1,1)})
				emitter.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.32+visualIntensity*0.25),NumberSequenceKeypoint.new(1,1.4+visualIntensity*1.8)})
				if attachment and attachment.Parent and wheel and wheel.Parent then
					local flat=Vector3.new(st.seat.AssemblyLinearVelocity.X,0,st.seat.AssemblyLinearVelocity.Z)
					local backward=flat.Magnitude>1 and -flat.Unit or -st.seat.CFrame.LookVector
					local sprayWorld=(Vector3.new(0,1,0)*0.78+backward*0.62).Unit
					local sprayLocal=wheel.CFrame:VectorToObjectSpace(sprayWorld)
					local base=Vector3.new(0,-wheel.Size.Y*0.48,0)
					attachment.CFrame=CFrame.lookAt(base,base+sprayLocal); emitter.EmissionDirection=Enum.NormalId.Front
				end
			else
				emitter.Color=ColorSequence.new(Color3.fromRGB(225,225,225),Color3.fromRGB(115,115,115))
				emitter.Lifetime=NumberRange.new(0.45+intensity*0.35,0.8+intensity*0.75)
				emitter.Speed=NumberRange.new(2+intensity*2,4+intensity*5)
				emitter.SpreadAngle=Vector2.new(45+intensity*35,45+intensity*35)
				emitter.Drag=1.5; emitter.Acceleration=Vector3.new(0,3+intensity*4,0)
				emitter.Orientation=Enum.ParticleOrientation.FacingCamera
				emitter.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.12),NumberSequenceKeypoint.new(0.55,0.45),NumberSequenceKeypoint.new(1,1)})
				emitter.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.65+intensity*0.45),NumberSequenceKeypoint.new(1,2.8+intensity*2.4)})
				if attachment and attachment.Parent and wheel and wheel.Parent then
					attachment.CFrame=CFrame.new(0,-wheel.Size.Y*0.48,0); emitter.EmissionDirection=Enum.NormalId.Top
				end
			end
		end
	end
	if smokeActive and intensity>=0.65 and not vc.skidStrongActive then
		vc.skidStrongActive=true
		local amount=wet and math.min(SPA_Effects.RAIN_MAX_BURST,math.floor((14+intensity*22)*densityMultiplier*lod)) or math.floor((14+intensity*22)*lod)
		for _,emitter in ipairs(vc.skidEmitters or {}) do if emitter.Parent and amount>0 then emitter:Emit(amount) end end
	elseif intensity<0.35 then
		vc.skidStrongActive=false
	end
	if launchBurst then
		vc.lastLaunchBurst=now; vc.fxLaunchArmed=false; vc.fxLaunchStartedAt=nil
		local amount=wet and math.min(SPA_Effects.RAIN_MAX_BURST,math.floor((18+speedWake*24)*densityMultiplier*lod)) or math.floor(10*lod)
		for _,emitter in ipairs(vc.skidEmitters or {}) do if emitter.Parent and amount>0 then emitter:Emit(amount) end end
	elseif vc.fxLaunchStartedAt and now-vc.fxLaunchStartedAt>2 then vc.fxLaunchArmed=false; vc.fxLaunchStartedAt=nil end
	if brakeBurst then
		vc.lastBrakeBurst=now
		local amount=math.min(SPA_Effects.RAIN_MAX_BURST,math.floor((16+math.min(deceleration,20)*2)*densityMultiplier*lod))
		for _,emitter in ipairs(vc.skidEmitters or {}) do if emitter.Parent and amount>0 then emitter:Emit(amount) end end
	end
	if wet and smokeActive and vc.rainCrashBurst then
		local amount=math.min(SPA_Effects.RAIN_MAX_BURST,math.floor((24+visualIntensity*28)*vc.rainCrashBurst*densityMultiplier*lod))
		for _,emitter in ipairs(vc.skidEmitters or {}) do if emitter.Parent and amount>0 then emitter:Emit(amount) end end
		vc.rainCrashBurst=nil
	elseif not wet then vc.rainCrashBurst=nil end
	SPA_PerfMark("SkidFX",perfStart)
	SPA_PerfMark("VehicleFX",perfStart,SPA_EFFECT_MODE)
end

function SPA_VehicleAudio:Step(uid,st,vc,now,dt)
	local perfStart=ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
	if not vc or vc.cleaned or not st.seat then return end
	if not vc.vehicleAudioBuilt then self:Build(uid,vc) end
	local velocity=st.seat.AssemblyLinearVelocity; local speed=velocity.Magnitude
	for _,sound in ipairs({vc.idleSound,vc.driveSound,vc.shiftSound,vc.skidSound}) do if sound and sound.Parent then sound.PlaybackSpeed=1.0 end end
	vc.filteredSpeed=(vc.filteredSpeed or speed)+(speed-(vc.filteredSpeed or speed))*math.clamp(dt*8,0,1)
	local smoothSpeed=vc.filteredSpeed
	local configured=nil
	if SPA_RaceModes and SPA_RaceModes.Configured then
		local ok,value=pcall(SPA_RaceModes.Configured,SPA_RaceModes,st,vc); if ok then configured=tonumber(value) end
	end
	if configured then self:ObserveConfigured(uid,st,vc,configured,now) end
	local forwardVelocity=velocity:Dot(st.seat.CFrame.LookVector)
	local startSpeed=tonumber(SPA_ENGINE_START_SPEED) or self.START_SPEED
	local top=vc.detectedTopSpeed or math.max(startSpeed+60,vc.calibrationPeakSpeed or 0)
	local idleFactor
	if smoothSpeed<=10 then idleFactor=1 elseif smoothSpeed<startSpeed then idleFactor=1-(smoothSpeed-10)/math.max(startSpeed-10,1)*0.45 else idleFactor=0.55-math.clamp((smoothSpeed-startSpeed)/30,0,1)*0.50 end
	local driveFactor=0
	if smoothSpeed>=startSpeed-5 and smoothSpeed<startSpeed then driveFactor=(smoothSpeed-(startSpeed-5))/5*0.20
	elseif smoothSpeed>=startSpeed and smoothSpeed<startSpeed+30 then driveFactor=0.20+(smoothSpeed-startSpeed)/30*0.40
	elseif smoothSpeed>=startSpeed+30 then driveFactor=0.60+math.clamp((smoothSpeed-(startSpeed+30))/math.max(top-(startSpeed+30),1),0,1)*0.40 end
	if not SPA_VEHICLE_AUDIO_ENABLED then idleFactor=0; driveFactor=0 end
	local idleVolumeTarget=idleFactor*SPA_IDLE_VOLUME; local driveVolumeTarget=driveFactor*SPA_DRIVE_VOLUME
	if now<(vc.shiftDipUntil or 0) then driveVolumeTarget*=0.70 end
	vc.idleVolume=(vc.idleVolume or 0)+(idleVolumeTarget-(vc.idleVolume or 0))*math.clamp(dt*6,0,1)
	vc.driveVolume=(vc.driveVolume or 0)+(driveVolumeTarget-(vc.driveVolume or 0))*math.clamp(dt*6,0,1)
	for _,motor in ipairs({{vc.idleSound,SPA_IDLE_SOUND_ID,vc.idleVolume},{vc.driveSound,SPA_DRIVE_SOUND_ID,vc.driveVolume}}) do
		local sound,id,volume=motor[1],motor[2],motor[3]
		if sound and sound.Parent then
			sound.SoundId=self:ValidSoundId(id) and id or ""; sound.Volume=volume; sound.PlaybackSpeed=1.0; sound.Looped=true
			if self:ValidSoundId(id) then if not sound.IsPlaying then sound:Play() end elseif sound.IsPlaying then sound:Stop() end
		end
	end
	self:StepSkid(uid,st,vc,now,dt,speed)
	local previous=vc.previousSpeed or speed; local delta=speed-previous; local teleported=math.abs(delta)>45
	self:ObserveCalibration(uid,vc,now,speed,teleported)
	if vc.gearCalibrated and vc.shiftRunReady then
		if teleported then
			vc.lastGear=vc.currentGear; vc.currentGear=self:GearAtSpeed(vc,speed); vc.simGear=vc.currentGear
		elseif forwardVelocity>0 and delta>0.2 and now-(vc.lastShiftAt or 0)>=self.SHIFT_COOLDOWN then
			local threshold=vc.gearThresholds and vc.gearThresholds[vc.currentGear]
			if threshold and previous<threshold and speed>=threshold then
				vc.lastGear=vc.currentGear; vc.currentGear+=1; vc.simGear=vc.currentGear; vc.lastShiftAt=now; self:PlayShift(vc)
			end
		end
		while vc.currentGear>1 and speed<(vc.gearThresholds[vc.currentGear-1]-2.5) do
			vc.lastGear=vc.currentGear; vc.currentGear-=1; vc.simGear=vc.currentGear
		end
	end
	if speed<=5 then
		vc.audioStoppedSince=vc.audioStoppedSince or now
		if now-vc.audioStoppedSince>=0.8 then
			vc.lastGear=vc.currentGear; vc.currentGear=1; vc.simGear=1
			if vc.gearCalibrated then vc.shiftRunReady=true end
		end
	else vc.audioStoppedSince=nil end
	vc.previousSpeed=speed; vc.lastAudioSpeed=speed
	SPA_PerfMark("VehicleAudio",perfStart)
end

function SPA_VehicleAudio:Cleanup(vc)
	if not vc then return end
	for _,entry in ipairs({{vc.idleSound,vc.audioOwnsIdle},{vc.driveSound,vc.audioOwnsDrive},{vc.shiftSound,vc.audioOwnsShift},{vc.skidSound,vc.audioOwnsSkid}}) do
		if entry[1] and entry[1].Parent and entry[2] then pcall(function() entry[1]:Destroy() end) end
	end
	for _,attachment in ipairs(vc.skidAttachments or {}) do
		if attachment and attachment.Parent and attachment:GetAttribute("SPAManagedSkid")==true then pcall(function() attachment:Destroy() end) end
	end
	vc.idleSound=nil; vc.driveSound=nil; vc.shiftSound=nil; vc.skidSound=nil; vc.skidAttachments={}; vc.skidEmitters={}; vc.skidOwnedEmitters={}; vc.wheels={}
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
	local detail = ("player=%s UID=%s vehicle=%s strikes=%d previous=%s current=%s type=%s reason=%s"):format(
		pl and pl.Name or "-", tostring(uid), state.vehicleRoot:GetFullName(), state.strikes,
		tostring(previous), tostring(current), kind, reason)
	proposeSanction(uid, "NoClip detectado", detail)
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
		if refs.pits then refs.pits.Text="PIT STOPS · "..tostring(pitData[uid] and pitData[uid].pitStopsMade or 0) end
	end
	if self.confirmUntil > 0 and tick() > self.confirmUntil then self:CancelReset() end
end

function SPA_LapsControl:Set(uid, value, batch)
	if not Players:GetPlayerByUserId(uid) or type(value) ~= "number" or value ~= value or math.abs(value) == math.huge then return end
	if not lapData[uid] then lapData[uid] = { lapsMade = 0, lastLapTouch = 0 } end
	SPA_Timing:Reset(uid)
	lapData[uid].lapsMade = mclamp(mfloor(value), 0, MAX_LAPS)
	if SPA_RaceModes then SPA_RaceModes:Clear(uid); SPA_RaceModes.leaderLap = 0; SPA_RaceModes.leaderUid = nil end
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
	row.Name = "LapControl_" .. uid; row.Size = UDim2.new(1, -8, 0, 170)
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
	local pits=Instance.new("TextLabel"); pits.Size=UDim2.new(1,-12,0,28); pits.Position=UDim2.fromOffset(6,82)
	pits.BackgroundTransparency=1; pits.TextColor3=C_ORANGE; pits.Font=Enum.Font.GothamBold; pits.TextSize=14; pits.Parent=row; refs.pits=pits
	for i,delta in ipairs({-1,1}) do
		local b=Instance.new("TextButton"); b.Size=UDim2.new(0.5,-8,0,48); b.Position=UDim2.new((i-1)*0.5,4,0,114)
		b.Text=delta<0 and "−1 BOX" or "+1 BOX"; b.BackgroundColor3=C_BG; b.TextColor3=C_WHITE; b.Font=Enum.Font.GothamBold; b.TextSize=14; b.Parent=row
		refs.connections[#refs.connections+1]=b.Activated:Connect(function() SPA_PitsControl:Adjust(uid,delta) end)
	end
	for i, label in ipairs({ "− LAP", "+ LAP", "RESET" }) do
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1/3, -8, 0, 44); button.Position = UDim2.new((i-1)/3, 4, 0, 32)
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

-- V2.19: DRS / OT / pits. Evaluation shares HB-NITRO; no new connections.
DRS_ENABLED = true
DRS_START_LAP = 3
DRS_GAP_SECONDS = 1.0
DRS_SPEED_BONUS = 10
DRS_DETECTION_WIDTH = 80
DRS_DETECTION_HEIGHT = 30
DRS_DETECTION_DEPTH = 200
DRS_PENALTY_ENABLED = true
DRS_CHAT_ENABLED = true
DRS_ZONES_VISIBLE = true
OT_ENABLED = true
OT_SPEED_BONUS = 2 -- Informational: the logic always uses the literal 2.
OT_GAP_SECONDS = 1.0
OT_DETECTION_ZONE = nil
OT_DETECTION_WIDTH = 80
OT_DETECTION_HEIGHT = 30
OT_DETECTION_DEPTH = 20
OT_ZONES_VISIBLE = true
PIT_LIMITER_ENABLED = true
PIT_SPEED_PENALTY = -30
DRS_STATE = {}
OT_STATE = {}
SPA_DRS = { zones = {}, initialized = false, nextId = 0 }
SPA_OT = { initialized = false }
SPA_PitLimiter = { states = {}, initialized = false }
SPA_RaceModes = { traces = {}, drivers = {}, ahead = {}, speedChecks = {}, leaderLap = 0, leaderUid = nil }

function SPA_RaceModes:Clear(uid)
	DRS_STATE[uid] = nil; OT_STATE[uid] = nil; SPA_PitLimiter.states[uid] = nil
	self.traces[uid] = nil; self.drivers[uid] = nil; self.ahead[uid] = nil
	self.speedChecks[uid] = nil
	for follower, ahead in pairs(self.ahead) do if ahead == uid then self.ahead[follower] = nil end end
end

function SPA_RaceModes:Reset()
	table.clear(DRS_STATE); table.clear(OT_STATE); table.clear(SPA_PitLimiter.states)
	table.clear(self.traces); table.clear(self.drivers); table.clear(self.ahead)
	table.clear(self.speedChecks)
	self.leaderLap = 0; self.leaderUid = nil
end

function SPA_RaceModes:NewState()
	return { insideDetection = false, insideZone = false, permitted = false, active = false,
		lastPermission = false, lap = 0, lastNotice = 0, notices = {} }
end

function SPA_RaceModes:Eligible(uid)
	local st = PlayerState and PlayerState[uid]
	return st and st.inVehicle and st.seat and st.seat.Parent
		and not FIA_EXCLUDED[uid] and not DSQ_DRIVERS[uid]
end

function SPA_RaceModes:RefreshZone(zone)
	if not zone or not zone.part or not zone.part.Parent then return false end
	zone.cf = zone.part.CFrame; zone.size = zone.part.Size
	return true
end

function SPA_RaceModes:Inside(zone, position)
	if not zone or not position or not zone.part.Parent then return false end
	local p = zone.cf:PointToObjectSpace(position)
	return math.abs(p.X) <= zone.size.X / 2 and math.abs(p.Y) <= zone.size.Y / 2 and math.abs(p.Z) <= zone.size.Z / 2
end

function SPA_RaceModes:Cross(zone, previous, position)
	if not previous or not position or not zone or not zone.part.Parent then return nil end
	local a, b = zone.cf:PointToObjectSpace(previous), zone.cf:PointToObjectSpace(position)
	if (a.Z >= 0) == (b.Z >= 0) or math.abs(a.Z - b.Z) < 1e-6 then return nil end
	local alpha = a.Z / (a.Z - b.Z)
	local p = a + (b - a) * alpha
	if math.abs(p.X) <= zone.size.X / 2 and math.abs(p.Y) <= zone.size.Y / 2 then return alpha end
	return nil
end

function SPA_DRS:Resize(resetState)
	for _, zone in ipairs(self.zones) do
		if zone.part.Parent then
			zone.part.Size = Vector3.new(DRS_DETECTION_WIDTH, DRS_DETECTION_HEIGHT, zone.kind == "DETECTION" and DRS_DETECTION_DEPTH or 4)
			zone.part.Transparency = DRS_ZONES_VISIBLE and 0.65 or 1
			SPA_RaceModes:RefreshZone(zone)
		end
	end
	if resetState ~= false then table.clear(DRS_STATE) end
end

function SPA_DRS:Create(kind, cf)
	assert(kind == "START" or kind == "END" or kind == "DETECTION", "Invalid DRS zone type")
	local index = 1
	for _, zone in ipairs(self.zones) do if zone.kind == kind then index = math.max(index, zone.index + 1) end end
	self.nextId += 1
	local part = Instance.new("Part")
	part.Name = "SPA_DRS_" .. kind .. "_" .. tostring(self.nextId)
	part.Anchored = true; part.CanCollide = false; part.CanTouch = false; part.CanQuery = false
	part.Material = Enum.Material.Neon
	part.Color = kind == "END" and C_RED or (kind == "START" and C_GREEN or C_YELLOW)
	cf=cf*CFrame.Angles(0,math.rad(-90),0) -- direct gate axes, placement offset only
	part.CFrame = cf
	part.Parent = Workspace
	table.insert(self.zones, { part = part, cf = cf, kind = kind, index = index, id = self.nextId })
	self:Resize()
	showNotification("DRS zone " .. kind .. " #" .. tostring(index) .. " created", C_GREEN, "🏁", 5)
end

function SPA_DRS:RemoveLast()
	local zone = table.remove(self.zones)
	if zone then zone.part:Destroy(); zone.part = nil end
	table.clear(DRS_STATE)
end

function SPA_DRS:RemoveAll()
	while #self.zones > 0 do self:RemoveLast() end
	self.nextId = 0
	table.clear(DRS_STATE)
end

function SPA_OT:Remove()
	if OT_DETECTION_ZONE then OT_DETECTION_ZONE.part:Destroy(); OT_DETECTION_ZONE = nil end
	table.clear(OT_STATE)
end

function SPA_OT:Resize(resetState)
	if not OT_DETECTION_ZONE then return end
	local part = OT_DETECTION_ZONE.part
	if not part.Parent then self:Remove(); return end
	part.Size = Vector3.new(OT_DETECTION_WIDTH, OT_DETECTION_HEIGHT, OT_DETECTION_DEPTH)
	part.Transparency = OT_ZONES_VISIBLE and 0.65 or 1
	SPA_RaceModes:RefreshZone(OT_DETECTION_ZONE)
	if resetState ~= false then table.clear(OT_STATE) end
end

function SPA_OT:Create(cf)
	self:Remove()
	cf=cf*CFrame.Angles(0,math.rad(-90),0) -- direct gate axes, placement offset only
	local part = Instance.new("Part")
	part.Name = "SPA_OT_DETECTION"; part.CFrame = cf
	part.Anchored = true; part.CanCollide = false; part.CanTouch = false; part.CanQuery = false
	part.Material = Enum.Material.Neon; part.Color = C_BLUE; part.Parent = Workspace
	OT_DETECTION_ZONE = { part = part, cf = cf, id = "OT" }
	self:Resize()
	showNotification("OT zone created: start and end of each lap", C_GREEN, "🏁", 5)
end

function SPA_RaceModes:Capture(now)
	if not (SPA_DRS.initialized and SPA_OT.initialized and SPA_PitLimiter.initialized) then return end
	if self.session ~= RACE_STATE then self:Reset(); self.session = RACE_STATE end
	-- Refresh references and geometry once per cycle, not once per driver.
	for i = #SPA_DRS.zones, 1, -1 do
		if not self:RefreshZone(SPA_DRS.zones[i]) then
			table.remove(SPA_DRS.zones, i); table.clear(DRS_STATE)
		end
	end
	if OT_DETECTION_ZONE and not self:RefreshZone(OT_DETECTION_ZONE) then SPA_OT:Remove() end
	table.clear(self.ahead)
	local previousUid
	for _, uid in ipairs(CURRENT_STANDINGS_ORDER) do
		if self:Eligible(uid) then self.ahead[uid] = previousUid; previousUid = uid end
	end
	for uid in pairs(self.traces) do if not self:Eligible(uid) then self:Clear(uid) end end
	for uid, st in pairs(PlayerState) do
		if not self:Eligible(uid) then continue end
		local trace = self.traces[uid]
		if not trace or trace.seat ~= st.seat or trace.character ~= st.character then
			self:Clear(uid)
			trace = { seat = st.seat, character = st.character, samples = {} }; self.traces[uid] = trace
		end
		local samples = trace.samples
		local last = samples[#samples]
		local position = st.seat.Position
		local velocity = st.seat.AssemblyLinearVelocity
		-- Respawns, long pauses and teleports do not form detection segments.
		if last and (now - last.time > 0.65 or (position - last.position).Magnitude > math.max(40, velocity.Magnitude * (now - last.time) * 2 + 10)) then
			table.clear(samples); DRS_STATE[uid] = nil; OT_STATE[uid] = nil
			last = nil
		end
		trace.previous = last and last.position or nil
		table.insert(samples, { position = position, time = now, lap = lapData[uid] and lapData[uid].lapsMade or 0 })
		if #samples > 96 then table.remove(samples, 1) end
	end
	-- Clear may invalidate followers; rebuild after joins/leaves to avoid relying on pairs() order.
	table.clear(self.ahead); previousUid = nil
	for _, uid in ipairs(CURRENT_STANDINGS_ORDER) do
		if self:Eligible(uid) then self.ahead[uid] = previousUid; previousUid = uid end
	end
end

function SPA_RaceModes:Gap(uid, position, now)
	local ahead = self.ahead[uid]
	local trace, own = ahead and self.traces[ahead], self.traces[uid]
	if not trace or not own or not self:Eligible(ahead) then return nil end
	local ld, ref = lapData[uid], lapData[ahead]
	-- Do not interpret a one-lap deficit as one second or use a stale finish-line time.
	if not ld or not ref or ld.lapsMade ~= ref.lapsMade then return nil end
	local movement = own.previous and (position - own.previous)
	if not movement or movement.Magnitude < 0.25 then return nil end
	local direction = movement.Unit
	-- Time gap at the same point on the track: interpolate when the car ahead crossed
	-- the follower's perpendicular plane; do not divide straight-line distance by speed.
	for i = #trace.samples, 2, -1 do
		local a, b = trace.samples[i-1], trace.samples[i]
		if now - a.time > 12 then break end
		if b.time > now or b.lap ~= ld.lapsMade or a.lap ~= b.lap then continue end
		local path = b.position - a.position
		local length = path.Magnitude
		if length < 0.25 or path.Unit:Dot(direction) < 0.75 then continue end
		local da, db = (a.position-position):Dot(direction), (b.position-position):Dot(direction)
		if da <= 0 and db >= 0 and db - da > 1e-6 then
			local alpha = -da / (db - da)
			local hit = a.position + path * alpha
			-- Allow adjacent lanes, but reject a nearby separate track section or a different elevation.
			if (hit-position).Magnitude <= 12 and math.abs(hit.Y-position.Y) <= 5 then
				local gap = now - (a.time + (b.time-a.time)*alpha)
				if gap >= 0 and gap <= 12 then return gap, ahead end
			end
		end
	end
	return nil
end

function SPA_RaceModes:Configured(st, vc)
	-- The old fallback caches MaxSpeed; read the live property without scanning.
	if vc and not vc.speedLimitValue and st.seat:IsA("VehicleSeat") then return st.seat.MaxSpeed end
	return getPlayerSpeedLimit(st.seat, vc)
end

function SPA_RaceModes:Emit(mode, uid, state, event, now, bad, reason)
	local key = event
	if now - (state.notices[key] or -math.huge) < (bad and 10 or 2) then return end
	state.notices[key] = now; state.lastNotice = now
	local driver = self.drivers[uid]
	local st = PlayerState[uid]
	if not driver or not st then return end
	local title = mode == "PIT" and "EXCESO DE VELOCIDAD EN BOXES" or (mode .. " " .. event)
	local bonus = mode == "DRS" and DRS_SPEED_BONUS or (mode == "OT" and 2 or PIT_SPEED_PENALTY)
	local name = getDisplayName(st.player)
	local detail = ("UID=%s | lap=%d | actual=%.2f | configured=%.2f | base=%.2f | bonus=%.2f / %.2f | permission=%s | active=%s | GAP=%s | zone=%s | %s"):format(
		tostring(uid), state.lap, driver.actual, driver.configured, driver.base, driver.configured-driver.base, bonus,
		tostring(state.permitted), tostring(state.active), state.gap and sformat("%.3f",state.gap) or "NO DATA",
		tostring(state.zone or "OUTSIDE"), reason or SPA_EnglishLabel(title))
	SPA_RaceControl:AddEvent(mode .. "_" .. event, {
		category = bad and "INCIDENTES" or "CARRERA", severity = bad and "WARN" or "INFO",
		uid = uid, name = name, lap = state.lap, title = SPA_EnglishLabel(title), description = name .. " — " .. SPA_EnglishLabel(title),
		detail = detail, reason = reason or title, speed = driver.actual, configuredSpeed = driver.configured,
		baseSpeed = driver.base, detectedBonus = driver.configured-driver.base, permittedBonus = bonus,
		permitted = state.permitted, active = state.active, gap = state.gap, zone = state.zone, mode = mode,
	})
	if ENABLE_CHAT_EVENTS and (mode ~= "DRS" or DRS_CHAT_ENABLED) then announceRaceEvent(name .. " — " .. SPA_EnglishLabel(title)) end
	if bad then
		-- proposeSanction retains manual approval, deduplication and existing logs.
		if mode ~= "DRS" or DRS_PENALTY_ENABLED then
			proposeSanction(uid, title, detail)
		else
			VIOLATIONS_LOG = VIOLATIONS_LOG or {}
			table.insert(VIOLATIONS_LOG, 1, { type = title, uid = uid, name = name, detail = detail, time = os.date("%H:%M:%S") })
			if #VIOLATIONS_LOG > 200 then table.remove(VIOLATIONS_LOG) end
			if buildViolationsLogList then buildViolationsLogList() end
			showNotification(name .. " — " .. SPA_EnglishLabel(title), C_RED, "⚠", 10)
		end
	end
end

function SPA_RaceModes:Permission(mode, uid, state, value, now)
	state.lastPermission = state.permitted
	state.permitted = value == true
	if not state.permitted then state.active = false end
	if state.permitted and not state.lastPermission then self:Emit(mode, uid, state, "PERMITIDO", now, false) end
end

function SPA_DRS:Step(uid, position, previous, now, blocked)
	local state = DRS_STATE[uid]
	if not state then state = SPA_RaceModes:NewState(); DRS_STATE[uid] = state end
	state.lap = (lapData[uid] and lapData[uid].lapsMade or 0) + 1
	state.insideDetection = false; state.detectionZone = nil
	local gates, hasEnd = {}, {}
	for _, zone in ipairs(self.zones) do
		if zone.kind == "DETECTION" then
			if SPA_RaceModes:Inside(zone,position) then state.insideDetection = true; state.detectionZone = zone.id end
		else
			if zone.kind == "END" then hasEnd[zone.index] = true end
			local alpha = SPA_RaceModes:Cross(zone, previous, position)
			if alpha then table.insert(gates, { zone = zone, alpha = alpha }) end
		end
	end
	table.sort(gates, function(a,b) return a.alpha < b.alpha end)
	for _, hit in ipairs(gates) do
		if hit.zone.kind == "START" then state.zone = hit.zone.index
		elseif state.zone == hit.zone.index then state.zone = nil end
	end
	if state.zone and not hasEnd[state.zone] then state.zone = nil end
	state.gap, state.ahead = SPA_RaceModes:Gap(uid,position,now)
	SPA_RaceModes:Permission("DRS",uid,state, DRS_ENABLED and not blocked and RACE_STATE == "RACE"
		and state.lap >= DRS_START_LAP and state.insideDetection and state.gap ~= nil and state.gap <= DRS_GAP_SECONDS, now)
	return state
end

function SPA_OT:Step(uid, position, previous, now, blocked)
	local state = OT_STATE[uid]
	if not state then state = SPA_RaceModes:NewState(); OT_STATE[uid] = state end
	local completed = lapData[uid] and lapData[uid].lapsMade or 0
	state.lap = completed + 1
	local inside = SPA_RaceModes:Inside(OT_DETECTION_ZONE, position)
	local crossing = SPA_RaceModes:Cross(OT_DETECTION_ZONE,previous,position)
	-- Without a previous sample, do not authorize cars that spawned inside the zone.
	local entry = previous and not state.insideZone and (inside or crossing ~= nil)
	state.insideZone = inside
	-- This single zone defines the cycle, even when LAP detection is disabled.
	-- Requiring a prior exit and the existing crossing debounce prevents continuous rearming.
	if entry and (not state.cycleAt or now-state.cycleAt >= DEBOUNCE_TIME) then
		state.active = false; state.cycleLap = completed; state.zone = "OT"
		state.cycleAt = now; state.cycle = (state.cycle or 0) + 1
		state.gap, state.ahead = SPA_RaceModes:Gap(uid,position,now)
		SPA_RaceModes:Permission("OT",uid,state, OT_ENABLED and not blocked and RACE_STATE == "RACE"
			and state.gap ~= nil and state.gap <= OT_GAP_SECONDS, now)
	end
	if not OT_ENABLED or blocked or RACE_STATE ~= "RACE" or not OT_DETECTION_ZONE then
		SPA_RaceModes:Permission("OT",uid,state,false,now)
		if not OT_ENABLED or not OT_DETECTION_ZONE or RACE_STATE ~= "RACE" then
			state.cycleLap = nil; state.cycleAt = nil; state.zone = nil
		end
	end
	return state
end

function SPA_RaceModes:CheckUse(mode, uid, state, selected, allowed, bonus, now)
	local driver = self.drivers[uid]
	local delta = driver.configured - driver.base
	local exact = math.abs(delta-bonus) < 0.051
	local bad = selected and (not allowed or not exact or driver.actual > driver.base+bonus+0.75)
	-- Require persistence: do not flag a single network or measurement spike.
	if bad then
		state.badSince = state.badSince or now
		if not state.violation and now-state.badSince >= 0.45 then
			state.violation = true; state.active = false
			self:Emit(mode,uid,state,"SIN PERMISO",now,true,
				not allowed and "Use without permission or outside the allowed zone/lap" or (not exact and "Speed increase differs from the authorized bonus" or "Actual speed exceeds the authorized bonus"))
		end
	else
		state.badSince = nil; state.violation = false
	end
	local active = selected and allowed and exact and not bad and driver.actual > driver.base+0.5
	if active and not state.active then state.active = true; self:Emit(mode,uid,state,"ACTIVADO",now,false) end
	state.active = active
end

function SPA_PitLimiter:Step(uid, inPit, now)
	local state = self.states[uid]
	if not state then state = SPA_RaceModes:NewState(); self.states[uid] = state end
	state.lap = (lapData[uid] and lapData[uid].lapsMade or 0)+1
	state.zone = inPit and "PIT IN / PIT OUT" or nil
	local driver = SPA_RaceModes.drivers[uid]
	local expected = math.max(0,driver.base + math.min(0,PIT_SPEED_PENALTY))
	state.expected = expected
	local bad = PIT_LIMITER_ENABLED and inPit and (RACE_STATE == "RACE" or RACE_STATE == "QUALY")
		and (driver.configured > expected+0.051 or driver.actual > expected+0.75)
	if bad then
		state.badSince = state.badSince or now
		if not state.violation and now-state.badSince >= 0.45 then
			state.violation = true
			SPA_RaceModes:Emit("PIT",uid,state,"EXCESO",now,true,("Pit lane limit %.2f; required reduction %.2f"):format(expected,PIT_SPEED_PENALTY))
		end
	else
		state.badSince = nil; state.violation = false
	end
	state.active = inPit and PIT_LIMITER_ENABLED
end

function SPA_RaceModes:Step(uid, st, vc, now)
	if not (SPA_DRS.initialized and SPA_OT.initialized and SPA_PitLimiter.initialized) then return end
	if not self:Eligible(uid) then self:Clear(uid); return end
	local configured = self:Configured(st,vc)
	local cd = customPlayerData[uid]
	local operatorLimit = (cd and cd.speedLimit) or SPEED_LIMIT
	local inPit = pitData[uid] and pitData[uid].status == "En Boxes" or false
	local driver = self.drivers[uid]
	if not driver or driver.seat ~= st.seat then
		-- Do not learn an already-active bonus or the reduced pit lane limit as the baseline.
		driver = { seat = st.seat, base = operatorLimit, operatorLimit = operatorLimit }
		if not inPit and configured > 0 and configured <= operatorLimit then driver.base = configured end
		self.drivers[uid] = driver
	elseif driver.operatorLimit ~= operatorLimit then
		driver.base = operatorLimit; driver.operatorLimit = operatorLimit
	end
	driver.configured = configured
	driver.actual = getVehicleSpeed(st.seat) * 0.28 * 3.6 * CAL_FACTOR + CAL_OFFSET
	local trace = self.traces[uid]
	local previous = trace and trace.previous
	local blocked = inPit or ENABLE_VSC
	local drs = SPA_DRS:Step(uid,st.seat.Position,previous,now,blocked)
	local ot = SPA_OT:Step(uid,st.seat.Position,previous,now,blocked)
	local delta = configured-driver.base
	local increased = delta > 0.051 or driver.actual > driver.base+0.75
	local drsContext = DRS_ENABLED and #SPA_DRS.zones > 0
	local otContext = OT_ENABLED and OT_DETECTION_ZONE ~= nil
	-- Independent modes: do not stack +2 and DRS. +2 belongs to OT when configured.
	local selectOT = otContext and increased and (math.abs(delta-2)<0.051 or (not (drsContext and drs.zone) and ot.cycleLap ~= nil))
	local selectDRS = drsContext and increased and not selectOT
	self:CheckUse("DRS",uid,drs,selectDRS and not inPit and RACE_STATE == "RACE",
		drs.permitted and drs.zone ~= nil and not blocked, DRS_SPEED_BONUS,now)
	self:CheckUse("OT",uid,ot,selectOT and not inPit and RACE_STATE == "RACE",
		ot.permitted and ot.cycleLap ~= nil and not blocked,2,now)
	SPA_PitLimiter:Step(uid,inPit,now)
end

function SPA_RaceModes:SpeedAllowance(uid)
	-- The original detector runs more frequently: never exempt a stale permission.
	if RACE_STATE ~= "RACE" or ENABLE_VSC or (pitData[uid] and pitData[uid].status == "En Boxes") then return 0 end
	local st, driver = PlayerState[uid], self.drivers[uid]
	if not st or not driver or st.seat ~= driver.seat then return 0 end
	local drs, ot = DRS_STATE[uid], OT_STATE[uid]
	local configured = self:Configured(st,VehicleCache[uid])
	local delta = configured-driver.base
	if OT_ENABLED and OT_DETECTION_ZONE and ot and ot.permitted and ot.cycleLap and math.abs(delta-2)<0.051 then return 2 end
	if DRS_ENABLED and drs and drs.permitted and drs.zone and drs.lap >= DRS_START_LAP and math.abs(delta-DRS_SPEED_BONUS)<0.051 then
		for _, zone in ipairs(SPA_DRS.zones) do
			if zone.kind == "DETECTION" and self:Inside(zone,st.seat.Position) then return DRS_SPEED_BONUS end
		end
	end
	return 0
end

function SPA_RaceModes:OnLap(uid, lap)
	if FIA_EXCLUDED[uid] or DSQ_DRIVERS[uid] or lap <= self.leaderLap then return end
	-- The first crossing of each lap sets the reference; subsequent crossings do not post.
	self.leaderLap = lap; self.leaderUid = uid
	local pl = Players:GetPlayerByUserId(uid)
	if not pl then return end
	local total = RACE_STATE == "QUALY" and QUALY_LAPS or MAX_LAPS
	local remaining = math.max(0,total-lap)
	if ENABLE_CHAT_EVENTS then
		announceRaceEvent(("%s — %s — LAP %d/%d — %d remaining"):format(
			remaining == 0 and "🏁 LAPS COMPLETED" or "🏁 FIRST ACROSS",getDisplayName(pl),lap,total,remaining))
	end
end

function SPA_RaceModes:GenericSpeedViolation(uid, configured, limit, now)
	if configured <= limit then self.speedChecks[uid] = nil; return false end
	if not ((DRS_ENABLED and #SPA_DRS.zones > 0) or (OT_ENABLED and OT_DETECTION_ZONE)) then return true end
	-- HB-SPEED (0.06 s) may run before permission is updated by HB-NITRO
	-- (0.15 s). A two-sample grace period prevents false warnings when activating +10/+2.
	self.speedChecks[uid] = self.speedChecks[uid] or now
	return now - self.speedChecks[uid] >= 0.3
end

function SPA_RaceModes:BuildConfig(toggle, adjust, wp, action)
	makeSectionHeader(configScroll,"🏁  DRS — ACTIVE DETECTION",120)
	toggle(configScroll,"Activar DRS",function() return DRS_ENABLED end,function(v) DRS_ENABLED=v; table.clear(DRS_STATE) end,121)
	adjust(configScroll,"Vuelta inicial DRS",function() return DRS_START_LAP end,function(v) DRS_START_LAP=v; table.clear(DRS_STATE) end,1,1,999,nil,122)
	adjust(configScroll,"GAP DRS (s)",function() return DRS_GAP_SECONDS end,function(v) DRS_GAP_SECONDS=math.round(v*10)/10 end,0.1,0.1,10,nil,123)
	adjust(configScroll,"Bonus DRS",function() return DRS_SPEED_BONUS end,function(v) DRS_SPEED_BONUS=v end,1,1,100,nil,124)
	toggle(configScroll,"Sanciones DRS",function() return DRS_PENALTY_ENABLED end,function(v) DRS_PENALTY_ENABLED=v end,125)
	toggle(configScroll,"Anuncios DRS",function() return DRS_CHAT_ENABLED end,function(v) DRS_CHAT_ENABLED=v end,126)
	toggle(configScroll,"Zonas DRS visibles",function() return DRS_ZONES_VISIBLE end,function(v) DRS_ZONES_VISIBLE=v; SPA_DRS:Resize(false) end,127)
	adjust(configScroll,"DRS ancho",function() return DRS_DETECTION_WIDTH end,function(v) DRS_DETECTION_WIDTH=v; SPA_DRS:Resize() end,10,10,1000,nil,128)
	adjust(configScroll,"DRS altura",function() return DRS_DETECTION_HEIGHT end,function(v) DRS_DETECTION_HEIGHT=v; SPA_DRS:Resize() end,5,5,500,nil,129)
	adjust(configScroll,"Detección hasta END: fondo",function() return DRS_DETECTION_DEPTH end,function(v) DRS_DETECTION_DEPTH=v; SPA_DRS:Resize() end,50,10,10000,nil,130)
	wp(configScroll,"+ DRS START",function(cf) SPA_DRS:Create("START",cf) end,131)
	wp(configScroll,"+ DRS END",function(cf) SPA_DRS:Create("END",cf) end,132)
	wp(configScroll,"+ DRS DETECTION",function(cf) SPA_DRS:Create("DETECTION",cf) end,133)
	action(configScroll,"ELIMINAR ÚLTIMA ZONA DRS",C_DARKRED,function() SPA_DRS:RemoveLast() end,134)
	action(configScroll,"ELIMINAR TODAS LAS ZONAS DRS",C_DARKRED,function() SPA_DRS:RemoveAll() end,135)
	makeSectionHeader(configScroll,"🏁  OT — FIXED +2 BONUS",140)
	toggle(configScroll,"Activar OT",function() return OT_ENABLED end,function(v) OT_ENABLED=v; table.clear(OT_STATE) end,141)
	adjust(configScroll,"GAP OT (s)",function() return OT_GAP_SECONDS end,function(v) OT_GAP_SECONDS=math.round(v*10)/10 end,0.1,0.1,10,nil,142)
	toggle(configScroll,"Zona OT visible",function() return OT_ZONES_VISIBLE end,function(v) OT_ZONES_VISIBLE=v; SPA_OT:Resize(false) end,143)
	adjust(configScroll,"OT ancho",function() return OT_DETECTION_WIDTH end,function(v) OT_DETECTION_WIDTH=v; SPA_OT:Resize() end,10,10,1000,nil,144)
	adjust(configScroll,"OT altura",function() return OT_DETECTION_HEIGHT end,function(v) OT_DETECTION_HEIGHT=v; SPA_OT:Resize() end,5,5,500,nil,145)
	adjust(configScroll,"OT fondo",function() return OT_DETECTION_DEPTH end,function(v) OT_DETECTION_DEPTH=v; SPA_OT:Resize() end,5,5,500,nil,146)
	wp(configScroll,"+ CREAR ZONA OT",function(cf) SPA_OT:Create(cf) end,147)
	action(configScroll,"ELIMINAR ZONA OT",C_DARKRED,function() SPA_OT:Remove() end,148)
	makeSectionHeader(configScroll,"🚦  PIT SPEED LIMITER",150)
	toggle(configScroll,"Control de velocidad en boxes",function() return PIT_LIMITER_ENABLED end,function(v) PIT_LIMITER_ENABLED=v; table.clear(SPA_PitLimiter.states) end,151)
	adjust(configScroll,"Reducción en boxes",function() return PIT_SPEED_PENALTY end,function(v) PIT_SPEED_PENALTY=v; table.clear(SPA_PitLimiter.states) end,1,-500,0,nil,152)
	self.configBuilt = true
end

function _spaInitStage(stage, fn, dependencies)
	if not SPA_INIT then SPA_INIT = { stages = {}, failed = {}, criticalFailed = false, ready = false } end
	if SPA_INIT.stages[stage] then return SPA_INIT.stages[stage] == "OK" end
	for _, dependency in ipairs(dependencies or {}) do
		if SPA_INIT.stages[dependency] ~= "OK" then
			SPA_INIT.stages[stage] = "BLOCKED"; SPA_INIT.criticalFailed = true
			SPA_INIT.failed[stage] = "failed dependency: " .. dependency
			warn(("[SPA INIT ERROR] etapa=%s %s"):format(stage, SPA_INIT.failed[stage]))
			return false
		end
	end
	if type(fn) ~= "function" then
		SPA_INIT.stages[stage] = "MISSING"
		SPA_INIT.criticalFailed = true
		SPA_INIT.failed[stage] = "function unavailable"
		warn(("[SPA INIT ERROR] etapa=%s function unavailable"):format(tostring(stage)))
		return false
	end
	local ok, err = xpcall(fn, debug.traceback)
	if ok then
		SPA_INIT.stages[stage] = "OK"
		print(("[SPA INIT] %s OK"):format(tostring(stage)))
	else
		SPA_INIT.stages[stage] = "ERROR"
		SPA_INIT.failed[stage] = tostring(err)
		SPA_INIT.criticalFailed = true
		warn(("[SPA INIT ERROR] etapa=%s error=%s"):format(tostring(stage), tostring(err):match("^[^\n]+") or tostring(err)))
		warn(("[SPA INIT TRACE] etapa=%s traceback=\n%s"):format(tostring(stage), tostring(err)))
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
		SPA_V220.controls[labelTxt] = row
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.6,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text=SPA_EnglishLabel(labelTxt); lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
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
		table.insert(SPA_V220.configRefresh, paint)
		btn.MouseButton1Click:Connect(function()
			local oldValue=getter(); setter(not oldValue); local newValue=getter(); paint()
			SPA_AuditConfigChange(labelTxt,oldValue,newValue)
		end)
	end

	local function mkConfigAdjustRow(parent, labelTxt, getter, setter, step, minV, maxV, onChange, order)
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=order; row.Parent=parent
		SPA_V220.controls[labelTxt] = row
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.5,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text=SPA_EnglishLabel(labelTxt); lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
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
		table.insert(SPA_V220.configRefresh, function() valLbl.Text=tostring(getter()) end)
		local function apply(v)
			local oldValue=getter(); setter(v); local newValue=getter(); valLbl.Text=tostring(newValue)
			SPA_AuditConfigChange(labelTxt,oldValue,newValue)
			if onChange then onChange(v) end
		end
		minus.MouseButton1Click:Connect(function() apply(mclamp(getter()-step,minV,maxV)) end)
		plus.MouseButton1Click:Connect(function() apply(mclamp(getter()+step,minV,maxV)) end)
	end

	local function mkConfigWPRow(parent, labelTxt, onWP, order)
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=order; row.Parent=parent
		SPA_V220.controls[labelTxt] = row
		local lbl=Instance.new("TextLabel")
		lbl.Size=UDim2.new(0.6,0,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1
		lbl.Text=SPA_EnglishLabel(labelTxt); lbl.Font=Enum.Font.GothamBold; lbl.TextColor3=C_WHITE; lbl.TextSize=12
		lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.Parent=row
		local btn=Instance.new("TextButton")
		btn.Size=UDim2.new(0.35,-4,0.7,0); btn.Position=UDim2.new(0.62,0,0.15,0)
		btn.BackgroundColor3=Color3.fromRGB(0,80,160); btn.Text="SET WP"
		btn.Font=Enum.Font.GothamBold; btn.TextColor3=C_WHITE; btn.TextSize=11; btn.BorderSizePixel=0; btn.Parent=row
		local bc=Instance.new("UICorner"); bc.CornerRadius=UDim.new(0,3); bc.Parent=btn
		btn.MouseButton1Click:Connect(function()
			local root=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
			if root then local cf=GetWaypointPlacementCFrame(root.CFrame); onWP(cf); SPA_AuditWaypoint(labelTxt,cf) end
		end)
	end

	local function mkConfigActionRow(parent, btnTxt, btnColor, onAction, order)
		local row=Instance.new("Frame")
		row.Size=UDim2.new(1,0,0,34); row.BackgroundColor3=C_BG2; row.BorderSizePixel=0; row.LayoutOrder=order; row.Parent=parent
		SPA_V220.controls[btnTxt] = row
		local btn=Instance.new("TextButton")
		btn.Size=UDim2.new(1,-16,0.75,0); btn.Position=UDim2.new(0,8,0.125,0)
		btn.BackgroundColor3=btnColor or C_RED; btn.Text=SPA_EnglishLabel(btnTxt)
		btn.Font=Enum.Font.GothamBlack; btn.TextColor3=C_WHITE; btn.TextSize=12; btn.BorderSizePixel=0; btn.Parent=row
		local bc=Instance.new("UICorner"); bc.CornerRadius=UDim.new(0,3); bc.Parent=btn
		btn.MouseButton1Click:Connect(onAction)
	end

	SPA_RaceModes:BuildConfig(mkConfigToggleRow, mkConfigAdjustRow, mkConfigWPRow, mkConfigActionRow)

	local function rebuildWall(wp, cf, width, height, thickness)
		if not wp then return end
		wp.CFrame = cf * CFrame.Angles(0, mrad(90), 0)
		wp.Size   = Vector3.new(width or WP_WIDTH, height or WP_HEIGHT, thickness or WP_THICKNESS)
	end

	-- ── SETTINGS: Race ─────────────────────────────────────────
	makeSectionHeader(configScroll, "⚙  RACE", 1)
	mkConfigAdjustRow(configScroll, "Max Vueltas", function() return MAX_LAPS end, function(v) MAX_LAPS=v end, 1, 1, 999, function() towerHeaderText.Text = "LAP ?/"..MAX_LAPS; lapNumLabel.Text = "? / "..MAX_LAPS end, 2)
	mkConfigAdjustRow(configScroll, "Max Boxes", function() return MAX_PITS end, function(v) MAX_PITS=v end, 1, 1, 99, nil, 3)

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
		table.insert(SPA_V220.configRefresh, function() box.Text=tostring(SPEED_LIMIT) end)
		local bc=Instance.new("UICorner"); bc.CornerRadius=UDim.new(0,3); bc.Parent=box
		box:GetPropertyChangedSignal("Text"):Connect(function() box.Text=box.Text:gsub("%D","") end)
		box.FocusLost:Connect(function()
			local n=tonumber(box.Text)
			if not n then box.Text=tostring(SPEED_LIMIT); return end
			local oldValue=SPEED_LIMIT; SPEED_LIMIT=mclamp(n,10,500); box.Text=tostring(SPEED_LIMIT)
			if oldValue~=SPEED_LIMIT then SPA_RaceControl:AddEvent("SPEED_LIMIT_CHANGED",{category="CONFIG",severity="INFO",operator=player.Name,name=player.Name,oldValue=oldValue,newValue=SPEED_LIMIT,title="SPEED LIMIT CHANGED",description=tostring(oldValue).." → "..tostring(SPEED_LIMIT)}) end
		end)
	end

	-- ── SETTINGS: Qualifying Mode ──────────────────────────────
	makeSectionHeader(configScroll, "🏆  QUALIFYING MODE", 5)
	mkConfigToggleRow(configScroll, "Activar Modo Qualy",
		function() return QUALY_MODE end,
		function(v)
			if v and SPA_Session.state == "RACE" then
				showNotification("🚫 Cannot enable qualifying during a race", C_RED, "🚫", 12)
				return
			end
			if v then
				SPA_Session:BeginQualy()
			elseif SPA_Session.state == "QUALY" then
				SPA_Session:EndQualy("IDLE")
			end
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

	mkConfigAdjustRow(configScroll, "Vueltas Qualy", function() return QUALY_LAPS end, function(v) QUALY_LAPS = v end, 1, 1, 99, nil, 7)

	mkConfigActionRow(configScroll, "↺  RESETEAR TIEMPOS QUALY", Color3.fromRGB(80,0,120), function()
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
	mkConfigToggleRow(configScroll, "Detección Vueltas",  function() return DETECT_LAPS end,         function(v) DETECT_LAPS=v end,         21)
	mkConfigToggleRow(configScroll, "Detección Boxes",    function() return DETECT_PITS end,         function(v) DETECT_PITS=v end,         22)
	mkConfigToggleRow(configScroll, "Solo Vehículos",     function() return showOnlyVehicles end,    function(v) showOnlyVehicles=v end,    23)

	-- ── SETTINGS: Waypoints ────────────────────────────────────
	makeSectionHeader(configScroll, "📐  WAYPOINTS", 30)
	mkConfigToggleRow(configScroll, "Mostrar Waypoints", function() return WP_VISIBLE end, function(v) WP_VISIBLE = v; applyWPVisibility() end, 31)
	-- ─── PER-WAYPOINT SIZE (not combined) ───────────────────────
	makeSectionHeader(configScroll, "📐  LAP WP (Start/Finish Line)", 32)
	mkConfigAdjustRow(configScroll, "LAP – Ancho (studs)", function() return wpCfg.LAP.width end, function(v)
		wpCfg.LAP.width = v
		if lapWall then lapWall.Size = Vector3.new(wpCfg.LAP.width, wpCfg.LAP.height, wpCfg.LAP.thickness) end
	end, 5, 10, 1000, nil, 33)
	mkConfigAdjustRow(configScroll, "LAP – Alto (studs)", function() return wpCfg.LAP.height end, function(v)
		wpCfg.LAP.height = v
		if lapWall then lapWall.Size = Vector3.new(wpCfg.LAP.width, wpCfg.LAP.height, wpCfg.LAP.thickness) end
	end, 5, 10, 500, nil, 34)
	mkConfigAdjustRow(configScroll, "LAP – Grosor (studs)", function() return wpCfg.LAP.thickness end, function(v)
		wpCfg.LAP.thickness = v
		if lapWall then lapWall.Size = Vector3.new(wpCfg.LAP.width, wpCfg.LAP.height, wpCfg.LAP.thickness) end
	end, 1, 1, 200, nil, 35)

	makeSectionHeader(configScroll, "📐  PIT IN WP (Pit Entry)", 36)
	mkConfigAdjustRow(configScroll, "PIT IN – Ancho (studs)", function() return wpCfg.PIT_IN.width end, function(v)
		wpCfg.PIT_IN.width = v
		if pitInWall then pitInWall.Size = Vector3.new(wpCfg.PIT_IN.width, wpCfg.PIT_IN.height, wpCfg.PIT_IN.thickness) end
	end, 5, 10, 1000, nil, 37)
	mkConfigAdjustRow(configScroll, "PIT IN – Alto (studs)", function() return wpCfg.PIT_IN.height end, function(v)
		wpCfg.PIT_IN.height = v
		if pitInWall then pitInWall.Size = Vector3.new(wpCfg.PIT_IN.width, wpCfg.PIT_IN.height, wpCfg.PIT_IN.thickness) end
	end, 5, 10, 500, nil, 38)
	mkConfigAdjustRow(configScroll, "PIT IN – Grosor (studs)", function() return wpCfg.PIT_IN.thickness end, function(v)
		wpCfg.PIT_IN.thickness = v
		if pitInWall then pitInWall.Size = Vector3.new(wpCfg.PIT_IN.width, wpCfg.PIT_IN.height, wpCfg.PIT_IN.thickness) end
	end, 1, 1, 200, nil, 39)

	makeSectionHeader(configScroll, "📐  PIT OUT WP (Pit Exit)", 40)
	mkConfigAdjustRow(configScroll, "PIT OUT – Ancho (studs)", function() return wpCfg.PIT_OUT.width end, function(v)
		wpCfg.PIT_OUT.width = v
		if pitOutWall then pitOutWall.Size = Vector3.new(wpCfg.PIT_OUT.width, wpCfg.PIT_OUT.height, wpCfg.PIT_OUT.thickness) end
	end, 5, 10, 1000, nil, 41)
	mkConfigAdjustRow(configScroll, "PIT OUT – Alto (studs)", function() return wpCfg.PIT_OUT.height end, function(v)
		wpCfg.PIT_OUT.height = v
		if pitOutWall then pitOutWall.Size = Vector3.new(wpCfg.PIT_OUT.width, wpCfg.PIT_OUT.height, wpCfg.PIT_OUT.thickness) end
	end, 5, 10, 500, nil, 42)
	mkConfigAdjustRow(configScroll, "PIT OUT – Grosor (studs)", function() return wpCfg.PIT_OUT.thickness end, function(v)
		wpCfg.PIT_OUT.thickness = v
		if pitOutWall then pitOutWall.Size = Vector3.new(wpCfg.PIT_OUT.width, wpCfg.PIT_OUT.height, wpCfg.PIT_OUT.thickness) end
	end, 1, 1, 200, nil, 43)
	mkConfigAdjustRow(configScroll, "Radio Checkpoint", function() return CHECKPOINT_RADIUS end, function(v) CHECKPOINT_RADIUS=v end, 10, 100, 600, function()
		lapSphere.Size       = Vector3.new(CHECKPOINT_RADIUS,CHECKPOINT_RADIUS,CHECKPOINT_RADIUS)
		pitEntrySphere.Size  = Vector3.new(CHECKPOINT_RADIUS,CHECKPOINT_RADIUS,CHECKPOINT_RADIUS)
		pitExitSphere.Size   = Vector3.new(CHECKPOINT_RADIUS,CHECKPOINT_RADIUS,CHECKPOINT_RADIUS)
	end, 34)
	mkConfigWPRow(configScroll, "Posición Meta/Vuelta", function(cf)
		SPA_Timing:Reset(nil,true)
		LAP_LINE_CFRAME=cf
		if lapWall    then lapWall.CFrame=cf*CFrame.Angles(0,mrad(90),0)   end
		if lapSphere  then lapSphere.CFrame=cf                               end
		applyWPVisibility()
		_spaLapRuntimeState("LAP_WALL_REPOSITIONED")
	end, 35)
	mkConfigWPRow(configScroll, "Posición Entrada Boxes", function(cf)
		PIT_ENTRY_CFRAME=cf
		if pitInWall      then pitInWall.CFrame=cf*CFrame.Angles(0,mrad(90),0)   end
		if pitEntrySphere then pitEntrySphere.CFrame=cf                          end
		applyWPVisibility()
	end, 36)
	mkConfigWPRow(configScroll, "Posición Salida Boxes", function(cf)
		PIT_EXIT_CFRAME=cf
		if pitOutWall    then pitOutWall.CFrame=cf*CFrame.Angles(0,mrad(90),0)  end
		if pitExitSphere then pitExitSphere.CFrame=cf                           end
		applyWPVisibility()
	end, 37)

	-- ── SETTINGS: Overhead HUD ─────────────────────────────────
	makeSectionHeader(configScroll, "🧠  OVERHEAD HUD", 40)
	mkConfigToggleRow(configScroll, "Mostrar nombre sobre cabeza",    function() return SHOW_HEAD_NAME  end, function(v) SHOW_HEAD_NAME=v  end, 41)
	mkConfigToggleRow(configScroll, "Mostrar velocidad sobre cabeza", function() return SHOW_HEAD_SPEED end, function(v) SHOW_HEAD_SPEED=v end, 42)

	-- ── SETTINGS: Reset ────────────────────────────────────────
	makeSectionHeader(configScroll, "🔄  RESET", 50)
	mkConfigActionRow(configScroll, "RESETEAR VUELTAS (todos)", C_DARKRED, function()
		SPA_RaceModes:Reset()
		lapData={}
		for _,pl in ipairs(Players:GetPlayers()) do ensurePlayerData(pl) end
		for uid, cached in pairs(vueltasRowCache) do
			local lc = cached.lapLbl
			if lc then lc.Text = sformat("LAP 0/%d", MAX_LAPS); lc.TextColor3= C_WHITE end
		end
	end, 51)
	mkConfigActionRow(configScroll, "RESETEAR FAST LAPS (todos)", C_DARKRED, function()
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
		mkConfigActionRow(configScroll, "RESETEAR BOXES (todos)", C_DARKRED, function()
		if SPA_PitsControl and not SPA_PitsControl:CanEdit() then return end
		table.clear(SPA_PitLimiter.states)
		pitData={}
		for _,pl in ipairs(Players:GetPlayers()) do ensurePlayerData(pl) end
		for uid, row in pairs(boxesRowCache) do
			local rightLbl = boxesRowRefs[uid] and boxesRowRefs[uid].rightLbl
			if rightLbl then rightLbl.Text = sformat("PIT 0/%d", MAX_PITS); rightLbl.TextColor3= C_WHITE end
		end
	end, 53)
	mkConfigActionRow(configScroll, "OCULTAR HUD (Q)", C_BG2, function()
		if toggleHUD then toggleHUD() end
	end, 54)

	-- ── SETTINGS: Tower ────────────────────────────────────────
	makeSectionHeader(configScroll, "🏆  TIMING TOWER", 60)
	mkConfigToggleRow(configScroll, "Mostrar Torre", function() return towerConfig.visible end, function(v) towerConfig.visible=v; applyTowerConfig() end, 61)

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
			{name="ROJO",    color=Color3.fromRGB(230,0,0)},
			{name="BLANCO",  color=Color3.fromRGB(200,200,200)},
			{name="VERDE",   color=Color3.fromRGB(0,180,70)},
			{name="AMARILLO",color=Color3.fromRGB(220,180,0)},
			{name="AZUL",    color=Color3.fromRGB(0,100,210)},
			{name="NARANJA", color=Color3.fromRGB(255,130,0)},
			{name="MORADO",  color=Color3.fromRGB(140,0,200)},
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
		colorBtn.Text=SPA_EnglishLabel(colorOptions[colorIndex].name)
		colorBtn.Font=Enum.Font.GothamBold; colorBtn.TextColor3=C_WHITE; colorBtn.TextSize=11
		colorBtn.BorderSizePixel=0; colorBtn.Parent=row
		local cbc2=Instance.new("UICorner"); cbc2.CornerRadius=UDim.new(0,3); cbc2.Parent=colorBtn
		colorBtn.MouseButton1Click:Connect(function()
			colorIndex=colorIndex%#colorOptions+1
			local opt=colorOptions[colorIndex]
			colorBtn.BackgroundColor3=opt.color; colorBtn.Text=SPA_EnglishLabel(opt.name)
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

	mkConfigActionRow(configScroll, "↺  RESETEAR POSICIÓN TORRE", Color3.fromRGB(40,40,60), function()
		TOWER_SCALE=1.0
		towerConfig.posX=1; towerConfig.offsetX=-TOWER_WIDTH
		towerConfig.posY=0; towerConfig.offsetY=12
		applyTowerScale(); applyTowerConfig()
	end, 67)

	-- ══════════════════════════════════════════════════════════
	-- LIST UPDATES
	-- ══════════════════════════════════════════════════════════
	local function updateGuiLists()
		if SPA_ControlCenter and SPA_ControlCenter.initialized then SPA_ControlCenter:Refresh() end
		if SPA_LapsControl.initialized then SPA_LapsControl:Refresh() end
		if SPA_Timing.RefreshUI then SPA_Timing:RefreshUI() end
		if SPA_Mobile then SPA_Mobile:Tower() end
		local perfStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
		local activeUids = {}
		local allData = {}
		for _, p in ipairs(SPA_PlayerList and SPA_PlayerList.list or Players:GetPlayers()) do
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
			SPA_PerfMark("HUD", perfStart, "unchanged")
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
			SPA_PerfMark("HUD", perfStart)
	end

	previousLapPositions = {}
	SPA_UI2_lapStateLogAt = {}
	SPA_UI2_lastSeenInPitIn  = {}
	SPA_UI2_lastSeenInPitOut = {}
	resetSessionMarkers = function()
		SPA_Timing:Reset(nil,true)
		SPA_RaceModes:Reset()
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
	PlayerState = PlayerState or {}
	SPA_PlayerList = SPA_PlayerList or { list = {}, byUid = {} }
	local function addCachedPlayer(p)
		if SPA_PlayerList.byUid[p.UserId] then return end
		SPA_PlayerList.byUid[p.UserId] = p
		SPA_PlayerList.list[#SPA_PlayerList.list + 1] = p
	end
	local function removeCachedPlayer(p)
		SPA_PlayerList.byUid[p.UserId] = nil
		for i = #SPA_PlayerList.list, 1, -1 do
			if SPA_PlayerList.list[i] == p then table.remove(SPA_PlayerList.list, i); break end
		end
	end
	for _, p in ipairs(Players:GetPlayers()) do addCachedPlayer(p) end
	Players.PlayerAdded:Connect(addCachedPlayer)
	Players.PlayerRemoving:Connect(removeCachedPlayer)
	local _tState = 0
	RunService.Heartbeat:Connect(function(dt)
		_tState += dt
		if _tState < 0.06 then return end
		_tState = 0
		local perfStateStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
		local now = tick()
		for _, p in ipairs(SPA_PlayerList.list) do
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
				local speedOk,characterVelocity=pcall(function() return st.root.AssemblyLinearVelocity end)
				st.characterSpeed=speedOk and characterVelocity.Magnitude or 0
			else
				st.position = nil; st.characterSpeed=0
			end
			if st.inVehicle and st.seat and st.seat.Parent then
				local okMotion, seatCF, velocity, angular = pcall(function()
					return st.seat.CFrame, st.seat.AssemblyLinearVelocity, st.seat.AssemblyAngularVelocity
				end)
				if okMotion then
					st.previousVehiclePosition = st.vehiclePosition; st.vehiclePosition = seatCF.Position; st.seatCFrame = seatCF
					st.velocity = velocity; st.angularVelocity = angular; st.rawSpeed = velocity.Magnitude; st.motionAt = now
				end
			else
				st.previousVehiclePosition = nil; st.vehiclePosition = nil; st.seatCFrame = nil
				st.velocity = nil; st.angularVelocity = nil; st.rawSpeed = 0; st.motionAt = now
			end
		end
		SPA_PerfMark("PlayerState", perfStateStart)
	end)

	-- ══════════════════════════════════════════════════════════
	-- VEHICLECACHE: discover references once per vehicle instead
	-- of repeatedly looking them up with GetDescendants().
	-- Invalidated only when the player changes seat/vehicle.
	-- ══════════════════════════════════════════════════════════
	VehicleCache = VehicleCache or {}

	local function getVehicleRootModel(seat)
		return _telGetRootModel(seat)
	end

	local function destroyVehicleEngineSound(vc)
		if vc and SPA_VehicleAudio then SPA_VehicleAudio:Cleanup(vc) end
	end

	local function cleanupVehicleCache(uid, vc)
		SPA_RaceModes:Clear(uid)
		if not vc or vc.cleaned then return end
		vc.cleaned = true
		_telStopDrift(uid)
		SPA_NoClip:Clear(uid, vc)
		destroyVehicleEngineSound(vc)
		if vc and vc.audioConn then pcall(function() vc.audioConn:Disconnect() end); vc.audioConn = nil end
		if vc and vc.nitrousDescendantConn then pcall(function() vc.nitrousDescendantConn:Disconnect() end); vc.nitrousDescendantConn = nil end
		if vc and vc.nitrousRemovingConn then pcall(function() vc.nitrousRemovingConn:Disconnect() end); vc.nitrousRemovingConn = nil end
		if vc and vc.vehicleRoot and SPA_Telemetry and SPA_Telemetry.suspCache then
			if vc.seat then SPA_Telemetry.rootBySeat[vc.seat]=nil end
			local sc = SPA_Telemetry.suspCache[vc.vehicleRoot]
			if sc and sc.connections then for _, c in ipairs(sc.connections) do pcall(function() c:Disconnect() end) end end
			SPA_Telemetry.suspCache[vc.vehicleRoot] = nil
			local tc = SPA_Telemetry.turboCache[vc.vehicleRoot]
			if tc and tc.connections then for _, c in ipairs(tc.connections) do pcall(function() c:Disconnect() end) end end
			SPA_Telemetry.turboCache[vc.vehicleRoot] = nil
			if SPA_Tires and SPA_Tires.scanCache then
				local tireCache=SPA_Tires.scanCache[vc.vehicleRoot]
				if tireCache and tireCache.connections then for _,conn in ipairs(tireCache.connections) do pcall(function() conn:Disconnect() end) end end
				SPA_Tires.scanCache[vc.vehicleRoot]=nil
			end
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
		if ENABLE_NITRO_DEBUG then warn("[SPA NITRO DEBUG] " .. tostring(message)) end
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
			audioScanned = false, audioOwnsIdle = false, audioOwnsDrive = false, audioOwnsShift = false, audioOwnsSkid = false,
			seatId = seat:GetFullName(), nitrousWasActive = false, nitrousStateInitialized = false,
			nitrousPoint = nil, nitrousEmitter = nil, nitrousCacheInvalid = true,
			nitrousDescendantConn = nil, nitrousRemovingConn = nil,
			lastGroundCheck = 0, lastSpringScan = 0, springConstraints = {},
			lastAudioScan = 0, idleSound = nil, driveSound = nil, shiftSound = nil, skidSound = nil, audioReady = false, audioConn = nil,
			driftWheels = {}, tireParts = {},
		}
		local ok, vehicleModel = pcall(getVehicleRootModel, seat)
		vehicleModel = ok and vehicleModel or seat
		vc.vehicleRoot = vehicleModel
		SPA_Telemetry.rootBySeat[seat]=vehicleModel
		refreshNitrousCache(vc, uid, true)
		bindNitrousInvalidation(vc)
		vc.speedLimit = getPlayerSpeedLimit(seat)
		local speedEntry = speedLimitCache[vehicleModel] or speedLimitCache[seat]
		vc.speedLimitValue = speedEntry and speedEntry.valueObject or nil
		vc.speedLimitReady = true
		SPA_VehicleAudio:Build(uid,vc)
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
				warn(("[SPA GROUND EFFECT] %s uid=%s FreeLength=%.4f SpringConstraints=%d"):format(pl and pl.Name or tostring(uid), tostring(uid), illegal, analyzed))
				if proposeSanction then
					proposeSanction(uid, "EFECTO SUELO DETECTADO", ("Illegal suspension detected: FreeLength <= 1.6999 | Detected FreeLength: %.4f | SpringConstraints checked: %d"):format(illegal, analyzed), "DSQ")
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
		SPA_RaceModes:Capture(tick())
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
						warn(("[SPA NITRO DEBUG] uid=%s buildVehicleCache error=%s"):format(tostring(uid), tostring(built)))
					end
				end
				if vc then
					local now = tick()
					ensureVehicleEngineSound(uid, st, vc, now)
					if SPA_AudioRetry:IsVehicle(st.seat, vc.vehicleRoot, st.character) then
						checkGroundEffect(uid, st, vc, now)
					end
					SPA_NoClip:Step(uid, st, vc, now)
					SPA_RaceModes:Step(uid, st, vc, now)
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
						proposeSanction(uid, "Uso de Boost",
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
		if SPA_WeatherFX then SPA_WeatherFX:Step() end
		for uid, st in pairs(PlayerState) do
			local p    = st.player
			local char = st.character
			local head = st.head
			if not char or not st.humanoid or not head then continue end
			if st.inVehicle then
				local seat = st.seat
				local vehicleAudioCache = VehicleCache[uid]
				if vehicleAudioCache then SPA_VehicleAudio:Step(uid,st,vehicleAudioCache,tick(),0.06) end
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
					local effLim = ((cdS and cdS.speedLimit) or SPEED_LIMIT) + SPA_RaceModes:SpeedAllowance(uid)
					-- Actual instantaneous speed and the configured limit are displayed separately.
					local maxSpd = SPA_RaceModes:Configured(st, VehicleCache[uid])
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
					if SPA_RaceModes:GenericSpeedViolation(uid, maxSpd, effLim, tick()) then
						if not SPA_UI2_alertedPlayers[uid] then
							SPA_UI2_alertedPlayers[uid] = true
							local last = notifiedPlayers[uid]
							if not last or tick()-last > NOTIFICATION_COOLDOWN then
								notifiedPlayers[uid] = tick()
								showSpeedingNotification(getDisplayName(p), maxSpd)
								VIOLATIONS_LOG = VIOLATIONS_LOG or {}
								table.insert(VIOLATIONS_LOG, 1, {
									type = "Exceso de Speed", uid = uid, name = getDisplayName(p),
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
		local now = tick()
		for uid, st in pairs(PlayerState) do
			local p = st.player
			if not st.character or not st.inVehicle or not st.seat then
				SPA_Telemetry.current[uid]=nil; _telStopDrift(uid); continue
			end
			local seat = st.seat
			local head = st.head
			-- Compare actual seat identity, not a reused vehicle name; weak reference + lifecycle cleanup.
			if not SPA_Telemetry.driftConns[uid] or SPA_Telemetry.driftConns[uid].seatRef[1]~=seat then
				_telWatchDrift(uid,seat)
			end
			local turboV = _telGetTurbo(seat)
			local perfDriftStart = ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
			local driftV,driftLow,driftHigh,driftStatus = _telGetDrift(seat, uid)
			SPA_PerfMark("DriftSensor",perfDriftStart)
			local suspV  = _telGetSusp(seat)
			SPA_Telemetry.current[uid] = {turbo=turboV,drift=driftV,driftLow=driftLow,driftHigh=driftHigh,driftStatus=driftStatus,suspension=suspV,at=now}
			if head then
				local tag=head:FindFirstChild("SpeedTag"); local telLbl=tag and tag:FindFirstChild("TelemetryText")
				if telLbl then
					if SHOW_HEAD_SPEED then
						local distT=(head.Position-Camera.CFrame.Position).Magnitude
						telLbl.Text=sformat("T:%s  D:%s  S:%s",SPA_EnglishLabel(turboV),driftV,SPA_EnglishLabel(suspV)); telLbl.TextSize=mclamp(30*(10/mmax(distT,1))*0.7,9,28); telLbl.Visible=true
					else telLbl.Text=""; telLbl.Visible=false end
				end
			end
			-- Telemetry alerts
			local cdT = customPlayerData[uid]
			if cdT then
				if cdT.maxTurbo then
					local cI = SPA_Telemetry.TURBO_IDX[turboV] or 0
					local mI = SPA_Telemetry.TURBO_IDX[cdT.maxTurbo] or 999
					local ak = uid.."_turbo"
					if cI > mI and (not SPA_Telemetry.alerts[ak] or now-SPA_Telemetry.alerts[ak] > NOTIFICATION_COOLDOWN) then
						SPA_Telemetry.alerts[ak] = now
						showNotification("⚡ "..getDisplayName(p).."  TURBO "..SPA_EnglishLabel(turboV).." > "..SPA_EnglishLabel(cdT.maxTurbo), C_ORANGE, "⚡", 56)
					end
				end
				if cdT.maxSusp then
					local cI2 = SPA_Telemetry.SUSP_IDX[suspV] or 0
					local mI2 = SPA_Telemetry.SUSP_IDX[cdT.maxSusp] or 999
					local ak2 = uid.."_susp"
					if cI2 > mI2 and (not SPA_Telemetry.alerts[ak2] or now-SPA_Telemetry.alerts[ak2] > NOTIFICATION_COOLDOWN) then
						SPA_Telemetry.alerts[ak2] = now
						showNotification("🔧 "..getDisplayName(p).."  SUSP "..SPA_EnglishLabel(suspV).." > "..SPA_EnglishLabel(cdT.maxSusp), C_YELLOW, "🔧", 92)
					end
				end
				if cdT.maxDrift then
					local exceeds,limitStatus = _telDriftExceeds(driftLow,driftHigh,cdT.maxDrift)
					if SPA_Telemetry.driftConns[uid] then SPA_Telemetry.driftConns[uid].limitStatus=limitStatus end
					local ak3  = uid.."_drift"
					if exceeds and (not SPA_Telemetry.alerts[ak3] or now-SPA_Telemetry.alerts[ak3] > NOTIFICATION_COOLDOWN) then
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
		SPA_Timing:Update(tick()) -- swept timing before the slower PIT/CC maintenance
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
							warn(("[SPA LAP STATE] uid=%s name=%s source=SEAT position=%s localZ=%.3f raceState=%s detect=%s"):format(tostring(uid), stPlayer and stPlayer.Name or "-", tostring(pos), localPos.Z, tostring(RACE_STATE), tostring(DETECT_LAPS)))
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
			-- META and sector registration is handled once by SPA_Timing above.

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
								pd.pitStopsMade = mmax(pd.pitStopsMade,mmin(pd.pitStopsMade+1,MAX_PITS))
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
										SPA_CC_UI_DIRTY=true
										if SPA_V220.ccPanel and SPA_V220.ccPanel.Visible and SPA_V220.ccTab=="REGISTROS CC" and buildRegCCList then buildRegCCList(); SPA_CC_UI_DIRTY=false end

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
												proposeSanction(uid, "Corner cuts acumulados", ("%d track limits infringements (limit: %d)"):format(total, limit))
											end
											-- Potential advantage: flag for review if close behind another car when cutting
											if ENABLE_GAP and getUidAhead then
												local aheadUid = getUidAhead(uid)
												if aheadUid then
													local diff = tonumber((computeGapText(uid, aheadUid):gsub("[^%d%.]","")))
													if diff and diff <= PENALTY_CONFIG.finalGapSec then
														proposeSanction(uid, "Posible ventaja por corte",
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
			task.wait((RACE_STATE=="RACE" or RACE_STATE=="QUALY") and 0.25 or 1)
		end
	end)

	SPA_UI2_cronRunning    = false
	SPA_UI2_cronStartTime  = 0
	SPA_UI2_cronConnection = nil
	local function copyMap(source)
		local out = {}
		for key, value in pairs(source or {}) do
			if type(value) == "table" then local row = {}; for k, v in pairs(value) do row[k] = v end; out[key] = row else out[key] = value end
		end
		return out
	end

	function SPA_Session:ResetIncidentData()
		PENDING_SANCTIONS = {}; APPLIED_SANCTIONS = {}; PENALTY_OFFSET = {}; VIOLATIONS_LOG = {}; OVERTAKE_COUNT = {}; CRASH_LEVE_COUNT = {}
		ccData = {}; ccDebounce = {}; lastSeenInCC = {}; DSQ_DRIVERS = {}
		if SPA_Crash then SPA_Crash.prevVel = {}; SPA_Crash.prevPos = {}; SPA_Crash.pairCD = {}; SPA_Crash.wallCD = {}; SPA_Crash.candidates = {}; SPA_Crash.states = {}; SPA_Crash.log = {}; SPA_Crash.uiDirty = true end
		if SPA_Replay then SPA_Replay.buffers = {}; SPA_Replay.hifi = {}; SPA_Replay.active = {}; SPA_Replay.pairCD = {}; SPA_Replay.events = {}; SPA_Replay.uiDirty = true end
		if SPA_Telemetry then SPA_Telemetry.alerts = {} end
		if SPA_Analysis then SPA_Analysis.data = {}; SPA_Analysis.uiDirty = true end
	end

	function SPA_Session:ResetRaceData()
		lapData = {}; pitData = {}; fastLapData = {}
		GLOBAL_FASTEST_LAP = { time = math.huge, uid = nil, name = nil }
		RACE_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
		CURRENT_STANDINGS_ORDER = {}; QUALY_STANDINGS = {}
		HUD_LAST_SIGNATURE = nil
		HUD_RANK_CACHE.signature = nil; HUD_RANK_CACHE.byUid = {}; HUD_RANK_CACHE.standings = {}; HUD_RANK_CACHE.qualy = {}
		lastSpeeds = {}; notifiedPlayers = {}; SPA_UI2_alertedPlayers = {}; SPA_UI2_lapCompletionRaceTime = {}; SPA_UI2_lastLapsMadeSeenGap = {}
		self:ResetIncidentData()
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
		if SPA_Tires then SPA_Tires._stableTimer = {}; SPA_Tires.log = {}; SPA_Tires.uiDirty = true end
		if ENABLE_VSC and toggleVSC then toggleVSC() end
		for _, pl in ipairs(SPA_PlayerList and SPA_PlayerList.list or Players:GetPlayers()) do ensurePlayerData(pl) end
	end

	function SPA_Session:ResetQualyData(keepFinal)
		QUALY_BEST_TIMES = {}; QUALY_FIA_STATUS = {}; QUALY_NAMES = {}; QUALY_STANDINGS = {}
		QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }
		if not keepFinal then FINAL_QUALY_RESULTS = {}; FINAL_QUALY_GLOBAL_FASTEST = { time = math.huge, uid = nil, name = nil }; self.hasFinalQualy=false end
	end

	function SPA_Session:FreezeQualy()
		FINAL_QUALY_RESULTS = {}
		for uid, qualyTime in pairs(QUALY_BEST_TIMES) do
			local pl = SPA_PlayerList and SPA_PlayerList.byUid[uid] or Players:GetPlayerByUserId(uid)
			FINAL_QUALY_RESULTS[uid] = { uid = uid, name = QUALY_NAMES[uid] or (pl and getDisplayName(pl) or ("UID " .. tostring(uid))), time = qualyTime, fiaExcluded = QUALY_FIA_STATUS[uid] == true }
		end
		FINAL_QUALY_GLOBAL_FASTEST = { time = QUALY_GLOBAL_FASTEST.time, uid = QUALY_GLOBAL_FASTEST.uid, name = QUALY_GLOBAL_FASTEST.name }
		self.hasFinalQualy=true
	end

	function SPA_Session:FreezeRaceResult(now)
		local snapshot = { sessionId = self.sessionId, generation = self.generation, startedAt = self.startedAt, finishedAt = now, duration = self.startedAt and math.max(0, now - self.startedAt) or 0,
			standings = {}, laps = copyMap(lapData), pits = copyMap(pitData), penalties = copyMap(APPLIED_SANCTIONS), dsq = copyMap(DSQ_DRIVERS), fastest = copyMap(GLOBAL_FASTEST_LAP), qualy = copyMap(FINAL_QUALY_RESULTS), qualyFastest = copyMap(FINAL_QUALY_GLOBAL_FASTEST), incidents = {}, stats = {} }
		for i, uid in ipairs(CURRENT_STANDINGS_ORDER or {}) do snapshot.standings[i] = uid end
		for i = 1, math.min(30, #(VIOLATIONS_LOG or {})) do snapshot.incidents[i] = copyMap(VIOLATIONS_LOG[i]) end
		for i = 1, math.min(20, #(SPA_Crash and SPA_Crash.log or {})) do snapshot.incidents[#snapshot.incidents+1] = copyMap(SPA_Crash.log[i]) end
		snapshot.stats.drivers=#snapshot.standings; snapshot.stats.penalties=#snapshot.penalties; snapshot.stats.incidents=#snapshot.incidents
		self.finalSnapshot = snapshot
		table.insert(self.archive, 1, snapshot); while #self.archive > self.MAX_ARCHIVE do table.remove(self.archive) end
		return snapshot
	end

	function SPA_Session:BeginQualy()
		if self.state == "RACE" then return false, "RACE_ACTIVE" end
		self:ResetQualyData(false); self:ResetRaceData()
		QUALY_MODE = true; self.state = "QUALY"; RACE_STATE = self.state
		_spaLapRuntimeState("QUALY_START")
		SPA_RaceControl:AddEvent("QUALY_START", { category = "QUALY", severity = "INFO", title = "🏆 QUALIFYING STARTED", description = "Qualifying mode enabled" })
		return true
	end

	function SPA_Session:EndQualy(nextState)
		if self.state ~= "QUALY" then return false end
		self:FreezeQualy(); QUALY_MODE = false; self.state = nextState or "IDLE"; RACE_STATE = self.state
		_spaLapRuntimeState("QUALY_FINISH")
		SPA_RaceControl:AddEvent("QUALY_FINISH", { category = "QUALY", severity = "INFO", title = "🏁 QUALIFYING FINISHED", description = "Qualifying results frozen" })
		return true
	end

	function SPA_Session:BeginRace(options)
		if self.state == "RACE" then return false, "ALREADY_RACING" end
		local previousState=self.state
		if previousState == "QUALY" then self:EndQualy("IDLE")
		elseif previousState == "FINISHED" or not self.hasFinalQualy then self:ResetQualyData(false) end
		SPA_UI2_cronRunning = false
		self.generation += 1; self.sessionId = HttpService:GenerateGUID(false); self.startedAt = tick(); self.finishedAt = nil; self.finalSnapshot = nil
		self:ResetRaceData()
		QUALY_MODE = false; self.state = "RACE"; RACE_STATE = self.state
		SPA_UI2_cronStartTime = self.startedAt; SPA_UI2_cronRunning = true
		_spaLapRuntimeState("RACE_START")
		SPA_RaceControl:AddEvent("RACE_START", { category = "FLAGS", severity = "INFO", title = "🟢 RACE STARTED", description = "Race timer started", options = options })
		return true
	end

	function SPA_Session:FinishRace()
		if self.state ~= "RACE" then return false, "NOT_RACING" end
		local now = tick(); local snapshot = self:FreezeRaceResult(now)
		SPA_UI2_cronRunning = false; self.finishedAt = now
		_spaLapRuntimeState("RACE_FINISH")
		SPA_RaceControl:AddEvent("RACE_FINISH", { category = "FLAGS", severity = "INFO", title = "🏁 RACE FINISHED", description = "Race timer stopped", duration = snapshot.duration })
		QUALY_MODE = false; self.state = "FINISHED"; RACE_STATE = self.state
		return true, snapshot
	end

	function SPA_Session:PrepareNewRace()
		if self.state == "RACE" then return false, "RACE_ACTIVE" end
		self:ResetRaceData(); self:ResetQualyData(false); self.finalSnapshot=nil; QUALY_MODE = false; self.state = "IDLE"; RACE_STATE = self.state
		return true
	end

	function SPA_Session:Diagnostics()
		local players=0; for _ in pairs(PlayerState or {}) do players+=1 end
		local vehicles=0; for _ in pairs(VehicleCache or {}) do vehicles+=1 end
		local watchers=0; for _ in pairs(SPA_Telemetry and SPA_Telemetry.driftConns or {}) do watchers+=1 end
		local replayBuffers=0; for _ in pairs(SPA_Replay and SPA_Replay.buffers or {}) do replayBuffers+=1 end
		local candidates=0; for _ in pairs(SPA_Crash and SPA_Crash.candidates or {}) do candidates+=1 end
		return ("SESSION %d · %s\nID: %s\nPlayers: %d · Vehicles: %d · Drift watchers: %d\nReplay buffers: %d · Crash candidates: %d"):format(self.generation,self.state,tostring(self.sessionId or "N/A"),players,vehicles,watchers,replayBuffers,candidates)
	end

	makeSectionHeader(configScroll, "🔊  DYNAMIC AUDIO / SKID FX", 67)
	mkConfigToggleRow(configScroll,"Vehicle Audio",function() return SPA_VEHICLE_AUDIO_ENABLED end,function(v) SPA_VEHICLE_AUDIO_ENABLED=v end,68)
	mkConfigAdjustRow(configScroll,"Idle Volume",function() return SPA_IDLE_VOLUME end,function(v) SPA_IDLE_VOLUME=v end,0.1,0,5,nil,68)
	mkConfigAdjustRow(configScroll,"Drive Volume",function() return SPA_DRIVE_VOLUME end,function(v) SPA_DRIVE_VOLUME=v end,0.1,0,5,nil,68)
	mkConfigAdjustRow(configScroll,"Drive Start Speed",function() return SPA_ENGINE_START_SPEED end,function(v) SPA_ENGINE_START_SPEED=v end,1,10,100,nil,68)
	mkConfigToggleRow(configScroll,"Shift Sounds",function() return SPA_SHIFT_SOUNDS_ENABLED end,function(v) SPA_SHIFT_SOUNDS_ENABLED=v end,68)
	mkConfigAdjustRow(configScroll,"Shift Volume",function() return SPA_SHIFT_VOLUME end,function(v) SPA_SHIFT_VOLUME=v end,0.1,0,5,nil,68)
	mkConfigToggleRow(configScroll,"Skid FX",function() return SPA_SKID_FX_ENABLED end,function(v) SPA_SKID_FX_ENABLED=v end,68)
	mkConfigAdjustRow(configScroll,"Skid Volume",function() return SPA_SKID_VOLUME end,function(v) SPA_SKID_VOLUME=v end,0.1,0,5,nil,68)
	mkConfigToggleRow(configScroll,"Skid Smoke",function() return SPA_SKID_SMOKE_ENABLED end,function(v) SPA_SKID_SMOKE_ENABLED=v end,69)
	mkConfigActionRow(configScroll,"⚙  RECALIBRATE TRANSMISSION",Color3.fromRGB(40,90,135),function()
		local target=SPA_Onboard and SPA_Onboard.current or LocalPlayer
		local vc=target and VehicleCache[target.UserId]
		if not vc or not vc.seat or not vc.seat.Parent then
			showNotification("Select a driver who is in a vehicle from ONBOARD",C_ORANGE,"⚙",6)
			return
		end
		SPA_VehicleAudio:ResetCalibration(vc)
		showNotification("Transmission reset · first startup in calibration",C_BLUE,"⚙",6)
	end,70)

	makeSectionHeader(configScroll, "🚨  COLLISION SYSTEM", 71)
	mkConfigToggleRow(configScroll, "Activar choques + repeticiones (CPU+)",
		function() return ENABLE_CRASH_SYSTEM end,
		function(v) ENABLE_CRASH_SYSTEM = v end, 72)
	mkConfigActionRow(configScroll,"💨  DRIFT DIAGNOSTICS",Color3.fromRGB(45,85,135),function()
		local target=SPA_Onboard and SPA_Onboard.current or LocalPlayer
		local text=SPA_Telemetry:Diagnostics(target and target.UserId or LocalPlayer.UserId)
		showNotification(text,C_BLUE,"💨",20)
		if ENABLE_DRIFT_DEBUG then warn("[SPA DRIFT DIAGNOSTICS] "..text) end
	end,72)
	mkConfigActionRow(configScroll,"🧪  SESSION DIAGNOSTICS",Color3.fromRGB(65,65,110),function()
		showNotification(SPA_Session:Diagnostics(),C_BLUE,"🧪",20)
	end,73)
	mkConfigActionRow(configScroll,"↻  PREPARE NEW RACE",Color3.fromRGB(0,105,75),function()
		local ok=SPA_Session:PrepareNewRace()
		showNotification(ok and "New race prepared · IDLE state" or "Stop the race before preparing another one",ok and C_GREEN or C_RED,"↻",20)
	end,73)

	makeSectionHeader(configScroll, "🧹  RESOURCE CLEANUP", 73)
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
		for uid in pairs(SPA_Telemetry.driftConns) do
			if type(uid)=="number" and not activeUids[uid] then _telStopDrift(uid) end
		end
		sweep(groundEffectState); sweep(DSQ_DRIVERS)

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

		showNotification(("🧹 Cleanup: %d entries + %d buffers released"):format(cleaned, buffersFreed),
			Color3.fromRGB(0,150,90), "🧹", 20)
	end
	mkConfigActionRow(configScroll, "🧹  LIMPIAR RECURSOS NO ESENCIALES", Color3.fromRGB(0,120,90), cleanupResources, 74)

	makeSectionHeader(configScroll, "📏  GAP", 74)
	mkConfigToggleRow(configScroll, "Mostrar gap en vez de vuelta",
		function() return ENABLE_GAP end,
		function(v) ENABLE_GAP = v end, 75)
	mkConfigToggleRow(configScroll, "Gap al líder (OFF = gap al de adelante)",
		function() return GAP_MODE_LEAD end,
		function(v) GAP_MODE_LEAD = v end, 76)

	makeSectionHeader(configScroll, "⚖  PENALTY SETTINGS", 90)
	mkConfigAdjustRow(configScroll, "Corner cuts antes de sanción",
		function() return PENALTY_CONFIG.ccWarnings end,
		function(v) PENALTY_CONFIG.ccWarnings = v end, 1, 1, 20, nil, 91)
	mkConfigAdjustRow(configScroll, "Choques leves antes de sanción",
		function() return PENALTY_CONFIG.crashLeves end,
		function(v) PENALTY_CONFIG.crashLeves = v end, 1, 1, 20, nil, 92)
	mkConfigAdjustRow(configScroll, "Gap (s) para marcar ventaja por corte",
		function() return PENALTY_CONFIG.finalGapSec end,
		function(v) PENALTY_CONFIG.finalGapSec = v end, 1, 1, 10, nil, 93)
	mkConfigAdjustRow(configScroll, "Segundos de penalización al confirmar",
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
			txt.Text = ("%s\n%s — %s"):format(s.name, SPA_EnglishLabel(s.reason), s.detail)
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
			lbl.Text = ("[%s] %s — %s: %s"):format(v.time, v.name, SPA_EnglishLabel(v.type), v.detail)
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
			lbl.Text = ("[%s] %s — %s (%s)"):format(s.time, s.name, SPA_EnglishLabel(s.reason), appliedText)
			lbl.TextWrapped = true; lbl.Font = Enum.Font.Gotham; lbl.TextSize = 10
			lbl.TextColor3 = Color3.fromRGB(120,220,150); lbl.TextXAlignment = Enum.TextXAlignment.Left
			lbl.LayoutOrder = idx; lbl.Parent = appliedHolder
		end
	end

	makeSectionHeader(configScroll, "🟡  VIRTUAL SAFETY CAR", 96)
	mkConfigActionRow(configScroll, "🟡  ACTIVAR / DESACTIVAR VSC", Color3.fromRGB(150,120,0), toggleVSC, 97)

	makeSectionHeader(configScroll, "💬  CHAT ANNOUNCEMENTS", 98)
	mkConfigToggleRow(configScroll, "Anunciar eventos, vueltas rápidas y sanciones en el chat",
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
		table.insert(lines, "🏁 POST-RACE REPORT — Administrator CGF1")
		table.insert(lines, "LEAGUE: "..((SPA_LEAGUE_NAME and SPA_LEAGUE_NAME~="") and SPA_LEAGUE_NAME or "NOT CONFIGURED"))
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
		table.insert(lines,SPA_Timing:Report())
		table.insert(lines,"— PIT STOPS —")
		for _,uid in ipairs(CURRENT_STANDINGS_ORDER or {}) do
			local pl=Players:GetPlayerByUserId(uid); local pd=pitData[uid]
			if pl and pd then table.insert(lines,getDisplayName(pl).." · "..tostring(pd.pitStopsMade or 0)) end
		end
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
			if v.type == "Uso de Boost" then nitroCount += 1 end
		end
		table.insert(lines, ("Boost activations detected: %d"):format(nitroCount))

		table.insert(lines, "")
		table.insert(lines, "— APPLIED PENALTIES —")
		if #APPLIED_SANCTIONS == 0 then table.insert(lines, "None.") end
		for _, s in ipairs(APPLIED_SANCTIONS) do
			local sanctionText = s.type == "DSQ" and "DSQ" or ("+" .. tostring(PENALTY_CONFIG.penaltySeconds) .. "s")
			table.insert(lines, ("%s — %s (%s) [%s]"):format(s.name, SPA_EnglishLabel(s.reason), sanctionText, s.time))
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
	mkConfigActionRow(configScroll, "📋  GENERAR INFORME POST-CARRERA", Color3.fromRGB(0,90,140), function()
		reportBox.Text = buildPostRaceReport()
	end, 102)

	-- ── League identity and Discord Race Control Feed ──
	makeSectionHeader(configScroll,"📡  DISCORD RACE CONTROL",102)
	local leagueBox = Instance.new("TextBox")
	leagueBox.Name="LeagueNameBox"; leagueBox.Size=UDim2.new(1,-16,0,36); leagueBox.Position=UDim2.new(0,8,0,0)
	leagueBox.BackgroundColor3=Color3.fromRGB(25,25,32); leagueBox.TextColor3=C_WHITE; leagueBox.Font=Enum.Font.Gotham
	leagueBox.TextSize=12; leagueBox.ClearTextOnFocus=false; leagueBox.PlaceholderText="League name (2–60 characters)"
	leagueBox.Text=SPA_LEAGUE_NAME; leagueBox.TextXAlignment=Enum.TextXAlignment.Left; leagueBox.LayoutOrder=103; leagueBox.Parent=configScroll
	SPA_DiscordLeagueBox=leagueBox
	Instance.new("UICorner",leagueBox).CornerRadius=UDim.new(0,4)
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
	webhookBox.Text = SPA_DISCORD_WEBHOOK_URL~="" and "WEBHOOK CONFIGURED ✓" or ""
	webhookBox.TextXAlignment = Enum.TextXAlignment.Left
	webhookBox.LayoutOrder = 104
	webhookBox.Parent = configScroll
	SPA_DiscordWebhookBox=webhookBox
	local whCorner = Instance.new("UICorner"); whCorner.CornerRadius = UDim.new(0,4); whCorner.Parent = webhookBox
	webhookBox.Focused:Connect(function() if webhookBox.Text=="WEBHOOK CONFIGURED ✓" then webhookBox.Text="" end end)
	webhookBox.FocusLost:Connect(function() if webhookBox.Text=="" and SPA_DISCORD_WEBHOOK_URL~="" then webhookBox.Text="WEBHOOK CONFIGURED ✓" end end)
	mkConfigActionRow(configScroll,"💾  SAVE CONFIGURATION",Color3.fromRGB(0,110,75),function()
		if not SPA_DiscordRaceFeed then showNotification("Discord Feed is not ready yet",C_YELLOW,"⚠",8); return end
		local leagueOK=SPA_DiscordRaceFeed:SetLeagueName(leagueBox.Text)
		local webhookOK=true
		if webhookBox.Text~="WEBHOOK CONFIGURED ✓" then webhookOK=SPA_DiscordRaceFeed:SetWebhook(webhookBox.Text) end
		leagueBox.Text=SPA_LEAGUE_NAME
		webhookBox.Text=SPA_DISCORD_WEBHOOK_URL~="" and "WEBHOOK CONFIGURED ✓" or ""
		if leagueOK and webhookOK then showNotification("Discord Race Control configuration saved",C_GREEN,"✓",8) else showNotification("Review League Name and Discord Webhook",C_YELLOW,"⚠",8) end
	end,105)

	SPA_DiscordStatusLabel=Instance.new("TextLabel")
	SPA_DiscordStatusLabel.Size=UDim2.new(1,-16,0,28); SPA_DiscordStatusLabel.Position=UDim2.new(0,8,0,0)
	SPA_DiscordStatusLabel.BackgroundTransparency=1; SPA_DiscordStatusLabel.Font=Enum.Font.GothamBold
	SPA_DiscordStatusLabel.TextColor3=C_YELLOW; SPA_DiscordStatusLabel.TextSize=11; SPA_DiscordStatusLabel.TextXAlignment=Enum.TextXAlignment.Left
	SPA_DiscordStatusLabel.Text="DISCORD FEED: INITIALIZING"; SPA_DiscordStatusLabel.LayoutOrder=106; SPA_DiscordStatusLabel.Parent=configScroll

	function sendReportToDiscord()
		local text = reportBox.Text
		if not text or text == "" or text == "Press GENERATE REPORT when the race ends." then
			text = buildPostRaceReport()
			reportBox.Text = text
		end
		if SPA_DiscordRaceFeed then SPA_DiscordRaceFeed:SendManualReport(text)
		else showNotification("Discord Feed is not ready yet",C_YELLOW,"⚠",8) end
	end
	mkConfigActionRow(configScroll,"🧪  SEND TEST",Color3.fromRGB(88,101,242),function() if SPA_DiscordRaceFeed then SPA_DiscordRaceFeed:SendTest() end end,107)
	mkConfigActionRow(configScroll, "📤  ENVIAR INFORME A DISCORD", Color3.fromRGB(88,101,242), sendReportToDiscord, 108)

	makeSectionHeader(configScroll, "🏆  SEASON REPORT", 110)
	SEASON_POINTS_TABLE = {25,18,15,12,10,8,6,4,2,1}
	SEASON_STANDINGS = SEASON_STANDINGS or {}  -- [uid] = {name=..., points=...}

	mkConfigActionRow(configScroll, "➕  SUMAR ESTA CARRERA A LA TEMPORADA", Color3.fromRGB(0,90,140), function()
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
	end, 111)

	mkConfigActionRow(configScroll, "📋  GENERAR REPORTE DE TEMPORADA", Color3.fromRGB(0,90,140), function()
		local rows = {}
		for uid, d in pairs(SEASON_STANDINGS) do table.insert(rows, d) end
		tsort(rows, function(a,b) return a.points > b.points end)
		local lines = { "🏆 CHAMPIONSHIP — Administrator CGF1", os.date("%d/%m/%Y"), "" }
		for i, d in ipairs(rows) do
			table.insert(lines, i..". "..d.name.." — "..d.points.." pts")
		end
		reportBox.Text = table.concat(lines, "\n")
	end, 112)

	makeSectionHeader(configScroll, "🔔  NOTIFICATIONS", 78)
	mkConfigToggleRow(configScroll, "Mostrar notificaciones",
		function() return NOTIF_ENABLED end,
		function(v) NOTIF_ENABLED = v end, 79)

	makeSectionHeader(configScroll, "⏱  RACE TIMER", 80)
	do
		local cronRow = Instance.new("Frame")
		cronRow.Size=UDim2.new(1,0,0,44); cronRow.BackgroundColor3=C_BG2; cronRow.BorderSizePixel=0; cronRow.LayoutOrder=81; cronRow.Parent=configScroll

		SPA_V220.controls.CRONOMETRO = cronRow
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
				local started = SPA_Session:BeginRace()
				if not started then return end
				towerHeader.BackgroundColor3 = towerConfig.headerColor
				towerHeaderText.Text = "LAP 0/" .. tostring(MAX_LAPS)
				cronBtn.Text   = "■  STOP"
				cronBtn.BackgroundColor3 = Color3.fromRGB(160,20,20)
				cronLbl.Text   = "0:00.000"
				cronLbl.TextColor3 = C_YELLOW
			else
				local finished, snapshot = SPA_Session:FinishRace()
				if not finished then return end
				local e    = snapshot.duration
				local mins = mfloor(e/60)
				local secs = e%60
				cronLbl.Text       = sformat("%d:%06.3f",mins,secs)
				cronLbl.TextColor3 = C_GREEN
				cronBtn.Text       = "▶  START"
				cronBtn.BackgroundColor3 = Color3.fromRGB(0,120,50)
			end
		end)
		SPA_UI2_cronConnection = RunService.Heartbeat:Connect(function()
			if not SPA_UI2_cronRunning then return end
			local e = tick() - SPA_UI2_cronStartTime
			cronLbl.Text = sformat("%d:%06.3f", mfloor(e / 60), e % 60)
		end)
	end

	-- ═══ CHAT ANNOUNCEMENTS (key events only: fastest laps and penalties) ═══
	-- (ENABLE_CHAT_EVENTS was initialized above, before the CONFIG UI)
	local function _buildCurrentQualyChatStandings()
		local list = {}
		for _, pl in ipairs(SPA_PlayerList and SPA_PlayerList.list or Players:GetPlayers()) do
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
		return RACE_STATE == "QUALY" and ("🏆 QUALIFYING STARTED — " .. tostring(QUALY_LAPS) .. " laps") or "🏁 QUALIFYING FINISHED"
	end

	function buildRaceChatMessage()
		return ("🏁 RACE — LAP %d/%d"):format(SPA_RaceModes.leaderLap, MAX_LAPS)
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
		if reason == "Uso de Boost" then
			SPA_RaceControl:AddEvent("BOOST", { category = "INCIDENTES", severity = "WARN", uid = uid, name = name, title = "⚡ BOOST", description = name .. " — Boost use detected" })
		end
		if sanctionType == "DSQ" then
			SPA_RaceControl:AddEvent("DSQ_PROPOSED", { category = "SANCIONES", severity = "WARN", uid = uid, name = name, title = "⛔ DSQ PROPOSED", description = name .. " — GROUND EFFECT DETECTED" })
		end
		SPA_RaceControl:AddEvent("SANCTION_PROPOSED", { category = "SANCIONES", severity = "WARN", uid = uid, name = name, reason = reason, detail = detail, title = "🚩 PENALTY PROPOSED", description = name .. " — " .. tostring(SPA_EnglishLabel(reason)) })
		showNotification(("🚩 PENALTY PROPOSED — %s: %s"):format(name, SPA_EnglishLabel(reason)), C_RED, "🚩", 15)
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
			SPA_RaceControl:AddEvent("SANCTION_APPLIED", { category = "SANCIONES", severity = "INFO", uid = s.uid, name = s.name, reason = s.reason, title = "✅ PENALTY APPLIED", description = s.name .. " — " .. tostring(SPA_EnglishLabel(s.reason)) .. " — +" .. tostring(PENALTY_CONFIG.penaltySeconds) .. "s" })
			showNotification(("✅ Penalty applied: %s (+%ds)"):format(s.name, PENALTY_CONFIG.penaltySeconds), Color3.fromRGB(0,150,90), "✅", 12)
			if ENABLE_CHAT_EVENTS then announceRaceEvent(("⚠️ PENALTY: %s +%ds — %s"):format(s.name, PENALTY_CONFIG.penaltySeconds, SPA_EnglishLabel(s.reason))) end
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
		for _, pl in ipairs(SPA_PlayerList and SPA_PlayerList.list or Players:GetPlayers()) do
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
		SPA_Timing:Reset(uid,true)
		SPA_RaceModes:Clear(uid)
		lapData[uid]=nil; pitData[uid]=nil; fastLapData[uid]=nil
		lastSpeeds[uid]=nil; notifiedPlayers[uid]=nil
		if PlayerState and PlayerState[uid] then
			if PlayerState[uid].charAncestryConn then pcall(function() PlayerState[uid].charAncestryConn:Disconnect() end) end
			PlayerState[uid] = nil
		end
		if VehicleCache and VehicleCache[uid] then cleanupVehicleCache(uid, VehicleCache[uid]); VehicleCache[uid] = nil end
		_telStopDrift(uid); SPA_Telemetry.current[uid]=nil
		for key in pairs(SPA_Telemetry.alerts) do if tostring(key):match("^"..tostring(uid).."_") then SPA_Telemetry.alerts[key]=nil end end
		SPA_Analysis.data[uid]=nil; SPA_Tires.current[uid]=nil; SPA_Tires._stableTimer[uid]=nil
		SPA_Crash.prevVel[uid]=nil; if SPA_Crash.prevPos then SPA_Crash.prevPos[uid]=nil end; SPA_Crash.candidates[uid]=nil; SPA_Crash.wallCD[uid]=nil
		SPA_Replay.buffers[uid]=nil; SPA_Replay.hifi[uid]=nil; SPA_Replay.active[uid]=nil
		SPA_Crash.states[uid]=nil
		for key in pairs(SPA_Crash.pairCD) do local a,b=tostring(key):match("^(%d+)_(%d+)$"); if tonumber(a)==uid or tonumber(b)==uid then SPA_Crash.pairCD[key]=nil end end
		for key in pairs(SPA_Replay.pairCD) do local a,b=tostring(key):match("^(%d+)_([%dWALL]+)$"); if tonumber(a)==uid or tonumber(b)==uid then SPA_Replay.pairCD[key]=nil end end
		SPA_Crash.uiDirty=true; SPA_Replay.uiDirty=true; SPA_Analysis.uiDirty=true; SPA_Tires.uiDirty=true
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
SPA_INIT.drsOk = _spaInitStage("DRS", function()
	assert(PlayerState and VehicleCache and SPA_RaceModes.configBuilt and type(proposeSanction) == "function" and type(announceRaceEvent) == "function", "DRS dependencies unavailable")
	SPA_DRS.initialized = true
end, { "UI2" })
SPA_INIT.otOk = _spaInitStage("OT", function()
	assert(SPA_RaceModes.configBuilt and type(SPA_OT.Step) == "function", "OT dependencies unavailable")
	OT_SPEED_BONUS = 2
	SPA_OT.initialized = true
end, { "UI2", "DRS" })
SPA_INIT.pitLimiterOk = _spaInitStage("PIT_LIMITER", function()
	assert(pitData and type(SPA_PitLimiter.Step) == "function" and type(proposeSanction) == "function", "Pit lane dependencies unavailable")
	SPA_PitLimiter.initialized = true
end, { "UI2", "DRS", "OT" })
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
	titleTxt.Text = "SPA TRACK LIMITS"
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
			local wall = createCCWall(id, wpName, GetWaypointPlacementCFrame(root.CFrame))
			ccWaypoints[id] = { name = wpName, wall = wall, cframe = wall.CFrame, halfWidth = wall.Size.X / 2, halfHeight = wall.Size.Y / 2 }
			SPA_AuditWaypoint("CC · "..wpName,wall.CFrame)
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
			refresh(); togBtn.MouseButton1Click:Connect(function() local oldValue=getVal(); setVal(not oldValue); local newValue=getVal(); refresh(); SPA_AuditConfigChange(labelText,oldValue,newValue) end)
		end

		local function makeAdjustRow(parent, labelText, getVal, setVal, step, minV, maxV, onChange, order)
			local row = Instance.new("Frame"); row.Size = UDim2.new(1, 0, 0, 34); row.BackgroundColor3 = C_BG2; row.BorderSizePixel = 0; row.LayoutOrder = order; row.Parent = parent
			local lbl = Instance.new("TextLabel"); lbl.Size = UDim2.new(0.42, 0, 1, 0); lbl.Position = UDim2.new(0, 10, 0, 0); lbl.BackgroundTransparency = 1; lbl.Text = labelText; lbl.Font = Enum.Font.GothamBold; lbl.TextColor3 = C_WHITE; lbl.TextSize = 12; lbl.TextXAlignment = Enum.TextXAlignment.Left; lbl.Parent = row
			local minusBtn = Instance.new("TextButton"); minusBtn.Size = UDim2.new(0, 28, 0.7, 0); minusBtn.Position = UDim2.new(0.44, 0, 0.15, 0); minusBtn.BackgroundColor3 = Color3.fromRGB(80, 30, 0); minusBtn.Text = "-"; minusBtn.Font = Enum.Font.GothamBlack; minusBtn.TextColor3 = C_YELLOW; minusBtn.TextSize = 16; minusBtn.BorderSizePixel = 0; minusBtn.Parent = row; Instance.new("UICorner", minusBtn).CornerRadius = UDim.new(0, 3)
			local valLbl = Instance.new("TextLabel"); valLbl.Size = UDim2.new(0.2, 0, 0.7, 0); valLbl.Position = UDim2.new(0.44, 32, 0.15, 0); valLbl.BackgroundColor3 = Color3.fromRGB(20, 20, 32); valLbl.BorderSizePixel = 0; valLbl.Text = tostring(getVal()); valLbl.Font = Enum.Font.GothamBlack; valLbl.TextColor3 = C_WHITE; valLbl.TextSize = 12; valLbl.TextXAlignment = Enum.TextXAlignment.Center; valLbl.Parent = row; Instance.new("UICorner", valLbl).CornerRadius = UDim.new(0, 3)
			local plusBtn = Instance.new("TextButton"); plusBtn.Size = UDim2.new(0, 28, 0.7, 0); plusBtn.Position = UDim2.new(0.65, 4, 0.15, 0); plusBtn.BackgroundColor3 = Color3.fromRGB(0, 70, 30); plusBtn.Text = "+"; plusBtn.Font = Enum.Font.GothamBlack; plusBtn.TextColor3 = C_GREEN; plusBtn.TextSize = 16; plusBtn.BorderSizePixel = 0; plusBtn.Parent = row; Instance.new("UICorner", plusBtn).CornerRadius = UDim.new(0, 3)
			local studsLbl = Instance.new("TextLabel"); studsLbl.Size = UDim2.new(0.28, -8, 1, 0); studsLbl.Position = UDim2.new(0.71, 0, 0, 0); studsLbl.BackgroundTransparency = 1; studsLbl.Text = "studs"; studsLbl.Font = Enum.Font.GothamBold; studsLbl.TextColor3 = Color3.fromRGB(80, 70, 40); studsLbl.TextSize = 10; studsLbl.TextXAlignment = Enum.TextXAlignment.Left; studsLbl.Parent = row
			minusBtn.MouseButton1Click:Connect(function() local oldValue=getVal(); setVal(math.max(minV, oldValue - step)); valLbl.Text = tostring(getVal()); SPA_AuditConfigChange(labelText,oldValue,getVal()); if onChange then onChange() end end)
			plusBtn.MouseButton1Click:Connect(function() local oldValue=getVal(); setVal(math.min(maxV, oldValue + step)); valLbl.Text = tostring(getVal()); SPA_AuditConfigChange(labelText,oldValue,getVal()); if onChange then onChange() end end)
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
			SPA_V220.ccTab = currentCCTab
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

	SPA_V220.ccPanel = ccPanel; SPA_V220.ccFrames=tabFrames
	SPA_V220.openCC = function(tab)
		currentCCTab = tab or "WP CC"; SPA_V220.ccTab = currentCCTab
		ccPanel.Visible = true
		for name, frame in pairs(tabFrames) do
			local active = name == currentCCTab
			frame.Visible = active
			tabButtons[name].BackgroundColor3 = active and CCWPCOLOR or C_BG2
			tabButtons[name].TextColor3 = active and Color3.fromRGB(0,0,0) or C_GRAY
			local indicator = tabButtons[name]:FindFirstChild("Indicator")
			if indicator then indicator.BackgroundColor3 = active and CCWPCOLOR or C_BG2 end
		end
		if currentCCTab == "WP CC" then buildWpCCList() elseif currentCCTab == "REGISTROS CC" then buildRegCCList() else buildConfigCCList() end
	end
	buildWpCCList()
end

SPA_INIT.ccUiOk = _spaInitStage("CC_UI", _setupCCUI, { "UI2" })

-- ════════════════════════════════════════════════════════════════
-- ███  _setupTireSystem — TIRES tab + compound detection  █████
-- ════════════════════════════════════════════════════════════════
function _setupTireSystem()
	local tireFrame = tabFrames["LLANTAS"]
	if not tireFrame then return end
	SPA_Tires.frame=tireFrame

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
	local TIRE_ORDER = { "SUPER BLANDA", "BLANDA", "MEDIA", "DURA", "INTERMEDIA", "FULL WET" }
	local tireByName = {}
	for id, cpd in pairs(SPA_Tires.COMPOUNDS) do tireByName[cpd.name] = cpd end

	-- ── UI rebuild ──────────────────────────────────────────────
	local function rebuildTireUI()
		SPA_Tires.uiDirty=false
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
			cpLbl.BackgroundTransparency = 1; cpLbl.Text = cur and SPA_EnglishLabel(cur.name) or "NO DATA"
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
					local prev = tireFrame:FindFirstChild("TireSel_"..captUid,true)
					if prev then prev:Destroy(); return end

					local rowHeight = SPA_Mobile and SPA_Mobile:Compact() and 44 or 32
					local headerHeight = rowHeight==44 and 44 or 28
					local selectorHeight = headerHeight+2 + #TIRE_ORDER * (rowHeight+2)
					local sel = Instance.new("ScrollingFrame")
					sel.Name = "TireSel_"..captUid
					sel.Size = UDim2.new(0, 220, 0, math.min(selectorHeight,math.max(80,tireFrame.AbsoluteSize.Y-56)))
					sel.CanvasSize = UDim2.fromOffset(0,selectorHeight)
					sel.ScrollingDirection = Enum.ScrollingDirection.Y; sel.ScrollBarThickness=6; sel.Active=true
					sel.Position = UDim2.new(0.5, -110, 0, 48)
					sel.BackgroundColor3 = C_BG2; sel.BackgroundTransparency = 0.05
					sel.BorderSizePixel = 0; sel.ZIndex = 20; sel.Parent = tireFrame
					Instance.new("UICorner", sel).CornerRadius = UDim.new(0, 8)
					Glass.registerModal(sel)

					local selHdr = Instance.new("TextLabel")
					selHdr.Size = UDim2.new(1, -headerHeight, 0, headerHeight); selHdr.BackgroundColor3 = C_RED
					selHdr.BackgroundTransparency = 0; selHdr.BorderSizePixel = 0
					selHdr.Text = "🔧 TIRE CHANGE — " .. getDisplayName(captP)
					selHdr.Font = Enum.Font.GothamBold; selHdr.TextColor3 = C_WHITE
					selHdr.TextSize = 10; selHdr.ZIndex = 21; selHdr.Parent = sel
					Instance.new("UICorner", selHdr).CornerRadius = UDim.new(0, 8)

					for idx, cname in ipairs(TIRE_ORDER) do
						local cpd = tireByName[cname]
						if not cpd then continue end
						local btn2 = Instance.new("TextButton")
						btn2.Size = UDim2.new(1, -8, 0, rowHeight)
						btn2.Position = UDim2.new(0, 0, 0, headerHeight + (idx-1)*(rowHeight+2))
						btn2.BackgroundColor3 = cpd.color; btn2.BackgroundTransparency = 0.75
						btn2.Text = cpd.icon .. "  " .. SPA_EnglishLabel(cpd.name)
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
					closeSelBtn.Size = UDim2.new(0, headerHeight, 0, headerHeight)
					closeSelBtn.Position = UDim2.new(1, -headerHeight, 0, 0)
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
			changeLbl.Text = entry.oldIcon .. " " .. SPA_EnglishLabel(entry.oldName) .. "  →  " .. entry.newIcon .. " " .. SPA_EnglishLabel(entry.newName)
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
		for uid,playerState in pairs(PlayerState) do
			local p=playerState.player
			if FIA_EXCLUDED[uid] then continue end
			local seat=playerState.inVehicle and playerState.seat
			if not seat then continue end
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
	tireFrame:GetPropertyChangedSignal("Visible"):Connect(function()
		if tireFrame.Visible and SPA_Tires.uiDirty then rebuildTireUI() end
	end)
end
SPA_INIT.tiresOk = _spaInitStage("TIRES", _setupTireSystem, { "UI2" })

-- ███ Apply the iOS Glassmorphism interface to ALL GUIs ███████
SPA_INIT.glassOk = _spaInitStage("GLASS_APPLY", Glass and Glass.apply, { "UI1", "UI2", "CC_UI", "TIRES", "LAPS CONTROL" })
SPA_INIT.ready = SPA_INIT.ui1Ok and SPA_INIT.ui2Ok and SPA_INIT.collisionOk and SPA_INIT.analysisOk and SPA_INIT.replayOk and SPA_INIT.ccUiOk and SPA_INIT.tiresOk and SPA_INIT.glassOk and SPA_INIT.audioOk and SPA_INIT.noclipOk and SPA_INIT.lapsControlOk and SPA_INIT.drsOk and SPA_INIT.otOk and SPA_INIT.pitLimiterOk and not SPA_INIT.criticalFailed
if SPA_INIT.ready then
	print("✅ SPA-GLOBAL V" .. SPA_VERSION .. " — RACE CONTROL SYSTEM (Unified)")
	print("🏁 Native track limits monitoring integrated without memory leaks")
	print("🍏 SPAV4 — iOS Glassmorphism interface applied (frosted glass + blur)")
else
	warn("[SPA INIT INCOMPLETE] SPA GLOBAL PRO was not marked as ready; check the failed stages.")
end


-- ═══ V2.20 · TRACK SYSTEM: portable data, no executable code ═══
SPA_Tracks = (function()
	local T = { FORMAT_VERSION = 1, Current = nil, Anchor = nil, Profiles = {},
		MAX_CODE = 262144, MAX_CC = 64, MAX_DRS = 24, MAX_PROFILES = 20 }
	local settingsSpec = {
		laps={1,999,true}, maxPits={1,99,true}, speedLimit={1,500}, pitReduction={-500,0},
		checkpointRadius={1,1000}, ccDebounce={1,30}, ccWidth={1,1000}, ccHeight={1,500}, ccDepth={0.1,100},
		drsLap={1,999,true}, drsGap={0.1,10}, drsBonus={1,100}, drsWidth={1,1000}, drsHeight={1,500}, drsDepth={1,10000},
		otGap={0.1,10}, otWidth={1,1000}, otHeight={1,500}, otDepth={1,500},
		detectLaps="boolean", detectPits="boolean", visible="boolean", ccEnabled="boolean", ccVisible="boolean",
		drsEnabled="boolean", drsPenalty="boolean", drsChat="boolean", drsVisible="boolean",
		otEnabled="boolean", otVisible="boolean", pitEnabled="boolean",
	}
	local function finite(n, lo, hi, integer)
		return type(n)=="number" and n==n and n>=lo and n<=hi and (not integer or n%1==0)
	end
	local function keys(t, names)
		assert(type(t)=="table" and getmetatable(t)==nil, "Invalid data structure")
		for k in pairs(t) do assert(names[k], "Unsupported field: "..tostring(k)) end
	end
	local function array(t, maxCount, exact)
		assert(type(t)=="table", "Expected a list")
		local n=0
		for k in pairs(t) do assert(finite(k,1,maxCount,true), "Invalid list index"); n+=1 end
		assert(n<=maxCount and (not exact or n==exact), "Invalid item count")
		for i=1,n do assert(t[i]~=nil, "Incomplete list") end
		return n
	end
	local function textValue(s, maxSize)
		return type(s)=="string" and #s>0 and #s<=maxSize and not s:find("[%z\1-\31\127]")
	end
	local function tree(t, seen, depth, budget)
		assert(depth<=9, "Data nesting is too deep")
		budget.n+=1; assert(budget.n<=20000,"Too much data")
		if type(t)=="table" then
			assert(not seen[t] and getmetatable(t)==nil,"Recursive or shared tables are not allowed"); seen[t]=true
			for k,v in pairs(t) do
				assert(type(k)=="string" or type(k)=="number","Invalid key")
				tree(v,seen,depth+1,budget)
			end
		else
			assert(type(t)=="string" or type(t)=="boolean" or finite(t,-1e9,1e9),"Invalid data type")
			if type(t)=="string" then assert(#t<=512,"Text is too long") end
		end
	end
	local function cfValid(a)
		array(a,12,12)
		for i=1,12 do assert(finite(a[i],i<=3 and -1e6 or -1.001,i<=3 and 1e6 or 1.001),"Non-finite or out-of-range CFrame") end
		local x=Vector3.new(a[4],a[5],a[6]); local y=Vector3.new(a[7],a[8],a[9]); local z=Vector3.new(a[10],a[11],a[12])
		assert(math.abs(x.Magnitude-1)<0.001 and math.abs(y.Magnitude-1)<0.001 and math.abs(z.Magnitude-1)<0.001
			and math.abs(x:Dot(y))<0.001 and math.abs(x:Dot(z))<0.001 and math.abs(y:Dot(z))<0.001
			and math.abs(x:Cross(y):Dot(z)-1)<0.002,"Invalid CFrame rotation")
	end
	local function zoneValid(z, lap)
		keys(z,{cf=true,size=true,detection=true})
		cfValid(z.cf); array(z.size,3,3)
		for i=1,3 do assert(finite(z.size[i],0.1,10000),"Dimension out of range") end
		if lap then
			keys(z.detection,{width=true,height=true,tolerance=true})
			assert(finite(z.detection.width,0.1,10000) and finite(z.detection.height,0.1,10000)
				and finite(z.detection.tolerance,0,100),"Invalid detection dimensions")
		else assert(z.detection==nil,"Additional detection is not supported") end
	end
	function T:_Validate(data)
		tree(data,{},0,{n=0})
		keys(data,{formatVersion=true,track=true})
		assert(data.formatVersion==self.FORMAT_VERSION,"Incompatible Track Format")
		local t=data.track
		keys(t,{id=true,name=true,author=true,created=true,settings=true,lap=true,pitIn=true,pitOut=true,drs=true,ot=true,cornerCuts=true,sector1=true,sector2=true,sector3=true})
		assert(textValue(t.id,96) and t.id:match("^SPA%-%w[%w%-]*$"),"Invalid TRACK ID")
		assert(textValue(t.name,80) and textValue(t.author,32) and textValue(t.created,32),"Incomplete metadata")
		keys(t.settings,settingsSpec)
		for key,spec in pairs(settingsSpec) do
			local value=t.settings[key]
			if spec=="boolean" then assert(type(value)=="boolean","Invalid configuration: "..key)
			else assert(finite(value,spec[1],spec[2],spec[3]),"Configuration out of range: "..key) end
		end
		zoneValid(t.lap,true); zoneValid(t.pitIn); zoneValid(t.pitOut)
		for i=1,3 do if t["sector"..i]~=nil then zoneValid(t["sector"..i]) end end
		local groups={}
		array(t.drs,self.MAX_DRS*3)
		local ids={}
		for _,d in ipairs(t.drs) do
			keys(d,{kind=true,index=true,id=true,zone=true})
			assert(d.kind=="START" or d.kind=="END" or d.kind=="DETECTION","Invalid DRS type")
			assert(finite(d.index,1,self.MAX_DRS,true) and finite(d.id,1,1000000,true) and not ids[d.id],"Invalid or duplicate DRS ID")
			ids[d.id]=true; groups[d.index]=groups[d.index] or {}
			assert(not groups[d.index][d.kind],"Duplicate DRS zone"); groups[d.index][d.kind]=true
			zoneValid(d.zone)
		end
		for _,g in pairs(groups) do assert(g.START and g.END and g.DETECTION,"Incomplete DRS configuration: missing START/END/DETECTION") end
		assert(t.ot==false or type(t.ot)=="table","Invalid OT zone")
		if t.ot then zoneValid(t.ot) end
		array(t.cornerCuts,self.MAX_CC); ids={}
		for _,cc in ipairs(t.cornerCuts) do
			keys(cc,{id=true,name=true,zone=true})
			assert(finite(cc.id,1,1000000,true) and not ids[cc.id] and textValue(cc.name,80),"Invalid or duplicate CC")
			ids[cc.id]=true; zoneValid(cc.zone)
		end
		return data
	end
	function T:GetSettings()
		return {laps=MAX_LAPS,maxPits=MAX_PITS,speedLimit=SPEED_LIMIT,pitReduction=PIT_SPEED_PENALTY,pitEnabled=PIT_LIMITER_ENABLED,
			detectLaps=DETECT_LAPS,detectPits=DETECT_PITS,visible=WP_VISIBLE,checkpointRadius=CHECKPOINT_RADIUS,
			ccEnabled=DETECTCC,ccVisible=SHOW_WAYPOINTS_CC,ccDebounce=CCDEBOUNCETIME,ccWidth=CCWPWIDTH,ccHeight=CCWPHEIGHT,ccDepth=CCWPTHICKNESS,
			drsEnabled=DRS_ENABLED,drsLap=DRS_START_LAP,drsGap=DRS_GAP_SECONDS,drsBonus=DRS_SPEED_BONUS,drsPenalty=DRS_PENALTY_ENABLED,
			drsChat=DRS_CHAT_ENABLED,drsVisible=DRS_ZONES_VISIBLE,drsWidth=DRS_DETECTION_WIDTH,drsHeight=DRS_DETECTION_HEIGHT,drsDepth=DRS_DETECTION_DEPTH,
			otEnabled=OT_ENABLED,otGap=OT_GAP_SECONDS,otVisible=OT_ZONES_VISIBLE,otWidth=OT_DETECTION_WIDTH,otHeight=OT_DETECTION_HEIGHT,otDepth=OT_DETECTION_DEPTH}
	end
	function T:SetSettings(s)
		MAX_LAPS=s.laps; MAX_PITS=s.maxPits; SPEED_LIMIT=s.speedLimit
		PIT_SPEED_PENALTY=s.pitReduction; PIT_LIMITER_ENABLED=s.pitEnabled
		DETECT_LAPS=s.detectLaps; DETECT_PITS=s.detectPits; WP_VISIBLE=s.visible; CHECKPOINT_RADIUS=s.checkpointRadius
		DETECTCC=s.ccEnabled; SHOW_WAYPOINTS_CC=s.ccVisible; CCDEBOUNCETIME=s.ccDebounce; CCWPWIDTH=s.ccWidth; CCWPHEIGHT=s.ccHeight; CCWPTHICKNESS=s.ccDepth
		DRS_ENABLED=s.drsEnabled; DRS_START_LAP=s.drsLap; DRS_GAP_SECONDS=s.drsGap; DRS_SPEED_BONUS=s.drsBonus
		DRS_PENALTY_ENABLED=s.drsPenalty; DRS_CHAT_ENABLED=s.drsChat; DRS_ZONES_VISIBLE=s.drsVisible
		DRS_DETECTION_WIDTH=s.drsWidth; DRS_DETECTION_HEIGHT=s.drsHeight; DRS_DETECTION_DEPTH=s.drsDepth
		OT_ENABLED=s.otEnabled; OT_GAP_SECONDS=s.otGap; OT_ZONES_VISIBLE=s.otVisible
		OT_DETECTION_WIDTH=s.otWidth; OT_DETECTION_HEIGHT=s.otHeight; OT_DETECTION_DEPTH=s.otDepth
	end
	function T:AnchorCF()
		assert(self.Anchor and self.Anchor.Parent,"Track Anchor is not configured")
		local cf=self.Anchor.CFrame; cfValid({cf:GetComponents()}); return cf
	end
	function T:SetAnchor(cf)
		if not cf then
			local st=PlayerState and PlayerState[player.UserId]
			local root=(st and st.inVehicle and st.seat) or (player.Character and player.Character:FindFirstChild("HumanoidRootPart"))
			assert(root,"Operator position not found"); cf=root.CFrame
		end
		cfValid({cf:GetComponents()})
		if not self.Anchor or not self.Anchor.Parent then
			self.Anchor=Instance.new("Part"); self.Anchor.Name="SPA_TRACK_ANCHOR"
			self.Anchor.Size=Vector3.new(6,1,6); self.Anchor.Anchored=true
			self.Anchor.CanCollide=false; self.Anchor.CanTouch=false; self.Anchor.CanQuery=false
			self.Anchor.Color=C_RED; self.Anchor.Material=Enum.Material.Neon; self.Anchor.Parent=Workspace
		end
		self.Anchor.CFrame=cf; self.Anchor.Transparency=0.25
		return cf
	end
	function T:Zone(part, anchor, detection)
		assert(part and part.Parent,"Incomplete configuration: waypoint unavailable")
		local z={cf={anchor:ToObjectSpace(part.CFrame):GetComponents()},size={part.Size.X,part.Size.Y,part.Size.Z}}
		if detection then z.detection={width=detection.detectionWidth,height=detection.detectionHeight,tolerance=detection.detectionTolerance or 0} end
		return z
	end
	function T:CaptureCurrentTrack(name)
		assert(textValue(name,80),"Enter a track name (1–80 characters)")
		local anchor=self:AnchorCF()
		assert(#self.Profiles<self.MAX_PROFILES,"Profile limit for this session reached")
		local t={id="SPA-"..HttpService:GenerateGUID(false):gsub("%-",""):upper(),name=name,author=player.Name,
			created=os.date("!%Y-%m-%dT%H:%M:%SZ"),settings=self:GetSettings(),drs={},cornerCuts={},ot=false}
		t.lap=self:Zone(lapWall,anchor,wpCfg.LAP); t.pitIn=self:Zone(pitInWall,anchor); t.pitOut=self:Zone(pitOutWall,anchor)
		for i=1,3 do local p=SPA_Timing.gates[i]; if p and p.Parent then t["sector"..i]=self:Zone(p,anchor) end end
		for _,z in ipairs(SPA_DRS.zones) do table.insert(t.drs,{id=z.id,index=z.index,kind=z.kind,zone=self:Zone(z.part,anchor)}) end
		if OT_DETECTION_ZONE then t.ot=self:Zone(OT_DETECTION_ZONE.part,anchor) end
		for id,cc in pairs(ccWaypoints) do table.insert(t.cornerCuts,{id=id,name=cc.name,zone=self:Zone(cc.wall,anchor)}) end
		table.sort(t.cornerCuts,function(a,b) return a.id<b.id end)
		local data=self:_Validate({formatVersion=self.FORMAT_VERSION,track=t})
		self.Current=data; table.insert(self.Profiles,data)
		return data
	end
	function T:Checksum(s)
		local a,b=1,0
		for i=1,#s do a=(a+s:byte(i))%65521; b=(b+a)%65521 end
		return string.format("%08X",b*65536+a)
	end
	function T:GenerateCode(data)
		data=self:_Validate(data or self.Current)
		local json=HttpService:JSONEncode(data)
		assert(#json<=120000,"Track is too large")
		local hex=table.create(#json)
		for i=1,#json do hex[i]=string.format("%02X",json:byte(i)) end
		local body="SPA_TRACK_FORMAT_"..self.FORMAT_VERSION.."|"..table.concat(hex)
		return body.."|"..self:Checksum(body)
	end
	function T:DecodeCode(code)
		assert(type(code)=="string" and #code<=self.MAX_CODE,"Track Code is too long")
		code=code:match("^%s*(.-)%s*$")
		local version,payload,checksum=code:match("^SPA_TRACK_FORMAT_(%d+)|([%x]+)|([%x]+)$")
		assert(version,"Incompatible or incomplete code")
		assert(version==tostring(self.FORMAT_VERSION),"Incompatible Track Format version")
		assert(#checksum==8 and #payload%2==0,"Corrupt Track Code")
		local body="SPA_TRACK_FORMAT_"..version.."|"..payload
		assert(self:Checksum(body)==checksum:upper(),"Invalid checksum: data has been modified or is incomplete")
		local bytes=table.create(#payload/2)
		for i=1,#payload,2 do bytes[#bytes+1]=string.char(tonumber(payload:sub(i,i+1),16)) end
		local data=HttpService:JSONDecode(table.concat(bytes))
		return self:_Validate(data)
	end
	function T:ValidateCode(code)
		local ok,data=pcall(function() return self:DecodeCode(code) end)
		if ok then return true,data end
		return false,tostring(data)
	end
	function T:Snapshot()
		local bundle={lap=lapWall,pitIn=pitInWall,pitOut=pitOutWall,lapSphere=lapSphere,pitInSphere=pitEntrySphere,pitOutSphere=pitExitSphere,
			lapCF=LAP_LINE_CFRAME,pitInCF=PIT_ENTRY_CFRAME,pitOutCF=PIT_EXIT_CFRAME,cfg=wpCfg,cc=ccWaypoints,ccCounter=ccWpCounter,
			drs=SPA_DRS.zones,drsCounter=SPA_DRS.nextId,ot=OT_DETECTION_ZONE,settings=self:GetSettings(),parts={}}
		for _,p in ipairs({lapWall,pitInWall,pitOutWall,lapSphere,pitEntrySphere,pitExitSphere}) do table.insert(bundle.parts,p) end
		bundle.sectors=table.clone(SPA_Timing.gates)
		for _,p in pairs(bundle.sectors) do table.insert(bundle.parts,p) end
		for _,cc in pairs(ccWaypoints) do table.insert(bundle.parts,cc.wall) end
		for _,z in ipairs(SPA_DRS.zones) do table.insert(bundle.parts,z.part) end
		if OT_DETECTION_ZONE then table.insert(bundle.parts,OT_DETECTION_ZONE.part) end
		bundle.parents={}
		bundle.timing={states=SPA_Timing.states,traces=SPA_Timing.traces,last=SPA_Timing.last,best=SPA_Timing.best,overall=SPA_Timing.overall}
		for _,p in ipairs(bundle.parts) do bundle.parents[p]=p.Parent end
		bundle.markers={previous=previousLapPositions,lapLog=SPA_UI2_lapStateLogAt,pitIn=SPA_UI2_lastSeenInPitIn,
			pitOut=SPA_UI2_lastSeenInPitOut,cc=lastSeenInCC,debounce=ccDebounce,collections={}}
		if SPA_RaceModes then
			bundle.markers.leaderLap=SPA_RaceModes.leaderLap; bundle.markers.leaderUid=SPA_RaceModes.leaderUid
			for _,collection in pairs({drs=DRS_STATE,ot=OT_STATE,pit=SPA_PitLimiter.states,traces=SPA_RaceModes.traces,
				drivers=SPA_RaceModes.drivers,ahead=SPA_RaceModes.ahead,speed=SPA_RaceModes.speedChecks}) do
				table.insert(bundle.markers.collections,{target=collection,values=table.clone(collection)})
			end
		end
		return bundle
	end
	function T:RestoreMarkers(markers)
		previousLapPositions=markers.previous; SPA_UI2_lapStateLogAt=markers.lapLog
		SPA_UI2_lastSeenInPitIn=markers.pitIn; SPA_UI2_lastSeenInPitOut=markers.pitOut
		lastSeenInCC=markers.cc; ccDebounce=markers.debounce
		for _,saved in ipairs(markers.collections) do
			table.clear(saved.target); for key,value in pairs(saved.values) do saved.target[key]=value end
		end
		if SPA_RaceModes then SPA_RaceModes.leaderLap=markers.leaderLap; SPA_RaceModes.leaderUid=markers.leaderUid end
	end
	function T:Build(data, anchor)
		local t=data.track
		local b={settings=t.settings,parts={},cfg={},cc={},ccCounter=0,drs={},drsCounter=0}
		local function make(name,z,color,visible)
			local world=anchor:ToWorldSpace(CFrame.new(table.unpack(z.cf)))
			local input=world*CFrame.Angles(0,math.rad(-90),0)
			local p=createWall(name,color,input,Vector3.new(table.unpack(z.size)),visible and 0.4 or 1)
			table.insert(b.parts,p); p.Parent=nil
			return p,input
		end
		local function sphere(name,cf)
			local p=createSphereTrigger(name,cf); table.insert(b.parts,p); p.Parent=nil
			p.Size=Vector3.new(t.settings.checkpointRadius,t.settings.checkpointRadius,t.settings.checkpointRadius)
			return p
		end
		local ok,err=xpcall(function()
			b.sectors={}
			for i=1,3 do if t["sector"..i] then b.sectors[i]=make("SPA_SECTOR_"..i,t["sector"..i],C_BLUE,t.settings.visible) end end
			b.lap,b.lapCF=make("LAP_WALL",t.lap,C_GREEN,t.settings.visible)
			b.pitIn,b.pitInCF=make("PIT_IN_WALL",t.pitIn,C_ORANGE,t.settings.visible)
			b.pitOut,b.pitOutCF=make("PIT_OUT_WALL",t.pitOut,Color3.fromRGB(128,0,128),t.settings.visible)
			b.lapSphere=sphere("LapTrigger",b.lapCF); b.pitInSphere=sphere("PitEntryTrigger",b.pitInCF); b.pitOutSphere=sphere("PitExitTrigger",b.pitOutCF)
			for key,z in pairs({LAP=t.lap,PIT_IN=t.pitIn,PIT_OUT=t.pitOut}) do
				b.cfg[key]={width=z.size[1],height=z.size[2],thickness=z.size[3]}
				if z.detection then
					b.cfg[key].detectionWidth=z.detection.width; b.cfg[key].detectionHeight=z.detection.height; b.cfg[key].detectionTolerance=z.detection.tolerance
				end
			end
			for _,cc in ipairs(t.cornerCuts) do
				local p=make("CCWP_"..cc.id,cc.zone,CCWPCOLOR,t.settings.ccVisible)
				b.cc[cc.id]={name=cc.name,wall=p,cframe=p.CFrame,halfWidth=p.Size.X/2,halfHeight=p.Size.Y/2}
				b.ccCounter=math.max(b.ccCounter,cc.id)
			end
			for _,d in ipairs(t.drs) do
				local p=make("SPA_DRS_"..d.kind.."_"..d.id,d.zone,d.kind=="END" and C_RED or (d.kind=="START" and C_GREEN or C_YELLOW),t.settings.drsVisible)
				p.CanQuery=false
				table.insert(b.drs,{part=p,cf=p.CFrame,size=p.Size,kind=d.kind,id=d.id,index=d.index})
				b.drsCounter=math.max(b.drsCounter,d.id)
			end
			if t.ot then
				local p=make("SPA_OT_DETECTION",t.ot,C_BLUE,t.settings.otVisible); p.CanQuery=false
				b.ot={part=p,cf=p.CFrame,size=p.Size,id="OT"}
			end
		end,debug.traceback)
		if not ok then for _,p in ipairs(b.parts) do p:Destroy() end; error(err,0) end
		return b
	end
	function T:Install(b)
		self:SetSettings(b.settings)
		lapWall=b.lap; pitInWall=b.pitIn; pitOutWall=b.pitOut
		lapSphere=b.lapSphere; pitEntrySphere=b.pitInSphere; pitExitSphere=b.pitOutSphere
		LAP_LINE_CFRAME=b.lapCF; PIT_ENTRY_CFRAME=b.pitInCF; PIT_EXIT_CFRAME=b.pitOutCF
		wpCfg=b.cfg; ccWaypoints=b.cc; ccWpCounter=b.ccCounter
		SPA_Timing.gates=b.sectors or {}
		if b.timing then for key,value in pairs(b.timing) do SPA_Timing[key]=value end end
		SPA_DRS.zones=b.drs; SPA_DRS.nextId=b.drsCounter; OT_DETECTION_ZONE=b.ot
		for _,p in ipairs(b.parts) do
			if b.parents then p.Parent=b.parents[p] else p.Parent=Workspace end
		end
	end
	function T:RefreshUI()
		for _,refresh in ipairs(SPA_V220.configRefresh) do refresh() end
		if buildWpCCList then buildWpCCList() end
		if buildConfigCCList then buildConfigCCList() end
		HUD_LAST_SIGNATURE=nil; HUD_RANK_CACHE.signature=nil
		towerHeaderText.Text="LAP ?/"..MAX_LAPS; lapNumLabel.Text="? / "..MAX_LAPS
	end
	function T:ApplyTrack(data)
		assert(not self.applying,"An import is already in progress")
		assert(RACE_STATE~="RACE" and RACE_STATE~="QUALY","End the active session before changing tracks")
		self:_Validate(data); local anchor=self:AnchorCF()
		-- Freeze only validated data before constructing the Parts.
		data=self:_Validate(HttpService:JSONDecode(HttpService:JSONEncode(data)))
		local old=self:Snapshot()
		local pending=self:Build(data,anchor) -- No detection references have changed.
		self.applying=true
		local ok,err=xpcall(function()
			self:Install(pending)
			for _,p in ipairs(old.parts) do p.Parent=nil end
			self:RefreshUI()
			if resetSessionMarkers then resetSessionMarkers() end
		end,debug.traceback)
		if not ok then
			local restored,restoreError=xpcall(function() self:Install(old); self:RestoreMarkers(old.markers) end,debug.traceback)
			if restored then
				for _,p in ipairs(pending.parts) do p:Destroy() end
				local uiOK,uiError=xpcall(function() self:RefreshUI() end,debug.traceback)
				if not uiOK then warn("[SPA TRACK UI] "..tostring(uiError)) end
			else
				self.Recovery={previous=old,pending=pending}
				warn("[SPA TRACK ROLLBACK ERROR] "..tostring(restoreError))
			end
			self.applying=false; warn("[SPA TRACK APPLY ERROR] "..tostring(err))
			return false,restored and "Import failed. The previous configuration was restored." or "Critical restore error. Objects preserved; check Output."
		end
		-- Remove the old Parts only after confirming the change.
		self.Current=data
		local labels={laps="Max Vueltas",maxPits="Max Boxes",pitReduction="Reducción en boxes",pitEnabled="Control de velocidad en boxes",detectLaps="Detección Vueltas",detectPits="Detección Boxes",checkpointRadius="Radio Checkpoint",ccEnabled="Track limits detection enabled",ccDebounce="Debounce CC",ccWidth="Ancho CC",ccHeight="Alto CC",ccDepth="Grosor CC",drsEnabled="Activar DRS",drsLap="Vuelta inicial DRS",drsGap="GAP DRS (s)",drsBonus="Bonus DRS",drsPenalty="Sanciones DRS",otEnabled="Activar OT",otGap="GAP OT (s)"}
		for key,label in pairs(labels) do SPA_AuditConfigChange(label,old.settings and old.settings[key],data.track.settings[key]) end
		if old.settings and old.settings.speedLimit~=data.track.settings.speedLimit then SPA_RaceControl:AddEvent("SPEED_LIMIT_CHANGED",{category="CONFIG",severity="INFO",operator=player.Name,name=player.Name,oldValue=old.settings.speedLimit,newValue=data.track.settings.speedLimit,title="SPEED LIMIT CHANGED",description=tostring(old.settings.speedLimit).." → "..tostring(data.track.settings.speedLimit)}) end
		SPA_AuditWaypoint("LAP",lapWall.CFrame); SPA_AuditWaypoint("PIT IN",pitInWall.CFrame); SPA_AuditWaypoint("PIT OUT",pitOutWall.CFrame)
		for index,gate in pairs(SPA_Timing.gates) do if gate and gate.Parent then SPA_AuditWaypoint("SECTOR "..tostring(index),gate.CFrame) end end
		for _,zone in ipairs(SPA_DRS.zones) do if zone.part and zone.part.Parent then SPA_AuditWaypoint("DRS "..zone.kind.." #"..tostring(zone.index),zone.part.CFrame) end end
		if OT_DETECTION_ZONE and OT_DETECTION_ZONE.part then SPA_AuditWaypoint("OT",OT_DETECTION_ZONE.part.CFrame) end
		for _,entry in pairs(ccWaypoints) do if entry.wall and entry.wall.Parent then SPA_AuditWaypoint("CC · "..entry.name,entry.wall.CFrame) end end
		self.applying=false
		local cleaned,cleanupError=xpcall(function()
			for _,p in ipairs(old.parts) do p:Destroy() end
		end,debug.traceback)
		if not cleaned then
			warn("[SPA TRACK CLEANUP ERROR] "..tostring(cleanupError))
			return true,"Track loaded; check Output for a cleanup error."
		end
		return true,"Track loaded successfully"
	end
	function T:Summary(data)
		if not data then return "NO TRACK LOADED" end
		local t=data.track
		return ("%s\nTRACK ID: %s\nCreated by @%s · %s\nFormat: SPA TRACK %d · %d LAPS\n%d DRS ZONES · %d CORNER CUTS · PIT CONFIGURED\nOT: %s"):format(
			t.name,t.id,t.author,t.created,data.formatVersion,t.settings.laps,#t.drs/3,#t.cornerCuts,t.ot and "CONFIGURED" or "NO ZONE")
	end
	return T
end)()

-- ═══ V2.20 · Optional UI: navigation over the original panels ═══
function SPA_V220:Make(class, props, parent)
	local obj=Instance.new(class)
	for key,value in pairs(props) do obj[key]=value end
	obj.Parent=parent
	return obj
end
function SPA_V220:Label(parent,text,height,order)
	local label=self:Make("TextLabel",{Size=UDim2.new(1,-12,0,height or 36),BackgroundTransparency=1,
		Text=text,TextColor3=C_WHITE,Font=Enum.Font.Gotham,TextSize=14,TextWrapped=true,RichText=false,
		TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=order or 0},parent)
	if parent:IsA("ScrollingFrame") then label.AutomaticSize=Enum.AutomaticSize.Y end
	return label
end
function SPA_V220:Button(parent,text,fn,order)
	local b=self:Make("TextButton",{Size=UDim2.new(1,-12,0,48),BackgroundColor3=C_BG2,BackgroundTransparency=0.18,
		Text=text,TextColor3=C_WHITE,Font=Enum.Font.GothamBold,TextSize=14,TextWrapped=true,
		BorderSizePixel=0,LayoutOrder=order or 0,AutoButtonColor=true},parent)
	self:Make("UICorner",{CornerRadius=UDim.new(0,12)},b)
	b.MouseButton1Click:Connect(function()
		local ok,err=xpcall(fn,debug.traceback)
		if not ok then
			warn("[SPA V2.20 UI] "..tostring(err))
			if SPA_ControlCenter then SPA_ControlCenter:Message("❌ "..tostring(err):match("^[^\n]+"),true) end
		end
	end)
	return b
end
function SPA_V220:Clear(parent)
	for _,c in ipairs(parent:GetChildren()) do if c:IsA("GuiObject") then c:Destroy() end end
end
function SPA_V220:Input(parent,placeholder,height,multiline)
	return self:Make("TextBox",{Size=UDim2.new(1,-12,0,height or 44),BackgroundColor3=C_BG2,BorderSizePixel=0,
		Text="",PlaceholderText=placeholder,PlaceholderColor3=C_GRAY,TextColor3=C_WHITE,TextSize=13,
		Font=Enum.Font.Code,TextWrapped=true,MultiLine=multiline or false,ClearTextOnFocus=false,RichText=false,
		TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2},parent)
end
function SPA_V220:Panel(gui,title)
	local panel=self:Make("Frame",{Size=UDim2.new(0.92,0,0.88,0),Position=UDim2.fromScale(0.5,0.5),
		AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=C_BG,BorderSizePixel=0,Visible=false},gui)
	self:Make("UISizeConstraint",{MaxSize=Vector2.new(920,760)},panel)
	Glass.registerModal(panel)
	local head=self:Label(panel,title,42); head.Position=UDim2.new(0,14,0,0); head.Size=UDim2.new(1,-72,0,42); head.Font=Enum.Font.GothamBlack
	local content=createScrollingList(panel)
	content.Position=UDim2.new(0,12,0,48); content.Size=UDim2.new(1,-24,1,-98); content.BackgroundTransparency=1
	local footer=self:Label(panel,"",44); footer.Position=UDim2.new(0,14,1,-47); footer.TextSize=12; footer.TextColor3=C_GRAY
	return panel,content,footer
end
function SPA_V220:Navigate(tab, control)
	assert(tabFrames[tab],"Panel unavailable: "..tostring(tab))
	currentTab=tab
	for name,frame in pairs(tabFrames) do
		local active=name==tab; frame.Visible=active
		local btn=tabButtons[name]
		btn.BackgroundColor3=active and C_RED or Color3.new(0,0,0); btn.BackgroundTransparency=active and 0 or 0.6
		btn.TextColor3=active and C_WHITE or C_GRAY
		local ind=btn:FindFirstChild("Indicator")
		if ind then ind.BackgroundColor3=active and C_RED or Color3.new(0,0,0); ind.BackgroundTransparency=active and 0 or 1 end
	end
	mainFrame.Visible=true
	if self.ccPanel then self.ccPanel.Visible=false end
	local target=control and self.controls[control] or tabFrames[tab]
	if target and tab=="CONFIG" then
		local y=target.AbsolutePosition.Y-configScroll.AbsolutePosition.Y+configScroll.CanvasPosition.Y
		configScroll.CanvasPosition=Vector2.new(0,math.max(0,y-12))
	end
	return target or tabFrames[tab]
end

SPA_ControlCenter = { initialized=false, lastRefresh=0 }
function SPA_ControlCenter:Message(message,bad)
	self.message=message
	if self.status then self.status.Text=message; self.status.TextColor3=bad and C_RED or C_GREEN end
	if self.trackStatus then self.trackStatus.Text=message; self.trackStatus.TextColor3=bad and C_RED or C_GREEN end
end
function SPA_ControlCenter:RefreshEffects()
	if not self.effectStatus then return end
	local labels={OFF="● OFF",NORMAL="● NORMAL",RAIN="🌧 RAIN"}
	local colors={OFF=Color3.fromRGB(105,105,115),NORMAL=Color3.fromRGB(0,135,78),RAIN=Color3.fromRGB(35,105,180)}
	self.effectStatus.Text="CURRENT:  "..labels[SPA_EFFECT_MODE]
	self.effectStatus.TextColor3=colors[SPA_EFFECT_MODE]
	for mode,button in pairs(self.effectButtons or {}) do
		local selected=mode==SPA_EFFECT_MODE
		button.BackgroundColor3=selected and colors[mode] or Color3.fromRGB(30,30,42)
		button.BackgroundTransparency=selected and 0 or 0.22
		button.TextColor3=selected and C_WHITE or C_GRAY
	end
	local rainVisible=SPA_EFFECT_MODE=="RAIN"
	if self.rainIntensityTitle then self.rainIntensityTitle.Visible=rainVisible end
	for intensity,button in pairs(self.rainIntensityButtons or {}) do
		local selected=intensity==SPA_RAIN_INTENSITY
		button.Visible=rainVisible
		button.BackgroundColor3=selected and (intensity=="STORM" and Color3.fromRGB(125,45,145) or Color3.fromRGB(35,105,180)) or Color3.fromRGB(30,30,42)
		button.BackgroundTransparency=selected and 0 or 0.22; button.TextColor3=selected and C_WHITE or C_GRAY
	end
	local wetness=SPA_WeatherFX and math.clamp(SPA_WeatherFX.trackWetness or 0,0,1) or 0
	if self.wetnessFill then self.wetnessFill.Size=UDim2.new(wetness,0,1,0) end
	if self.wetnessLabel then self.wetnessLabel.Text=("TRACK WETNESS  ·  %d%%"):format(math.floor(wetness*100+0.5)) end
	if self.wetnessStatus then
		local status=SPA_WeatherFX and SPA_WeatherFX:WetnessStatus() or "DRY"
		self.wetnessStatus.Text=(SPA_EFFECT_MODE=="RAIN" and ("RAIN · "..SPA_RAIN_INTENSITY.." · "..status) or (wetness>0.02 and ("DRYING · "..status) or status))
	end
end
function SPA_ControlCenter:Refresh()
	if not self.initialized or not self.panel.Visible then return end
	if tick()-self.lastRefresh<0.25 then return end
	self.lastRefresh=tick()
	local names={IDLE="IDLE",QUALY="QUALIFYING",RACE="RACE",FINISHED="FINISHED"}
	local discordStatus=SPA_DiscordRaceFeed and SPA_DiscordRaceFeed:Status() or "INITIALIZING"
	self.dashboard.Text=("SESSION: %s\nTRACK: %s\nLEAGUE: %s\nDRIVERS: %d CONNECTED\nRACE CONTROL: %s\nDISCORD FEED: %s"):format(
		names[RACE_STATE] or RACE_STATE,SPA_Tracks and SPA_Tracks.Current and SPA_Tracks.Current.track.name or "NO TRACK LOADED",
		(SPA_LEAGUE_NAME~="" and SPA_LEAGUE_NAME or "NOT CONFIGURED"),#Players:GetPlayers(),SPA_INIT.ready and "READY" or "ERROR — check Output",discordStatus)
	self.completed.Text=SPA_TUTORIAL_COMPLETED and "✓ Tutorial completed" or "Optional tutorial · you can start working now"
	self:RefreshEffects()
end
function SPA_ControlCenter:Hide()
	self.panel.Visible=false; self.trackPanel.Visible=false
	if SPA_ConnectUI then SPA_ConnectUI:Hide() end
	if SPA_Tutorial and SPA_Tutorial.menu then SPA_Tutorial.menu.Visible=false end
end
function SPA_ControlCenter:Open()
	if not self.initialized then return end
	if SPA_Tutorial and SPA_Tutorial.active then SPA_Tutorial:Stop(false) end
	self:Hide(); mainFrame.Visible=false
	if SPA_V220.ccPanel then SPA_V220.ccPanel.Visible=false end
	self.panel.Visible=true; self.lastRefresh=0; self:Refresh()
	TweenService:Create(self.panel,TweenInfo.new(0.18),{BackgroundTransparency=0.12}):Play()
end
function SPA_ControlCenter:Go(tab,control)
	self:Hide(); return SPA_V220:Navigate(tab,control)
end
function SPA_ControlCenter:CloseTracks()
	self.pending=nil; self:Open()
end
function SPA_ControlCenter:TrackView(mode,data)
	assert(SPA_Tracks,"SPA Track System is unavailable")
	self:Hide(); self.trackPanel.Visible=true; SPA_V220:Clear(self.trackContent)
	mainFrame.Visible=false
	if SPA_V220.ccPanel then SPA_V220.ccPanel.Visible=false end
	self.trackStatus.Text="Profiles are kept for this session. Export the code to share or save them."
	local p=self.trackContent
	if mode=="capture" then
		SPA_V220:Label(p,"TRACK NAME · first configure LAP, PIT, DRS, OT and CC in the original panels.",56,1)
		local name=SPA_V220:Input(p,"Track name",44)
		SPA_V220:Button(p,"CAPTURE CURRENT CONFIGURATION / SAVE PROFILE",function()
			local captured=SPA_Tracks:CaptureCurrentTrack(name.Text)
			self:TrackView("export",captured); self:Message("✓ Configuration captured")
		end,3)
	elseif mode=="export" then
		SPA_V220:Label(p,SPA_Tracks:Summary(data),150,1)
		local code=SPA_V220:Input(p,"TRACK CODE",150,true); code.Text=SPA_Tracks:GenerateCode(data); code.TextEditable=false
		SPA_V220:Button(p,"COPY TRACK CODE",function()
			local copied=false
			if type(setclipboard)=="function" then copied=pcall(setclipboard,code.Text) end
			if not copied then
				code:CaptureFocus(); code.SelectionStart=1; code.CursorPosition=#code.Text+1
				self:Message("Select the code and copy it manually (Ctrl+C or your device's menu).")
			else self:Message("✓ Track Code copied") end
		end,3)
		self:Message("✓ Track Code generated")
	elseif mode=="import" then
		self.pending=nil
		SPA_V220:Label(p,"PASTE YOUR SPA TRACK CODE · Contains data only; code is never executed.",60,1)
		local code=SPA_V220:Input(p,"SPA_TRACK_FORMAT_1|DATA|CHECKSUM",160,true)
		SPA_V220:Button(p,"VALIDATE",function()
			local ok,decoded=SPA_Tracks:ValidateCode(code.Text)
			if not ok then self:Message("❌ "..decoded,true); return end
			self.pending=decoded; self:TrackView("confirm",decoded); self:Message("✓ Track Code validated")
		end,3)
	elseif mode=="confirm" then
		SPA_V220:Label(p,SPA_Tracks:Summary(data),150,1)
		SPA_V220:Label(p,"IMPORT replaces the track using the current anchor. A backup is saved before applying and restored on failure. Importing is not allowed during an active session.",72,2)
		SPA_V220:Button(p,"IMPORT — CONFIRM REPLACEMENT",function()
			local ok,message=SPA_Tracks:ApplyTrack(data)
			if ok then
				local exists=false
				for _,profile in ipairs(SPA_Tracks.Profiles) do if profile.track.id==data.track.id then exists=true end end
				if not exists and #SPA_Tracks.Profiles<SPA_Tracks.MAX_PROFILES then table.insert(SPA_Tracks.Profiles,SPA_Tracks.Current) end
				self.pending=nil; self:TrackView("home")
			end
			self:Message((ok and "✓ " or "❌ ")..message,not ok)
		end,4)
		SPA_V220:Button(p,"CANCEL",function() self.pending=nil; self:TrackView("home") end,5)
	elseif mode=="profiles" then
		SPA_V220:Label(p,"LOADED TRACKS · Profiles for this session",44,1)
		if #SPA_Tracks.Profiles==0 then SPA_V220:Label(p,"No profiles have been captured or imported yet.",48,2) end
		for i,profile in ipairs(SPA_Tracks.Profiles) do
			SPA_V220:Button(p,profile.track.name.." · "..profile.track.id,function() self.pending=profile; self:TrackView("confirm",profile) end,i+2)
		end
	else
		SPA_V220:Label(p,SPA_Tracks:Summary(SPA_Tracks.Current),150,1)
		SPA_V220:Button(p,"📍 SET TRACK ANCHOR HERE",function() SPA_Tracks:SetAnchor(); self:Message("✓ Track Anchor set to the current position and orientation") end,2)
		SPA_V220:Button(p,"SHOW / HIDE TRACK ANCHOR",function()
			SPA_Tracks:AnchorCF(); SPA_Tracks.Anchor.Transparency=SPA_Tracks.Anchor.Transparency==1 and 0.25 or 1
		end,3)
		SPA_V220:Button(p,"CREATE / CAPTURE TRACK",function() self:TrackView("capture") end,4)
		SPA_V220:Button(p,"IMPORT TRACK CODE",function() self:TrackView("import") end,5)
		SPA_V220:Button(p,"LOADED TRACKS",function() self:TrackView("profiles") end,6)
		SPA_V220:Button(p,"GENERATE TRACK CODE",function() assert(SPA_Tracks.Current,"Capture or import a track first"); self:TrackView("export",SPA_Tracks.Current) end,7)
		SPA_V220:Button(p,"CONFIGURE EXISTING WAYPOINTS",function() self:Go("CONFIG","Posición Meta/Vuelta") end,8)
	end
	SPA_V220:Button(p,"⌂ BACK TO TRACKS / HOME",function()
		if mode=="home" then self:CloseTracks() else self.pending=nil; self:TrackView("home") end
	end,100)
end
function SPA_ControlCenter:Init()
	self.gui=SPA_V220:Make("ScreenGui",{Name="SPA_CONTROL_CENTER",ResetOnSpawn=false,DisplayOrder=80,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},playerGui)
	self.panel,self.content,self.status=SPA_V220:Panel(self.gui,"SPA CONTROL CENTER · V" .. SPA_VERSION)
	self.trackPanel,self.trackContent,self.trackStatus=SPA_V220:Panel(self.gui,"SPA TRACK SYSTEM")
	for _,panel in ipairs({self.panel,self.trackPanel}) do
		local close=SPA_V220:Button(panel,"✕",function() self:Hide() end)
		close.Size=UDim2.new(0,34,0,30); close.Position=UDim2.new(1,-44,0,7)
	end
	local profile=SPA_V220:Make("Frame",{Size=UDim2.new(1,-12,0,106),BackgroundTransparency=1,LayoutOrder=1},self.content)
	local avatar=SPA_V220:Make("ImageLabel",{Size=UDim2.new(0,82,0,82),Position=UDim2.new(0,8,0,8),BackgroundColor3=C_BG2,Image=""},profile)
	SPA_V220:Make("UICorner",{CornerRadius=UDim.new(0,40)},avatar)
	local fallback=SPA_V220:Label(avatar,"FIA",82); fallback.TextXAlignment=Enum.TextXAlignment.Center
	local label=SPA_V220:Label(profile,player.DisplayName.."\nFIA OPERATOR · @"..player.Name,90)
	label.Position=UDim2.new(0,104,0,0); label.Size=UDim2.new(1,-112,0,90)
	SPA_V220:Label(self.content,"Welcome to Race Control, @"..player.Name.."\nWhat would you like to prepare today?",68,2)
	self.dashboard=SPA_V220:Label(self.content,"",138,3)
	self.completed=SPA_V220:Label(self.content,"",42,4)
	local leagueRow=SPA_V220:Make("Frame",{Size=UDim2.new(1,-12,0,64),BackgroundColor3=C_BG2,BorderSizePixel=0,LayoutOrder=5},self.content)
	SPA_V220:Make("UICorner",{CornerRadius=UDim.new(0,5)},leagueRow)
	local leagueTitle=SPA_V220:Label(leagueRow,"LEAGUE SESSION",20); leagueTitle.Position=UDim2.new(0,6,0,2); leagueTitle.Size=UDim2.new(1,-12,0,20); leagueTitle.TextColor3=C_YELLOW
	local leagueInput=SPA_V220:Make("TextBox",{Size=UDim2.new(0.72,-10,0,30),Position=UDim2.new(0,6,0,28),BackgroundColor3=Color3.fromRGB(25,25,35),BorderSizePixel=0,Font=Enum.Font.Gotham,TextColor3=C_WHITE,TextSize=12,Text=SPA_LEAGUE_NAME,PlaceholderText="League name (2–60)",ClearTextOnFocus=false,TextXAlignment=Enum.TextXAlignment.Left},leagueRow)
	SPA_V220:Make("UICorner",{CornerRadius=UDim.new(0,4)},leagueInput)
	local leagueSave=SPA_V220:Make("TextButton",{Size=UDim2.new(0.28,-8,0,30),Position=UDim2.new(0.72,2,0,28),BackgroundColor3=Color3.fromRGB(0,90,140),BorderSizePixel=0,Font=Enum.Font.GothamBold,TextColor3=C_WHITE,TextSize=11,Text="SAVE LEAGUE"},leagueRow)
	SPA_V220:Make("UICorner",{CornerRadius=UDim.new(0,4)},leagueSave)
	leagueSave.MouseButton1Click:Connect(function()
		if SPA_DiscordRaceFeed and SPA_DiscordRaceFeed:SetLeagueName(leagueInput.Text) then leagueInput.Text=SPA_LEAGUE_NAME; self:Refresh()
		else leagueInput.Text=SPA_LEAGUE_NAME; showNotification("League name must contain 2–60 valid characters",C_YELLOW,"⚠",8) end
	end)
	local effectCard=SPA_V220:Make("Frame",{Size=UDim2.new(1,-12,0,270),BackgroundColor3=C_BG2,BorderSizePixel=0,LayoutOrder=6},self.content)
	SPA_V220:Make("UICorner",{CornerRadius=UDim.new(0,10)},effectCard)
	local effectTitle=SPA_V220:Label(effectCard,"🌦  WEATHER & CAR FX",28); effectTitle.Position=UDim2.new(0,10,0,6); effectTitle.Size=UDim2.new(1,-20,0,28); effectTitle.Font=Enum.Font.GothamBlack
	self.effectStatus=SPA_V220:Label(effectCard,"",30); self.effectStatus.Position=UDim2.new(0,10,0,38); self.effectStatus.Size=UDim2.new(1,-20,0,30); self.effectStatus.Font=Enum.Font.GothamBold
	self.effectButtons={}
	for index,entry in ipairs({{"OFF","🚫 NO EFFECTS"},{"NORMAL","🏎 NORMAL"},{"RAIN","🌧 RAIN"}}) do
		local mode,text=entry[1],entry[2]
		local button=SPA_V220:Make("TextButton",{Size=UDim2.new(1/3,-10,0,44),Position=UDim2.new((index-1)/3,5,0,76),BackgroundColor3=C_BG,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextColor3=C_WHITE,TextSize=12,Text=text},effectCard)
		SPA_V220:Make("UICorner",{CornerRadius=UDim.new(0,8)},button)
		button.MouseButton1Click:Connect(function() SPA_Effects:SetMode(mode) end)
		self.effectButtons[mode]=button
	end
	self.rainIntensityTitle=SPA_V220:Label(effectCard,"RAIN INTENSITY",20); self.rainIntensityTitle.Position=UDim2.new(0,10,0,126); self.rainIntensityTitle.Size=UDim2.new(1,-20,0,20); self.rainIntensityTitle.TextColor3=C_BLUE; self.rainIntensityTitle.Font=Enum.Font.GothamBold
	self.rainIntensityButtons={}
	for index,intensity in ipairs({"LIGHT","HEAVY","STORM"}) do
		local icon=intensity=="STORM" and "⛈ " or "🌧 "
		local button=SPA_V220:Make("TextButton",{Size=UDim2.new(1/3,-10,0,38),Position=UDim2.new((index-1)/3,5,0,150),BackgroundColor3=C_BG,BorderSizePixel=0,Font=Enum.Font.GothamBold,TextColor3=C_WHITE,TextSize=11,Text=icon..intensity},effectCard)
		SPA_V220:Make("UICorner",{CornerRadius=UDim.new(0,7)},button)
		button.MouseButton1Click:Connect(function() SPA_Effects:SetRainIntensity(intensity) end)
		self.rainIntensityButtons[intensity]=button
	end
	self.wetnessLabel=SPA_V220:Label(effectCard,"TRACK WETNESS  ·  0%",20); self.wetnessLabel.Position=UDim2.new(0,10,0,196); self.wetnessLabel.Size=UDim2.new(1,-20,0,20); self.wetnessLabel.Font=Enum.Font.GothamBold
	local wetnessBar=SPA_V220:Make("Frame",{Size=UDim2.new(1,-20,0,12),Position=UDim2.new(0,10,0,220),BackgroundColor3=Color3.fromRGB(22,28,36),BorderSizePixel=0},effectCard)
	SPA_V220:Make("UICorner",{CornerRadius=UDim.new(1,0)},wetnessBar)
	self.wetnessFill=SPA_V220:Make("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=Color3.fromRGB(55,155,225),BorderSizePixel=0},wetnessBar)
	SPA_V220:Make("UICorner",{CornerRadius=UDim.new(1,0)},self.wetnessFill)
	self.wetnessStatus=SPA_V220:Label(effectCard,"DRY",22); self.wetnessStatus.Position=UDim2.new(0,10,0,238); self.wetnessStatus.Size=UDim2.new(1,-20,0,22); self.wetnessStatus.TextColor3=C_GRAY; self.wetnessStatus.Font=Enum.Font.GothamBold
	self:RefreshEffects()
	local cards={
		{"🏁 RACE",function() self:Go("VUELTAS") end},
		{"🗺️ TRACKS",function() self:TrackView("home") end},
		{"⚖️ RACE CONTROL",function() self:Go("RACE CONTROL") end},
		{"📡 TELEMETRY",function() self:Go("ONBOARD"); showNotification("Existing telemetry: select a driver in ONBOARD. Speed, turbo, drift and suspension data appear above their vehicle; limits are in SETTINGS.",C_WHITE,"📡",15) end},
		{"🎥 ANALYSIS",function() self:Go("ANÁLISIS") end},
		{"🎓 TUTORIAL",function() assert(SPA_Tutorial and SPA_Tutorial.initialized,"Tutorial unavailable"); SPA_Tutorial:Menu() end},
		{"📢 UPDATES",function() if SPA_ConnectUI then SPA_ConnectUI:Open("updates") end end},
		{"💬 SUPPORT",function() if SPA_ConnectUI then SPA_ConnectUI:Open("support") end end},
		{"💡 IDEAS & FEEDBACK",function() if SPA_ConnectUI then SPA_ConnectUI:Open("feedback") end end},
		{"⚙️ SETTINGS",function() self:Go("CONFIG") end},
	}
	for i,card in ipairs(cards) do SPA_V220:Button(self.content,card[1],card[2],i+6) end
	local home=SPA_V220:Button(self.gui,"⌂ HOME",function() self:Open() end)
	home.Size=UDim2.new(0,88,0,32); home.Position=UDim2.new(0,14,1,-44)
	self.home=home; self.initialized=true
	self.gui.Destroying:Connect(function()
		self.initialized=false
		if SPA_Tutorial then SPA_Tutorial:Stop(false) end
		if SPA_WeatherFX then SPA_WeatherFX:Cleanup() end
		end)
	task.spawn(function()
		local ok,url,ready=pcall(function() return Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size180x180) end)
		if not avatar.Parent then return end
		if ok and ready and type(url)=="string" and url~="" then avatar.Image=url; fallback.Visible=false
		else fallback.Text="FIA"; warn("[SPA AVATAR] Thumbnail unavailable; using fallback.") end
	end)
	if SPA_V220.loadingDone then self:Open() end
end

-- ═══ TUTORIAL · independent navigation and highlighting, no permanent loops ═══
SPA_TUTORIAL_COMPLETED = false
SPA_Tutorial = { initialized=false, active=false, connections={}, index=1, full=false }
SPA_Tutorial.steps = {
	{"Carrera","PREPARE THE RACE","CONFIG","Max Vueltas","Set the maximum number of laps before starting. Importing a track also restores this value. This tutorial never starts or resets a session for you."},
	{"Carrera","START AND FINISH","CONFIG","CRONOMETRO","START puts the session in RACE and starts the race timer. STOP changes it to FINISHED. Preparing a new race may reset transient data: review the report before doing so."},
	{"Carrera","POSITIONS AND STATES","VUELTAS",nil,"The tower and LAPS show the existing standings. FIA excludes drivers from the calculations. IDLE, QUALY, RACE and FINISHED identify the session state."},
	{"Carrera","FASTEST LAP AND GAPS","FAST LAPS",nil,"FASTEST LAPS shows the best times. In SETTINGS you can show the gap to the leader or the car ahead; the calculation uses the active timing system."},
	{"Clasificación","QUALIFYING MODE","CONFIG","Activar Modo Qualy","Enable qualifying before the race. Valid laps have a configurable limit. Starting the race preserves a snapshot of the qualifying results."},
	{"Clasificación","QUALIFYING LAPS","CONFIG","Vueltas Qualy","Set the attempt limit. RESET QUALIFYING TIMES clears the session times; do not press it if you need to keep them."},
	{"Circuitos y Waypoints","LAP / PIT IN / PIT OUT","CONFIG","Posición Meta/Vuelta","Use SET WP at your current position to place the start/finish line. PIT IN and PIT OUT define pit entry and exit. The script uses vehicle position and plane crossings."},
	{"Circuitos y Waypoints","DIMENSIONS AND VISIBILITY","CONFIG","LAP – Ancho (studs)","Adjust width, height and thickness. Show waypoints controls their visibility. The LAP detection zone has its own dimensions: hiding a Part does not disable detection."},
	{"Circuitos y Waypoints","TRACK LIMITS: WAYPOINTS","CC","WP CC","Place a CC WP from the original panel, assign a name and check its dimensions. REMOVE deletes one; REMOVE ALL deletes all CC waypoints."},
	{"Circuitos y Waypoints","TRACK LIMITS: WARNINGS","CC","CONFIG CC","Track limits detection enabled and debounce control the warnings. Infringements generate logs and penalty proposals according to the thresholds in SETTINGS; penalties are not applied automatically."},
	{"Circuitos y Waypoints","TRACK ANCHOR AND CODES","TRACK",nil,"Set the anchor at a reproducible reference point with the same orientation. Capture a profile, export the code and share it. When importing, set the new anchor, validate, review the summary and confirm; the backup protects against errors. Profiles are kept for this session."},
	{"DRS / OT / Pit","DRS: DETECTION, START AND END","CONFIG","+ DRS DETECTION","DETECTION is an active volume that recalculates the gap. START opens the activation section and END closes it; leaving DETECTION removes permission, so extend the detection volume to the end of the section."},
	{"DRS / OT / Pit","DRS: LAP, GAP AND BONUS","CONFIG","Vuelta inicial DRS","By default, DRS is available from LAP 3, with a maximum gap of 1 s and a +10 bonus. These values are configurable. An unknown gap does not grant permission."},
	{"DRS / OT / Pit","DRS: USE AND INFRINGEMENTS","CONFIG","Sanciones DRS","PERMITTED does not mean ACTIVATED: the actual increase and the car's configuration are monitored. An incorrect bonus or use without permission generates warnings and proposals; messages are rate-limited."},
	{"DRS / OT / Pit","OT: A SINGLE ZONE","CONFIG","+ CREAR ZONA OT","The single OT zone starts the cycle, and the next crossing renews it. The gap is evaluated on entry. The permitted increase is always +2; it is not automatically added to the DRS bonus."},
	{"DRS / OT / Pit","PITS AND PIT SPEED LIMITER","CONFIG","Reducción en boxes","PIT IN activates the In Pits state; PIT OUT ends it and counts the stop. The limiter checks the configured reduction (−30 by default). It does not physically change the car's speed."},
	{"Race Control","EVENTS AND REVIEW","RACE CONTROL",nil,"Select an event to view the driver, time, lap and details. Filters separate race, qualifying, incidents and penalties. Review the evidence before deciding."},
	{"Race Control","PENALTIES AND DSQ","SANCIONES",nil,"Proposals await your confirmation. APPLY imposes the existing penalty; DISMISS rejects it. Ground Effect may propose DSQ. This tutorial does not apply penalties."},
	{"Telemetría","MONITOR A DRIVER","ONBOARD",nil,"Select a driver to follow. Existing telemetry displays speed and its limit, along with turbo, drift and suspension, above the vehicle. There is no separate telemetry panel to duplicate."},
	{"Telemetría","LIMITS AND CALIBRATION","CONFIG","Mostrar velocidad sobre cabeza","Enable overhead speed. SETTINGS lets you calibrate the reading; LAPS also contains driver names and individual limits. Calibration does not modify vehicle physics."},
	{"Neumáticos","COMPOUNDS AND CHANGES","LLANTAS",nil,"Compounds are identified by their configured texture IDs. SET manually records a compound when the driver is in the pits; it does not change the car's physical tires. Stable changes are recorded in the history."},
	{"Replay / Análisis","INCIDENTS AND RECORDING","CONFIG","Activar choques + repeticiones (CPU+)","Enable the existing system to record contacts and replays. It is disabled by default to reduce load. It only captures situations that meet its thresholds."},
	{"Replay / Análisis","REVIEW TRAJECTORIES","ANÁLISIS",nil,"Select an incident and use GHOST 3D to replay the recorded trajectories. Snapshots allow review even after the driver has left. An anomaly alone does not prove an infringement."},
	{"Configuración","GENERAL SETTINGS","CONFIG",nil,"SETTINGS retains all original options. The new controls do not replace calculations or detection. HOME always lets you return to the control center."},
	{"Configuración","REPORT AND DISCORD","CONFIG","📋  GENERAR INFORME POST-CARRERA","Generate the report at the end. To send it, use your own Discord webhook. Sending requires HTTP support from the environment; it is not guaranteed by a normal LocalScript."},
	{"Configuración","SEASON","CONFIG","➕  SUMAR ESTA CARRERA A LA TEMPORADA","Explicitly add the race to the season and generate its report. A Track Code does not contain results, penalties, players or season data."},
}
function SPA_Tutorial:Disconnect()
	for _,c in ipairs(self.connections) do c:Disconnect() end
	table.clear(self.connections)
end
function SPA_Tutorial:Restore()
	local s=self.saved
	if not s then return end
	SPA_V220:Navigate(s.tab); mainFrame.Visible=s.main
	configScroll.CanvasPosition=s.canvas
	if SPA_V220.ccPanel then
		if s.cc and SPA_V220.openCC then SPA_V220.openCC(s.ccTab or "WP CC") else SPA_V220.ccPanel.Visible=false end
	end
	self.saved=nil
end
function SPA_Tutorial:Stop(completed)
	self.active=false; self:Disconnect()
	if self.overlay then self.overlay.Enabled=false end
	if completed and self.full then SPA_TUTORIAL_COMPLETED=true end
	-- Disable the overlay before restoring: a UI failure never leaves input blocked.
	local ok,err=xpcall(function() self:Restore() end,debug.traceback)
	if not ok then warn("[SPA TUTORIAL RESTORE] "..tostring(err)) end
	if SPA_ControlCenter and SPA_ControlCenter.trackPanel then SPA_ControlCenter.trackPanel.Visible=false end
end
function SPA_Tutorial:Menu()
	self:Stop(false); SPA_ControlCenter:Hide(); self.menu.Visible=true
	SPA_V220:Clear(self.menuContent)
	for i,category in ipairs({"Carrera","Clasificación","Circuitos y Waypoints","DRS / OT / Pit","Race Control","Telemetría","Neumáticos","Replay / Análisis","Configuración","Recorrido completo"}) do
		SPA_V220:Button(self.menuContent,SPA_EnglishLabel(category),function() self:Start(category) end,i)
	end
end
function SPA_Tutorial:Start(category)
	self:Stop(false); self.menu.Visible=false
	self.saved={tab=currentTab,main=mainFrame.Visible,canvas=configScroll.CanvasPosition,cc=SPA_V220.ccPanel and SPA_V220.ccPanel.Visible,ccTab=SPA_V220.ccTab}
	self.sequence={}; self.full=category=="Recorrido completo"
	for _,step in ipairs(self.steps) do if self.full or step[1]==category then table.insert(self.sequence,step) end end
	assert(#self.sequence>0,"Tutorial category unavailable")
	self.index=1; self.active=true
	self:Step()
end
function SPA_Tutorial:Position(target)
	if not self.active or not target or not target.Parent then return end
	local root=self.shield
	local origin=root.AbsolutePosition; local area=root.AbsoluteSize
	local pos=target.AbsolutePosition-origin; local size=target.AbsoluteSize
	local x=math.clamp(pos.X-4,0,area.X); local y=math.clamp(pos.Y-4,0,area.Y)
	local w=math.clamp(size.X+8,0,area.X-x); local h=math.clamp(size.Y+8,0,area.Y-y)
	self.outline.Position=UDim2.fromOffset(x,y); self.outline.Size=UDim2.fromOffset(w,h)
	local rects={{0,0,area.X,y},{0,y+h,area.X,area.Y-y-h},{0,y,x,h},{x+w,y,area.X-x-w,h}}
	for i,r in ipairs(rects) do self.dims[i].Position=UDim2.fromOffset(r[1],r[2]); self.dims[i].Size=UDim2.fromOffset(r[3],r[4]) end
	local cw=math.min(390,math.max(160,area.X-24)); local ch=math.min(286,math.max(130,area.Y-24))
	local cx=x+w+12
	if cx+cw>area.X-12 then cx=math.max(12,x-cw-12) end
	local cy=math.clamp(y,12,math.max(12,area.Y-ch-12))
	if x<cw+24 and x+w+cw+24>area.X then cy=math.max(12,area.Y-ch-12); cx=math.max(12,area.X-cw-12) end
	self.card.Position=UDim2.fromOffset(cx,cy); self.card.Size=UDim2.fromOffset(cw,ch)
end
function SPA_Tutorial:Step()
	self:Disconnect(); SPA_ControlCenter:Hide()
	local step=self.sequence[self.index]
	local ok,err=xpcall(function()
		local target
		if step[3]=="CC" then
			assert(SPA_V220.openCC,"CC panel unavailable"); SPA_V220.openCC(step[4]); mainFrame.Visible=false; target=SPA_V220.ccPanel
		elseif step[3]=="TRACK" then SPA_ControlCenter:TrackView("home"); target=SPA_ControlCenter.trackPanel
		else target=SPA_V220:Navigate(step[3],step[4]) end
		self.title.Text=("STEP %d OF %d · %s"):format(self.index,#self.sequence,step[2])
		self.body.Text=step[5]; self.previous.Visible=self.index>1
		self.next.Text=self.index==#self.sequence and "FINISH" or "NEXT"
		self.overlay.Enabled=true
		self:Position(target)
		for _,prop in ipairs({"AbsolutePosition","AbsoluteSize"}) do table.insert(self.connections,target:GetPropertyChangedSignal(prop):Connect(function() self:Position(target) end)) end
		table.insert(self.connections,self.shield:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() self:Position(target) end))
		table.insert(self.connections,target.AncestryChanged:Connect(function() if not target.Parent then self:Stop(false) end end))
		task.defer(function() if self.active then self:Position(target) end end)
	end,debug.traceback)
	if not ok then self:Stop(false); warn("[SPA TUTORIAL] "..tostring(err)); SPA_ControlCenter:Message("Could not open this step; check Output.",true) end
end
function SPA_Tutorial:Init()
	self.menu,self.menuContent=SPA_V220:Panel(SPA_ControlCenter.gui,"WHAT WOULD YOU LIKE TO LEARN?")
	local close=SPA_V220:Button(self.menu,"⌂ HOME",function() self.menu.Visible=false; SPA_ControlCenter:Open() end)
	close.Size=UDim2.new(0,90,0,32); close.Position=UDim2.new(1,-102,1,-42)
	self.overlay=SPA_V220:Make("ScreenGui",{Name="SPA_TUTORIAL_OVERLAY",ResetOnSpawn=false,DisplayOrder=180,Enabled=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},playerGui)
	self.shield=SPA_V220:Make("Frame",{Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Active=true},self.overlay)
	self.dims={}
	for i=1,4 do
		self.dims[i]=SPA_V220:Make("Frame",{BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=0.48,BorderSizePixel=0,ZIndex=1},self.shield)
		self.dims[i]:SetAttribute("_glassed",true)
	end
	self.outline=SPA_V220:Make("Frame",{BackgroundTransparency=1,BorderSizePixel=0,ZIndex=2},self.shield)
	SPA_V220:Make("UIStroke",{Color=C_RED,Thickness=3,ApplyStrokeMode=Enum.ApplyStrokeMode.Border},self.outline)
	self.card=SPA_V220:Make("Frame",{BackgroundColor3=C_BG,BorderSizePixel=0,ZIndex=3},self.shield)
	SPA_V220:Make("UICorner",{CornerRadius=UDim.new(0,16)},self.card)
	self.title=SPA_V220:Label(self.card,"",62); self.title.Size=UDim2.new(1,-24,0,62); self.title.Position=UDim2.fromOffset(12,0); self.title.Font=Enum.Font.GothamBold
	local scroll=createScrollingList(self.card); scroll.Position=UDim2.new(0,12,0,62); scroll.Size=UDim2.new(1,-24,1,-150); scroll.BackgroundTransparency=1
	self.body=SPA_V220:Label(scroll,"",200); self.body.TextYAlignment=Enum.TextYAlignment.Top
	self.previous=SPA_V220:Button(self.card,"PREVIOUS",function() if self.active and self.index>1 then self.index-=1; self:Step() end end)
	self.previous.Size=UDim2.new(0.46,0,0,32); self.previous.Position=UDim2.new(0.03,0,1,-80)
	self.next=SPA_V220:Button(self.card,"NEXT",function()
		if not self.active then return end
		if self.index<#self.sequence then self.index+=1; self:Step()
		else self:Stop(true); SPA_ControlCenter:Open(); SPA_ControlCenter:Message("✓ Tutorial completed") end
	end)
	self.next.Size=UDim2.new(0.46,0,0,32); self.next.Position=UDim2.new(0.51,0,1,-80)
	local skip=SPA_V220:Button(self.card,"SKIP TUTORIAL",function() self:Stop(false); SPA_ControlCenter:Open() end)
	skip.Size=UDim2.new(0.94,0,0,30); skip.Position=UDim2.new(0.03,0,1,-42)
	self.overlay.Destroying:Connect(function() self:Stop(false) end)
	self.initialized=true
end

-- Optional stages: a failure here preserves startup and the V2.19 panels.
function SPA_V220:Stage(name,fn)
	local ok,err=xpcall(fn,debug.traceback)
	self.stages[name]=ok and "OK" or "ERROR"
	if ok then print("[SPA INIT] "..name.." OK") else warn("[SPA INIT OPTIONAL ERROR] "..name.."\n"..tostring(err)) end
	return ok
end
SPA_V220:Stage("TRACK SYSTEM",function() assert(SPA_Tracks and SPA_Tracks.FORMAT_VERSION==1,"Track System unavailable") end)
if SPA_V220:Stage("CONTROL CENTER",function() SPA_ControlCenter:Init() end) then
	SPA_V220:Stage("TUTORIAL",function() SPA_Tutorial:Init() end)
	if SPA_V220.loadingDone then SPA_ControlCenter:Open() end
end

-- V2.21 CONNECT MODULES · optional, asynchronous, data-only
SPA_HTTP = (function()
	local H={queue={},active=nil,sequence=0,enabled=true,maxQueue=32,timeout=10,maxBody=524288,
		lastCode=0,lastError=nil,transport=nil,available=false,retryDelays={15,30,60,120}}
	function H:Detect()
		-- An injected adapter must be supplied by the host, never by remote data.
		if type(SPA_HTTP_TRANSPORT)=="function" then self.transport=SPA_HTTP_TRANSPORT
		elseif type(request)=="function" then self.transport=request
		elseif type(http_request)=="function" then self.transport=http_request
		elseif type(syn)=="table" and type(syn.request)=="function" then self.transport=syn.request
		else
			local ok,isServer=pcall(function() return RunService:IsServer() end)
			if ok and isServer then self.transport=function(o) return HttpService:RequestAsync(o) end end
		end
		self.available=type(self.transport)=="function"; return self.available
	end
	function H:ValidURL(url)
		return type(url)=="string" and #url<=2048 and url:match("^https://[%w%.%-]+:?%d*/[%w%-%._~/%?=&%%]*$")~=nil
			and not url:find("%.%.") and not url:find("[%z\1-\32\127]")
	end
	function H:JSONSafe(value,depth,budget)
		depth=depth or 0; budget=budget or {n=0}
		budget.n+=1
		if depth>14 or budget.n>30000 then return false end
		if type(value)=="table" then
			for k,v in pairs(value) do
				if (type(k)~="string" and type(k)~="number") or not self:JSONSafe(v,depth+1,budget) then return false end
			end
		elseif type(value)=="number" then return value==value and math.abs(value)<1e15
		elseif type(value)=="string" then return #value<=262144
		elseif type(value)~="boolean" and value~=nil then return false end
		return true
	end
	function H:Deliver(job,result)
		if job.done then return end
		job.done=true
		local ok=pcall(job.callback,result)
		if not ok then warn("[SPA CONNECT] CALLBACK_ERROR"); if SPA_Connect then SPA_Connect:RecordError("HTTP","CALLBACK_ERROR") end end
	end
	function H:Wake(delay)
		if self.wake then pcall(task.cancel,self.wake) end
		self.wake=task.delay(math.max(0,delay or 0),function() self.wake=nil; self:Pump() end)
	end
	function H:Finish(job,result)
		if self.active~=job then return end
		if job.timer then pcall(task.cancel,job.timer); job.timer=nil end
		self.active=nil; self.lastCode=result.status or 0; self.lastError=result.ok and nil or result.error
		local delays=job.retryDelays or self.retryDelays
		local retry=self.enabled and not job.cancelled and not job.noRetry and result.retry and job.attempt<=#delays
		if retry then
			job.ready=os.clock()+math.max(delays[job.attempt],math.min(result.retryAfter or 0,120))
			table.insert(self.queue,job)
		else self:Deliver(job,result) end
		self:Wake(0)
	end
	function H:Pump()
		if not self.enabled or self.active then return end
		local now=os.clock(); local chosen; local soon
		for i,j in ipairs(self.queue) do
			if j.ready<=now and (not chosen or j.priority>self.queue[chosen].priority) then chosen=i end
			if not soon or j.ready<soon then soon=j.ready end
		end
		if not chosen then if soon then self:Wake(soon-now) end; return end
		local job=table.remove(self.queue,chosen); self.active=job; job.attempt+=1
		-- task.delay(0) ensures handles exist before a synchronous adapter returns.
		job.thread=task.delay(0,function()
			local ok,response=pcall(self.transport,job.options)
			if self.active~=job or job.cancelled then return end
			if not ok then self:Finish(job,{ok=false,status=0,error="HTTP_UNAVAILABLE",retry=true}); return end
			if type(response)~="table" then self:Finish(job,{ok=false,status=0,error="INVALID_HTTP_RESPONSE"}); return end
			local status=tonumber(response.StatusCode or response.status_code)
			local body=response.Body or response.body
			if not status or status%1~=0 or status<100 or status>599 or type(body)~="string" then
				self:Finish(job,{ok=false,status=0,error="INVALID_HTTP_RESPONSE"}); return
			end
			if #body>self.maxBody then self:Finish(job,{ok=false,status=status,error="RESPONSE_TOO_LARGE"}); return end
			if status<200 or status>=300 then
				local headers=response.Headers or response.headers or {}
				local retryAfter=type(headers)=="table" and tonumber(headers["Retry-After"] or headers["retry-after"]) or 0
				local apiOK,apiData=pcall(function() return HttpService:JSONDecode(body) end)
				if apiOK and type(apiData)=="table" and tonumber(apiData.retry_after) then retryAfter=tonumber(apiData.retry_after) end
				local apiError=apiOK and type(apiData)=="table" and type(apiData.error)=="string" and apiData.error:match("^[A-Z_0-9]+$") and apiData.error:sub(1,96) or nil
				self:Finish(job,{ok=false,status=status,error="HTTP_"..status,apiError=apiError,retry=status==429 or status>=500,retryAfter=retryAfter}); return
			end
			if job.acceptEmpty and body=="" then self:Finish(job,{ok=true,status=status,data={},latency=math.floor((os.clock()-job.started)*1000)}); return end
			local decoded,data=pcall(function() return HttpService:JSONDecode(body) end)
			if not decoded or type(data)~="table" or not self:JSONSafe(data) then
				self:Finish(job,{ok=false,status=status,error="INVALID_JSON"}); return
			end
			self:Finish(job,{ok=true,status=status,data=data,latency=math.floor((os.clock()-job.started)*1000)})
		end)
		job.started=os.clock()
		job.timer=task.delay(self.timeout,function()
			if self.active~=job then return end
			job.timer=nil; job.cancelled=true
			-- Logical timeout: ignore late results. Never blindly retry a timed-out write.
			local cancelled=pcall(task.cancel,job.thread)
			self:Finish(job,{ok=false,status=0,error="TIMEOUT"})
			if not cancelled then
				-- A host that cannot cancel is disabled, avoiding accumulation of hung requests.
				self:Stop("TRANSPORT_STALLED")
			end
		end)
	end
	function H:Request(options,callback)
		callback=type(callback)=="function" and callback or function() end
		if not self.enabled or not self.available then callback({ok=false,status=0,error="HTTP_DISABLED"}); return end
		if #self.queue>=self.maxQueue then callback({ok=false,status=0,error="QUEUE_FULL"}); return end
		if type(options)~="table" or not self:ValidURL(options.Url) or (options.Method~="GET" and options.Method~="POST") then
			callback({ok=false,status=0,error="INVALID_REQUEST"}); return
		end
		local body=options.Body
		if type(body)=="table" then
			local ok,encoded=pcall(function() return HttpService:JSONEncode(body) end)
			if not ok then callback({ok=false,status=0,error="INVALID_REQUEST_JSON"}); return end
			body=encoded
		end
		if body~=nil and (type(body)~="string" or #body>300000) then callback({ok=false,status=0,error="REQUEST_TOO_LARGE"}); return end
		self.sequence+=1
		local safe={Url=options.Url,Method=options.Method,Headers=table.clone(options.Headers or {})}
		if body then safe.Body=body end
		local retryDelays=nil
		if type(options.RetryDelays)=="table" and #options.RetryDelays<=4 then
			retryDelays={}
			for _,delay in ipairs(options.RetryDelays) do
				local n=tonumber(delay)
				if not n or n<0 or n>120 then retryDelays=nil; break end
				retryDelays[#retryDelays+1]=n
			end
		end
		local job={options=safe,priority=math.clamp(tonumber(options.Priority) or 1,0,2),callback=callback,
			id=self.sequence,ready=os.clock(),attempt=0,noRetry=options.NoRetry==true,acceptEmpty=options.AcceptEmpty==true,retryDelays=retryDelays}
		table.insert(self.queue,job); self:Wake(0); return job.id
	end
	function H:Get(url,headers,callback,priority) return self:Request({Url=url,Method="GET",Headers=headers,Priority=priority},callback) end
	function H:Post(url,body,headers,callback,priority) return self:Request({Url=url,Method="POST",Body=body,Headers=headers,Priority=priority},callback) end
	function H:Stop(reason)
		self.enabled=false
		if self.wake then pcall(task.cancel,self.wake); self.wake=nil end
		if self.active then
			local job=self.active; self.active=nil; job.cancelled=true
			if job.timer then pcall(task.cancel,job.timer) end
			if job.thread then pcall(task.cancel,job.thread) end
			self:Deliver(job,{ok=false,status=0,error=reason or "CANCELLED"})
		end
		local pending=self.queue; self.queue={}
		for _,job in ipairs(pending) do self:Deliver(job,{ok=false,status=0,error=reason or "CANCELLED"}) end
	end
	H:Detect()
	return H
end)()

-- V2.22.8 · single event-driven Discord sender. The webhook is never printed,
-- included in Race Control events, or copied into diagnostics.
SPA_DiscordRaceFeed = {
	queue={},maxQueue=150,sending=false,lastCode=0,lastError=nil,lastSuccess=nil,lastSuccessAt=0,
	sessionId=HttpService:GenerateGUID(false),finalResultsSent={},finalResultOrder={},subscription=nil,
}

function SPA_DiscordRaceFeed:CleanText(value,limit)
	local text=tostring(value or ""):gsub("[%z\1-\8\11\12\14-\31\127]","")
	if #text>(limit or 1000) then text=text:sub(1,(limit or 1000)-1).."…" end
	return text
end

function SPA_DiscordRaceFeed:SanitizeLeague(value)
	local text=self:CleanText(value,60):match("^%s*(.-)%s*$")
	if #text<2 or #text>60 then return nil end
	return text
end

function SPA_DiscordRaceFeed:SetLeagueName(value)
	local clean=self:SanitizeLeague(value)
	if not clean then self:UpdateStatus(); return false end
	SPA_LEAGUE_NAME=clean; self:UpdateStatus(); return true
end

function SPA_DiscordRaceFeed:SetWebhook(value)
	local clean=self:CleanText(value,2048):match("^%s*(.-)%s*$")
	local host=string.lower(clean):match("^https://([^/]+)/api/webhooks/")
	local discordHost=host and (host=="discord.com" or host=="discordapp.com" or host:sub(-12)==".discord.com" or host:sub(-15)==".discordapp.com")
	if not discordHost or not SPA_HTTP:ValidURL(clean) then self:UpdateStatus(); return false end
	SPA_DISCORD_WEBHOOK_URL=clean
	if SPA_DiscordWebhookBox and SPA_DiscordWebhookBox.Parent then SPA_DiscordWebhookBox.Text="WEBHOOK CONFIGURED ✓" end
	self.lastError=nil; self.lastCode=0; self:UpdateStatus(); return true
end

function SPA_DiscordRaceFeed:Status()
	if not self:SanitizeLeague(SPA_LEAGUE_NAME) then return "NO LEAGUE" end
	if type(SPA_DISCORD_WEBHOOK_URL)~="string" or SPA_DISCORD_WEBHOOK_URL=="" or not SPA_HTTP:ValidURL(SPA_DISCORD_WEBHOOK_URL) then return "NO WEBHOOK" end
	if not SPA_HTTP.available or not SPA_HTTP.enabled then return "HTTP UNAVAILABLE" end
	if self.sending then return "SENDING" end
	if self.lastCode==429 then return "RATE LIMITED" end
	if self.lastError then return "ERROR · "..self:CleanText(self.lastError,40) end
	return "READY"
end

function SPA_DiscordRaceFeed:UpdateStatus()
	local status=self:Status()
	if SPA_DiscordStatusLabel and SPA_DiscordStatusLabel.Parent then
		SPA_DiscordStatusLabel.Text="● "..status
		SPA_DiscordStatusLabel.TextColor3=status=="READY" and C_GREEN or ((status=="SENDING") and C_YELLOW or C_RED)
	end
	if SPA_ControlCenter and SPA_ControlCenter.initialized then SPA_ControlCenter.lastRefresh=0 end
	return status
end

function SPA_DiscordRaceFeed:TrackName()
	return SPA_Tracks and SPA_Tracks.Current and SPA_Tracks.Current.track and SPA_Tracks.Current.track.name or "NO TRACK LOADED"
end

function SPA_DiscordRaceFeed:BaseFields(event)
	return {
		{name="League",value=self:CleanText(SPA_LEAGUE_NAME,256),inline=true},
		{name="Track",value=self:CleanText(self:TrackName(),256),inline=true},
		{name="Session",value=self:CleanText((RACE_STATE or "IDLE").." · "..self.sessionId,256),inline=false},
		{name="SPA Version",value=SPA_VERSION,inline=true},
		{name="Operator",value=self:CleanText((event and event.operator) or (player and player.Name) or "Local",256),inline=true},
		{name="Time",value=os.date("%d/%m/%Y %H:%M:%S"),inline=true},
	}
end

function SPA_DiscordRaceFeed:Embed(title,description,color,event,extraFields)
	local fields=self:BaseFields(event)
	for _,field in ipairs(extraFields or {}) do
		if #fields>=25 then break end
		fields[#fields+1]={name=self:CleanText(field.name,256),value=self:CleanText(field.value,1024),inline=field.inline==true}
	end
	return {title=self:CleanText(title,256),description=self:CleanText(description,4000),color=color or 3447003,fields=fields,timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ")}
end

function SPA_DiscordRaceFeed:CanSend(notify)
	local status=nil
	if not self:SanitizeLeague(SPA_LEAGUE_NAME) then status="NO LEAGUE"
	elseif type(SPA_DISCORD_WEBHOOK_URL)~="string" or SPA_DISCORD_WEBHOOK_URL=="" or not SPA_HTTP:ValidURL(SPA_DISCORD_WEBHOOK_URL) then status="NO WEBHOOK"
	elseif not SPA_HTTP.available or not SPA_HTTP.enabled then status="HTTP UNAVAILABLE" end
	if not status then return true end
	if notify then showNotification("Discord Feed: "..status,C_YELLOW,"⚠",8) end
	self:UpdateStatus(); return false
end

function SPA_DiscordRaceFeed:QueueEmbed(embed,notify)
	local perfStart=ENABLE_PERF_DIAGNOSTICS and os.clock() or nil
	if not self:CanSend(notify) then SPA_PerfMark("DiscordQueue",perfStart); return false end
	if #self.queue>=self.maxQueue then table.remove(self.queue,1) end
	self.queue[#self.queue+1]={embeds={embed},notify=notify==true}
	self:Flush(); SPA_PerfMark("DiscordQueue",perfStart); return true
end

function SPA_DiscordRaceFeed:Flush()
	if self.sending or #self.queue==0 or not self:CanSend(false) then return end
	local job=table.remove(self.queue,1); self.sending=true; self:UpdateStatus()
	SPA_HTTP:Request({Url=SPA_DISCORD_WEBHOOK_URL,Method="POST",Headers={["Content-Type"]="application/json"},Body={username="SPA-GLOBAL Race Control",embeds=job.embeds},Priority=2,AcceptEmpty=true,RetryDelays={2,5,10}},function(result)
		self.sending=false; self.lastCode=result.status or 0
		if result.ok then
			self.lastError=nil; self.lastSuccess=tick(); self.lastSuccessAt=self.lastSuccess
			if job.notify then showNotification("Discord Feed sent",Color3.fromRGB(0,150,90),"📤",8) end
		else
			self.lastError=result.error or "SEND_FAILED"
			if job.notify then showNotification("Discord Feed error: "..self:CleanText(self.lastError,48),C_RED,"❌",10) end
			warn("[SPA DISCORD] SEND_FAILED status="..tostring(self.lastCode).." error="..self:CleanText(self.lastError,48))
		end
		self:UpdateStatus(); self:Flush()
	end)
end

function SPA_DiscordRaceFeed:EventEmbed(event)
	local kind=event.type
	local titles={
		GLOBAL_FASTEST_LAP="🟣 Global Fastest Lap",PROVISIONAL_POLE="🟣 Provisional Pole",
		CONFIG_CHANGED="⚙ Competitive Configuration",SPEED_LIMIT_CHANGED="🚦 Global Speed Limit",
		DRIVER_SPEED_LIMIT_CHANGED="🚦 Driver Speed Limit",VEHICLE_SPEED_CONFIG_CHANGED="🏎 Vehicle Speed Configuration",
		SANCTION_PROPOSED="⚖ Sanction Proposed",
		SANCTION_APPLIED="✅ Sanction Applied",SANCTION_DISMISSED="↩ Sanction Dismissed",DSQ="⛔ Disqualification",
		DSQ_PROPOSED="⚠ DSQ Proposed",FIA_DECISION="⚖ FIA Decision",RACE_START="🟢 Race Started",
		WEATHER_CHANGED="🌦 Weather Change",RAIN_STARTED="🌧 Rain Started",RAIN_STOPPED="🌤 Rain Stopped",
		RAIN_INTENSITY_CHANGED="🌧 Rain Intensity Changed",TRACK_WETNESS="💧 Track Wetness",STORM_STARTED="⛈ Storm Started",
	}
	if not titles[kind] then return nil end
	local color=({RACE_START=3066993,GLOBAL_FASTEST_LAP=10181046,PROVISIONAL_POLE=10181046,SANCTION_APPLIED=15844367,DSQ=15158332,WEATHER_CHANGED=3447003,RAIN_STARTED=3447003,RAIN_STOPPED=3066993,RAIN_INTENSITY_CHANGED=3447003,TRACK_WETNESS=10181046,STORM_STARTED=10181046})[kind] or 3447003
	local extra={}
	if event.name then extra[#extra+1]={name="Driver",value=event.name,inline=true} end
	if event.lap then extra[#extra+1]={name="Lap",value=event.lap,inline=true} end
	if event.time or event.bestTime then extra[#extra+1]={name="Lap time",value=event.time or event.bestTime,inline=true} end
	if event.configuration then extra[#extra+1]={name="Configuration",value=event.configuration,inline=true} end
	if kind=="WEATHER_CHANGED" or kind=="RAIN_STARTED" or kind=="RAIN_STOPPED" or kind=="RAIN_INTENSITY_CHANGED" or kind=="STORM_STARTED" then
		extra[#extra+1]={name="Previous",value=tostring(event.oldValue),inline=true}
		extra[#extra+1]={name="New",value=tostring(event.newValue),inline=true}
	elseif event.oldValue~=nil or event.newValue~=nil then extra[#extra+1]={name="Change",value=tostring(event.oldValue).." → "..tostring(event.newValue),inline=false} end
	if event.weather then extra[#extra+1]={name="Rain",value=tostring(event.weather),inline=true} end
	if event.wetness~=nil then extra[#extra+1]={name="Track wetness",value=tostring(event.wetness).."%",inline=true} end
	if event.direction then extra[#extra+1]={name="Trend",value=tostring(event.direction),inline=true} end
	if event.context then extra[#extra+1]={name="Context",value=event.context,inline=true} end
	if event.reason then extra[#extra+1]={name="Reason",value=event.reason,inline=false} end
	return self:Embed(titles[kind],event.description or event.title or kind,color,event,extra)
end

function SPA_DiscordRaceFeed:BuildFinalResults(event)
	local snapshot=event and event.finalSnapshot or (SPA_Session and SPA_Session.finalSnapshot)
	local standings=snapshot and snapshot.standings or CURRENT_STANDINGS_ORDER or {}
	local laps=snapshot and snapshot.laps or lapData; local pits=snapshot and snapshot.pits or pitData
	local penalties=snapshot and snapshot.penalties or APPLIED_SANCTIONS
	local lines={}; local position=0; local listed=0
	for _,uid in ipairs(standings) do
		if listed>=20 then break end
		local pl=Players:GetPlayerByUserId(uid); local ld=laps[uid]; local pd=pits[uid]
		local name=pl and getDisplayName(pl) or (customPlayerData[uid] and customPlayerData[uid].name) or ("UID "..tostring(uid))
		local penaltyCount=0; for _,sanction in ipairs(penalties or {}) do if sanction.uid==uid then penaltyCount+=1 end end
		if (snapshot and snapshot.dsq and snapshot.dsq[uid]) or (not snapshot and DSQ_DRIVERS[uid]) or FIA_EXCLUDED[uid] then
			lines[#lines+1]="[DSQ] "..name.." · laps "..tostring(ld and ld.lapsMade or 0).." · pits "..tostring(pd and pd.pitStopsMade or 0).." · sanctions "..tostring(penaltyCount)
		else
			position+=1; lines[#lines+1]="P"..position.." "..name.." · laps "..tostring(ld and ld.lapsMade or 0).." · pits "..tostring(pd and pd.pitStopsMade or 0).." · sanctions "..tostring(penaltyCount)
		end
		listed+=1
	end
	if #lines==0 then lines[1]="No standings available." end
	local duration=snapshot and snapshot.duration or (SPA_UI2_cronStartTime and math.max(0,tick()-SPA_UI2_cronStartTime) or 0)
	local fastestData=snapshot and snapshot.fastest or GLOBAL_FASTEST_LAP
	local fastest=fastestData and fastestData.time and fastestData.time<math.huge and ((fastestData.name or "Unknown").." · "..fmtTime(fastestData.time)) or "Not recorded"
	local poleData=snapshot and snapshot.qualyFastest or FINAL_QUALY_GLOBAL_FASTEST
	local pole=poleData and poleData.time and poleData.time<math.huge and ((poleData.name or "Unknown").." · "..fmtTime(poleData.time)) or "Not recorded"
	return self:Embed("🏆 Final Race Results",table.concat(lines,"\n"),15105570,event,{
		{name="Drivers",value=tostring(#standings),inline=true},{name="Duration",value=fmtTime(duration),inline=true},{name="Pole",value=pole,inline=false},{name="Fastest lap",value=fastest,inline=false},
	})
end

function SPA_DiscordRaceFeed:Push(event)
	if event.type=="RACE_START" then self.sessionId=event.sessionId or HttpService:GenerateGUID(false); self.queue={}; self.lastCode=0; self.lastError=nil end
	local embed=self:EventEmbed(event); if embed then self:QueueEmbed(embed,false) end
	if event.type=="RACE_FINISH" and not self.finalResultsSent[self.sessionId] then
		if self:QueueEmbed(self:BuildFinalResults(event),false) then
			self.finalResultsSent[self.sessionId]=true; self.finalResultOrder[#self.finalResultOrder+1]=self.sessionId
			while #self.finalResultOrder>20 do local old=table.remove(self.finalResultOrder,1); self.finalResultsSent[old]=nil end
		end
	end
end

function SPA_DiscordRaceFeed:SendManualReport(text)
	self:QueueEmbed(self:Embed("🏁 Post-Race Report",self:CleanText(text,4000),15158332,nil),true)
end

function SPA_DiscordRaceFeed:SendTest()
	self:QueueEmbed(self:Embed("✅ SPA-GLOBAL RACE CONTROL CONNECTED","Private Race Control webhook test completed successfully.",3066993,nil),true)
end

SPA_DiscordRaceFeed.subscription=SPA_RaceControl:Subscribe(function(event) SPA_DiscordRaceFeed:Push(event) end)
SPA_DiscordRaceFeed:UpdateStatus()

SPA_Connect = (function()
	local C={API_VERSION=1,enabled=true,status="DISABLED",baseUrl=SPA_CONNECT_BASE_URL,latency=nil,lastHealthCheck=0,
		caches={},tickets={},feedback={},activeTicket=nil,errors={},errorSeen={},noticeSeen={},pending={},unread=0,
		flags={supportEnabled=true,feedbackEnabled=true,updatesEnabled=true,trackLibraryEnabled=false},
		ttl={health=60,features=300,updates=300,notices=300,["known-issues"]=300,faq=600},generation=0}
	local statuses={OPEN=true,STAFF_REPLY=true,WAITING_USER=true,STAFF_REVIEWING=true,RESOLVED=true,CLOSED=true}
	local categories={BUG=true,CONFIGURATION=true,TRACK_SYSTEM=true,DRS_OT=true,TELEMETRY=true,RACE_CONTROL=true,REPLAY=true,OTHER=true}
	local feedbackTypes={IDEA=true,BUG=true,QUESTION=true,FEEDBACK=true}
	local function textOK(s,max)
		return type(s)=="string" and #s>0 and #s<=max and not s:find("[%z\1-\8\11\12\14-\31\127]")
	end
	local function secretOK(s) return textOK(s,256) and #s>=32 and s:match("^[%w_%-]+$") end
	local function idOK(s) return textOK(s,96) and s:match("^SPA[%w%-]+$") end
	local function listOK(t,max)
		if type(t)~="table" or #t>max then return false end
		local n=0
		for k in pairs(t) do if type(k)~="number" or k<1 or k%1~=0 or k>#t then return false end; n+=1 end
		return n==#t
	end
	function C:Version(v)
		if type(v)~="string" or #v>24 or not v:match("^%d+%.%d+%.?%d*$") then return nil end
		local a={}; for n in v:gmatch("%d+") do n=tonumber(n); if n>99999 then return nil end; a[#a+1]=n end
		if #a<2 or #a>3 then return nil end
		return a
	end
	function C:Compare(a,b)
		a=self:Version(a); b=self:Version(b); if not a or not b then return nil end
		for i=1,3 do local x,y=a[i] or 0,b[i] or 0; if x~=y then return x>y and 1 or -1 end end
		return 0
	end
	function C:RecordError(module,code)
		-- Deliberately no raw traces, URLs, request bodies, keys or arbitrary output in diagnostics.
		module=type(module)=="string" and module:match("^[%w_]+$") and module:sub(1,32) or "SPA"
		code=type(code)=="string" and code:match("^[%w_]+$") and code:sub(1,64) or "INTERNAL_ERROR"
		local signature=module..":"..code; local now=os.clock()
		if self.errorSeen[signature] and now-self.errorSeen[signature]<300 then return end
		self.errorSeen[signature]=now
		table.insert(self.errors,{module=module,code=code})
		if #self.errors>20 then
			local old=table.remove(self.errors,1); self.errorSeen[old.module..":"..old.code]=nil
		end
		if SPA_ConnectUI then SPA_ConnectUI:ErrorPrompt() end
	end
	function C:Notify(message,icon)
		if showNotification then pcall(showNotification,message,C_BG2,icon or "💬",15) end
	end
	function C:Changed()
		if SPA_ConnectUI and SPA_ConnectUI.initialized then SPA_ConnectUI:Status() end
	end
	function C:Configure(url,enabled)
		url=type(url)=="string" and url:match("^%s*(.-)%s*$"):gsub("/+$","") or ""
		assert(url=="" or (SPA_HTTP:ValidURL(url.."/v1/health") and not url:find("[?=&]")),"Use a public HTTPS base URL without credentials or a query string")
		assert(next(self.tickets)==nil and #self.feedback==0 or url==self.baseUrl,"Restart SPA before changing servers when tickets exist")
		self.generation+=1; self.enabled=enabled~=false; self.baseUrl=url; self.caches={}; self.pending={}
		if self.timer then pcall(task.cancel,self.timer); self.timer=nil end
		SPA_HTTP:Stop("RECONFIGURED"); SPA_HTTP.enabled=self.enabled; SPA_HTTP:Detect()
		self.status=(not self.enabled or url=="" or not SPA_HTTP.available) and "DISABLED" or "OFFLINE"
		self:Changed()
		if self.enabled and url~="" and SPA_HTTP.available then self.status="OFFLINE"; self:Tick() end
	end
	function C:Call(method,path,body,headers,priority,callback)
		if not self.enabled or self.baseUrl=="" or not SPA_HTTP.available or not SPA_HTTP.enabled then
			self.status="DISABLED"; self:Changed(); callback(false,nil,"HTTP_DISABLED"); return
		end
		local gen=self.generation
		local h={["Accept"]="application/json",["Content-Type"]="application/json",["X-Client-ID"]=self.clientId}
		for k,v in pairs(headers or {}) do h[k]=v end
		if method=="POST" then h["X-Request-ID"]=HttpService:GenerateGUID(false) end
		SPA_HTTP:Request({Url=self.baseUrl..path,Method=method,Body=body,Headers=h,Priority=priority},function(result)
			if gen~=self.generation then return end
			if not result.ok then
				if result.status==0 or result.status>=500 then self.status="OFFLINE" end
				self.lastError=result.error; self:Changed()
				callback(false,nil,result.error); return
			end
			self.lastError=nil
			callback(true,result.data,nil,result)
		end)
	end
	function C:ValidResource(kind,d)
		if type(d)~="table" then return false end
		if kind=="features" then
			for k in pairs(self.flags) do if type(d[k])~="boolean" then return false end end
			for k in pairs(d) do if self.flags[k]==nil then return false end end
			return true
		elseif kind=="health" then
			if (d.status~="ONLINE" and d.status~="DEGRADED" and d.status~="OFFLINE") or type(d.maintenance)~="boolean" or type(d.services)~="table" then return false end
			local n=0
			for k,v in pairs(d.services) do n+=1; if n>12 or not textOK(k,40) or not textOK(v,32) then return false end end
			return true
		elseif kind=="updates" then
			if not self:Version(d.latestVersion) or not ({OPTIONAL=true,RECOMMENDED=true,IMPORTANT=true})[d.releaseType] or not listOK(d.updates,50) then return false end
			for _,u in ipairs(d.updates) do
				if type(u)~="table" or not self:Version(u.version) or not textOK(u.title,150) or not textOK(u.date,40) or not listOK(u.changes,50) then return false end
				for _,v in ipairs(u.changes) do
					if type(v)~="table" or not ({NEW=true,IMPROVED=true,FIXED=true,IMPORTANT=true,SECURITY=true})[v.type] or not textOK(v.description,2000) then return false end
				end
			end
			return true
		else
			if not listOK(d.items,100) then return false end
			for _,v in ipairs(d.items) do
				if type(v)~="table" then return false end
				if kind=="faq" then
					if not textOK(v.question,200) or not textOK(v.answer,4000) then return false end
				elseif kind=="notices" then
					if not textOK(v.id,96) or not textOK(v.title,150) or not textOK(v.message,2000)
						or not ({INFO=true,IMPORTANT=true,CRITICAL=true})[v.priority] or not textOK(v.expires,40) then return false end
					if v.minimumVersion and not self:Version(v.minimumVersion) then return false end
					if v.maximumVersion and not self:Version(v.maximumVersion) then return false end
				elseif kind=="known-issues" then
					if not textOK(v.title,150) or not textOK(v.description,2000) or not textOK(v.status,40) then return false end
				end
			end
			return true
		end
	end
	function C:Fetch(kind,force,callback)
		callback=callback or function() end
		local cached=self.caches[kind]
		if not force and cached and os.clock()-cached.at<self.ttl[kind] then callback(true,cached.data); return end
		if self.pending[kind] then
			if #self.pending[kind]<8 then table.insert(self.pending[kind],callback) else callback(false,cached and cached.data,"BUSY") end
			return
		end
		self.pending[kind]={callback}
		self:Call("GET","/v1/"..kind,nil,nil,kind=="health" and 1 or 0,function(ok,data,err,result)
			if ok and not self:ValidResource(kind,data) then ok=false; err="INVALID_API_DATA" end
			if ok then
				self.caches[kind]={at=os.clock(),data=data}
				if kind=="features" then for k in pairs(self.flags) do self.flags[k]=data[k] end
				elseif kind=="health" then
					self.status=data.maintenance and "DEGRADED" or data.status; self.maintenance=data.maintenance
					self.latency=result and result.latency or self.latency; self.lastHealthCheck=os.time(); SPA_V221.services=data.services
				elseif kind=="notices" then self:Notices(data.items)
				elseif kind=="updates" then
					if self:Compare(data.latestVersion,SPA_V221.version)==1 and self.notifiedVersion~=data.latestVersion then
						self.notifiedVersion=data.latestVersion; self:Notify("NEW SPA VERSION · SPA-GLOBAL V"..data.latestVersion.." AVAILABLE","⬆","IMPORTANT")
					end
				end
			else self.lastError=err end
			local waiting=self.pending[kind] or {}; self.pending[kind]=nil
			for _,fn in ipairs(waiting) do pcall(fn,ok,ok and data or (cached and cached.data),err) end
			self:Changed()
		end)
	end
	function C:NoticeActive(n)
		local ok,date=pcall(function() return DateTime.fromIsoDate(n.expires).UnixTimestamp end)
		return ok and date>os.time() and (not n.minimumVersion or (self:Compare(SPA_V221.version,n.minimumVersion) or -1)>=0)
			and (not n.maximumVersion or (self:Compare(SPA_V221.version,n.maximumVersion) or 1)<=0)
	end
	function C:Notices(items)
		for _,n in ipairs(items) do
			if self:NoticeActive(n) and not self.noticeSeen[n.id] and #self.noticeOrder<200 and (n.priority=="IMPORTANT" or n.priority=="CRITICAL") then
				self.noticeSeen[n.id]=true
				table.insert(self.noticeOrder,n.id)
				self:Notify(n.title.."\n"..n.message,"📢")
			end
		end
	end
	function C:Metadata()
		local current=SPA_Tracks and SPA_Tracks.Current
		return {username=player.Name,displayName=player.DisplayName,userId=player.UserId,spaVersion=SPA_V221.version,
			trackId=current and current.track.id or nil,trackName=current and current.track.name or nil,raceState=RACE_STATE}
	end
	function C:Diagnostics()
		local modules={}
		for _,k in ipairs({"ui1Ok","ui2Ok","drsOk","otOk","pitLimiterOk","replayOk","analysisOk","tiresOk","ready"}) do modules[k]=SPA_INIT[k]==true end
		return {spaVersion=SPA_V221.version,raceState=RACE_STATE,trackId=SPA_Tracks.Current and SPA_Tracks.Current.track.id or nil,
			trackName=SPA_Tracks.Current and SPA_Tracks.Current.track.name or nil,playerCount=#Players:GetPlayers(),
			connectStatus=self.status,latency=self.latency,errors=table.clone(self.errors),modules=modules}
	end
	function C:AdoptTicket(d,subject,category)
		assert(idOK(d.ticketId) and secretOK(d.ticketKey) and statuses[d.status],"INVALID_TICKET_RESPONSE")
		local t=self.tickets[d.ticketId]
		if not t then
			assert(#self.ticketOrder<20,"History limit for this session reached")
			t={ticketId=d.ticketId,key=d.ticketKey,status=d.status,subject=subject or d.subject or d.ticketId,category=category or "OTHER",
				messages={},after=0,unread=0,nextPoll=0}; self.tickets[d.ticketId]=t; table.insert(self.ticketOrder,d.ticketId)
		end
		return t
	end
	function C:CreateTicket(category,subject,message,diagnostics,callback)
		assert(self.consent,"Accept the privacy notice before submitting")
		assert(self.flags.supportEnabled and not self.maintenance,"Support temporarily disabled")
		assert(categories[category] and textOK(subject,100) and textOK(message,1500),"Invalid subject/category/message (100/1500 characters)")
		assert(#self.ticketOrder<20,"Session history is full")
		local data=self:Metadata(); data.category=category; data.subject=subject; data.message=message
		if diagnostics and category=="BUG" then data.diagnostics=self:Diagnostics() end
		self:Call("POST","/v1/tickets",data,nil,2,function(ok,d,err)
			if ok then
				local valid,t=pcall(function() return self:AdoptTicket(d,subject,category) end)
				if valid then self.activeTicket=t.ticketId; self:PollTicket(t,true); callback(true,t); return end
				err="INVALID_TICKET_RESPONSE"
			end
			callback(false,nil,err)
		end)
	end
	function C:PollTicket(t,force)
		if t.busy or (not force and (((t.status=="CLOSED" or t.status=="RESOLVED") and not t.more) or os.clock()<t.nextPoll)) then return end
		t.busy=true
		self:Call("GET","/v1/tickets/"..t.ticketId.."/messages?afterMessageId="..t.after,nil,{["X-Ticket-Key"]=t.key},2,function(ok,d,err)
			t.busy=false; t.nextPoll=os.clock()+((SPA_ConnectUI and SPA_ConnectUI.mode=="ticket" and self.activeTicket==t.ticketId and SPA_ConnectUI.panel.Visible) and 15 or 60)
			if not ok then t.lastError=err; return end
			local ticket=d.ticket
			if type(ticket)~="table" or ticket.ticketId~=t.ticketId or not statuses[ticket.status] or not listOK(d.messages,100) then t.lastError="INVALID_TICKET_DATA"; return end
			local cursor=t.after
			for _,m in ipairs(d.messages) do
				if type(m)~="table" or type(m.id)~="number" or m.id%1~=0 or m.id<=cursor or m.id>1e12
					or (m.authorType~="STAFF" and m.authorType~="PLAYER") or not textOK(m.message,2000)
					or (m.staffName and not textOK(m.staffName,100)) then t.lastError="INVALID_MESSAGE"; return end
				cursor=m.id
			end
			t.status=ticket.status; t.priority=ticket.priority; t.lastError=nil
			local newStaff=false
			for _,m in ipairs(d.messages) do
				table.insert(t.messages,{id=m.id,authorType=m.authorType,staffName=m.staffName,message=m.message,createdAt=m.createdAt})
				if #t.messages>200 then table.remove(t.messages,1) end
				if m.authorType=="STAFF" then t.unread+=1; newStaff=true end
				t.after=m.id
			end
			if newStaff then self:Notify("New reply from SPA Development · "..t.ticketId.."\nOpen SUPPORT to read it.","💬") end
			if SPA_ConnectUI and SPA_ConnectUI.mode=="ticket" and self.activeTicket==t.ticketId and SPA_ConnectUI.panel.Visible then
				t.unread=0; SPA_ConnectUI:TicketMessages(t)
			end
			self:Changed()
			t.more=d.hasMore==true and #d.messages>0
			if t.more then t.nextPoll=0 end
		end)
	end
	function C:Reply(t,message,callback)
		assert(self.consent and self.flags.supportEnabled and not self.maintenance,"Support unavailable")
		assert(t and t.status~="CLOSED" and t.status~="RESOLVED" and textOK(message,1500),"Invalid reply or closed ticket")
		self:Call("POST","/v1/tickets/"..t.ticketId.."/messages",{message=message},{["X-Ticket-Key"]=t.key},2,function(ok,d,err)
			if ok then self:PollTicket(t,true) end; callback(ok,d,err)
		end)
	end
	function C:Close(t,callback)
		self:Call("POST","/v1/tickets/"..t.ticketId.."/close","{}",{["X-Ticket-Key"]=t.key},2,function(ok,d,err)
			if ok then t.status="CLOSED"; self:PollTicket(t,true) end; callback(ok,d,err)
		end)
	end
	function C:SendFeedback(category,message,diagnostics,callback)
		assert(self.consent and self.flags.feedbackEnabled and not self.maintenance,"Accept the privacy notice; Feedback must be available")
		assert(feedbackTypes[category] and textOK(message,2000) and #self.feedback<20,"Invalid feedback or full history")
		local data=self:Metadata(); data.category=category; data.message=message
		if diagnostics and category=="BUG" then data.diagnostics=self:Diagnostics() end
		self:Call("POST","/v1/feedback",data,nil,1,function(ok,d,err)
			if ok and idOK(d.feedbackId) and secretOK(d.feedbackKey) then
				table.insert(self.feedback,{id=d.feedbackId,key=d.feedbackKey}); callback(true,d); return
			end
			callback(false,nil,err or "INVALID_FEEDBACK_RESPONSE")
		end)
	end
	function C:FeedbackTicket(f,callback)
		self:Call("GET","/v1/feedback/"..f.id,nil,{["X-Feedback-Key"]=f.key},1,function(ok,d,err)
			if ok and d.ticketId then
				local valid,t=pcall(function() return self:AdoptTicket(d,"Feedback "..f.id,"OTHER") end)
				if valid then callback(true,t); return end
				ok=false; err="INVALID_TICKET_RESPONSE"
			end
			callback(ok,nil,err)
		end)
	end
	function C:Tick()
		if not self.enabled or self.baseUrl=="" or not SPA_HTTP.available or not SPA_HTTP.enabled then return end
		self:Fetch("health"); self:Fetch("features"); self:Fetch("known-issues"); self:Fetch("faq")
		if self.flags.updatesEnabled then self:Fetch("updates"); self:Fetch("notices") end
		for _,id in ipairs(self.ticketOrder) do self:PollTicket(self.tickets[id],false) end
		local delay=30
		if SPA_ConnectUI and SPA_ConnectUI.mode=="ticket" and SPA_ConnectUI.panel.Visible then delay=15 end
		if self.timer then pcall(task.cancel,self.timer) end
		self.timer=task.delay(delay,function() self.timer=nil; self:Tick() end)
	end
	function C:Stop()
		self.generation+=1; self.enabled=false
		if self.timer then pcall(task.cancel,self.timer); self.timer=nil end
		SPA_HTTP:Stop("STOPPED")
		if self.errorConnection then self.errorConnection:Disconnect(); self.errorConnection=nil end
		self.status="DISABLED"
	end
	C.ticketOrder={}; C.noticeOrder={}; C.clientId=HttpService:GenerateGUID(false)
	return C
end)()

SPA_ConnectUI = {initialized=false,mode=nil,view=0,errorPrompted=false}
function SPA_ConnectUI:Hide()
	if self.panel then self.panel.Visible=false end
	self.view+=1; self.mode=nil; self.messageList=nil
end
function SPA_ConnectUI:Message(text,bad)
	if self.footer then self.footer.Text=text; self.footer.TextColor3=bad and C_RED or C_GREEN end
end
function SPA_ConnectUI:Async(action)
	if self.sending then self:Message("A request is in progress; wait for the result.",true); return end
	self.sending=true
	local view=self.view
	local function done(ok,data,err)
		self.sending=false
		if view~=self.view then return end
		if not ok then
			self:Message(err=="TIMEOUT" and "Request timed out. Your submission may have been received; check your history before trying again." or ("Unavailable: "..tostring(err or "ERROR")),true)
		end
	end
	local ok,err=xpcall(function() action(function(success,data,message) done(success,data,message) end,view) end,debug.traceback)
	if not ok then self.sending=false; self:Message(tostring(err):match("^[^\n]+"),true); warn("[SPA CONNECT UI] "..tostring(err)) end
end
function SPA_ConnectUI:Button(text,fn,order,parent)
	return SPA_V220:Button(parent or self.content,text,fn,order)
end
function SPA_ConnectUI:Label(text,height,order,parent)
	return SPA_V220:Label(parent or self.content,text,height or 48,order)
end
function SPA_ConnectUI:Input(placeholder,height,order,multi)
	local box=SPA_V220:Input(self.content,placeholder,height,multi)
	box.LayoutOrder=order; return box
end
function SPA_ConnectUI:UpdateSignature()
	local cache=SPA_Connect.caches.updates
	if not cache then return "" end
	local ok,encoded=pcall(function() return HttpService:JSONEncode(cache.data) end)
	return ok and SPA_Tracks:Checksum(encoded) or ""
end
function SPA_ConnectUI:Status()
	if not self.initialized then return end
	local c=SPA_Connect
	local colors={ONLINE=C_GREEN,DEGRADED=C_YELLOW,OFFLINE=C_RED,DISABLED=C_GRAY}
	self.homeStatus.Text="SPA CONNECT · "..c.status..(c.maintenance and "\nTEMPORARILY UNAVAILABLE · Maintenance in progress." or "")
	self.homeStatus.TextColor3=colors[c.status] or C_GRAY
	local count=0; for _,id in ipairs(c.ticketOrder) do count+=c.tickets[id].unread end; c.unread=count
	self.supportCard.Text="💬 SUPPORT"..(count>0 and (" • "..count) or "")
	self.updateCard.Text="📢 UPDATES"..(self:UpdateSignature()~="" and self:UpdateSignature()~=self.readUpdates and " • NEW" or "")
	self.configStatus.Text=("SPA CONNECT · %s\nLATENCY: %s · LATEST SYNC: %s"):format(c.status,c.latency and (c.latency.." ms") or "—",c.lastHealthCheck>0 and os.date("%H:%M:%S",c.lastHealthCheck) or "—")
	if self.inbox then self.inbox.Visible=count>0; self.inbox.Text="💬 SUPPORT • "..count.." · OPEN" end
end
function SPA_ConnectUI:Open(mode)
	assert(self.initialized,"SPA Connect UI unavailable")
	if SPA_Tutorial.active then SPA_Tutorial:Stop(false) end
	SPA_ControlCenter:Hide(); mainFrame.Visible=false
	if SPA_V220.ccPanel then SPA_V220.ccPanel.Visible=false end
	self.panel.Visible=true; self.mode=mode; self.view+=1; self.sending=false; self.messageList=nil
	SPA_V220:Clear(self.content)
	self:Message("SPA CONNECT BETA · FIA tools work offline.")
	if mode=="support" then self:Support()
	elseif mode=="ticket" then self:Ticket()
	elseif mode=="newTicket" then self:TicketForm()
	elseif mode=="feedback" then self:Feedback()
	elseif mode=="updates" then self:Updates()
	elseif mode=="faq" or mode=="known-issues" or mode=="notices" then self:Resource(mode)
	elseif mode=="library" then self:Library()
	elseif mode=="diagnostics" then self:Diagnostics()
	else self:Config() end
	self:Status()
end
function SPA_ConnectUI:Privacy(order)
	self:Label("PRIVACY · Submitting shares your username, DisplayName, UserId (unverified metadata), version, current track, session state and message with SPA Development. Diagnostics are optional. Do not paste passwords, tokens, private webhooks or other people's data.",112,order)
	local consent
	consent=self:Button(SPA_Connect.consent and "✓ NOTICE ACCEPTED (this session)" or "I AGREE TO THE DESCRIBED SUBMISSION",function()
		SPA_Connect.consent=not SPA_Connect.consent
		consent.Text=SPA_Connect.consent and "✓ NOTICE ACCEPTED (this session)" or "I AGREE TO THE DESCRIBED SUBMISSION"
	end,order+1)
end
function SPA_ConnectUI:DiagnosticChoice(order,category)
	local choice={attach=false}
	local button
	button=self:Button("DO NOT ATTACH technical diagnostics",function()
		if category()~="BUG" then self:Message("Diagnostics are only available for BUG reports.",true); return end
		choice.attach=not choice.attach
		button.Text=choice.attach and "✓ ATTACH technical diagnostics" or "DO NOT ATTACH technical diagnostics"
	end,order)
	self:Label("Diagnostics: version, state, track, player count, modules, latency and SPA error codes. No raw traces, other players' messages, results or credentials.",80,order+1)
	return choice
end
function SPA_ConnectUI:Support()
	self:Label("SPA SUPPORT CENTER\nHow can we help you?",64,1)
	self:Button("FREQUENTLY ASKED QUESTIONS",function() self:Open("faq") end,2)
	self:Button("CREATE TICKET",function() self:Open("newTicket") end,3)
	self:Label("MY TICKETS · This history and its keys are kept only while SPA is open. Close or resolve tickets before leaving. Keys are never displayed.",80,4)
	for i,id in ipairs(SPA_Connect.ticketOrder) do
		local t=SPA_Connect.tickets[id]
		self:Button(id.." · "..t.status..(t.unread>0 and (" • "..t.unread) or "").."\n"..t.subject,function()
			SPA_Connect.activeTicket=id; self:Open("ticket")
		end,i+4)
	end
	self:Button("CONNECTION DIAGNOSTICS",function() self:Open("diagnostics") end,80)
end
function SPA_ConnectUI:TicketForm()
	self:Label("NEW REQUEST · maximum 3 open tickets",48,1)
	local category="OTHER"; local categoryButton
	local choices={"BUG","CONFIGURATION","TRACK_SYSTEM","DRS_OT","TELEMETRY","RACE_CONTROL","REPLAY","OTHER"}; local index=8
	categoryButton=self:Button("CATEGORY: OTHER · change",function()
		index=index%#choices+1; category=choices[index]; categoryButton.Text="CATEGORY: "..category.." · change"
	end,2)
	local subject=self:Input("SUBJECT · maximum 100 characters",48,3)
	local message=self:Input("MESSAGE · maximum 1500 characters",150,4,true)
	self:Privacy(5)
	local diagnostic=self:DiagnosticChoice(7,function() return category end)
	self:Button("SUBMIT TO SUPPORT",function()
		self:Async(function(done,view)
			self:Message("Submitting request…")
			SPA_Connect:CreateTicket(category,subject.Text,message.Text,diagnostic.attach,function(ok,t,err)
				done(ok,t,err)
				if ok and self.view==view then self:Open("ticket"); self:Message("✓ Ticket created: "..t.ticketId) end
			end)
		end)
	end,9)
	self:Button("BACK TO SUPPORT",function() self:Open("support") end,10)
end
function SPA_ConnectUI:TicketMessages(t)
	if not self.messageList or not self.messageList.Parent then return end
	SPA_V220:Clear(self.messageList)
	SPA_V220:Label(self.messageList,t.ticketId.." · "..t.status.." · "..(t.priority or "NORMAL").."\n"..t.subject,80,1)
	if t.status=="STAFF_REVIEWING" then SPA_V220:Label(self.messageList,"SPA Development is reviewing your request…",56,2) end
	for i,m in ipairs(t.messages) do
		local who=m.authorType=="STAFF" and ("SPA Development · "..(m.staffName or "Staff")) or "YOU"
		SPA_V220:Label(self.messageList,who.."\n"..m.message,70,i+2)
	end
	if t.lastError then SPA_V220:Label(self.messageList,"Last check: "..t.lastError,40,500) end
	if self.replyButton then self.replyButton.Visible=t.status~="CLOSED" and t.status~="RESOLVED" end
end
function SPA_ConnectUI:Ticket()
	local t=SPA_Connect.tickets[SPA_Connect.activeTicket]
	if not t then self:Label("Select a ticket from MY TICKETS."); return end
	t.unread=0
	self.messageList=createScrollingList(self.content)
	self.messageList.Size=UDim2.new(1,-12,0,260); self.messageList.LayoutOrder=1
	local reply=self:Input("WRITE A REPLY · maximum 1500 characters",120,2,true)
	self.replyButton=self:Button("SEND REPLY",function()
		self:Async(function(done,view)
			SPA_Connect:Reply(t,reply.Text,function(ok,d,err) done(ok,d,err); if ok and self.view==view then reply.Text=""; self:Message("✓ Reply sent") end end)
		end)
	end,3)
	self:Button("REFRESH MESSAGES",function() SPA_Connect:PollTicket(t,true) end,4)
	local confirmed=false; local close
	close=self:Button("CLOSE TICKET",function()
		if not confirmed then confirmed=true; close.Text="CONFIRM CLOSURE"; return end
		self:Async(function(done,view)
			SPA_Connect:Close(t,function(ok,d,err) done(ok,d,err); if ok and self.view==view then self:Open("support") end end)
		end)
	end,5)
	self:Button("MY TICKETS",function() self:Open("support") end,6)
	self:TicketMessages(t); SPA_Connect:PollTicket(t,true)
	-- Reschedule at the visible-ticket cadence; no parallel polling loop.
	if SPA_Connect.enabled and SPA_Connect.baseUrl~="" then
		if SPA_Connect.timer then pcall(task.cancel,SPA_Connect.timer) end
		SPA_Connect.timer=task.delay(15,function() SPA_Connect.timer=nil; SPA_Connect:Tick() end)
	end
end
function SPA_ConnectUI:Feedback()
	self:Label("IDEAS & FEEDBACK\nWhat would you like to share with SPA Development?",64,1)
	local types={"IDEA","BUG","QUESTION","FEEDBACK"}; local index=1; local button
	button=self:Button("TYPE: IDEA · change",function() index=index%#types+1; button.Text="TYPE: "..types[index].." · change" end,2)
	local message=self:Input("Your message · maximum 2000 characters",150,3,true)
	self:Privacy(4)
	local diagnostic=self:DiagnosticChoice(6,function() return types[index] end)
	self:Button("SUBMIT FEEDBACK",function()
		self:Async(function(done,view)
			SPA_Connect:SendFeedback(types[index],message.Text,diagnostic.attach,function(ok,d,err)
				done(ok,d,err); if ok and self.view==view then self:Open("feedback"); self:Message("✓ Feedback submitted: "..d.feedbackId) end
			end)
		end)
	end,8)
	self:Label("MY SUBMISSIONS · If Staff converts a submission into a ticket, click it to retrieve the conversation.",70,9)
	for i,f in ipairs(SPA_Connect.feedback) do
		self:Button(f.id.." · VIEW REPLY / TICKET",function()
			self:Async(function(done,view)
				SPA_Connect:FeedbackTicket(f,function(ok,t,err)
					done(ok,t,err)
					if ok and self.view==view then
						if t then SPA_Connect.activeTicket=t.ticketId; self:Open("ticket") else self:Message("This feedback does not have an associated ticket yet.") end
					end
				end)
			end)
		end,i+9)
	end
end
function SPA_ConnectUI:Updates()
	self:Label("SPA GLOBAL · CURRENT VERSION V2.23",50,1)
	local info=self:Label("LATEST VERSION: unverified\nSTATUS: OFFLINE / not synchronized",75,2)
	local localChanges="V2.23 · SESSION STABILITY HOTFIX\nNEW · Session lifecycle, frozen results and reusable race reset.\nIMPROVED · Drift sensor, confirmed crashes and adaptive replay.\nFIXED · Stale data, periodic UI rebuilds and cache cleanup."
	local details=self:Label(localChanges,180,3)
	local view=self.view
	if SPA_Connect.flags.updatesEnabled then SPA_Connect:Fetch("updates",false,function(ok,d)
		if self.view~=view or not d then return end
		local newer=SPA_Connect:Compare(d.latestVersion,SPA_V221.version)==1
		info.Text="LATEST VERSION: V"..d.latestVersion.."\nSTATUS: "..(newer and "UPDATE AVAILABLE" or "UP TO DATE").." · "..d.releaseType..(ok and "" or " · CACHED")
		local lines={}
		for _,u in ipairs(d.updates) do
			table.insert(lines,"V"..u.version.." · "..u.title.." · "..u.date)
			for _,change in ipairs(u.changes) do table.insert(lines,change.type.." · "..change.description) end
		end
		details.Text=#lines>0 and table.concat(lines,"\n") or localChanges
		self.readUpdates=self:UpdateSignature(); self:Status()
	end) end
	self:Button("⚠ KNOWN ISSUES",function() self:Open("known-issues") end,4)
	self:Button("📢 GLOBAL NOTICES",function() self:Open("notices") end,5)
	self:Button("SPA SERVICES / DIAGNOSTICS",function() self:Open("diagnostics") end,6)
	self:Button("SPA TRACK LIBRARY · EXPERIMENTAL",function() self:Open("library") end,7)
	self:Label("Updates are informational only. Code is never downloaded or executed automatically.",65,8)
end
function SPA_ConnectUI:Resource(kind)
	self:Label(({faq="FREQUENTLY ASKED QUESTIONS",["known-issues"]="KNOWN ISSUES",notices="SPA GLOBAL NOTICES"})[kind],50,1)
	local fallback=kind=="faq" and "LAP: SETTINGS → Start/finish line position → SET WP.\nDRS: configure Detection, Start and End, and check the gap/minimum lap.\nTracks: set the anchor, validate the code, review the summary and confirm.\nReplay: enable collisions + replays and open ANALYSIS.\nRace Control: review evidence and confirm or dismiss proposals." or "No verified remote data. This does not mean there are no issues."
	local body=self:Label(fallback,220,2)
	local view=self.view
	SPA_Connect:Fetch(kind,false,function(ok,d)
		if self.view~=view or not d then return end
		local lines={}
		for _,item in ipairs(d.items) do
			if kind=="faq" then table.insert(lines,item.question.."\n"..item.answer)
			elseif kind=="known-issues" then table.insert(lines,item.title.." · "..item.status.."\n"..item.description)
			elseif SPA_Connect:NoticeActive(item) then table.insert(lines,item.priority.." · "..item.title.."\n"..item.message) end
		end
		body.Text=(ok and "" or "CACHED · Not currently synchronized\n")..(#lines>0 and table.concat(lines,"\n\n") or "No current items have been published.")
	end)
	self:Button("BACK",function() self:Open(kind=="faq" and "support" or "updates") end,3)
end
function SPA_ConnectUI:Library()
	self:Label("SPA TRACK LIBRARY · BETA EXPERIMENTAL",50,1)
	if not SPA_Connect.flags.trackLibraryEnabled then self:Label("Library is disabled. Local Track Codes remain available.",70,2); return end
	self:Label("Publishing makes the Track Code, name, author and track configuration public. Only publish tracks you want to share. Scripts, webhooks and results are not accepted.",90,2)
	local confirmed=false; local publish
	publish=self:Button("PUBLISH CURRENT TRACK",function()
		if not confirmed then confirmed=true; publish.Text="I CONFIRM PUBLIC PUBLICATION"; return end
		self:Async(function(done,view)
			local code=SPA_Tracks:GenerateCode()
			SPA_Connect:Call("POST","/v1/tracks",{trackCode=code},nil,0,function(ok,d,err) done(ok,d,err); if ok and self.view==view then self:Message("✓ Track published") end end)
		end)
	end,3)
	local state=self:Label("Loading library…",50,4); local view=self.view
	SPA_Connect:Call("GET","/v1/tracks",nil,nil,0,function(ok,d,err)
		if self.view~=view then return end
		if not ok or type(d.items)~="table" or #d.items>100 then state.Text="Library unavailable · "..tostring(err or "INVALID_DATA"); return end
		state.Text="Select to download and validate. Importing always requires confirmation."
		for i,item in ipairs(d.items) do
			if type(item)=="table" and type(item.id)=="string" and item.id:match("^SPA[%w%-]+$") and #item.id<=96 and type(item.name)=="string" and #item.name<=80 then
				self:Button(item.name.." · "..item.id,function()
					self:Async(function(done,downloadView)
						SPA_Connect:Call("GET","/v1/tracks/"..item.id,nil,nil,0,function(success,track,errorCode)
							if success and type(track.trackCode)=="string" then
								local valid,data=SPA_Tracks:ValidateCode(track.trackCode)
								if valid then
									done(true)
									if self.view==downloadView then SPA_ControlCenter.pending=data; SPA_ControlCenter:TrackView("confirm",data) end
									return
								end
								errorCode="INVALID_TRACK_CODE"
							end
							done(false,nil,errorCode or "INVALID_DATA")
						end)
					end)
				end,i+4)
			end
		end
	end)
end
function SPA_ConnectUI:Config()
	self:Label("SPA CONNECT · SETTINGS",50,1)
	local url=self:Input("https://your-api.example · blank = offline",55,2)
	url.Text=SPA_Connect.baseUrl
	self:Label("Use only your backend's public HTTPS endpoint. Never paste tokens, administrator keys or webhooks. Changing servers requires a restart if this session has tickets.",90,3)
	self:Button("SAVE URL / ENABLE",function() SPA_Connect:Configure(url.Text,true); self:Message("Configuration applied") end,4)
	self:Button("DISABLE SPA CONNECT",function() SPA_Connect:Configure(SPA_Connect.baseUrl,false); self:Message("SPA Connect disabled; local modules continue working") end,5)
	self:Button("TEST CONNECTION / REFRESH STATUS",function()
		SPA_Connect:Fetch("health",true,function(ok) self:Message(ok and "✓ Service health verified" or "Could not verify the service.",not ok) end)
	end,6)
	self:Button("CONNECTION DIAGNOSTICS",function() self:Open("diagnostics") end,7)
	self:Button("SPA TRACK LIBRARY · BETA",function() self:Open("library") end,8)
end
function SPA_ConnectUI:Diagnostics()
	local c=SPA_Connect
	self:Label("SPA CONNECT DIAGNOSTICS",50,1)
	self:Label(("HTTP: %s\nAPI: %s\nSTATUS CODE: %s\nLATENCY: %s\nLAST ERROR: %s\nLATEST SYNC: %s"):format(
		SPA_HTTP.available and "AVAILABLE" or "UNAVAILABLE",c.status,tostring(SPA_HTTP.lastCode),
		c.latency and (c.latency.." ms") or "—",c.lastError or SPA_HTTP.lastError or "NONE",
		c.lastHealthCheck>0 and os.date("%H:%M:%S",c.lastHealthCheck) or "—"),170,2)
	local services={}
	for name,status in pairs(SPA_V221.services) do table.insert(services,name.." · "..status) end
	self:Label("SPA SERVICES\n"..(#services>0 and table.concat(services,"\n") or "No verified remote status."),120,3)
	self:Button("REFRESH STATUS",function()
		self:Async(function(done,view)
			SPA_Connect:Fetch("health",true,function(ok,d,err) done(ok,d,err); if self.view==view then self:Open("diagnostics") end end)
		end)
	end,4)
	self:Button("CONFIGURE CONNECTION",function() self:Open("connectConfig") end,5)
	self:Button("CREATE TECHNICAL REPORT (consent required)",function() self:Open("newTicket") end,6)
end
function SPA_ConnectUI:ErrorPrompt()
	if not self.initialized or self.errorPrompted then return end
	self.errorPrompted=true
	self.errorButton.Visible=true
	if self.ignoreError then self.ignoreError.Visible=true end
	SPA_Connect:Notify("SPA detected an internal error. You can create a technical report from SUPPORT; nothing has been sent.","⚠")
end
function SPA_ConnectUI:Init()
	self.panel,self.content,self.footer=SPA_V220:Panel(SPA_ControlCenter.gui,"SPA CONNECT · V2.23")
	local close=SPA_V220:Button(self.panel,"⌂ HOME",function() SPA_ControlCenter:Open() end)
	close.Size=UDim2.new(0,100,0,30); close.Position=UDim2.new(1,-116,0,7)
	self.homeStatus=SPA_V220:Label(SPA_ControlCenter.content,"SPA CONNECT · DISABLED",58,4)
	for _,child in ipairs(SPA_ControlCenter.content:GetChildren()) do
		if child:IsA("TextButton") and child.Text=="💬 SUPPORT" then self.supportCard=child end
		if child:IsA("TextButton") and child.Text=="📢 UPDATES" then self.updateCard=child end
	end
	assert(self.supportCard and self.updateCard,"SPA Connect cards missing")
	self.configStatus=SPA_V220:Label(configScroll,"SPA CONNECT · DISABLED",80,130)
	SPA_V220:Button(configScroll,"SPA CONNECT · CONFIGURE / TEST CONNECTION",function() self:Open("connectConfig") end,131)
	SPA_V220:Button(configScroll,"SPA CONNECT · TEST CONNECTION",function()
		SPA_Connect:Fetch("health",true,function(ok) SPA_Connect:Notify(ok and "SPA Connect: connection verified" or "SPA Connect unavailable; check Diagnostics.","📡") end)
	end,132)
	SPA_V220:Button(configScroll,"SPA CONNECT · REFRESH STATUS",function() self:Open("diagnostics") end,133)
	self.inbox=SPA_V220:Button(SPA_ControlCenter.gui,"💬 SUPPORT · OPEN",function() self:Open("support") end)
	self.inbox.Size=UDim2.new(0,240,0,32); self.inbox.Position=UDim2.new(1,-250,1,-44); self.inbox.Visible=false
	self.errorButton=SPA_V220:Button(SPA_ControlCenter.content,"⚠ INTERNAL ERROR · SUBMIT REPORT",function()
		self:Open("newTicket")
		self:Message("Nothing will be sent until you accept the privacy notice, select BUG and confirm SUBMIT TO SUPPORT.")
		self.errorButton.Visible=false; if self.ignoreError then self.ignoreError.Visible=false end
	end,20)
	self.errorButton.Visible=false
	self.ignoreError=SPA_V220:Button(SPA_ControlCenter.content,"DISMISS ERROR NOTICE",function() self.errorButton.Visible=false; self.ignoreError.Visible=false end,21)
	self.ignoreError.Visible=false
	self.initialized=true; self:Status()
	SPA_ControlCenter.gui.Destroying:Connect(function() self.initialized=false; SPA_Connect:Stop() end)
	-- Read only SPA-tagged engine errors. Retain a generic code, never the Output text.
	local ok,connection=pcall(function()
		return game:GetService("LogService").MessageOut:Connect(function(message,kind)
			if kind==Enum.MessageType.MessageError and type(message)=="string" and message:find("[SPA",1,true) then
				SPA_Connect:RecordError("RUNTIME","SPA_INTERNAL_ERROR")
			end
		end)
	end)
	if ok then SPA_Connect.errorConnection=connection end
	if SPA_INIT.criticalFailed then SPA_Connect:RecordError("INIT","CRITICAL_STAGE_FAILED") end
end
SPA_V220:Stage("SPA CONNECT UI",function() SPA_ConnectUI:Init() end)
SPA_V221.connect=SPA_Connect
-- No network operation participates in SPA_INIT.ready or the loading animation.
task.defer(function()
	local ok,err=xpcall(function() SPA_Connect:Configure(SPA_CONNECT_BASE_URL,true) end,debug.traceback)
	if not ok then SPA_Connect.status="DISABLED"; warn("[SPA CONNECT START] "..tostring(err)) end
end)




-- V2.22 ADDITIVE MODULES
-- V2.22 remote publication notifications. No remote code; bounded non-modal queue.
do
 SPA_Connect.ttl.updates=60; SPA_Connect.ttl.notices=30
 SPA_Connect.updateSeen={}; SPA_Connect.noticeRead={}; SPA_Connect.notificationQueue={}
 function SPA_Connect:DrainNotifications()
  if self.notificationTimer then return end
  local item=table.remove(self.notificationQueue,1); if not item then return end
  if showNotification then pcall(showNotification,item.text,item.priority=="CRITICAL" and C_RED or item.priority=="IMPORTANT" and C_YELLOW or C_BG2,item.icon,15) end
  self.notificationTimer=task.delay(6,function() self.notificationTimer=nil; if self.enabled then self:DrainNotifications() end end)
 end
 function SPA_Connect:Notify(message,icon,priority)
  if #self.notificationQueue>=160 then return false end
  local item={text=tostring(message):sub(1,2200),icon=icon or "💬",priority=priority or "INFO"}
  if priority=="CRITICAL" then table.insert(self.notificationQueue,1,item) else table.insert(self.notificationQueue,item) end
  self:DrainNotifications(); return true
 end
 function SPA_Connect:Notices(items)
  for _,n in ipairs(items) do
   local key=n.noticeId or n.id
   if type(key)=="string" and #key<=96 and self:NoticeActive(n) and not self.noticeSeen[key] then
    if self:Notify("SPA GLOBAL · "..n.priority.."\n"..n.title.."\n"..n.message,"📢",n.priority) then self.noticeSeen[key]=true end
   end
  end
 end
 local fetch=SPA_Connect.Fetch
 function SPA_Connect:Fetch(kind,force,callback)
  return fetch(self,kind,force,function(ok,d,err)
   if ok and d and kind=="updates" then
    for _,u in ipairs(d.updates) do
     local key=u.updateId or u.id
     if type(key)=="string" and #key<=96 and not self.updateSeen[key] then
      local description=u.changes[1] and u.changes[1].description or ""
      if self:Notify("NEW UPDATE POST · V"..u.version.."\n"..u.title.."\n"..description,"📢","INFO") then self.updateSeen[key]=true end
     end
    end
   end
   if callback then callback(ok,d,err) end
  end)
 end
 local status=SPA_ConnectUI.Status
 function SPA_ConnectUI:Status()
  status(self)
  if self.noticesCard then
   local count=0; local cached=SPA_Connect.caches.notices
   for _,n in ipairs(cached and cached.data.items or {}) do if SPA_Connect:NoticeActive(n) and not SPA_Connect.noticeRead[n.noticeId or n.id] then count+=1 end end
   self.noticesCard.Text="📢 NOTICES"..(count>0 and (" • "..count) or "")
  end
 end
 local resource=SPA_ConnectUI.Resource
 function SPA_ConnectUI:Resource(kind)
  resource(self,kind)
  if kind=="notices" then SPA_Connect:Fetch(kind,false,function(ok,d)
   if ok and self.mode=="notices" then for _,n in ipairs(d.items) do SPA_Connect.noticeRead[n.noticeId or n.id]=true end; self:Status() end
  end) end
 end
 SPA_ConnectUI.noticesCard=SPA_V220:Button(SPA_ControlCenter.content,"📢 NOTICES",function() SPA_ConnectUI:Open("notices") end,7)
 SPA_ConnectUI:Status()
end

-- V2.22 FIA NETWORK MODULE: data only, session-bound transport, no frame networking.
SPA_FIA = (function()
 local F={status="OFFLINE",roomId=nil,token=nil,sessionId=nil,room=nil,operators={},incidents={},timeline={},cursor=0,
  applied={},pendingReports={},sharedEvents={},mode="room",joinStation="INCIDENT_STEWARD",backoff=4,lastPresence=0,seen={},shareDetected=false}
 function F:Metadata()
  return {placeId=game.PlaceId,jobId=game.JobId,userId=player.UserId,username=player.Name,displayName=player.DisplayName,spaVersion=SPA_VERSION}
 end
 function F:Me()
  for _,o in ipairs(self.operators) do if o.sessionId==self.sessionId then return o end end
 end
 function F:OperatorName(sid)
  for _,o in ipairs(self.operators) do if o.sessionId==sid then return o.displayName end end
  return tostring(sid)
 end
 function F:IsDirector() local me=self:Me(); return me and me.workstation=="RACE_DIRECTOR" end
 function F:CanManage() return self.room and (self.room.hostSession==self.sessionId or self:IsDirector()) end
 function F:Message(s,bad)
  if self.footer and self.footer.Parent then self.footer.Text=tostring(s); self.footer.TextColor3=bad and C_RED or C_GREEN end
 end
 function F:Call(method,path,body,callback,requestId)
  if not SPA_Connect.enabled or SPA_Connect.baseUrl=="" or not SPA_HTTP.available then callback(false,nil,"HTTP UNAVAILABLE",0); return end
  if self.token and self.boundURL~=SPA_Connect.baseUrl then self:Forget("SERVER CHANGED · JOIN REQUIRED"); callback(false,nil,"SERVER CHANGED",0); return end
  local gen=self.generation or 0
  local headers={["Content-Type"]="application/json",["Accept"]="application/json",["X-Client-ID"]=SPA_Connect.clientId}
  if self.token then headers["X-SPA-FIA-SESSION"]=self.token end
  if method=="POST" then headers["X-Request-ID"]=requestId or HttpService:GenerateGUID(false) end
  SPA_HTTP:Request({Url=SPA_Connect.baseUrl..path,Method=method,Headers=headers,Body=body,Priority=1,NoRetry=true},function(r)
   if gen~=(self.generation or 0) then return end
   callback(r.ok,r.data,r.apiError or r.error,r.status)
  end)
 end
 function F:Path(suffix) return "/v1/race-rooms/"..self.roomId..(suffix or "") end
 function F:Forget(reason)
  self.generation=(self.generation or 0)+1; self.token=nil; self.sessionId=nil; self.room=nil; self.pending=nil
  self.operators={}; self.incidents={}; self.timeline={}; self.cursor=0; self.busy=false; self.polling=false; self.syncing=false; self.detail=nil
  self.pendingReports={}; self.sharedEvents={}; self.joinCode=nil; self.observerCode=nil; self.status=reason or "OFFLINE"
  if self.timer then pcall(task.cancel,self.timer); self.timer=nil end
  self:Refresh()
 end
 function F:Adopt(d)
  assert(type(d)=="table" and type(d.roomId)=="string" and d.roomId:match("^SPA%-RC%-%x+$") and type(d.sessionId)=="string"
   and type(d.fiaSessionToken)=="string" and #d.fiaSessionToken==64 and d.fiaSessionToken:match("^%x+$"),"INVALID FIA SESSION")
  self.roomId=d.roomId; self.sessionId=d.sessionId; self.token=d.fiaSessionToken; self.boundURL=SPA_Connect.baseUrl
  self.joinCode=d.joinCode; self.observerCode=d.observerCode; self.status="SYNCING"; self.cursor=0; self.backoff=4
  self:Resync(); self:Schedule(4)
 end
 function F:Submit(path,body,done)
  if self.busy then self:Message("REQUEST IN PROGRESS",true); return end
  if self.pending then self:Message("Previous write unconfirmed. Use RETRY LAST ACTION with the same request ID.",true); return end
  self.pending={path=path,body=body,done=done,id=HttpService:GenerateGUID(false)}; self:Retry()
 end
 function F:Retry()
  local p=self.pending; if not p or self.busy then return end; self.busy=true
  self:Call("POST",p.path,p.body,function(ok,d,err,status)
   self.busy=false
   if ok then
    self.pending=nil; self:Message("✓ SAVED")
    if p.done then p.done(d) elseif self.token then self:Resync() end
   elseif status==401 or status==410 then self.pending=nil; self:Forget(status==410 and "ROOM CLOSED" or "SESSION EXPIRED · JOIN REQUIRED")
   elseif status==409 then self.pending=nil; self:Message("CONFLICT · Refreshing current revision; review before retrying.",true); self:Resync()
   elseif status and status>=400 and status<500 then self.pending=nil; self:Message(err or "PERMISSION DENIED",true)
   else self.status="CONNECTION LOST"; self:Message("Write not confirmed. RETRY LAST ACTION is safe and idempotent.",true) end
   self:Refresh()
  end,p.id)
 end
 function F:Action(action,extra)
  if not self.room then return end
  local body=table.clone(extra or {}); body.roomRevision=self.room.revision
  self:Submit(self:Path("/"..action),body,function(d)
   if d.joinCode then self.joinCode=d.joinCode; self.observerCode=d.observerCode end
   if action=="end" then self:Forget("ROOM CLOSED"); self:Render() else self:Resync() end
  end)
 end
 function F:IncidentAction(action,extra)
  if not self.detail or not self.room then return end
  local b=table.clone(extra or {}); b.roomRevision=self.room.revision; b.incidentRevision=self.detail.revision
  local iid=self.detail.incidentId
  self:Submit(self:Path("/incidents/"..iid.."/"..action),b,function() self:Resync(); self:LoadIncident(iid) end)
 end
 function F:Resync()
  if not self.token or self.syncing then return end; self.syncing=true
  self:Call("GET",self:Path("/state"),nil,function(ok,d,err,status)
   self.syncing=false
   if ok and type(d.room)=="table" and type(d.incidents)=="table" and type(d.operators)=="table" and type(d.nextCursor)=="number" then
    self.room=d.room; self.operators=d.operators; self.incidents={}
    for _,i in ipairs(d.incidents) do self.incidents[i.incidentId]=i; self:ApplyDecision(i) end
    self.cursor=d.nextCursor; self.status="LIVE"; self.backoff=4; self:Refresh()
    if self.panel and self.panel.Visible and self.mode~="incident" and self.mode~="new" and self.mode~="confirm" then self:Render() end
   elseif status==401 or status==410 then self:Forget(status==410 and "ROOM CLOSED" or "SESSION EXPIRED · JOIN REQUIRED")
   else self.status="CONNECTION LOST"; self:Message(err or "STATE UNAVAILABLE",true); self:Refresh() end
  end)
 end
 function F:ApplyDecision(incident)
  local d=incident.decision
  if type(d)~="table" or type(d.decisionId)~="string" or self.applied[d.decisionId] then return end
  local permitted={NO_ACTION=true,RACING_INCIDENT=true,WARNING=true,PLUS_5=true,PLUS_10=true,DSQ=true,CUSTOM_REVIEW=true}
  if not permitted[d.kind] or type(d.targetUserId)~="number" or d.targetUserId%1~=0 or d.targetUserId<0 then return end
  self.applied[d.decisionId]=true; self.applying=true
  if d.kind=="PLUS_5" or d.kind=="PLUS_10" then PENALTY_OFFSET[d.targetUserId]=(PENALTY_OFFSET[d.targetUserId] or 0)+(d.kind=="PLUS_5" and 5 or 10)
  elseif d.kind=="DSQ" then DSQ_DRIVERS[d.targetUserId]=true end
  if d.kind=="PLUS_5" or d.kind=="PLUS_10" or d.kind=="DSQ" then table.insert(APPLIED_SANCTIONS,{uid=d.targetUserId,name="UID "..d.targetUserId,reason="FIA "..d.kind,type=d.kind=="DSQ" and "DSQ" or "PENALTY",decisionId=d.decisionId,time=os.date("%H:%M:%S")}) end
  SPA_RaceControl:AddEvent("FIA_DECISION",{category="SANCIONES",severity="INFO",uid=d.targetUserId,title="⚖ FIA DECISION",description=incident.incidentId.." · "..d.kind.." · UID "..d.targetUserId})
  self.applying=false
  SPA_Connect:Notify("FIA DECISION · "..d.kind.."\nDriver "..d.targetUserId,"⚖")
  if buildAppliedSanctionsList then pcall(buildAppliedSanctionsList) end
  local me=self:Me()
  if me and me.workstation~="OBSERVER" and self.room then
   self:Call("POST",self:Path("/incidents/"..incident.incidentId.."/ack"),{roomRevision=self.room.revision,incidentRevision=incident.revision},function() end)
  end
 end
 function F:Event(e)
  if type(e.id)~="number" or type(e.action)~="string" then return end
  if self.seen[e.id] then return end; self.seen[e.id]=true
  table.insert(self.timeline,e); if #self.timeline>200 then local old=table.remove(self.timeline,1); self.seen[old.id]=nil end
  if e.data and e.data.incident then local i=e.data.incident; self.incidents[i.incidentId]=i; self:ApplyDecision(i) end
  if e.action=="RACE_CONTROL_MESSAGE" and e.data then SPA_Connect:Notify("RACE CONTROL · "..tostring(e.data.title).."\n"..tostring(e.data.message),"⚑","IMPORTANT") end
  if e.action=="INCIDENT_CREATED" or e.action=="DECISION_PROPOSED" or e.action=="ROOM_JOIN" then
   if not self.lastNotify or os.clock()-self.lastNotify>8 then self.lastNotify=os.clock(); SPA_Connect:Notify("FIA NETWORK · "..e.action.."\n"..tostring(e.target),"⚑") end
  end
  if self.mode=="incident" and self.detail and e.target==self.detail.incidentId then self:LoadIncident(self.detail.incidentId,true) end
 end
 function F:Schedule(seconds)
  if self.timer then pcall(task.cancel,self.timer) end
  if self.closed or not self.token then return end
  self.timer=task.delay(math.max(3,seconds),function() self.timer=nil; self:Tick() end)
 end
 function F:Tick()
  if not self.token or self.closed then return end
  if self.polling or self.syncing then self:Schedule(4); return end
  self.polling=true
  self:Call("GET",self:Path("/events?after="..self.cursor),nil,function(ok,d,err,status)
   self.polling=false
   if ok and type(d.events)=="table" and type(d.nextCursor)=="number" and d.nextCursor>=self.cursor then
    self.room=d.room; self.operators=d.operators or self.operators
    for _,e in ipairs(d.events) do self:Event(e) end
    self.cursor=d.nextCursor; self.status="LIVE"; self.backoff=4
    if os.clock()-self.lastPresence>=15 then
     self.lastPresence=os.clock()
     self:Call("POST",self:Path("/heartbeat"),{},function(success,_,errorCode,code)
      if code==401 or code==410 then self:Forget("SESSION ENDED · JOIN REQUIRED")
      elseif not success then self.status="DEGRADED"; self:Message(errorCode or "PRESENCE FAILED",true) end
     end)
    end
    if not self.pending and not self.busy then
     if self.shareDetected and #self.pendingReports>0 then local evidence=table.remove(self.pendingReports,1); self:Action("incidents",{evidence=evidence})
     elseif self:IsDirector() and #self.sharedEvents>0 then local state=table.remove(self.sharedEvents,1); self:Action("session",{sessionState=state}) end
    end
   elseif status==401 or status==410 then self:Forget(status==410 and "ROOM CLOSED" or "SESSION EXPIRED · JOIN REQUIRED"); return
   else self.status="CONNECTION LOST"; self.backoff=math.min(60,self.backoff*2) end
   self:Refresh()
   if self.panel.Visible and (self.mode=="incidents" or self.mode=="operators" or self.mode=="timeline") then self:Render() end
   self:Schedule(self.status=="LIVE" and (self.panel.Visible and 4 or 8) or self.backoff)
  end)
 end
 function F:Capture(event)
  if not self.token or self.applying then return end
  if self:IsDirector() and ({RACE_START=true,RACE_FINISH=true,QUALY_START=true,QUALY_FINISH=true})[event.type] then
   if #self.sharedEvents<8 then table.insert(self.sharedEvents,({RACE_START="RACE",RACE_FINISH="FINISHED",QUALY_START="QUALY",QUALY_FINISH="IDLE"})[event.type]) end
  end
  local me=self:Me()
  if not self.shareDetected or not me or me.workstation=="OBSERVER" or not ({CRASH=true,CORNER_CUT=true,BOOST=true,SANCTION_PROPOSED=true})[event.type] then return end
  if #self.pendingReports>=20 then return end
  local drivers=event.uid and {event.uid} or {}
  table.insert(self.pendingReports,{lap=math.max(0,math.floor(tonumber(event.lap) or 0)),turn="REVIEW",drivers=drivers,eventType=event.type,
   notes=tostring(event.description or event.reason or "Local event"):sub(1,1000),timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ"),raceState=RACE_STATE})
 end
 function F:FindRoom()
  if game.JobId=="" then self:Message("JobId unavailable. A live server identity is needed; it is not authentication.",true); return end
  self:Call("GET","/v1/race-rooms/current?placeId="..tostring(game.PlaceId).."&jobId="..HttpService:UrlEncode(game.JobId),nil,function(ok,d,err)
   if ok then self.roomId=d.room and d.room.roomId; self.status=self.roomId and "ROOM AVAILABLE" or "NO ACTIVE ROOM"; self:Render()
   else self.status="OFFLINE"; self:Message(err or "OFFLINE",true); self:Refresh() end
  end)
 end
 function F:Leave()
  if not self.token then return end
  self:Call("POST",self:Path("/leave"),{},function() self:Forget("LEFT ROOM"); self:Render() end)
 end
 function F:LoadIncident(iid,quiet)
  self:Call("GET",self:Path("/incidents/"..iid),nil,function(ok,d,err)
   if ok then self.detail=d
    if quiet and self.mode=="incident" then self:DetailLabels() else self.mode="incident"; self:Render() end
   else self:Message(err or "INCIDENT UNAVAILABLE",true) end
  end)
 end
 function F:Confirm(message,fn)
  self.mode="confirm"; SPA_V220:Clear(self.content); self:Label(message,100)
  self:Button("CONFIRM",fn); self:Button("CANCEL",function() self.mode="room"; self:Render() end)
 end
 function F:Label(s,height) self.order=(self.order or 0)+1; return SPA_V220:Label(self.content,s,height or 54,self.order) end
 function F:Button(s,fn) self.order=(self.order or 0)+1; return SPA_V220:Button(self.content,s,fn,self.order) end
 function F:Input(s,value,height)
  self.order=(self.order or 0)+1; local b=SPA_V220:Input(self.content,s,height or 44,height and height>44); b.LayoutOrder=self.order; b.Text=value or ""; return b
 end
 function F:Refresh()
  if not self.card or not self.card.Parent then return end
  local n=0; for _,o in ipairs(self.operators) do if o.status~="OFFLINE" then n+=1 end end
  self.card.Text="⚑ FIA NETWORK · "..self.status..(self.roomId and ("\n"..self.roomId.." · "..n.." FIA ONLINE") or "")
  if self.header then self.header.Text="ROOM: "..(self.roomId or "—").." · SYNC: "..self.status.." · FIA: "..n end
 end
 function F:RoomView()
  self:Label("ONE RACE. ONE CONTROL ROOM.\nNames and server identity are unverified metadata. Protect your join codes.",70)
  self:Button("OPEN LOCAL TELEMETRY / ONBOARD",function() SPA_ControlCenter:Go("ONBOARD") end)
  if not self.token then
   self:Button("DETECT RACE ROOM",function() self:FindRoom() end)
   if not self.roomId then self:Button("CREATE RACE ROOM",function() self:Submit("/v1/race-rooms",self:Metadata(),function(d) self:Adopt(d) end) end)
   else
    self:Label("🔒 FIA AUTHORIZATION REQUIRED")
    for _,station in ipairs({"INCIDENT_STEWARD","TELEMETRY","OBSERVER","RACE_DIRECTOR"}) do self:Button((self.joinStation==station and "✓ " or "")..station,function() self.joinStation=station; self:Render() end) end
    local code=self:Input("ENTER FIA / OBSERVER CODE · 6 digits")
    self:Button("CONNECT",function() local value=code.Text; code.Text=""; self:Submit(self:Path("/join"),{metadata=self:Metadata(),code=value,workstation=self.joinStation},function(d) self:Adopt(d) end) end)
   end
   return
  end
  if not self.room then self:Button("RESYNC",function() self:Resync() end); return end
  local me=self:Me(); self:Label("SHARED SESSION: "..self.room.sessionState.."\nWORKSTATION: "..(me and me.workstation or "SYNCING").."\nHOST: "..(self.room.hostSession==self.sessionId and "YOU" or self.room.hostSession),90)
  if self.joinCode then self:Label("PRIVATE FIA JOIN CODE: "..self.joinCode.."\nOBSERVER CODE: "..tostring(self.observerCode).."\nExpires after 30 minutes. Share privately.",90) end
  for _,station in ipairs({"RACE_DIRECTOR","INCIDENT_STEWARD","TELEMETRY","OBSERVER"}) do
   if me and (me.clearance=="FIA" or station=="OBSERVER") then self:Button("CHANGE WORKSTATION → "..station,function() self:Action("workstation",{workstation=station}) end) end
  end
  if me and me.workstation~="OBSERVER" then
   self:Button("SHARE DETECTED INCIDENTS: "..(self.shareDetected and "ON" or "OFF"),function() self.shareDetected=not self.shareDetected; if not self.shareDetected then self.pendingReports={} end; self:Render() end)
  end
  if self:IsDirector() then
   for _,state in ipairs({"IDLE","QUALY","RACE","FINISHED"}) do self:Button("SHARED SESSION → "..state,function() self:Confirm("Set shared Race Control state to "..state.."? Local timing remains under its existing controls.",function() self.mode="room"; self:Action("session",{sessionState=state}) end) end) end
   local title=self:Input("Race Control title"); local message=self:Input("Race Control message",nil,90)
   self:Button("PUBLISH RACE CONTROL MESSAGE",function() self:Action("race-control",{title=title.Text,message=message.Text}) end)
   self:Button("PUBLISH CURRENT RESULTS",function()
    local results={}; for pos,uid in ipairs(CURRENT_STANDINGS_ORDER or {}) do
     local cached=HUD_RANK_CACHE and HUD_RANK_CACHE.byUid and HUD_RANK_CACHE.byUid[uid]
     if #results<100 then table.insert(results,{userId=uid,position=pos,laps=cached and cached.lap.lapsMade or 0,penaltySeconds=math.max(0,tonumber(PENALTY_OFFSET[uid]) or 0),dsq=DSQ_DRIVERS[uid]==true}) end
    end
    self:Confirm("Publish current classification, completed laps, penalty seconds and DSQ status?",function() self.mode="room"; self:Action("results",{results=results}) end)
   end)
  end
  if self:CanManage() then
   self:Button("ROTATE FIA / OBSERVER CODES",function() self:Confirm("Rotate codes? Existing sessions stay connected.",function() self.mode="room"; self:Action("rotate-code") end) end)
   self:Button("REVOKE OTHER FIA SESSIONS",function() self:Confirm("Disconnect all other operators and rotate codes? Your session is retained for recovery.",function() self.mode="room"; self:Action("revoke-sessions",{confirm=true}) end) end)
   for _,mode in ipairs({"DIRECTOR_CONFIRMATION","MAJORITY","UNANIMOUS"}) do self:Button("DECISION MODE → "..mode,function() self:Action("settings",{decisionMode=mode,directorLimit=self.room.directorLimit}) end) end
   local slots=self:Input("Race Director slots (1–8)",tostring(self.room.directorLimit))
   self:Button("SET DIRECTOR SLOTS",function() self:Action("settings",{decisionMode=self.room.decisionMode,directorLimit=tonumber(slots.Text)}) end)
   self:Button("END RACE ROOM",function() self:Confirm("END COLLABORATIVE SESSION? This disconnects every FIA operator.",function()
    SPA_V220:Clear(self.content); local verify=self:Input("Type "..self.roomId.." to confirm closure")
    self:Button("FINAL CONFIRM · CLOSE ROOM",function() self:Action("end",{confirm=true,confirmation=verify.Text}) end)
   end) end)
  end
  self:Label("SHARED RESULTS (position / UserId / laps / penalty seconds / DSQ)",40)
  for _,row in ipairs(self.room.results or {}) do self:Label(row.position.." / "..row.userId.." / "..row.laps.." / +"..row.penaltySeconds.."s"..(row.dsq and " / DSQ" or ""),35) end
  self:Button("LEAVE ROOM",function() self:Leave() end)
 end
 function F:IncidentsView()
  local counts={}; local rows={}; for _,i in pairs(self.incidents) do counts[i.status]=(counts[i.status] or 0)+1; table.insert(rows,i) end
  table.sort(rows,function(a,b) return a.createdAt>b.createdAt end)
  self:Label("NEW "..(counts.NEW or 0).." · REVIEW "..(counts.UNDER_REVIEW or 0).." · AWAITING "..(counts.AWAITING_DECISION or 0).." · CLOSED "..(counts.CLOSED or 0),60)
  local me=self:Me(); if me and me.workstation~="OBSERVER" then self:Button("NEW INCIDENT REPORT",function() self.mode="new"; self:Render() end) end
  for _,i in ipairs(rows) do self:Button(i.incidentId.." · LAP "..i.lap.." · "..i.turn.."\n"..i.status..(i.lease and (" · REVIEWING "..self:OperatorName(i.lease.operator)) or ""),function() self:LoadIncident(i.incidentId) end) end
 end
 function F:NewIncidentView()
  local lap=self:Input("LAP","0"); local turn=self:Input("TURN","T1"); local drivers=self:Input("Driver UserIds separated by commas"); local notes=self:Input("Evidence notes",nil,100)
  self:Button("CREATE INCIDENT · NO AUTOMATIC SANCTION",function()
   local ids={}; for n in drivers.Text:gmatch("%d+") do table.insert(ids,tonumber(n)) end
   self:Action("incidents",{evidence={lap=tonumber(lap.Text),turn=turn.Text,drivers=ids,eventType="MANUAL",notes=notes.Text,raceState=RACE_STATE,timestamp=os.date("!%Y-%m-%dT%H:%M:%SZ")}})
   self.mode="incidents"
  end)
 end
 function F:DetailLabels()
  local i=self.detail; if not i or not self.detailStatus or not self.detailStatus.Parent then return end
  self.detailStatus.Text=i.incidentId.." · "..i.status.." · REV "..i.revision.."\nREVIEW: "..(i.lease and self:OperatorName(i.lease.operator) or "AVAILABLE").."\n"..(i.decision and ("CONFIRMED: "..i.decision.kind.." · "..self:OperatorName(i.decision.operator)) or (i.proposal and ("AWAITING DECISION: "..i.proposal.kind) or "NO PROPOSAL"))
  local lines={}; for _,n in ipairs(i.notes or {}) do table.insert(lines,self:OperatorName(n.operator)..": "..n.note) end
  for _,v in ipairs(i.votes or {}) do table.insert(lines,"VOTE · "..self:OperatorName(v.operator)..": "..v.choice) end
  local totals={}; local voters=0
  for _,o in ipairs(self.operators) do if o.workstation=="INCIDENT_STEWARD" and o.status~="OFFLINE" then voters+=1 end end
  for _,v in ipairs(i.votes or {}) do totals[v.choice]=(totals[v.choice] or 0)+1 end
  for kind,n in pairs(totals) do table.insert(lines,kind.." · "..n.." / "..voters) end
  self.detailNotes.Text=table.concat(lines,"\n")
 end
 function F:DetailView()
  local i=self.detail; if not i then return end
  self.detailStatus=self:Label("",100); self:Label("EVIDENCE\n"..HttpService:JSONEncode(i.evidence),140); self.detailNotes=self:Label("",100); self:DetailLabels()
  local me=self:Me(); if not me or (me.workstation~="RACE_DIRECTOR" and me.workstation~="INCIDENT_STEWARD") then return end
  self:Button("CLAIM REVIEW (60s lease, renewed by presence)",function() self:IncidentAction("claim") end)
  self:Button("RELEASE REVIEW",function() self:IncidentAction("release") end)
  if self:IsDirector() then self:Button("TAKE OVER REVIEW",function() self:Confirm("Take over another steward's review? This is audited.",function() self:IncidentAction("claim",{force=true,confirm=true}) end) end) end
  local note=self:Input("FIA NOTE · max 1000 characters",nil,90)
  self:Button("ADD NOTE",function() self:IncidentAction("note",{note=note.Text}) end)
  local target=self:Input("Driver UserId",tostring((i.drivers or {})[1] or 0)); local reason=self:Input("Decision reason",nil,80)
  for _,kind in ipairs({"NO_ACTION","RACING_INCIDENT","WARNING","PLUS_5","PLUS_10","DSQ","CUSTOM_REVIEW"}) do self:Button("PROPOSE "..kind,function() self:IncidentAction("proposal",{proposal={kind=kind,targetUserId=tonumber(target.Text),reason=reason.Text}}) end) end
  self:Button("VOTE APPROVE",function() self:IncidentAction("vote",{choice="APPROVE"}) end)
  self:Button("VOTE REJECT",function() self:IncidentAction("vote",{choice="REJECT"}) end)
  for _,kind in ipairs({"NO_ACTION","RACING_INCIDENT","WARNING","PLUS_5","PLUS_10","DSQ","CUSTOM_REVIEW"}) do self:Button("VOTE "..kind,function() self:IncidentAction("vote",{choice=kind}) end) end
  if self:IsDirector() then
   for _,outcome in ipairs({"CONFIRM","REJECT","RETURN_TO_REVIEW"}) do self:Button(outcome,function() self:Confirm(outcome.." this proposal?",function() self:IncidentAction("decision",{outcome=outcome}) end) end) end
   self:Button("CLOSE INCIDENT",function() self:IncidentAction("status",{status="CLOSED"}) end)
  end
 end
 function F:Render()
  if not self.panel or not self.panel.Visible then return end
  SPA_V220:Clear(self.content); self.order=0; self.header=self:Label("",65); self:Refresh()
  self:Button("RETRY LAST ACTION",function() self:Retry() end)
  if self.token then for _,v in ipairs({{"room","RACE ROOM"},{"incidents","INCIDENTS"},{"timeline","FIA TIMELINE"},{"operators","OPERATORS"}}) do self:Button(v[2],function() self.mode=v[1]; self:Render() end) end end
  if self.mode=="room" or not self.token then self:RoomView()
  elseif self.mode=="incidents" then self:IncidentsView()
  elseif self.mode=="new" then self:NewIncidentView()
  elseif self.mode=="incident" then self:DetailView()
  elseif self.mode=="timeline" then
   self:Button("LOAD HISTORY · NEXT PAGE",function() self:Call("GET",self:Path("/events?after="..tostring(self.historyCursor or 0)),nil,function(ok,d) if ok then self.historyCursor=d.hasMore and d.nextCursor or 0; for _,e in ipairs(d.events) do self:Event(e) end; self:Render() end end) end)
   for n=#self.timeline,1,-1 do local e=self.timeline[n]; self:Label(e.id.." · "..e.action.."\n"..self:OperatorName(e.actor).." → "..e.target..(e.data and e.data.message and ("\n"..e.data.title..": "..e.data.message) or ""),64) end
  elseif self.mode=="operators" then
   for _,o in ipairs(self.operators) do
    local review=""; for _,i in pairs(self.incidents) do if i.lease and i.lease.operator==o.sessionId then review="\nREVIEWING "..i.incidentId end end
    self:Label(o.displayName.." · "..o.workstation.."\n"..o.status..review,70)
    if self.room and self.room.hostSession==self.sessionId and o.sessionId~=self.sessionId and o.status~="OFFLINE" and o.clearance=="FIA" then self:Button("TRANSFER HOST → "..o.displayName,function() self:Confirm("Transfer room ownership to "..o.displayName.."?",function() self.mode="room"; self:Action("transfer-host",{sessionId=o.sessionId,confirm=true}) end) end) end
   end
  end
 end
 function F:Open()
  SPA_ControlCenter:Hide(); mainFrame.Visible=false; self.panel.Visible=true; self.mode="room"; self:Render()
  if self.token then self:Resync() else self:FindRoom() end
 end
 function F:Init()
  self.panel,self.content,self.footer=SPA_V220:Panel(SPA_ControlCenter.gui,"SPA FIA NETWORK · COLLABORATIVE RACE CONTROL")
  local home=SPA_V220:Button(self.panel,"⌂ HOME",function() self.panel.Visible=false; SPA_ControlCenter:Open() end)
  home.Size=UDim2.new(0,100,0,30); home.Position=UDim2.new(1,-116,0,7)
  self.card=SPA_V220:Button(SPA_ControlCenter.content,"⚑ FIA NETWORK",function() self:Open() end,5); self:Refresh()
 end
 return F
end)()

do
 local oldEvent=SPA_RaceControl.AddEvent
 function SPA_RaceControl:AddEvent(kind,data)
  local result=oldEvent(self,kind,data)
  if result then local ok=pcall(SPA_FIA.Capture,SPA_FIA,result); if not ok then warn("[SPA FIA] LOCAL_EVENT_CAPTURE_FAILED") end end
  return result
 end
 local oldHide=SPA_ControlCenter.Hide
 function SPA_ControlCenter:Hide() oldHide(self); if SPA_FIA.panel then SPA_FIA.panel.Visible=false end end
 local oldConfigure=SPA_Connect.Configure
 function SPA_Connect:Configure(url,enabled)
  assert(not SPA_FIA.token or url==self.baseUrl,"Leave FIA Room before changing API URL")
  return oldConfigure(self,url,enabled)
 end
 local oldStop=SPA_Connect.Stop
 function SPA_Connect:Stop()
  SPA_FIA.closed=true; if SPA_FIA.timer then pcall(task.cancel,SPA_FIA.timer); SPA_FIA.timer=nil end
  local stopped=false; local function finish() if not stopped then stopped=true; SPA_FIA:Forget("OFFLINE"); oldStop(self) end end
  if SPA_FIA.token then SPA_FIA:Call("POST",SPA_FIA:Path("/leave"),{},finish); task.delay(2,finish) else finish() end
 end
end
SPA_V220:Stage("FIA NETWORK",function() SPA_FIA:Init() end)

-- V2.22.1 TIMING UI / MANUAL PITS
SPA_PitsControl = {}
function SPA_PitsControl:CanEdit()
	if SPA_FIA and SPA_FIA.token and not SPA_FIA:IsDirector() then
		showNotification("RACE DIRECTOR REQUIRED · MANUAL PIT",C_RED,"⚑",20); return false
	end
	return true
end
function SPA_PitsControl:Adjust(uid,delta)
	local pl=Players:GetPlayerByUserId(uid)
	if not pl or (delta~=1 and delta~=-1) then return false end
	if not self:CanEdit() then return false end
	ensurePlayerData(pl); local pd=pitData[uid]; local old=pd.pitStopsMade or 0
	local value=math.max(0,old+delta); if value==old then return false end
	pd.pitStopsMade=value -- Never modify status, lastPitTouch, limiter or physical state.
	SPA_RaceControl:AddEvent("MANUAL_PIT",{category="BOXES",uid=uid,name=getDisplayName(pl),operator=player.Name,operatorId=player.UserId,oldValue=old,newValue=value,title=delta>0 and "MANUAL PIT +1" or "MANUAL PIT -1",description=getDisplayName(pl).." · "..old.." → "..value.." · "..player.Name})
	HUD_LAST_SIGNATURE=nil; HUD_RANK_CACHE.signature=nil
	SPA_LapsControl:Refresh(); if SPA_LapsControl.refreshHUD then SPA_LapsControl.refreshHUD() end
	return true
end
function SPA_Timing:Describe(uid)
	local s=self.states[uid]; local last=self.last[uid]; local f=fastLapData[uid] or {}
	local lines={s and s.stage or "WAITING_META"}
	for i=1,3 do
		local value=s and s["sector"..i.."Time"]
		table.insert(lines,"S"..i.."  "..(value and string.format("%.3f",value) or "—"))
	end
	table.insert(lines,"CURRENT  "..(s and s.lapStart and s.stage~="INVALID" and fmtTime(math.max(0,tick()-s.lapStart)) or "—"))
	table.insert(lines,"BEST LAP  "..(f.bestTime and fmtTime(f.bestTime) or "—"))
	if last then table.insert(lines,("LAP COMPLETE · S1 %.3f · S2 %.3f · S3 %.3f\nFINAL %.3f · LAP %s"):format(last[1],last[2],last[3],last.finalSplit,fmtTime(last.lapTime))) end
	table.insert(lines,"PIT STOPS  "..tostring(pitData[uid] and pitData[uid].pitStopsMade or 0))
	return table.concat(lines,"\n")
end
function SPA_Timing:RefreshUI()
	if not self.statusLabel then return end
	local mode=self:Mode()
	self.statusLabel.Text="TIMING MODE · "..(mode=="INCOMPLETE" and "INCOMPLETE SECTOR CONFIGURATION · LEGACY ACTIVE" or mode)
	self.statusLabel.TextColor3=mode=="INCOMPLETE" and C_YELLOW or C_GREEN
	for i,label in ipairs(self.gateLabels) do label.Text="SECTOR "..i.." · "..(self.gates[i] and self.gates[i].Parent and "✓" or "NOT SET") end
	if self.panel.Visible then
		local active={}
		for uid,st in pairs(PlayerState or {}) do
			if st.player then
				active[uid]=true; local label=self.driverLabels[uid]
				if not label then label=SPA_V220:Label(self.content,"",230,uid%1000000); self.driverLabels[uid]=label end
				label.Text=getDisplayName(st.player).."\n"..self:Describe(uid)
			end
		end
		for uid,label in pairs(self.driverLabels) do if not active[uid] then label:Destroy(); self.driverLabels[uid]=nil end end
	end
	if SPA_Onboard.active and SPA_Onboard.current and self.onboardLabel then
		self.onboardLabel.Visible=true; local s=self.states[SPA_Onboard.current.UserId]; local last=self.last[SPA_Onboard.current.UserId]
		self.onboardLabel.Text=last and ("S1 %.3f · S2 %.3f · S3 %.3f\nLAP %s"):format(last[1],last[2],last[3],fmtTime(last.lapTime)) or (s and s.stage or "WAITING_META")
	elseif self.onboardLabel then self.onboardLabel.Visible=false end
end
function SPA_Timing:AddOnboardShortcut()
	SPA_V220:Button(onboardScroll,"⏱ CURRENT LAP / SECTORS / BEST LAP",function() mainFrame.Visible=false; self.panel.Visible=true; self:RefreshUI() end,-1)
end
function SPA_Timing:BuildUI()
	self.gateLabels={}; self.driverLabels={}
	self.statusLabel=SPA_V220:Label(configScroll,"",56,160)
	SPA_V220:Label(configScroll,"LOOK FORWARD ALONG THE TRACK · placement rotates automatically. FINISH closes the lap, not S3.",60,161)
	for i=1,3 do
		self.gateLabels[i]=SPA_V220:Label(configScroll,"",28,162+i*3)
		SPA_V220:Button(configScroll,"SET SECTOR "..i.." WP",function() self:SetGate(i,GetWaypointPlacementCFrame()); self:RefreshUI() end,163+i*3)
		SPA_V220:Button(configScroll,"CLEAR SECTOR "..i,function() self:SetGate(i,nil); self:RefreshUI() end,164+i*3)
	end
	self.panel,self.content=SPA_V220:Panel(SPA_ControlCenter.gui,"TRACK TIMING · S1 / S2 / S3 / FINISH")
	SPA_V220:Button(self.content,"CLOSE",function() self.panel.Visible=false; SPA_ControlCenter:Open() end,-2)
	SPA_V220:Button(SPA_ControlCenter.content,"⏱ TRACK TIMING / SECTORS",function() SPA_ControlCenter:Hide(); self.panel.Visible=true; self:RefreshUI() end,6)
	self:AddOnboardShortcut()
	local oldHide=SPA_ControlCenter.Hide
	function SPA_ControlCenter:Hide() oldHide(self); SPA_Timing.panel.Visible=false end
	self.onboardLabel=SPA_V220:Label(mainGui,"",44); self.onboardLabel.Size=UDim2.new(0.7,0,0,44); self.onboardLabel.AnchorPoint=Vector2.new(0.5,0); self.onboardLabel.Position=UDim2.fromScale(0.5,0.22); self.onboardLabel.Visible=false
	self:RefreshUI()
end
SPA_V220:Stage("TRACK TIMING UI",function() SPA_Timing:BuildUI() end)
-- END V2.22.1 TIMING UI

-- V2.22.1 RESPONSIVE GUI: safe insets, event-driven sizing, independent X/Y scrolling.
SPA_Mobile = { watched=setmetatable({},{__mode="k"}), adapted=setmetatable({},{__mode="k"}), wrappers={}, modals={} }
function SPA_Mobile:Compact()
	local camera=Workspace.CurrentCamera
	return UserInputService.TouchEnabled or (camera and camera.ViewportSize.X<800)
end
function SPA_Mobile:Scroll(scroll)
	scroll.Active=true; scroll.ScrollingEnabled=true; scroll.ClipsDescendants=true
	scroll.ElasticBehavior=Enum.ElasticBehavior.WhenScrollable
	scroll.VerticalScrollBarInset=Enum.ScrollBarInset.ScrollBar
	scroll.ScrollBarThickness=self:Compact() and 8 or 10
end
function SPA_Mobile:Wrap(frame,minWidth)
	-- Outer X scrolling preserves dense desktop editors without shrinking their controls.
	-- Existing inner Y lists remain the only vertical scroller.
	local children=frame:GetChildren()
	local outer=Instance.new("ScrollingFrame"); outer.Name="SPA_HorizontalViewport"
	outer.Size=UDim2.fromScale(1,1); outer.BackgroundTransparency=1; outer.BorderSizePixel=0
	outer.ScrollingDirection=Enum.ScrollingDirection.X; outer.CanvasSize=UDim2.new(); outer.Parent=frame; self:Scroll(outer)
	local body=Instance.new("Frame"); body.Name="SPA_ResponsiveBody"; body.BackgroundTransparency=1; body.Parent=outer
	for _,child in ipairs(children) do child.Parent=body end
	local item={frame=frame,outer=outer,body=body,minWidth=minWidth or 640}; table.insert(self.wrappers,item)
	local function resize()
		if not frame.Parent then return end
		local width=math.max(1,frame.AbsoluteSize.X); local content=self:Compact() and math.max(width,item.minWidth) or width
		body.Size=UDim2.new(0,content,1,-10); outer.CanvasSize=UDim2.fromOffset(content,0)
		outer.CanvasPosition=Vector2.new(math.clamp(outer.CanvasPosition.X,0,math.max(0,content-width)),0)
	end
	item.resize=resize; frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(resize)
	frame.ChildAdded:Connect(function(child) if child~=outer then child.Parent=body end end)
	resize()
end
function SPA_Mobile:Adapt(obj)
	self.watched[obj]=true
	if obj:IsA("ScrollingFrame") then self:Scroll(obj) end
	if not self:Compact() or self.adapted[obj] then return end
	if obj:IsA("GuiObject") then self.adapted[obj]={size=obj.Size,automatic=obj.AutomaticSize} end
	if obj:IsA("Frame") and obj.Parent and obj.Parent~=towerContainer and obj.Parent:IsA("ScrollingFrame") and obj.Size.Y.Scale==0 and obj.Size.Y.Offset>0 and obj.Size.Y.Offset<48 then
		for _,child in ipairs(obj:GetChildren()) do
			if child:IsA("TextButton") or child:IsA("ImageButton") then obj.Size=UDim2.new(obj.Size.X.Scale,obj.Size.X.Offset,0,64); break end
		end
	end
	if obj:IsA("TextButton") or obj:IsA("TextBox") then
		local parent=obj.Parent
		local list=parent and parent:FindFirstChildOfClass("UIListLayout")
		if list and obj.Size.Y.Scale==0 and obj.Size.Y.Offset<44 then obj.Size=UDim2.new(obj.Size.X.Scale,obj.Size.X.Offset,0,44) end
		obj.TextWrapped=true
	end
	if obj:IsA("TextBox") and obj.MultiLine and obj.Parent and obj.Parent:IsA("ScrollingFrame") then
		-- Reports and long Track Codes grow inside the existing scroll, not behind clipped text.
		obj.AutomaticSize=Enum.AutomaticSize.Y
	end
end
function SPA_Mobile:Watch(gui)
	if self.watched[gui] then return end; self.watched[gui]=true
	gui.ScreenInsets=Enum.ScreenInsets.CoreUISafeInsets
	gui.ClipToDeviceSafeArea=true
	local function visit(obj) self:Adapt(obj); for _,child in ipairs(obj:GetChildren()) do visit(child) end end
	for _,child in ipairs(gui:GetChildren()) do visit(child) end
	gui.DescendantAdded:Connect(function(obj)
		task.defer(function() if obj.Parent then self:Adapt(obj) end end)
	end)
end
function SPA_Mobile:Modal(panel)
	if not panel then return end
	table.insert(self.modals,{panel=panel,size=panel.Size,position=panel.Position})
end
function SPA_Mobile:Resize()
	local compact=self:Compact()
	if compact then
		for obj in pairs(self.watched) do if obj.Parent then self:Adapt(obj) end end
	else
		for obj,saved in pairs(self.adapted) do
			if obj.Parent then obj.Size=saved.size; if saved.automatic then obj.AutomaticSize=saved.automatic end end
			self.adapted[obj]=nil
		end
	end
	for _,item in ipairs(self.modals) do
		if item.panel.Parent then
			item.panel.Size=compact and UDim2.new(1,-16,1,-76) or item.size
			item.panel.Position=compact and UDim2.fromScale(0.5,0.48) or item.position
		end
	end
	if compact then
		tabBar.Size=UDim2.new(1,0,0,48); tabBar.Position=UDim2.fromOffset(0,41)
		tabBar.ScrollingDirection=Enum.ScrollingDirection.X; tabBar.AutomaticCanvasSize=Enum.AutomaticSize.X
		tabBar.CanvasSize=UDim2.new(); tabSep.Visible=false
		local layout=tabBar:FindFirstChildOfClass("UIListLayout"); if layout then layout.FillDirection=Enum.FillDirection.Horizontal end
		for _,btn in pairs(tabButtons) do btn.Size=UDim2.fromOffset(112,44) end
		for _,frame in pairs(tabFrames) do frame.Size=UDim2.new(1,-12,1,-99); frame.Position=UDim2.fromOffset(6,93) end
	elseif self.sidebar then
		tabBar.Size=self.sidebar.size; tabBar.Position=self.sidebar.position; tabBar.ScrollingDirection=Enum.ScrollingDirection.Y; tabBar.AutomaticCanvasSize=Enum.AutomaticSize.Y; tabSep.Visible=true
		local layout=tabBar:FindFirstChildOfClass("UIListLayout"); if layout then layout.FillDirection=Enum.FillDirection.Vertical end
		for _,btn in pairs(tabButtons) do btn.Size=UDim2.new(1,0,0,38) end
		for frame,saved in pairs(self.tabSizes) do frame.Size=saved.size; frame.Position=saved.position end
	end
	for _,item in ipairs(self.wrappers) do item.resize() end
	self:Tower()
	if SPA_Onboard then SPA_Onboard:Paint() end
end
function SPA_Mobile:Tower()
	if not towerContainer or not towerLayout then return end
	local camera=Workspace.CurrentCamera; if not camera then return end
	local area=camera.ViewportSize; local content=towerLayout.AbsoluteContentSize.Y+8
	local width=math.min(math.round(TOWER_WIDTH*TOWER_SCALE),math.max(80,area.X-20))
	local x=math.clamp(area.X*towerConfig.posX+towerConfig.offsetX,8,math.max(8,area.X-width-8))
	local y=math.clamp(area.Y*towerConfig.posY+towerConfig.offsetY,8,math.max(8,area.Y-100))
	towerContainer.Position=UDim2.fromOffset(x,y)
	towerContainer.Size=UDim2.fromOffset(width,math.min(content,math.max(80,area.Y-y-60)))
	towerContainer.CanvasSize=UDim2.fromOffset(0,content)
end
function SPA_Mobile:Init()
	self.sidebar={size=tabBar.Size,position=tabBar.Position}; self.tabSizes={}
	for _,frame in pairs(tabFrames) do self.tabSizes[frame]={size=frame.Size,position=frame.Position} end
	self:Modal(mainFrame); self:Modal(SPA_V220.ccPanel)
	for _,frame in pairs(tabFrames) do self:Wrap(frame) end
	if SPA_V220.ccFrames then for _,frame in pairs(SPA_V220.ccFrames) do self:Wrap(frame) end end
	for _,gui in ipairs(playerGui:GetChildren()) do if gui:IsA("ScreenGui") and gui.Name:match("^SPA") then self:Watch(gui) end end
	self:Watch(hudGui); self:Watch(towerGui)
	self.guiConnection=playerGui.ChildAdded:Connect(function(gui) if gui:IsA("ScreenGui") and gui.Name:match("^SPA") then task.defer(function() if gui.Parent then self:Watch(gui) end end) end end)
	if towerLayout then self.towerConnection=towerLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() self:Tower() end) end
	local function bindCamera()
		if self.cameraConnection then self.cameraConnection:Disconnect() end
		local camera=Workspace.CurrentCamera
		if camera then self.cameraConnection=camera:GetPropertyChangedSignal("ViewportSize"):Connect(function() self:Resize() end) end
		self:Resize()
	end
	self.currentCameraConnection=Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(bindCamera)
	self.touchConnection=UserInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(function() self:Resize() end)
	mainGui.Destroying:Connect(function()
		if self.cameraConnection then self.cameraConnection:Disconnect() end
		self.currentCameraConnection:Disconnect(); self.touchConnection:Disconnect()
		self.guiConnection:Disconnect(); if self.towerConnection then self.towerConnection:Disconnect() end
	end)
	bindCamera()
end
SPA_V220:Stage("RESPONSIVE MOBILE UI",function() SPA_Mobile:Init() end)
-- END V2.22.1 RESPONSIVE GUI
