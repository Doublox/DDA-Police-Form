local display = false



--very important cb 
RegisterNUICallback("exit", function(data)

    SetDisplay(false)
end)


RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)


function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)

        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)
function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end



function DrawText2(text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, 0.45)
    SetTextDropshadow(1, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.40, 0.10)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        if (GetDistanceBetweenCoords(pos, 441.17 , -983.40 , 30.68, true) < 3) then
            DrawMarker(2,441.21 , -979.61 , 30.68 , 0.0, 0.0, 0.0, 300.0, 0.0, 0.0, 0.25, 0.25, 0.05, 0, 100, 255, 255, false, true, 2, false, false, false, false)
            DrawText3D(441.60 , -983.30 , 30.68 + 0.2, "~b~[E]~w~ Pour ouvrir un formulaire")
            if IsControlJustReleased(1, 38) then        
                SetDisplay(not display)
            end
		end
	end
end)


RegisterNUICallback('name', function(data, cb)
    TriggerServerEvent("log" , data)

end)
-- RegisterNUICallback('complaintinfo', function(data, cb)
--     TriggerServerEvent("log2" , data)

-- end)
