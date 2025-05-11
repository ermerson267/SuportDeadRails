-- SuporteDeadRails GUI (Feito por Dead Rails)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "SuporteDeadRails"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 500)
main.Position = UDim2.new(0.5, -200, 0.5, -250)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
main.BorderSizePixel = 0

local title = Instance.new("TextLabel", main)
title.Text = "Comandos de Helper (Dead Rails)"
title.Size = UDim2.new(1, 0, 0, 50)
title.TextSize = 28
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

local y = 60

local function categoria(nome)
    local label = Instance.new("TextLabel", main)
    label.Text = "== " .. nome .. " =="
    label.Size = UDim2.new(1, 0, 0, 25)
    label.Position = UDim2.new(0, 0, 0, y)
    label.TextColor3 = Color3.new(1, 1, 1)
    label.BackgroundTransparency = 1
    y = y + 30
end

local function botao(txt, callback)
    local btn = Instance.new("TextButton", main)
    btn.Text = txt
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 255)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 20
    btn.MouseButton1Click:Connect(callback)
    y = y + 35
end

-- Categorias e Funções
categoria("Boas-Vindas")
botao("Mensagem de boas-vindas", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Helper Ativado",
        Text = "Bem-vindo ao SuporteDeadRails!",
        Duration = 5
    })
end)

categoria("Bring")
botao("Puxar Itens", function()
    -- Aqui você pode colocar funções de bring personalizadas
end)

categoria("Coletar")
botao("Coletar Valiosos", function()
    -- pegar boud, armas, dinheiro, etc.
end)

categoria("Suporte")
botao("Ativar Fly", function()
    local Fly = true
    local mouse = LocalPlayer:GetMouse()
    local char = LocalPlayer.Character
    local hrp = char:WaitForChild("HumanoidRootPart")
    local speed = 200

    local bv = Instance.new("BodyVelocity")
    bv.Velocity = Vector3.new(0,0,0)
    bv.MaxForce = Vector3.new(1,1,1) * 9e9
    bv.Parent = hrp

    game:GetService("RunService").RenderStepped:Connect(function()
        if Fly then
            bv.Velocity = (mouse.Hit.p - hrp.Position).Unit * speed
        end
    end)
end)

botao("Noclip", function()
    game:GetService("RunService").Stepped:Connect(function()
        for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
end)

botao("Destravar Câmera", function()
    LocalPlayer.CameraMode = Enum.CameraMode.Classic
end)

categoria("Créditos")
botao("Ver Créditos", function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Feito por Dead Rails",
        Text = "Objetivo: Ajudar jogadores. Obrigado por jogar!",
        Duration = 6
    })
end)
