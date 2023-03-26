RegisterCommand('revive', function(source, args, rawCommand)
  local playerId = tonumber(args[1])
  local player = GetPlayerFromServerId(playerId)
  if player ~= nil then
    if IsEntityDead(GetPlayerPed(player)) then
      ResurrectPed(GetPlayerPed(player))
      SetEntityHealth(GetPlayerPed(player), 200)
      TriggerEvent('chat:addMessage', {args = {"^1SYSTEM", "Joueur avec l'ID " .. playerId .. " a été ranimé."}})
    else
      TriggerEvent('chat:addMessage', {args = {"^1SYSTEM", "Joueur avec l'ID " .. playerId .. " est déjà en vie."}})
    end
  else
    TriggerEvent('chat:addMessage', {args = {"^1SYSTEM", "Joueur avec l'ID " .. playerId .. " non trouvé."}})
  end
end, false)
