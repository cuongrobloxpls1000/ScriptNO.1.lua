local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = plr:WaitForChild("PlayerGui")

-- Nút tròn đỏ
local openBtn = Instance.new("TextButton")
openBtn.Parent = gui
openBtn.Size = UDim2.new(0,60,0,60)
openBtn.Position = UDim2.new(0.05,0,0.4,0)
openBtn.Text = "●"
openBtn.TextScaled = true
openBtn.TextColor3 = Color3.new(1,1,1)
openBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
openBtn.Active = true
openBtn.Draggable = true

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1,0)
corner.Parent = openBtn


-- Bảng admin
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,330,0,380)
frame.Position = UDim2.new(0.5,-165,0.2,0)
frame.BackgroundColor3 = Color3.fromRGB(35,35,35)
frame.Visible = false
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner")
frameCorner.Parent = frame


-- Tiêu đề
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,-40,0,40)
title.Text = "Quyền Admin"
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)


-- Nút X
local closeBtn = Instance.new("TextButton")
closeBtn.Parent = frame
closeBtn.Size = UDim2.new(0,35,0,35)
closeBtn.Position = UDim2.new(1,-38,0,2)
closeBtn.Text = "X"
closeBtn.TextScaled = true
closeBtn.BackgroundColor3 = Color3.fromRGB(255,0,0)
closeBtn.TextColor3 = Color3.new(1,1,1)


-- Kéo xuống
local scroll = Instance.new("ScrollingFrame")
scroll.Parent = frame
scroll.Position = UDim2.new(0,5,0,45)
scroll.Size = UDim2.new(1,-10,1,-50)
scroll.CanvasSize = UDim2.new(0,0,0,500)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1


---------------------------------
-- PHẦN 1 : Tìm người chơi
---------------------------------
local box = Instance.new("TextBox")
box.Parent = scroll
box.Size = UDim2.new(1,-10,0,40)
box.Position = UDim2.new(0,5,0,10)
box.PlaceholderText = "Nhập tên người chơi..."
box.Text = ""

local tpBtn = Instance.new("TextButton")
tpBtn.Parent = scroll
tpBtn.Size = UDim2.new(1,-10,0,40)
tpBtn.Position = UDim2.new(0,5,0,60)
tpBtn.Text = "Xác nhận"

tpBtn.MouseButton1Click:Connect(function()
	local targetName = box.Text:lower()

	for _,v in pairs(Players:GetPlayers()) do
		if v.Name:lower():find(targetName) then
			if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
				plr.Character.HumanoidRootPart.CFrame =
					v.Character.HumanoidRootPart.CFrame + Vector3.new(2,0,0)
			end
			break
		end
	end
end)


---------------------------------
-- PHẦN 2 : Nhảy vô hạn
---------------------------------
local infJump = false

local jumpBtn = Instance.new("TextButton")
jumpBtn.Parent = scroll
jumpBtn.Size = UDim2.new(1,-10,0,40)
jumpBtn.Position = UDim2.new(0,5,0,
