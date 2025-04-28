getgenv().ConfigsKaitun = {
	["Safe Mode"] = false, -- Will be pass all anti cheat (but slow farm)

	["Berry Collect"] = false,
	["Melee"] = {
		["Death Step"] = true,
		["Electric Claw"] = true,
		["Dragon Talon"] = true,
		["Sharkman Karate"] = true,
		["Superhuman"] = true,
		["God Human"] = true,
	},

	["Sword"] = {
		-- : World 1
		["Saber"] = true,
		["Pole"] = false,
		-- : World 2
		["Midnight Blade"] = true,
		["Shisui"] = true,
		["Saddi"] = true,
		["Wando"] = true,
		["Rengoku"] = true,
		["True Triple Katana"] = true,
		-- : World 3
		["Yama"] = true,
		["Tushita"] = true,
		["Canvander"] = true,
		["Buddy Sword"] = true,
		["Twin Hooks"] = true,
		["Hallow Scythe"] = true,
		["Cursed Dual Katana"] = true,
	},

	["Gun"] = {
		-- : World 2
		["Kabucha"] = true,
		-- : World 3
		["Venom Bow"] = true,
		["Skull Guitar"] = true,
	},

	["Mastery"] = {
		["Melee"] = true,
		["Sword"] = true,
		["Devil Fruits"] = false,

		["Configs"] = {
			["Selected All Sword"] = false,
			["Select Sword"] = {
				"Saber",
				"Cursed Dual Katana",
				"Shark Anchor"
			},
		}
	},

	["Race"] = {
		["v2"] = true,
		["v3"] = true,
		["Locked"] = {
			["Mink"] = true,
			["Human"] = true,
			["Skypiea"] = true,
			["Fishman"] = true,
		},
	},

	["Fruit"] = {
		["Main Fruit"] = {""},
		["Sec Fruit"] = {""},
		["Safe Fruit"] = {
			"Dough-Dough",
			"Dragon-Dragon"
		},
		["Not Open Door Fruit"] = {
			"Dough-Dough",
			"Dragon-Dragon"
		}
	},

	["Quest"] = {
		["Sea3Hop"] = true,
		
		["Rainbow Haki"] = true,
		["Pull Lever"] = false,
		["Musketeer Hat"] = true,
		["Dough Mirror"] = true,
		["Shark Anchor"] = {
			["Enable"] = false,
			["Level"] = 2100, -- Level Should More Than This Will Do
			["MaxMoney"] = 25_000_000,
			["MinMoney"] = 22_000_000,
		},
	},

	["Currency"] = {
		["Lock Fragment"] = 30_000,
	},

	["Performance"] = {
		["White Screen"] = false,
		["Booster FPS"] = false,
		["Lock FPS"] = 240,
		["AFK Timeout"] = 150,
		
		["Add/Accept Friends"] = true,
		["Auto Chat"] = false,
	},
}
