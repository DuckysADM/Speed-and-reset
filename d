local PlayerGroupBox = Tabs.Player:AddLeftGroupbox('Player Actions')
PlayerGroupBox:AddButton('Reset Character', function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/DuckysADM/Force-Reset/refs/heads/main/Force%20Reset"))
end, { Tooltip = 'Resets your character' })

repeat
    wait()
until game:IsLoaded()

local Players = game:service('Players')
local LocalPlayer = Players.LocalPlayer
repeat
    wait()
until LocalPlayer.Character

local UserInputService = game:service('UserInputService')
local RunService = game:service('RunService')

getgenv().Multiplier = 5
local SpeedEnabled = false
local ToggleSpeed = false

PlayerGroupBox:AddToggle('SpeedToggle', {
    Text = 'Enable Speed',
    Default = false,
    Tooltip = 'Toggles the speed boost',
    Callback = function(Value)
        ToggleSpeed = Value
    end
})

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.C and ToggleSpeed then
        SpeedEnabled = not SpeedEnabled
        if SpeedEnabled then
            repeat
                LocalPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + LocalPlayer.Character.Humanoid.MoveDirection * getgenv().Multiplier
                RunService.Stepped:Wait()
            until not SpeedEnabled
        end
    end
end)

PlayerGroupBox:AddSlider('WalkspeedMultiplier', {
    Text = 'Speed Amount',
    Default = 5,
    Min = 1,
    Max = 10,
    Rounding = 1,
    Tooltip = 'Adjusts the walkspeed multiplier',
    Callback = function(Value)
        getgenv().Multiplier = Value
