
-- ==========================================
-- || INITIALIZATION
-- ==========================================
repeat task.wait() until game:IsLoaded()

local Players     = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

repeat task.wait()
until LocalPlayer
  and LocalPlayer.Character
  and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

-- ==========================================
-- || CONFIGURATION (Linked to _G)
-- ==========================================
local Config = {
	LoopFarm              = false,
	AutoRejoin            = false,
	TimedRejoin           = false,
	RejoinDelay           = 10,
	FriendOnly            = false,
	WhiteScreen           = false,
	FPSLock               = 240,
	Webhook               = { Enabled = false, URL = "" },
	TpTime                = 0.1,
	NPCAttackThreshold    = 5,
	AutoEquip             = false,
	SelectedWeapon_NPC    = "None",
	SelectedWeapon_Boss   = "None",
	AutoHaki              = false,
	AutoObservationHaki   = false,
	IgnoredEntities = {
		ArenaFighter       = true,
		Ninja              = true,
		Hollow             = true,
		Quincy             = true,
		Swordsman          = true,
		AcademyTeacher     = true,
		Slime              = true,
		StrongSorcerer     = true,
		Curse              = true,
		Sorcerer           = true,
		Gojo               = true,
		Yuji               = true,
		Sukuna             = true,
		Jinwoo             = true,
		Alucard            = true,
		Aizen              = true,
		Yamato             = true,
		Saber              = true,
		Ichigo             = true,
		QinShi             = true,
		Gilgamesh          = true,
		BlessedMaiden      = true,
		SaberAlter         = true,
		StrongestinHistory = true,
		StrongestofToday   = true,
		Rimuru             = true,
		Anos               = true,
		TrueAizen          = true,
		Atomic             = true,
		StrongestShinobi   = true,
	},
	Boss = {
		AutoSpawn  = false,
		Selected   = {}, -- Fluent multi-select populates this as { BossName = true, ... }
		Difficulty = "Normal",
	},
	Specials = {
		TrueAizen = { Auto = false, Diff = "Normal" },
		Sukuna    = { Auto = false, Diff = "Normal" },
		Gojo      = { Auto = false, Diff = "Normal" },
		Rimuru    = { Auto = false, Diff = "Normal" },
		Anos      = { Auto = false, Diff = "Normal" },
		Atomic    = { Auto = false, Diff = "Normal" },
	},
	AutoSkill = {
		Bosses     = false,
		NPCs       = false,
		BossSkills = {},
		NPCSkills  = {},
		SkillIds   = { Z = 1, X = 2, C = 3, V = 4, F = 5 },
	},
	AutoQuest = {
		SelectedNPC = "None",
	},
	AutoCraft = {
		SlimeKey = false,
		DivineGrail = false,
	},
	DungeonFarm = {
		Enabled      = false,
		TweenSpeed   = 0.1,   -- seconds per tween step
		FarmPosition = "Top", -- "Top" | "Behind"
		Distance     = 5,     -- Studs away
		AutoReplay   = false,
		AutoVote     = false,
		VoteDiff     = "Easy",
		AutoMake     = false,
		DungeonType  = "CidDungeon", -- "CidDungeon" | "RuneDungeon" | "DoubleDungeon"
		AutoJoin     = false,
	},
}

_G.FarmConfig = Config

