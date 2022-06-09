local isAnnounces = nil

local function sendAnnounces(e)
    while (isAnnounces) do
        Wait(500)
    end

    SendNUIMessage({
        type = 'newAnnounces:show',
        text = e.text,
        time = e.time,
    })
end

RegisterNetEvent('jsx_framework:client:sendAnnounces', sendAnnounces)

RegisterNUICallback('boolean', function(boolean)
    isAnnounces = boolean
end)