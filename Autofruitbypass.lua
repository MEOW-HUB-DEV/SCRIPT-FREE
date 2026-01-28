-- SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- CONFIG
getgenv().Team = getgenv().Team or "Pirates"

-- CHỜ GAME LOAD
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- CHỜ DATA PLAYER
repeat task.wait()
until Player:FindFirstChild("DataLoaded")

-- AUTO SET TEAM (nếu đang ở màn hình chọn team)
if PlayerGui:FindFirstChild("Main (minimal)") then
    pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("SetTeam", getgenv().Team)
    end)

    -- chờ UI chọn team biến mất (tối đa 10s)
    local timeout = tick() + 10
    repeat task.wait()
    until not PlayerGui:FindFirstChild("Main (minimal)") or tick() > timeout
end

-- CHỜ UI CHÍNH
repeat task.wait()
until PlayerGui:FindFirstChild("Main")

-- LOADSTRING SCRIPT CHÍNH
pcall(function()
    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/MEOW-HUB-DEV/Test-obf/refs/heads/main/Test.luau",
        true
    ))()
end)