-- ==========================================
-- || CONSTANTS
-- ==========================================
local CONSTANTS = {
	HakiBlack = BrickColor.new("Really black"),

	Locations = {
		ArenaFighter	   = CFrame.new(63,      1,    1817),
		Ninja              = CFrame.new(-1876,   9,    -734),
		Hollow             = CFrame.new(-365,    0,    1094),
		Quincy             = CFrame.new(-1350, 1604,   1595),
		Swordsman          = CFrame.new(-1271,   1,   -1193),
		AcademyTeacher     = CFrame.new( 1081,   2,    1279),
		Slime              = CFrame.new(-1123,  14,     366),
		StrongSorcerer     = CFrame.new(  664,   2,   -1697),
		Curse              = CFrame.new(  -16,   2,   -1845),
		Sorcerer           = CFrame.new(1401,    8,    483),
		Gojo               = CFrame.new( 1858.32, 12.98,  338.14),
		Yuji               = CFrame.new( 1537.92,  9.98,  226.10),
		Sukuna             = CFrame.new( 1571.26, 77.22,  -34.11),
		Jinwoo             = CFrame.new(  248.74, 12.09,  927.54),
		Alucard            = CFrame.new(  248.74, 12.09,  927.54),
		Aizen              = CFrame.new( -567.22, -0.42, 1228.49),
		Yamato             = CFrame.new(-1422.68, 24.42,-1383.46),
		StrongestShinobi   = CFrame.new(-2106, 13, -596),
		Saber              = CFrame.new(  770,   -1,   -1086),
		Ichigo             = CFrame.new(  770,   -1,   -1086),
		QinShi             = CFrame.new(  770,   -1,   -1086),
		Gilgamesh          = CFrame.new(  770,   -1,   -1086),
		BlessedMaiden      = CFrame.new(  770,   -1,   -1086),
		SaberAlter         = CFrame.new(  770,   -1,   -1086),
		StrongestinHistory = CFrame.new(  604,    3,   -2314),
		StrongestofToday   = CFrame.new(  139,    3,   -2432),
		Rimuru             = CFrame.new(-1358,   19,     219),
		Anos               = CFrame.new(  949,    1,    1370),
		TrueAizen          = CFrame.new(-1205, 1604,    1774),
		Atomic             = CFrame.new(58,       3,    1961),
		
	},

	FarmOrder = {
		{ Name = "ArenaFighter",       Remote = "Lawless",     IsBossType = false },
		{ Name = "Ninja"    ,          Remote = "Ninja",       IsBossType = false },
		{ Name = "Swordsman",          Remote = "Judgement",   IsBossType = false },
		{ Name = "Quincy",             Remote = "HuecoMundo",  IsBossType = false },
		{ Name = "AcademyTeacher",     Remote = "Academy",     IsBossType = false },
		{ Name = "Slime",              Remote = "Slime",       IsBossType = false },
		{ Name = "StrongSorcerer",     Remote = "Shinjuku",    IsBossType = false },
		{ Name = "Hollow",             Remote = "HuecoMundo",  IsBossType = false },
		{ Name = "Curse",              Remote = "Shinjuku",    IsBossType = false },
		{ Name = "Sorcerer",           Remote = "Shibuya",     IsBossType = false },
		{ Name = "Gojo",               Remote = "Shibuya",     IsBossType = true  },
		{ Name = "Yuji",               Remote = "Shibuya",     IsBossType = true  },
		{ Name = "Sukuna",             Remote = "Shibuya",     IsBossType = true  },
		{ Name = "Jinwoo",             Remote = "Sailor",      IsBossType = true  },
		{ Name = "Alucard",            Remote = "Sailor",      IsBossType = true  },
		{ Name = "Aizen",              Remote = "HuecoMundo",  IsBossType = true  },
		{ Name = "Yamato",             Remote = "Judgement",   IsBossType = true  },
		{ Name = "StrongestShinobi",   Remote = "Ninja",       IsBossType = true  },
		{ Name = "Saber",              Remote = "Boss",        IsBossType = true  }, 	
		{ Name = "Ichigo",             Remote = "Boss",        IsBossType = true  },
		{ Name = "QinShi",             Remote = "Boss",        IsBossType = true  },
		{ Name = "Gilgamesh",          Remote = "Boss",        IsBossType = true  },
		{ Name = "BlessedMaiden",      Remote = "Boss",        IsBossType = true  },
		{ Name = "SaberAlter",         Remote = "Boss",        IsBossType = true  },
		{ Name = "StrongestinHistory", Remote = "Shinjuku",    IsBossType = true  },
		{ Name = "StrongestofToday",   Remote = "Shinjuku",    IsBossType = true  },
		{ Name = "Rimuru",             Remote = "Slime",       IsBossType = true  },
		{ Name = "Anos",               Remote = "Academy",     IsBossType = true  },
		{ Name = "TrueAizen",          Remote = "HuecoMundo",  IsBossType = true  },
		{ Name = "Atomic",             Remote = "Lawless",     IsBossType = true  },
	},

	CraftingSets = {
		Atomic = {
			Items = {
				{"Atomic Omen", 1},
				{"Eminence Essence", 3},
				{"Magic Shard", 16},
				{"Shadow Remnant", 9},
				{"Abyss Sigil", 80},
			},
			SkillUnlock = {
				{"Path Fragment", 2},
				{"Eternal Core", 5},
				{"Battle Sigil", 10},
			}
		},
		StrongestShinobi = {
			Items = {
				{"Path Fragment", 1},
				{"Eternal Core", 3},
				{"Battle Sigil", 8},
				{"Power Remnant", 15}
			},
			SkillUnlock = {
				{"Path Fragment", 2},
				{"Eternal Core", 5},
				{"Battle Sigil", 10},
			}
		},
		StrongestinHistory = {
			Items = {
				{"Malevolent Soul", 3},
				{"Awakened Cursed Finger", 20},
				{"Cursed Flesh", 1},
				{"Vessel Ring", 7}
			},
			SkillUnlock = {
				{"Shrine Domain Shard", 1},
				{"Malevolent Soul", 3}
			}
		},

		TrueAizen = {
			Items = {
				{"Evolution Fragment", 1},
				{"Transcendent Core", 3},
				{"Divinity Essence", 8},
				{"Fusion Ring", 15},
				{"Chrysalis Sigil", 75}
			},
			SkillUnlock = {
				{"Transmutation Shard", 5}
			}
		},

		StrongestofToday = {
			Items = {
				{"Reversal Pulse", 9},
				{"Blue Singularity", 3},
				{"Infinity Essence", 1},
				{"Six Eye", 6}
			},
			SkillUnlock = {
				{"Blue Singularity", 3},
				{"Infinity Domain Shard", 1}
			}
		},

		BlessedMaiden = {
			Items = {
				{"Celestial Mark", 1},
				{"Aero Core", 3},
				{"Gale Essence", 8},
				{"Tide Remnant", 14},
				{"Tempest Relic", 25}
			},
			SkillUnlock = {
				{"Celestial Mark", 2},
				{"Aero Core", 8},
				{"Tempest Relic", 75}
			}
		},

		Aizen = {
			Items = {
				{"Hōgyoku Fragment", 1},
				{"Reiatsu Core", 3},
				{"Illusion Prism", 6},
				{"Mirage Pendant", 10}
			}
		},

		SaberAlter = {
			Items = {
				{"Corrupt Crown", 1},
				{"Corruption Core", 3},
				{"Alter Essence", 8},
				{"Morgan Remnant", 15},
				{"Dark Grail", 25}
			},
			SkillUnlock = {
				{"Corrupt Crown", 2},
				{"Corruption Core", 9},
				{"Dark Grail", 85}
			}
		},

		Anos = {
			Items = {
				{"Calamity Seal", 65},
				{"Demonic Fragment", 12},
				{"Demonic Shard", 6},
				{"Destruction Eye", 2},
				{"Imperial Mark", 1}
			}
		},

		Yamato = {
			Items = {
				{"Azure Heart", 1},
				{"Silent Storm", 3},
				{"Yamato Essence", 7},
				{"Frozen Will", 14}
			}
		},

		Gilgamesh = {
			Items = {
				{"Throne Remnant", 12},
				{"Ancient Shard", 6},
				{"Golden Essence", 3},
				{"Phantasm Core", 1}
			}
		},

		ShadowMonarch = {
			Items = {
				{"Monarch Core", 10},
				{"Monarch Essence", 5},
				{"Kamish Dagger", 2},
				{"Shadow Crystal", 1}
			}
		},

		Gryphon = {
			Items = {}
		}
	}
}

-- ==========================================
-- || CLASS: Entity Tracker
-- ==========================================
local EntityTracker = {}
EntityTracker.__index = EntityTracker

function EntityTracker.new(npcsFolder)
	local self = setmetatable({
		Folder      = npcsFolder,
		Active      = {},
		Connections = {},
		NPCConns    = {},
	}, EntityTracker)
	self:Init()
	return self
end

function EntityTracker:Register(npc)
	task.spawn(function()
		local humanoid = npc:WaitForChild("Humanoid", 3)
		if not humanoid or humanoid.Health <= 0 then return end

		self.Active[npc] = true

		local deathConn, removeConn

		deathConn = humanoid.Died:Connect(function()
			self.Active[npc]   = nil
			self.NPCConns[npc] = nil
			deathConn:Disconnect()
			removeConn:Disconnect()
		end)

		removeConn = npc.AncestryChanged:Connect(function(_, parent)
			if not parent then
				self.Active[npc]   = nil
				self.NPCConns[npc] = nil
				removeConn:Disconnect()
				deathConn:Disconnect()
			end
		end)

		self.NPCConns[npc] = { deathConn, removeConn }
	end)
end

function EntityTracker:Init()
	for _, child in ipairs(self.Folder:GetChildren()) do
		self:Register(child)
	end
	local conn = self.Folder.ChildAdded:Connect(function(child)
		self:Register(child)
	end)
	table.insert(self.Connections, conn)
end

function EntityTracker:Destroy()
	for _, conn in ipairs(self.Connections) do
		conn:Disconnect()
	end
	self.Connections = {}

	for _, conns in pairs(self.NPCConns) do
		for _, c in ipairs(conns) do
			c:Disconnect()
		end
	end
	self.NPCConns = {}
	self.Active   = {}
end

function EntityTracker:IsAlive(queryName, isBossType, requiredCount)
	requiredCount = requiredCount or 5
	local currentCount = 0

	for npc in next, self.Active do
		if not (npc and npc.Parent) then
			self.Active[npc]   = nil
			self.NPCConns[npc] = nil
		end
	end

	for npc in next, self.Active do
		if isBossType then
			if npc.Name:find("^" .. queryName) then
				return true
			end
		else
			if npc.Name:find("^" .. queryName) then
				currentCount += 1
				if currentCount >= requiredCount then
					return true
				end
			end
		end
	end

	return false
end

-- ==========================================
-- || CLASS: Boss Spawner
-- ==========================================
local BossSpawner = {}
BossSpawner.__index = BossSpawner

function BossSpawner.new(tracker, remotes)
	return setmetatable({
		Tracker  = tracker,
		Remotes  = remotes,
		_running = false,
	}, BossSpawner)
end

function BossSpawner:Stop()
	self._running = false
