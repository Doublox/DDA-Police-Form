local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/833542634080960552/IsPIcQttSBx6zA7ls3oAU7wUz_1nNQW38Txhd4BoQfej190qO5Cwv3vzbx3V3Ya-tR-4"
function ExtractIdentifiers()
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
            TriggerEvent("log", identifierDiscord)
        end
    end
end
    

RegisterServerEvent('log')
AddEventHandler('log', function(data)
        for k,v in pairs(GetPlayerIdentifiers(source))do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
              identifier = v
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
              license = v
            elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
              xbl  = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
              playerip = v
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
              playerdiscord = v
              str = string.sub(v, 9)
            elseif string.sub(v, 1, string.len("live:")) == "live:" then
              liveid = v
            end
          end
        
          if playerip == nil then
            playerip = GetPlayerEndpoint(target)
            if playerip == nil then
              playerip = 'not found'
            end
          end
          if playerdiscord == nil then
            playerdiscord = 'not found'
          end
          if str == nil then
            str = "not found"
          end
          if liveid == nil then
            liveid = 'not found'
          end
          if xbl == nil then
            xbl = 'not found'
          end
    
    local connect = {
        {
            ["color"] = "255",
            ["title"] = "Nouvelle Inscription | " ..data.plate.."-"..data.lastname,
            timestamp = os.date('!%Y-%m-%dT%H:%M:%S'),

            ["description"] = "Prénom: \n `"..data.plate.."` \n Nom de Famille: \n `"..data.lastname.."` \n Date Anniverssaire: \n `"..data.age.."` \n Motivation: \n`"..data.why.."`\n Sexe:\n `"..data.gender.."`".."\n דיסקורד:\n".."<@"..str..">",
	        ["footer"] = {
                ["text"] = "Nouvelle Inscription",
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "Inscription Police",  avatar_url = "https://static.wikia.nocookie.net/gta/images/5/5e/Sceau-lspd-gtav.png/revision/latest?cb=20140916194909&path-prefix=fr",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)



RegisterServerEvent('log2')
AddEventHandler('log2', function(data)

    for k,v in pairs(GetPlayerIdentifiers(source))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
          identifier = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
          xbl  = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
          playerip = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          playerdiscord = v
          str = string.sub(v, 9)
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
          liveid = v
        end
      end
    
      if playerip == nil then
        playerip = GetPlayerEndpoint(target)
        if playerip == nil then
          playerip = 'not found'
        end
      end
      if playerdiscord == nil then
        playerdiscord = 'not found'
      end
      if str == nil then
        str = "not found"
      end
      if liveid == nil then
        liveid = 'not found'
      end
      if xbl == nil then
        xbl = 'not found'
      end

    local connect = {
        {
            ["color"] = "255",
            ["title"] = "Nouvelle Plainte | " ..data.ft.."-"..data.ln,
            ["description"] = "Prénom: \n `"..data.ft.."` \n Nom de Famille: \n `"..data.ln.."`\n Raison: \n `"..data.reason.."`".."\n Date: \n `"..data.date.."`".."\n דיסקורד:\n".."<@"..str..">",
	        ["footer"] = {
                ["text"] = "Police Plainte",
            },
            image = {
                url = data.myImg
            },
        }
    }
    PerformHttpRequest(DISCORD_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = "Inscription Police",  avatar_url = "https://static.wikia.nocookie.net/gta/images/5/5e/Sceau-lspd-gtav.png/revision/latest?cb=20140916194909&path-prefix=fr",embeds = connect}), { ['Content-Type'] = 'application/json' })
end)


