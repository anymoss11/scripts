local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlaySoundEvent = ReplicatedStorage:WaitForChild("PlaySoundEvent")
local button = script.Parent

button.MouseButton1Click:Connect(function()
    -- Example: call /sound1
    PlaySoundEvent:FireServer("rbxassetid://1444622447)
end)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlaySoundEvent = ReplicatedStorage:WaitForChild("PlaySoundEvent")

PlaySoundEvent.OnServerEvent:Connect(function(player, soundId)
    local character = player.Character
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local sound = Instance.new("Sound")
    sound.Parent = hrp
    sound.SoundId = soundId
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.RollOffMinDistance = 10
    sound.RollOffMaxDistance = 50
    sound:Play(50studs)
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end)