end

function BossSpawner:Start()
	if self._running then return end
	self._running = true

	task.spawn(function()
		while self._running and task.wait(0.5) do
			local cfg = _G.FarmConfig

			-- ── Multi-select Standard Boss spawning ──────────────────────────
			-- Fluent multi-select returns a dict: { BossName = true, ... }
			-- We iterate with pairs() and only act on entries where value == true
			if cfg.Boss.AutoSpawn then
				local selected = cfg.Boss.Selected
				if type(selected) == "table" then
					for bName, enabled in pairs(selected) do
						if enabled == true and not self.Tracker:IsAlive(bName, true) then
							self.Remotes.SummonBoss:FireServer(bName .. "Boss", cfg.Boss.Difficulty)
							task.wait(0.3)
						end
					end
				end
			end

			-- ── Special Bosses ───────────────────────────────────────────────
			local specs = cfg.Specials
			if specs.TrueAizen.Auto and not self.Tracker:IsAlive("TrueAizen", true) then
				self.Remotes.TrueAizen:FireServer(specs.TrueAizen.Diff)
			end
			if specs.Sukuna.Auto and not self.Tracker:IsAlive("StrongestinHistory", true) then
				self.Remotes.SpawnStrongest:FireServer("StrongestHistory", specs.Sukuna.Diff)
			end
			if specs.Gojo.Auto and not self.Tracker:IsAlive("StrongestofToday", true) then
				self.Remotes.SpawnStrongest:FireServer("StrongestToday", specs.Gojo.Diff)
			end
			if specs.Rimuru.Auto and not self.Tracker:IsAlive("Rimuru", true) then
				self.Remotes.Rimuru:FireServer(specs.Rimuru.Diff)
			end
			if specs.Anos.Auto and not self.Tracker:IsAlive("Anos", true) then
				self.Remotes.Anos:FireServer("Anos", specs.Anos.Diff)
			end
			if specs.Atomic.Auto and not self.Tracker:IsAlive("Atomic", true) then
				self.Remotes.Atomic:FireServer(specs.Atomic.Diff)
			end
		end
	end)
end

-- ==========================================
-- || CLASS: Farmer
-- ==========================================
local Farmer = {}
Farmer.__index = Farmer

function Farmer.new(tracker, tpRemote, abilityRemote, obsHakiRemote, hakiRemote)
	return setmetatable({
		Tracker            = tracker,
		TpRemote           = tpRemote,
		AbilityRemote      = abilityRemote,
		ObsHakiRemote      = obsHakiRemote,
		HakiRemote         = hakiRemote,
		LastSkillTime      = 0,
		LastEquipTime_NPC  = 0,
		LastEquipTime_Boss = 0,
		LastArmamentToggle = 0,
		LastObsToggle      = 0,
		_running           = false,
	}, Farmer)
end

function Farmer:Stop()
	self._running = false
end

function Farmer:EquipWeapon(isBoss)
	local cfg = _G.FarmConfig
	if not cfg.AutoEquip then return end

	local now = tick()
	if isBoss then
		if now - self.LastEquipTime_Boss < 1 then return end
		self.LastEquipTime_Boss = now
	else
		if now - self.LastEquipTime_NPC < 1 then return end
		self.LastEquipTime_NPC = now
	end

	local weaponName = isBoss and cfg.SelectedWeapon_Boss or cfg.SelectedWeapon_NPC
	local dropdownId = isBoss and "Dropdown_WeaponBoss" or "Dropdown_WeaponNPC"

	local char = LocalPlayer.Character
	if not char then return end

	local hum     = char:FindFirstChild("Humanoid")
	local backpack = LocalPlayer:FindFirstChild("Backpack")
	if not hum or hum.Health <= 0 or not backpack then return end

	if weaponName == "None" or weaponName == "" then
		local equippedTool = char:FindFirstChildOfClass("Tool")
		if equippedTool then
			if isBoss then cfg.SelectedWeapon_Boss = equippedTool.Name
			else            cfg.SelectedWeapon_NPC  = equippedTool.Name end
			pcall(function() Fluent.Options[dropdownId]:SetValue(equippedTool.Name) end)
			return
		end

		local firstTool = backpack:FindFirstChildOfClass("Tool")
		if not firstTool then return end
		hum:EquipTool(firstTool)

		if isBoss then cfg.SelectedWeapon_Boss = firstTool.Name
		else            cfg.SelectedWeapon_NPC  = firstTool.Name end
		pcall(function() Fluent.Options[dropdownId]:SetValue(firstTool.Name) end)
		return
	end

	if char:FindFirstChild(weaponName) then return end
	local tool = backpack:FindFirstChild(weaponName)
	if tool then hum:EquipTool(tool) end
end

function Farmer:CheckArmamentHaki()
	local cfg = _G.FarmConfig
	if not cfg.AutoHaki then return end

	local now = tick()
	if now - self.LastArmamentToggle < 3 then return end

	local char = LocalPlayer.Character
	if not char then return end

	local rightArm     = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
	local isHakiActive = rightArm and rightArm.BrickColor == CONSTANTS.HakiBlack

	if not isHakiActive then
		self.LastArmamentToggle = now
		pcall(function() self.HakiRemote:FireServer("Toggle") end)
	end
end

function Farmer:CheckObservationHaki()
	local cfg = _G.FarmConfig
	if not cfg.AutoObservationHaki then return end
	if tick() - self.LastObsToggle < 3 then return end

	local playerGui  = LocalPlayer:FindFirstChild("PlayerGui")
	local dodgeUI    = playerGui and playerGui:FindFirstChild("DodgeCounterUI")
	local isVisible  = dodgeUI
		and dodgeUI:FindFirstChild("MainFrame")
		and dodgeUI.MainFrame.Visible

	local cdUI       = playerGui and playerGui:FindFirstChild("CooldownUI")
	local onCooldown = cdUI
		and cdUI:FindFirstChild("MainFrame")
		and cdUI.MainFrame:FindFirstChild("Cooldown_ObsHaki_Observation") ~= nil

	if not isVisible and not onCooldown then
		self.LastObsToggle = tick()
		pcall(function() self.ObsHakiRemote:FireServer("Toggle") end)
	end
end

function Farmer:CastSkills(isBoss)
	local cfg = _G.FarmConfig
	local shouldCast = isBoss and cfg.AutoSkill.Bosses or (not isBoss and cfg.AutoSkill.NPCs)
	if not shouldCast then return end

	if tick() - self.LastSkillTime <= 0.3 then return end
	self.LastSkillTime = tick()

	local activeSkills = isBoss and cfg.AutoSkill.BossSkills or cfg.AutoSkill.NPCSkills
	for skillName, isEnabled in pairs(activeSkills) do
		if isEnabled then
			local skillId = cfg.AutoSkill.SkillIds[skillName]
			if skillId then
				pcall(function() self.AbilityRemote:FireServer(skillId) end)
			end
		end
	end
end

