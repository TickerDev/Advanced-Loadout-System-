# Advanced-Loadout-System-
Echo Labs -  https://discord.gg/rUyXeRzbqm

Thank you for downloading the script and supporting us, please follow those steps before running the script:

1 - Edit the "config.lua" file
```lua
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
```

2 - Edit "server_config.lua" file
```lua
Discord = {
    DiscordServerID =  "", -- Your Discord Server ID

    DiscordBotToken = "", -- Your Discord Bot Token

    WebHook = "",  -- Your WebHook URL for logs

    Image = "", -- Your Server Image URL  (96px x 96px)

    color = 1432462
}
```
3. To add a new loadout
```lua
     -- To add a new loadout
    [3] = { -- Loadout number
        roleID = "", -- The role ID required
        loadoutName = "", -- Loadout name
        Price = 1000, -- The price of the loadout if Config.money is not set to "free"
        items = { -- Items included in the loadout
            { itemname = "itemname", amount = 1}, -- Item name and amount
            { itemname = "itemname", amount = 1}, -- Item name and amount
            { itemname = "itemname", amount = 1}, -- Item name and amount
            { itemname = "itemname", amount = 1}, -- Item name and amount
            { itemname = "itemname", amount = 1}, -- Item name and amount
            -- you can add more items if you want
        }
    },
```

Have fun :() Enjoy your new script ❤️
Echo Labs -  https://discord.gg/rUyXeRzbqm
