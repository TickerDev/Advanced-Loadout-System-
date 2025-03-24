local Core = exports[''..Config.Framework.scriptName]:GetCoreObject()

---- locals ----

---- functions ----
function CheckRole(DiscordID, source)
    PerformHttpRequest("https://discordapp.com/api/guilds/" .. Discord.DiscordServerID .. "/members/"..string.sub(DiscordID, 9), function(err, text, headers) 
        if err == 200 then
            local member = json.decode(text)
            local memberRoleNames, memberRoleNamesCounter = '', 0
            for k, v in ipairs(member.roles) do
                for _, roleData in pairs(Config.loadout) do
                    if v == roleData.roleID then
                        TriggerClientEvent("EL-Police-loadout:c:TakeMoney", source, {price = roleData.Price, items = roleData.items, loadoutName = roleData.loadoutName})
                        return
                    end
                end
            end
        else
            print("Failed to fetch Discord roles: " .. err)
        end
    end, "GET", "", {["Content-type"] = "application/json", ["Authorization"] = "Bot " .. Discord.DiscordBotToken})
end

function DiscordLog(message)
    local embed = {
    {
      ["color"] = Discord.color, 
      ["title"] = "Echo Labs Police loadout",
      ["description"] = message,
      ["url"] = "https://discord.gg/ydQFeNyuBK",
      ["footer"] = {
      ["text"] = "By Echo Labs",
      ["icon_url"] = Discord.Image,
      },
       ["thumbnail"] = {
       ["url"] = Discord.Image,
      },
    }
  }
    PerformHttpRequest(Discord.WebHook, function(err, text, headers) end, 'POST', json.encode({username = 'EL-Police-loadout', embeds = embed, avatar_url = Config.Image}), { ['Content-Type'] = 'application/json' })
end

---- Events ----
RegisterNetEvent("EL-Police-loadout:GetCurrentDiscordID")
AddEventHandler("EL-Police-loadout:GetCurrentDiscordID", function(source)
    local currentDiscordID
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            currentDiscordID = v
        end
    end
    CheckRole(currentDiscordID, source) 
end)

RegisterNetEvent("EL-Police-loadout:s:giveitems")
AddEventHandler("EL-Police-loadout:s:giveitems", function(items, amount)
    local Player = Core.Functions.GetPlayer(source)
    if Player ~= nil then
        for _, item in pairs(items) do
            Player.Functions.AddItem(item.itemname, item.amount)
        end
    end
end)

RegisterServerEvent('EL-Police-loadout:TakeMoney')
AddEventHandler('EL-Police-loadout:TakeMoney', function(data)
    local src = source
    local Player = Core.Functions.GetPlayer(src)
    local type = Config.money 

    if Player then
        if data and data.price then
            local success = false
            if type == "cash" then
                if Player.PlayerData.money.cash >= data.price then  
                    Player.Functions.RemoveMoney("cash", data.price)
                    success = true
                    if success then
                        Core.Functions.Notify( src, "You have successfully paid $" .. data.price, "success")
                    end
                else
                    Core.Functions.Notify( src, "You don't have enough money!", "error")
                end 
            elseif type == "bank" then
                if Player.PlayerData.money.bank >= data.price then  
                    Player.Functions.RemoveMoney("bank", data.price)
                    success = true
                    if success then
                        Core.Functions.Notify( src, "You have successfully paid $" .. data.price, "success")
                    end
                else
                    Core.Functions.Notify( src, "You don't have enough money!", "error")
                end
            elseif type == "free" then
                success = true
            else
                Core.Functions.Notify( src, "Invalid payment type!", "error")
            end

            if success then
                TriggerClientEvent("EL-Police-loadout:c:giveitem", src, data.items)
                Core.Functions.Notify( src, "You have received the loadout: " .. data.loadoutName, "success")
                TriggerClientEvent("EL-Police-loadout:SendDiscordLog:c", src, data.loadoutName)
            end
        else
            print("Invalid data or price is nil")
            Core.Functions.Notify( src, "An error occurred while processing the payment.", "error")
        end
    else
        print("Player not found for source: " .. src)
    end
end)

RegisterServerEvent("EL-Police-loadout:SendDiscordLog", function(loadoutName)
    local src = source
    local steamname = GetPlayerName(src)
    DiscordLog('**' .. steamname .. '** ID: **' .. src .. '** has taken **' .. loadoutName .. '** Loadout')
end)

---- commands ----
RegisterNetEvent("EL-Police-loadout:open", function()
    TriggerEvent("EL-Police-loadout:GetCurrentDiscordID", source)
end)

---- other stuff ----


AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print(resourceName.. ' loading 100% ')
  end)

  AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	print(resourceName..  ' loading 100% ')
  end)