function Farmer:Start()
	if self._running then return end
	self._running = true

	task.spawn(function()
		while self._running and task.wait(0.1) do
			local cfg = _G.FarmConfig
			if not cfg.LoopFarm then self.CurrentTarget = nil continue end
			if game.PlaceId ~= 77747658251236 then self.CurrentTarget = nil continue end

			self:CheckObservationHaki()
			self:CheckArmamentHaki()
			self:EquipWeapon(false)

			local char = LocalPlayer.Character
			local hrp  = char and char:FindFirstChild("HumanoidRootPart")
			if not hrp then continue end

			self.CurrentTarget = nil  -- reset so UI shows 🟡 scanning between cycles
			for _, target in ipairs(CONSTANTS.FarmOrder) do
				if not self._running or not cfg.LoopFarm then break end
				if cfg.IgnoredEntities[target.Name] then continue end

				local requiredToStart = target.IsBossType and 1 or cfg.NPCAttackThreshold
				if not self.Tracker:IsAlive(target.Name, target.IsBossType, requiredToStart) then
					continue
				end

				local spawnCF = CONSTANTS.Locations[target.Name]
				if not spawnCF then continue end
				
				self.CurrentTarget = target.Name

				-- ── BOSS LOOP ──────────────────────────────────────────────────
				if target.IsBossType then
					if target.Remote then
						self.TpRemote:FireServer(target.Remote)
						task.wait()
					end

					while
						self._running
						and cfg.LoopFarm
						and not cfg.IgnoredEntities[target.Name]
						and self.Tracker:IsAlive(target.Name, true)
					do
						cfg = _G.FarmConfig

						self:CheckObservationHaki()
						self:CheckArmamentHaki()
						self:EquipWeapon(true)
						self:CastSkills(true)

						local curChar = LocalPlayer.Character
						local curHrp  = curChar and curChar:FindFirstChild("HumanoidRootPart")
						if not curHrp then task.wait(1) continue end

						local liveBoss = nil
						for npc in next, self.Tracker.Active do
							if npc.Name:find("^" .. target.Name) and npc:FindFirstChild("HumanoidRootPart") then
								liveBoss = npc.HumanoidRootPart
								break
							end
						end

						local targetGoal = liveBoss and liveBoss.CFrame or spawnCF
						local lookAtPos  = targetGoal.Position
						local distance   = (curHrp.Position - lookAtPos).Magnitude

						if distance > 20 then
							if distance > 150 and target.Remote then
								self.TpRemote:FireServer(target.Remote)
								task.wait(0.5)
							end
							curHrp.CFrame = CFrame.lookAt(
								targetGoal.Position + Vector3.new(0, 0, 3),
								lookAtPos
							)
						else
							curHrp.CFrame = CFrame.lookAt(curHrp.Position, lookAtPos)
						end

						task.wait(cfg.TpTime)
					end
					self.CurrentTarget = nil  -- boss died, back to scanning

				-- ── NPC LOOP ───────────────────────────────────────────────────
				else
					if target.Remote then
						self.TpRemote:FireServer(target.Remote)
						task.wait()
					end

					while
						self._running
						and cfg.LoopFarm
						and not cfg.IgnoredEntities[target.Name]
						and self.Tracker:IsAlive(target.Name, false, 1)
					do
						cfg = _G.FarmConfig

						local curChar = LocalPlayer.Character
						local curHrp  = curChar and curChar:FindFirstChild("HumanoidRootPart")
						if not curHrp then task.wait(1) continue end

						self:CheckObservationHaki()
						self:CheckArmamentHaki()
						self:EquipWeapon(false)
						self:CastSkills(false)

						local distance = (curHrp.Position - spawnCF.Position).Magnitude
						if distance > 10 then
							curHrp.CFrame = spawnCF
						end

						task.wait(cfg.TpTime)
					end
					self.CurrentTarget = nil  -- npcs cleared, back to scanning
				end
			end
		end
	end)
end

-- ==========================================
-- || CLASS: Dungeon Farmer
-- ==========================================
local DungeonFarmer = {}
DungeonFarmer.__index = DungeonFarmer

function DungeonFarmer.new()
	return setmetatable({ _running = false }, DungeonFarmer)
end

function DungeonFarmer:Stop()
	self._running = false
end

-- Adds BodyMovers to make the character feel "anchored" in the air without actually anchoring them
function DungeonFarmer:_stabilize(hrp, goalCF)
	local bv = hrp:FindFirstChild("DungeonStabilizer_BV")
	if not bv then
		bv = Instance.new("BodyVelocity")
		bv.Name = "DungeonStabilizer_BV"
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Parent = hrp
	end
	bv.Velocity = Vector3.new(0, 0, 0)
	
	local bg = hrp:FindFirstChild("DungeonStabilizer_BG")
	if not bg then
		bg = Instance.new("BodyGyro")
		bg.Name = "DungeonStabilizer_BG"
		bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		bg.P = 3000
		bg.D = 500
		bg.Parent = hrp
	end
	bg.CFrame = goalCF
end

function DungeonFarmer:_destabilize(hrp)
	local bv = hrp:FindFirstChild("DungeonStabilizer_BV")
	if bv then bv:Destroy() end
	local bg = hrp:FindFirstChild("DungeonStabilizer_BG")
	if bg then bg:Destroy() end
end

-- Returns a goal CFrame next to the NPC's HumanoidRootPart
function DungeonFarmer:_getGoal(npcHRP, position)
	local pos = npcHRP.Position
	local cf  = npcHRP.CFrame
	local dist = _G.FarmConfig.DungeonFarm.Distance or 5
	
	if position == "Top" then
		return CFrame.new(pos + Vector3.new(0, dist, 0), pos)
	else -- Behind
		return cf * CFrame.new(0, 2, dist)
	end
end

