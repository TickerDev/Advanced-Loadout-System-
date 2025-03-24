Config = {}

Config.Framework = {
    scriptName = 'qb-core' -- Framework script name work framework exports. (Example: qb-core)
}

Config.target = 'qb' --ox , qb

Config.job = "police"  -- The job required

Config.money = "free" -- "cash" or "bank" or "free"
    -- cash: the player needs to pay in cash to get the loadout
    -- bank: the player needs to pay from their bank account to get the loadout
    -- free: the player will receive the loadout for free

Config.loadout = {
    [1] = {
        roleID = "",
        loadoutName = "Cadet",
        Price = 10,
        items = {
            { itemname = "phone", amount = 1},
            { itemname = "radio", amount = 1},
            { itemname = "bandage", amount = 5},
            { itemname = "weapon_flashlight", amount = 1},
            { itemname = "weapon_stungun", amount = 1},
        }
    },
    [2] = {
        roleID = "", 
        loadoutName = "officer",
        Price = 20,
        items = {
            { itemname = "phone", amount = 1},
            { itemname = "weapon_microsmg", amount = 1},
            { itemname = "weapon_heavypistol", amount = 1},
            { itemname = "pistol_ammo", amount = 50},
            { itemname = "smg_ammo", amount = 100},
        }
    },
}


Config.Peds = {
    {peds = "s_m_m_security_01", coords = vector4(454.04568, -980.1397, 30.689584, 88.543785)},
}
