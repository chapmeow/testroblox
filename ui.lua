-- สร้างตัวแปรอ้างอิงผู้เล่นเรา และ PlayerGui (ที่เก็บ UI ของฝั่ง client)
local player = game:GetService("Players").LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- 1) ScreenGui = "ผืนผ้าใบ" ที่ใส่ UI ทั้งหมดลงไป
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyFirstUI"
screenGui.ResetOnSpawn = false          -- ไม่ให้ UI หายตอนเราตาย/เกิดใหม่
screenGui.Parent = playerGui            -- พอ set Parent มันถึงจะโผล่บนจอ

-- 2) Frame = "หน้าต่าง" กล่องพื้นหลัง
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)  -- กว้าง 300px สูง 150px
frame.Position = UDim2.new(0.5, -150, 0.5, -75)  -- จัดกลางจอ (0.5 = กึ่งกลาง แล้วเลื่อนกลับครึ่งขนาด)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- ทำมุมโค้งให้ frame
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- 3) TextLabel = ข้อความคำถาม
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 60)     -- กว้างเต็ม frame (1 = 100%), สูง 60px
label.Position = UDim2.new(0, 0, 0, 15)
label.BackgroundTransparency = 1        -- ไม่เอาพื้นหลัง label
label.Text = "Are you gay ?"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 24
label.Font = Enum.Font.GothamBold
label.Parent = frame

-- 4) ปุ่มติ๊ก Yes (ใช้ TextButton ทำเป็น checkbox)
local checkbox = Instance.new("TextButton")
checkbox.Size = UDim2.new(0, 40, 0, 40)
checkbox.Position = UDim2.new(0.5, -20, 0, 85)  -- จัดกลางแนวนอน
checkbox.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
checkbox.Text = ""                      -- เริ่มต้นยังไม่ติ๊ก = ว่าง
checkbox.TextColor3 = Color3.fromRGB(0, 255, 100)
checkbox.TextSize = 28
checkbox.Font = Enum.Font.GothamBold
checkbox.Parent = frame

local checkCorner = Instance.new("UICorner")
checkCorner.CornerRadius = UDim.new(0, 8)
checkCorner.Parent = checkbox

-- ป้ายกำกับว่า "Yes" ข้างๆ กล่องติ๊ก
local yesLabel = Instance.new("TextLabel")
yesLabel.Size = UDim2.new(0, 50, 0, 40)
yesLabel.Position = UDim2.new(0.5, 25, 0, 85)
yesLabel.BackgroundTransparency = 1
yesLabel.Text = "Yes"
yesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
yesLabel.TextSize = 20
yesLabel.Font = Enum.Font.Gotham
yesLabel.Parent = frame

-- 5) ตัวแปรเก็บสถานะ + สั่งให้ปุ่มตอบสนองตอนคลิก
local checked = false

checkbox.MouseButton1Click:Connect(function()
    checked = not checked               -- สลับค่า true/false ทุกครั้งที่คลิก
    if checked then
        checkbox.Text = "✓"
        checkbox.BackgroundColor3 = Color3.fromRGB(40, 120, 60)  -- เขียวตอนติ๊ก
    else
        checkbox.Text = ""
        checkbox.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    end
    print("Checkbox state:", checked)   -- ดูค่าใน Output ของ Studio
end)