function DungeonFarmer:Start()
	if self._running then return end
	self._running = true

	task.spawn(function()
		while self._running do
			task.wait(0.05)
			local cfg = _G.FarmConfig
			if not cfg.DungeonFarm.Enabled then self.CurrentTarget = nil task.wait(0.5) continue end
			if game.PlaceId == 77747658251236 then self.CurrentTarget = nil task.wait(1) continue end

			local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
			if playerGui and playerGui:FindFirstChild("DungeonUI") then
				local dungeonUI = playerGui.DungeonUI
				
				if cfg.DungeonFarm.AutoReplay then
					local replayFrame = dungeonUI:FindFirstChild("ReplayDungeonFrameVisibleOnlyWhenClearingDungeon")
					if replayFrame and replayFrame.Visible then
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DungeonWaveReplayVote"):FireServer("sponsor")
							game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DungeonWaveVote"):FireServer("start")
						end)
						task.wait(1)
					end
				end
				
				if cfg.DungeonFarm.AutoVote then
					local contentFrame = dungeonUI:FindFirstChild("ContentFrame")
					if contentFrame then
						local actions = contentFrame:FindFirstChild("Actions")
						if actions then
							local diffFrame = actions:FindFirstChild(cfg.DungeonFarm.VoteDiff .. "DifficultyFrame")
							if diffFrame and diffFrame.Visible then
								pcall(function()
									game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DungeonWaveVote"):FireServer(cfg.DungeonFarm.VoteDiff)
								end)
								task.wait(1)
							end
						end
					end
				end
			end

			local char = LocalPlayer.Character
			local hrp  = char and char:FindFirstChild("HumanoidRootPart")
			if not hrp then task.wait(1) continue end

			local npcsFolder = workspace:FindFirstChild("NPCs")
			if not npcsFolder then task.wait(1) continue end

			local targets = npcsFolder:GetChildren()
			if #targets == 0 then task.wait(0.5) continue end

			for _, model in ipairs(targets) do
				if not self._running or not cfg.DungeonFarm.Enabled then break end

				local hum    = model:FindFirstChildOfClass("Humanoid")
				local npcHRP = model:FindFirstChild("HumanoidRootPart")
				if not hum or not npcHRP then continue end
				if hum.Health <= 0 then continue end
				
				self.CurrentTarget = model.Name

				local isBoss = model.Name:find("Boss") ~= nil
				local speed  = cfg.DungeonFarm.TweenSpeed
				local pos    = cfg.DungeonFarm.FarmPosition

				if isBoss then
					-- Stay on boss until it dies
					while self._running and cfg.DungeonFarm.Enabled do
						cfg = _G.FarmConfig
						speed = cfg.DungeonFarm.TweenSpeed
						pos   = cfg.DungeonFarm.FarmPosition

						if _G.ArcX_Farmer then
							_G.ArcX_Farmer:CheckObservationHaki()
							_G.ArcX_Farmer:CheckArmamentHaki()
							_G.ArcX_Farmer:EquipWeapon(true)
							_G.ArcX_Farmer:CastSkills(true)
						end

						local curChar = LocalPlayer.Character
						local curHrp  = curChar and curChar:FindFirstChild("HumanoidRootPart")
						if not curHrp then task.wait(1) break end

						local liveHum = model:FindFirstChildOfClass("Humanoid")
						if not model.Parent or not liveHum or liveHum.Health <= 0 then break end

						local liveHRP = model:FindFirstChild("HumanoidRootPart")
						if not liveHRP then break end

						local goal = self:_getGoal(liveHRP, pos)
						self:_stabilize(curHrp, goal)
						curHrp.CFrame = goal
						task.wait(speed)
					end
				else
					-- Fast single-pass TP, don't care if it dies
					local curChar = LocalPlayer.Character
					local curHrp  = curChar and curChar:FindFirstChild("HumanoidRootPart")
					if not curHrp then continue end
					
					if _G.ArcX_Farmer then
						_G.ArcX_Farmer:CheckObservationHaki()
						_G.ArcX_Farmer:CheckArmamentHaki()
						_G.ArcX_Farmer:EquipWeapon(false)
						_G.ArcX_Farmer:CastSkills(false)
					end
					
					local goal = self:_getGoal(npcHRP, pos)
					self:_stabilize(curHrp, goal)
					curHrp.CFrame = goal
					task.wait(speed)
				end
				
				-- Destabilize when moving to next target
				local curChar = LocalPlayer.Character
				local curHrp  = curChar and curChar:FindFirstChild("HumanoidRootPart")
				if curHrp then self:_destabilize(curHrp) end
			end
		end
	end)
end

-- ==========================================
-- || AUTO MAKE DUNGEON
-- ==========================================
local _autoMakeDungeonRunning = false

local function StartAutoMakeDungeon()
	if _autoMakeDungeonRunning then return end
	_autoMakeDungeonRunning = true

	task.spawn(function()
		while _autoMakeDungeonRunning do
			task.wait(3)
			local cfg = _G.FarmConfig
			if not cfg.DungeonFarm.AutoMake then continue end
			if game.PlaceId ~= 77747658251236 then continue end

			pcall(function()
				game:GetService("ReplicatedStorage")
					:WaitForChild("Remotes")
					:WaitForChild("RequestDungeonPortal")
					:FireServer(cfg.DungeonFarm.DungeonType)
			end)
		end
	end)
end

-- ==========================================
-- || AUTO JOIN DUNGEON
-- ==========================================
local _autoJoinDungeonRunning = false

local function StartAutoJoinDungeon()
	if _autoJoinDungeonRunning then return end
	_autoJoinDungeonRunning = true

	task.spawn(function()
		while _autoJoinDungeonRunning do
			task.wait(2)
			local cfg = _G.FarmConfig
			if not cfg.DungeonFarm.AutoJoin then continue end
			if game.PlaceId ~= 77747658251236 then continue end

			-- Skip if executor is Xeno
			local isXeno = false
			pcall(function()
				local name = identifyexecutor()
				if type(name) == "string" and name == "Xeno" then
					isXeno = true
				end
			end)
			if isXeno then continue end

			-- Check if ActiveDungeonPortal exists
			local portal = workspace:FindFirstChild("ActiveDungeonPortal")
			if not portal then continue end

			local joinPrompt = portal:FindFirstChild("JoinPrompt")
			if not joinPrompt then continue end

			-- Teleport to dungeon portal location
			local char = LocalPlayer.Character
			local hrp  = char and char:FindFirstChild("HumanoidRootPart")
			if not hrp then continue end

			hrp.CFrame = CFrame.new(1434, 2, -933)
			task.wait(0.5)

			-- Fire the proximity prompt
			pcall(function()
				fireproximityprompt(joinPrompt)
			end)

			hrp.CFrame = CFrame.new(1349, 1, -1473)

			-- Fire the proximity prompt
			pcall(function()
				fireproximityprompt(joinPrompt)
			end)
			task.wait(3)
		end
	end)
end

-- ==========================================
-- || CLASS: Utility / Character Manager
-- ==========================================
local Utility = {}

local _utilityConnections = {}

function Utility.EnableAntiAFK()
	local VirtualUser = game:GetService("VirtualUser")
	local conn = LocalPlayer.Idled:Connect(function()
		VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)
	table.insert(_utilityConnections, conn)
end

function Utility.EnableAutoRejoin()
	local TeleportService = game:GetService("TeleportService")
	local GuiService      = game:GetService("GuiService")

	local conn = GuiService.ErrorMessageChanged:Connect(function()
		local cfg = _G.FarmConfig
		if not cfg.AutoRejoin then return end

		local lastError = GuiService:GetErrorMessage()
		if lastError:find("ArcX Security") then
			warn("Auto-Rejoin blocked: Security Kick.")
			return
		end

		task.spawn(function()
			while task.wait(5) do
				if pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end) then
					break
				end
				task.wait(10)
			end
		end)
	end)

	table.insert(_utilityConnections, conn)
end

-- ── Timed rejoin ──────────────────────────────────────────────────────────────
local _timedRejoinRunning = false

function Utility.EnableTimedRejoin()
	_timedRejoinRunning = false
	task.wait()
	_timedRejoinRunning = true

	local TeleportService = game:GetService("TeleportService")

	task.spawn(function()
		local elapsed = 0
		while _timedRejoinRunning and task.wait(1) do
			local cfg = _G.FarmConfig

			if not cfg.TimedRejoin then
				elapsed = 0
				continue
			end

			elapsed += 1
			local target = (cfg.RejoinDelay or 10) * 60
			if elapsed > target then elapsed = target end

			if elapsed >= target then
				elapsed = 0

				pcall(function()
					Fluent:Notify({
						Title    = "ArcX Timed Rejoin",
						Content  = "Rejoining now (" .. (cfg.RejoinDelay or 10) .. " min timer)...",
						Duration = 5,
					})
				end)
				task.wait(5)

				for _ = 1, 10 do
					if pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end) then
						break
					end
					task.wait(10)
				end
			end
		end
	end)
end

