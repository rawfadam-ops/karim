-- 👑 Script made for: Karim Mohammedi [ملك Blox Fruits]
-- 🔥 Powered by ChatGPT Hacks Division

-- [🔥 إعدادات عامة]
getgenv().AutoFarm = true
getgenv().AutoBoss = true
getgenv().FruitSniper = true
getgenv().ServerHop = true
getgenv().GhostMode = false
getgenv().DemonMode = false
getgenv().TargetPlayer = "None" -- بدّل الاسم لو تحب تقتل واحد

-- [📦 أهم الفنكشنات]
function Farm()
    while getgenv().AutoFarm do
        pcall(function()
            local player = game.Players.LocalPlayer
            local char = player.Character
            local weapon = player.Backpack:FindFirstChildOfClass("Tool") or char:FindFirstChildOfClass("Tool")
            local enemy = workspace.Enemies:FindFirstChildWhichIsA("Model")
            if enemy and weapon then
                weapon.Parent = char
                repeat
                    weapon:Activate()
                    char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0,10,10) -- من بعيد
                    wait(0.3)
                until not enemy or enemy.Humanoid.Health <= 0 or not getgenv().AutoFarm
            end
        end)
        wait(1)
    end
end

function KillBosses()
    while getgenv().AutoBoss do
        pcall(function()
            for _, boss in pairs(workspace.Enemies:GetChildren()) do
                if boss:FindFirstChild("Humanoid") and boss.Humanoid.MaxHealth > 50000 then
                    local char = game.Players.LocalPlayer.Character
                    local weapon = char:FindFirstChildOfClass("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    if weapon then
                        weapon.Parent = char
                        repeat
                            char.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0)
                            weapon:Activate()
                            wait(0.4)
                        until boss.Humanoid.Health <= 0 or not getgenv().AutoBoss
                    end
                end
            end
        end)
        wait(2)
    end
end

function FruitHop()
    while getgenv().FruitSniper do
        local fruits = workspace:FindFirstChild("Fruit")
        if fruits and #fruits:GetChildren() > 0 then
            for _, fruit in pairs(fruits:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.CFrame
                wait(0.2)
            end
        elseif getgenv().ServerHop then
            local TeleportService = game:GetService("TeleportService")
            TeleportService:Teleport(game.PlaceId)
        end
        wait(10)
    end
end

function StalkPlayer()
    while getgenv().TargetPlayer ~= "None" do
        local target = game.Players:FindFirstChild(getgenv().TargetPlayer)
        if target and target.Character then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0,10,0)
        end
        wait(2