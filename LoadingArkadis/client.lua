-- Attache un événement à la pression de la barre d'espace
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if IsControlJustPressed(0, 32) then -- Vérifie si la barre d'espace est pressée
        local audioElement = "myAudio" -- Nom de l'élément audio
        local audio = GetAudioElement(audioElement) -- Récupère l'élément audio
        if audio ~= nil then
          audio:pause() -- Arrête l'audio
          break -- Sort de la boucle
        end
      end
    end
  end)
  
  function GetAudioElement(audioElement)
    local audioElement = "document.getElementById('" .. audioElement .. "')"
    local _, result = Citizen.InvokeNative(0xFA925AC00EB830B9, audioElement)
    return result
  end
  