function Utility.EnableFriendCheck()
	local function checkAndKick(player)
		if not _G.FarmConfig.FriendOnly or player == LocalPlayer then return end

		local isFriend = false
		local ok, result = pcall(function() return LocalPlayer:IsFriendsWith(player.UserId) end)
		if ok then isFriend = result end

		if not isFriend then
			LocalPlayer:Kick(
				"\n[ArcX Security]\nStranger Detected: " .. player.Name
				.. "\nAuto-Rejoin disabled to prevent looping."
			)
		end
	end

	for _, player in ipairs(Players:GetPlayers()) do
		checkAndKick(player)
	end

	local conn = Players.PlayerAdded:Connect(checkAndKick)
	table.insert(_utilityConnections, conn)
end

function Utility.SetupCharacterEvents(hakiRemote, obsHakiRemote)
	local function onCharacterAdded(char)
		char:WaitForChild("HumanoidRootPart", 5)
		task.wait(1)
		local cfg = _G.FarmConfig

		if cfg.AutoHaki then
			pcall(function() hakiRemote:FireServer("Toggle") end)
		end

		if cfg.AutoObservationHaki then
			local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
			if playerGui then
				local cdUI    = playerGui:FindFirstChild("CooldownUI")
				local hasCD   = cdUI
					and cdUI:FindFirstChild("MainFrame")
					and cdUI.MainFrame:FindFirstChild("Cooldown_ObsHaki_Observation") ~= nil

				local dodgeUI   = playerGui:FindFirstChild("DodgeCounterUI")
				local isVisible = dodgeUI
					and dodgeUI:FindFirstChild("MainFrame")
					and dodgeUI.MainFrame.Visible

				if not hasCD and not isVisible then
					pcall(function() obsHakiRemote:FireServer("Toggle") end)
				end
			end
		end
	end

	local conn = LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
	table.insert(_utilityConnections, conn)

	if LocalPlayer.Character then
		task.spawn(onCharacterAdded, LocalPlayer.Character)
	end
end

function Utility.Cleanup()
	_timedRejoinRunning = false

	for _, conn in ipairs(_utilityConnections) do
		conn:Disconnect()
	end
	_utilityConnections = {}
end

function Utility.GetWeapons()
	local weapons = {}
	local char = LocalPlayer.Character
	if char then
		for _, v in ipairs(char:GetChildren()) do
			if v:IsA("Tool") then table.insert(weapons, v.Name) end
		end
	end
	for _, v in ipairs(LocalPlayer.Backpack:GetChildren()) do
		if v:IsA("Tool") then table.insert(weapons, v.Name) end
	end
	return #weapons > 0 and weapons or { "None" }
end

-- ==========================================
-- || CODE REDEEMER
-- ==========================================
local _codeRedeemDone = false

local function RedeemCodes()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local ok, CodesConfig = pcall(function()
		return require(ReplicatedStorage:WaitForChild("CodesConfig", 5))
	end)

	if not ok or not CodesConfig then
		warn("[ArcX] Code Redeemer: CodesConfig module not found.")
		return
	end

	local CodeRedeem = ReplicatedStorage
		:WaitForChild("RemoteEvents", 5)
		:FindFirstChild("CodeRedeem")

	if not CodeRedeem then
		warn("[ArcX] Code Redeemer: CodeRedeem remote not found.")
		return
	end

	print("[ArcX] Starting code auto-redeem...")

	for codeName, _ in pairs(CodesConfig.Codes) do
		if CodesConfig.IsValid(codeName) then
			print("[ArcX] Redeeming: " .. codeName)

			local success, serverResponse = pcall(function()
				return CodeRedeem:InvokeServer(codeName)
			end)

			if success then
				print("[ArcX] Response for " .. codeName .. ":", serverResponse)
			else
				warn("[ArcX] Error redeeming " .. codeName .. ":", serverResponse)
			end

			task.wait(0.5)
		end
	end

	print("[ArcX] Code auto-redeem finished.")
end

-- ==========================================
-- || QUEST MANAGER
-- ==========================================
local QuestManager = {}
QuestManager.__index = QuestManager

function QuestManager.new()
	return setmetatable({ _remote = nil }, QuestManager)
end

function QuestManager.GetQuestNPCs()
	local found = {}
	local serviceNPCs = workspace:FindFirstChild("ServiceNPCs")
	if not serviceNPCs then return { "None" } end

	for _, child in ipairs(serviceNPCs:GetChildren()) do
		if child.Name:match("^QuestNPC") then
			table.insert(found, child.Name)
		end
	end

	table.sort(found, function(a, b)
		local na = tonumber(a:match("%d+$")) or 0
		local nb = tonumber(b:match("%d+$")) or 0
		return na < nb
	end)

	return #found > 0 and found or { "None" }
end

function QuestManager:AcceptOnce(npcName)
	if not npcName or npcName == "None" or npcName == "" then
		warn("[ArcX] AcceptOnce: No Quest NPC selected.")
		return false
	end

	if not self._remote then
		local re = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents")
		self._remote = re and re:FindFirstChild("QuestAccept")
	end

	if not self._remote then
		warn("[ArcX] QuestAccept remote not found.")
		return false
	end

	local ok, err = pcall(function()
		self._remote:FireServer(npcName)
	end)

	if ok then
		print("[ArcX] Quest accepted from " .. npcName)
		return true
	else
		warn("[ArcX] Quest accept failed:", err)
		return false
	end
end

-- ==========================================
-- || CLEANUP PREVIOUS INSTANCES
-- ==========================================
if _G.ArcX_Spawner       then _G.ArcX_Spawner:Stop()             end
if _G.ArcX_Farmer        then _G.ArcX_Farmer:Stop()              end
if _G.ArcX_DungeonFarmer then _G.ArcX_DungeonFarmer:Stop()       end
if _G.ArcX_Tracker       then _G.ArcX_Tracker:Destroy()          end
Utility.Cleanup()

if _G.ArcX_Window then
	pcall(function() _G.ArcX_Window:Destroy() end)
	_G.ArcX_Window = nil
end

-- ==========================================
-- || REMOTE SETUP
-- ==========================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes           = ReplicatedStorage:WaitForChild("Remotes")
local RemoteEvents      = ReplicatedStorage:WaitForChild("RemoteEvents")
local AbilityRemote     = ReplicatedStorage
	:WaitForChild("AbilitySystem")
	:WaitForChild("Remotes")
	:WaitForChild("RequestAbility")

local GameRemotes = {
	Teleport        = Remotes:WaitForChild("TeleportToPortal"),
	SummonBoss      = Remotes:WaitForChild("RequestSummonBoss"),
	SpawnStrongest  = Remotes:WaitForChild("RequestSpawnStrongestBoss"),
	Anos            = Remotes:WaitForChild("RequestSpawnAnosBoss"),
	TrueAizen       = RemoteEvents:WaitForChild("RequestSpawnTrueAizen"),
	Rimuru          = RemoteEvents:WaitForChild("RequestSpawnRimuru"),
	Atomic          = RemoteEvents:WaitForChild("RequestSpawnAtomic"),
	Haki            = RemoteEvents:WaitForChild("HakiRemote"),
	ObservationHaki = RemoteEvents:WaitForChild("ObservationHakiRemote"),
}

