RegisterCommand('revive', function(source, args, rawCommand)
    local playerId = tonumber(args[1])
    local player = GetPlayerFromServerId(playerId)
    if player ~= nil then
      if IsEntityDead(GetPlayerPed(player)) then
        ResurrectPed(GetPlayerPed(player))
        SetEntityHealth(GetPlayerPed(player), 200)
        TriggerClientEvent('chat:addMessage', -1, {args = {"^1SYSTEM", "Joueur avec l'ID " .. playerId .. " a été ranimé."}})
      else
        TriggerClientEvent('chat:addMessage', source, {args = {"^1SYSTEM", "Joueur avec l'ID " .. playerId .. " est déjà en vie."}})
      end
    else
      TriggerClientEvent('chat:addMessage', source, {args = {"^1SYSTEM", "Joueur avec l'ID " .. playerId .. " non trouvé."}})
    end
  end, false)
  
  function IsPlayerAdmin(playerId)
    local playerId = tonumber(playerId)
    local player = GetPlayerIdentifiers(playerId)
    for _, v in pairs(player) do
      if string.find(v, "admin") then
        return true
      end
    end
    return false
  end
  
  AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, 6) == '/revive' then
      if IsPlayerAdmin(source) then
        local args = stringsplit(message, ' ')
        if args[2] ~= nil then
          local playerId = tonumber(args[2])
          if playerId ~= nil then
            TriggerEvent('revive', source, args, message)
            CancelEvent()
          else
            TriggerClientEvent('chat:addMessage', source, {args = {"^1SYSTEM", "Syntaxe invalide. Utilisation : /revive [ID du joueur]"}})
          end
        else
          TriggerClientEvent('chat:addMessage', source, {args = {"^1SYSTEM", "Syntaxe invalide. Utilisation : /revive [ID du joueur]"}})
        end
      else
        TriggerClientEvent('chat:addMessage', source, {args = {"^1SYSTEM", "Vous n'avez pas la permission d'utiliser cette commande."}})
        CancelEvent()
      end
    end
  end)
  
  function stringsplit(inputstr, sep)
    if sep == nil then
      sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
      table.insert(t, str)
    end
    return t
  end
  