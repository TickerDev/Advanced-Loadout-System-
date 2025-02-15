
local Core = exports[''..Config.Framework.scriptName]:GetCoreObject()

---- functions ----
local peds = {}

function CreateNPC(type, model, anim, dict, pos)
    Citizen.CreateThread(function()
        local hash = GetHashKey(model)

        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Wait(1)
        end
        local ped = CreatePed(type, hash, pos.x, pos.y, pos.z - 1, pos.w, false, true)
        SetEntityHeading(ped, pos.w)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end)
end

for _, pedInfo in ipairs(Config.Peds) do
    CreateNPC(4, pedInfo.peds, "amb@code_human_police_investigate@idle_a", "idle_b", pedInfo.coords)
    table.insert(peds, pedInfo.peds)
end
---- Events ----

CreateThread(function()
    for _, pedInfo in ipairs(Config.Peds) do
        if Config.target == 'qb' then
            exports['qb-target']:AddTargetModel(pedInfo.peds, {
                options = {
                    {
                        type = 'server',
                        event = 'EL-Police-loadout:open',
                        icon = 'fa-solid fa-handcuffs',
                        label = 'Take Police Loadout',
                        job = Config.job
                    },
                },
                distance = 2.5
            })
        elseif Config.target == 'ox' then
            exports.ox_target:addBoxZone({
                coords = pedInfo.coords.xyz,
                size = vec3(2.0, 2.0, 2.0),
                rotation = pedInfo.coords.w,
                drawSprite = false,
                options = {
                    {
                        name = 'EL-Police-loadout:open',
                        icon = 'fa-solid fa-handcuffs',
                        label = 'Take Police Loadout',
                        onSelect = function()
                            TriggerServerEvent('EL-Police-loadout:open')
                        end,
                        groups = Config.job
                    }
                },
                distance = 2.5
            })
        end
    end
end)

RegisterNetEvent("EL-Police-loadout:c:giveitem")
AddEventHandler("EL-Police-loadout:c:giveitem", function(items)
    TriggerServerEvent('EL-Police-loadout:s:giveitems', items)
end)

RegisterNetEvent("EL-Police-loadout:c:TakeMoney", function(data)
    TriggerServerEvent('EL-Police-loadout:TakeMoney', data)
end)

RegisterNetEvent("EL-Police-loadout:SendDiscordLog:c", function(loadoutName)
    TriggerServerEvent("EL-Police-loadout:SendDiscordLog", loadoutName)
end)