local Tracker   = EntityTracker.new(workspace:WaitForChild("NPCs"))
local Spawner   = BossSpawner.new(Tracker, GameRemotes)
local AutoFarm  = Farmer.new(
	Tracker,
	GameRemotes.Teleport,
	AbilityRemote,
	GameRemotes.ObservationHaki,
	GameRemotes.Haki
)
local AutoQuest     = QuestManager.new()
local DungeonFarm   = DungeonFarmer.new()

_G.ArcX_Tracker       = Tracker
_G.ArcX_Spawner       = Spawner
_G.ArcX_Farmer        = AutoFarm
_G.ArcX_DungeonFarmer = DungeonFarm

Utility.EnableAntiAFK()
Utility.EnableAutoRejoin()
Utility.EnableTimedRejoin()
Utility.EnableFriendCheck()
Utility.SetupCharacterEvents(GameRemotes.Haki, GameRemotes.ObservationHaki)

print("ArcX AutoFarm Initialized Successfully.")

local _lastWebhookTime = 0
local function SendWebhook(title, description, color)
	local url = Config.Webhook.URL
	if not Config.Webhook.Enabled or not url or url == "" then return end
	if tick() - _lastWebhookTime < 3 then return end
	_lastWebhookTime = tick()

	local data = {
		content = "",
		embeds = {{
			title = title,
			description = description,
			color = color or 5814783,
			footer = { text = "ArcX Notifier | " .. os.date("%X") }
		}}
	}
	
	local req = (request or http_request or (syn and syn.request))
	if req then
		pcall(function()
			req({
				Url = url,
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json" },
				Body = game:GetService("HttpService"):JSONEncode(data)
			})
		end)
	end
end

-- ==========================================
-- || UI INTEGRATION (DIEVER HUB)
-- ==========================================
_G.ArcX_UI_RunID = (_G.ArcX_UI_RunID or 0) + 1
local currentRunID = _G.ArcX_UI_RunID

local DIEVERHUB = "https://raw.githubusercontent.com/lnaa323sda/scki343/refs/heads/main/memoryTAKE.lua"
local Hub = loadstring(game:HttpGet(DIEVERHUB))()

local Win = Hub:CreateWindow({
	Title = "Sailor Piece ⛵",
	SubTitle = "| ArcX",
	MiniText = "ArcX",
	Logo = "rbxassetid://70511817915018",
	Center = true,
	MinSize = Vector2.new(360, 260),
	MaxSize = Vector2.new(1400, 900),
	ToggleKey = Enum.KeyCode.LeftControl,
})

Win:Notify("ArcX", "All systems online. Refresh weapons!", 3, "rbxassetid://70511817915018")

local TabMain = Win:Tab("Main")
local TabMobs = Win:Tab("Entities")
local TabBosses = Win:Tab("Standard Bosses")
local TabSpecials = Win:Tab("Special Bosses")
local TabDungeon = Win:Tab("Dungeon")
local TabCrafting = Win:Tab("Crafting")
local TabMisc = Win:Tab("Misc")
local TabSettings = Win:Tab("Settings")

-- Start loops AFTER UI initialization
Spawner:Start()
AutoFarm:Start()
DungeonFarm:Start()
StartAutoMakeDungeon()
StartAutoJoinDungeon()

-- ==========================================
-- MAIN TAB 
-- ==========================================
do
	local S = TabMain:Section("Live Status & Farm Control")
	S:Toggle("Enable Auto Farm", Config.LoopFarm, function(v) Config.LoopFarm = v end)
	S:Slider("Teleport Delay", 0, 10, Config.TpTime * 10, function(v) Config.TpTime = v / 10 end)

	local S2 = TabMain:Section("Haki Buffs")
	S2:Toggle("Auto Armament Haki", Config.AutoHaki, function(v) Config.AutoHaki = v end)
	S2:Toggle("Auto Observation Haki", Config.AutoObservationHaki, function(v) Config.AutoObservationHaki = v end)

	local S3 = TabMain:Section("Weapon Management")
	S3:Toggle("Auto Equip Weapon", Config.AutoEquip, function(v) Config.AutoEquip = v end)
	
	local weps = Utility.GetWeapons()
	if #weps == 0 then weps = {"None"} end
	S3:Dropdown("NPC Weapon", weps, Config.SelectedWeapon_NPC, function(v) Config.SelectedWeapon_NPC = v end)
	S3:Dropdown("Boss Weapon", weps, Config.SelectedWeapon_Boss, function(v) Config.SelectedWeapon_Boss = v end)
	
	S3:Button("Refresh Weapon List", function()
		Win:Notify("ArcX", "Reload script to properly refresh lists in Diever UI", 3, "rbxassetid://70511817915018")
	end)

	local S4 = TabMain:Section("Auto Skills")
	S4:Toggle("Use Skills on Bosses", Config.AutoSkill.Bosses, function(v) Config.AutoSkill.Bosses = v end)
	S4:Toggle("Use Skills on NPCs", Config.AutoSkill.NPCs, function(v) Config.AutoSkill.NPCs = v end)
end

-- ==========================================
-- MOBS TAB
-- ==========================================
do
	local S = TabMobs:Section("Attack Threshold")
	S:Slider("Min NPC Count", 1, 5, Config.NPCAttackThreshold, function(v) Config.NPCAttackThreshold = v end)

	local EntityCategories = {
		{ Name = "Regular NPCs", List = { "ArenaFighter", "Ninja", "Hollow", "Quincy", "Swordsman", "AcademyTeacher", "Slime", "StrongSorcerer", "Curse", "Sorcerer" } },
		{ Name = "Timed Bosses", List = { "Gojo", "Yuji", "Sukuna", "Jinwoo", "Alucard", "Aizen", "Yamato", "StrongestShinobi" } },
		{ Name = "Summon Bosses", List = { "Saber", "Ichigo", "QinShi", "Gilgamesh", "BlessedMaiden", "SaberAlter", "StrongestinHistory", "StrongestofToday", "Rimuru", "Anos", "TrueAizen", "Atomic" } },
	}

	for _, category in ipairs(EntityCategories) do
		local Scat = TabMobs:Section(category.Name)
		for _, entityName in ipairs(category.List) do
			Scat:Toggle("Farm " .. entityName, not Config.IgnoredEntities[entityName], function(v)
				Config.IgnoredEntities[entityName] = not v
			end)
		end
	end
end

-- ==========================================
-- BOSSES TAB
-- ==========================================
do
	local S = TabBosses:Section("Spawn Settings")
	S:Toggle("Auto-Spawn Bosses", Config.Boss.AutoSpawn, function(v) Config.Boss.AutoSpawn = v end)
	S:Dropdown("Difficulty", { "Normal", "Medium", "Hard", "Extreme" }, Config.Boss.Difficulty, function(v) Config.Boss.Difficulty = v end)
end

-- ==========================================
-- SPECIALS TAB
-- ==========================================
do
	local specialOrder = { "Atomic", "TrueAizen", "Sukuna", "Gojo", "Rimuru", "Anos" }
	for _, bossName in ipairs(specialOrder) do
		local bossData = Config.Specials[bossName]
		if bossData then
			local Scat = TabSpecials:Section(bossName)
			Scat:Toggle("Auto Spawn " .. bossName, bossData.Auto, function(v) Config.Specials[bossName].Auto = v end)
			Scat:Dropdown("Difficulty", { "Normal", "Medium", "Hard", "Extreme" }, bossData.Diff, function(v) Config.Specials[bossName].Diff = v end)
		end
	end
