JSX = {}

TriggerEvent('esx:getSharedObject', function(obj)
    JSX = obj
end)

function checkAdmin(source)
    local player = JSX.GetPlayerFromId(source)

    return player.getGroup() == 'admin'
end

function jobsExcluded(source)
    local x = JSX.GetPlayerFromId(source)

    if (x.getJob() ~= 'miner' and x.getJob() ~= 'unemployed' and x.getJob() ~= 'banker' and x.getJob() ~= 'fueler' and x.getJob() ~= 'reporter' and x.getJob() ~= 'tailor') then
        excluded = true
    else
        excluded = false
    end

    return excluded
end

RegisterCommand('announce', function(source, args)
    if (checkAdmin(source) or not jobsExcluded(source)) then
        local players = JSX.GetPlayers()
        local _text = table.concat(args, ' ')

        for k,v in pairs(players) do
            TriggerClientEvent('jsx_framework:client:sendAnnounces', players[k], {
                text = _text,
                time = 7000,
            })
        end
    end   
end)