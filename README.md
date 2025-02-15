# Advanced-Loadout-System-
Echo Labs -  https://discord.gg/rUyXeRzbqm

Thank you for downloading the script and supporting us, please follow those steps before running the script:

1 - Edit the "config.lua" file
```lua
    Config.job = "" -- Your job name 

    Config.Discord = {
        DiscordServerID =  0000, -- Your Discord Server ID

        DiscordBotToken = "", -- Your Discord Bot Token

        WebHook = "", -- Your WebHook URL for logs

        Image = "" -- Your Server Image URL  
    }

    Config.money = "" -- "cash", "bank", or "free" 
    -- cash: the player needs to pay in cash to get the loadout
    -- bank: the player needs to pay from their bank account to get the loadout
    -- free: the player will receive the loadout for free
```

2 - To add a new loadout
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