end

-- ==========================================
-- DUNGEON TAB
-- ==========================================
do
	local S = TabDungeon:Section("Farm Settings")
	S:Toggle("Enable Dungeon Auto Farm", Config.DungeonFarm.Enabled, function(v) Config.DungeonFarm.Enabled = v end)
	S:Slider("TP Delay", 0, 20, Config.DungeonFarm.TweenSpeed * 10, function(v) Config.DungeonFarm.TweenSpeed = v / 10 end)

	local S2 = TabDungeon:Section("Position")
	S2:Dropdown("Farm Position", { "Top", "Behind" }, Config.DungeonFarm.FarmPosition, function(v) Config.DungeonFarm.FarmPosition = v end)
	S2:Slider("Distance (studs)", 0, 20, Config.DungeonFarm.Distance or 5, function(v) Config.DungeonFarm.Distance = v end)

	local S3 = TabDungeon:Section("Auto Run")
	S3:Toggle("Auto Replay", Config.DungeonFarm.AutoReplay, function(v) Config.DungeonFarm.AutoReplay = v end)
	S3:Toggle("Auto Vote Difficulty", Config.DungeonFarm.AutoVote, function(v) Config.DungeonFarm.AutoVote = v end)
	S3:Dropdown("Vote Difficulty", { "Easy", "Medium", "Hard", "Extreme" }, Config.DungeonFarm.VoteDiff, function(v) Config.DungeonFarm.VoteDiff = v end)

	local S4 = TabDungeon:Section("Dungeon Portal (Main Game)")
	S4:Toggle("Auto Make Dungeon", Config.DungeonFarm.AutoMake, function(v) Config.DungeonFarm.AutoMake = v end)
	S4:Dropdown("Dungeon Type", { "CidDungeon", "RuneDungeon", "DoubleDungeon", "InfiniteTower" }, Config.DungeonFarm.DungeonType, function(v) Config.DungeonFarm.DungeonType = v end)
	S4:Toggle("Auto Join Dungeon", Config.DungeonFarm.AutoJoin, function(v) Config.DungeonFarm.AutoJoin = v end)
end

-- ==========================================
-- CRAFTING TAB
-- ==========================================
do
	local S = TabCrafting:Section("Crafting Info")
	S:Label("Crafting Calculator Requires Inventory Info!")
	
	local craftingSetKeys = {}
	for k, _ in pairs(CONSTANTS.CraftingSets) do table.insert(craftingSetKeys, k) end
	local selectedSet = "StrongestinHistory"
	
	S:Dropdown("Select Set", craftingSetKeys, selectedSet, function(v) selectedSet = v end)
	S:Button("Check Amount", function()
		Win:Notify("ArcX", "Check your F9 console for full info.", 3, "rbxassetid://70511817915018")
	end)

	local S2 = TabCrafting:Section("Craft Items")
	local craftAmount = 1
	S2:Slider("Amount to Craft", 1, 100, 1, function(v) craftAmount = v end)

	S2:Button("Craft Slime Key", function()
		task.spawn(function()
			pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSlimeCraft"):InvokeServer("SlimeKey", craftAmount) end)
			Win:Notify("ArcX", "Crafted Slime Key", 3, "rbxassetid://70511817915018")
		end)
	end)
	S2:Button("Craft Divine Grail", function()
		task.spawn(function()
			pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestGrailCraft"):InvokeServer("DivineGrail", craftAmount) end)
			Win:Notify("ArcX", "Crafted Divine Grail", 3, "rbxassetid://70511817915018")
		end)
	end)

	local S3 = TabCrafting:Section("Auto Crafting")
	S3:Toggle("Auto Craft Slime Key", Config.AutoCraft.SlimeKey, function(v) Config.AutoCraft.SlimeKey = v end)
	S3:Toggle("Auto Craft Divine Grail", Config.AutoCraft.DivineGrail, function(v) Config.AutoCraft.DivineGrail = v end)
	
	task.spawn(function()
		while task.wait(5) do
			if _G.ArcX_UI_RunID ~= currentRunID then break end
			if Config.AutoCraft.SlimeKey then
				pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestSlimeCraft"):InvokeServer("SlimeKey", 1) end)
			end
			if Config.AutoCraft.DivineGrail then
				pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RequestGrailCraft"):InvokeServer("DivineGrail", 1) end)
			end
		end
	end)
end

-- ==========================================
-- MISC TAB
-- ==========================================
do
	local S = TabMisc:Section("Code Redeemer")
	S:Button("Redeem All Active Codes", function()
		task.spawn(RedeemCodes)
		Win:Notify("ArcX", "Scanning and redeeming active codes...", 3, "rbxassetid://70511817915018")
	end)

	local S2 = TabMisc:Section("Quest Manager")
	local questNPCList = QuestManager.GetQuestNPCs()
	Config.AutoQuest.SelectedNPC = questNPCList[1] or "None"
	
	if #questNPCList == 0 then questNPCList = {"None"} end
	S2:Dropdown("Quest NPC", questNPCList, questNPCList[1], function(v) Config.AutoQuest.SelectedNPC = v end)
	S2:Button("Accept Quest", function()
		task.spawn(function() AutoQuest:AcceptOnce(Config.AutoQuest.SelectedNPC) end)
	end)
end

-- ==========================================
-- SETTINGS TAB
-- ==========================================
do
	local S = TabSettings:Section("Performance")
	S:Toggle("WhiteScreen Mode", Config.WhiteScreen, function(v)
		Config.WhiteScreen = v
		pcall(function() game:GetService("RunService"):Set3dRenderingEnabled(not v) end)
	end)

	local S2 = TabSettings:Section("Webhook & Auto Rejoin")
	S2:Toggle("Enable Webhooks", Config.Webhook.Enabled, function(v) Config.Webhook.Enabled = v end)
	S2:Toggle("Auto Rejoin on Disconnect", Config.AutoRejoin, function(v) Config.AutoRejoin = v end)
	S2:Toggle("Timed Auto Rejoin", Config.TimedRejoin, function(v) Config.TimedRejoin = v end)
	S2:Slider("Rejoin Interval (min)", 1, 120, Config.RejoinDelay, function(v) Config.RejoinDelay = v end)

	local S3 = TabSettings:Section("Server Security")
	S3:Toggle("Friend-Only Mode", Config.FriendOnly, function(v)
		Config.FriendOnly = v
		if v then
			for _, player in ipairs(game.Players:GetPlayers()) do
				if player ~= LocalPlayer then
					local isFriend = false
					pcall(function() isFriend = LocalPlayer:IsFriendsWith(player.UserId) end)
					if not isFriend then
						LocalPlayer:Kick("[ArcX Security] Friend-Only Mode Enabled: Stranger found.")
					end
				end
			end
		end
	end)
end

-- Final Actions
if not _codeRedeemDone then
	_codeRedeemDone = true
	task.spawn(function()
		task.wait(2)
		RedeemCodes()
	end)
end

game:GetService("GuiService").ErrorMessageChanged:Connect(function(msg)
	if Config.Webhook.Enabled then
		SendWebhook("🔴 Disconnected", "Player **" .. LocalPlayer.Name .. "** disconnected.\nReason: " .. tostring(msg), 0xFF0000)
	end
end)
