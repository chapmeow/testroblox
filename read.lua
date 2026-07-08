-- ผู้โจมตีแค่ไล่ดูว่ามี RemoteEvent อะไรบ้างในเกม
for _, obj in ipairs(game:GetDescendants()) do
    if obj:IsA("RemoteEvent") then
        print(obj.Name)  -- เห็นชื่อจริงหมด รวมถึง Xz9_buY_k3
    end
end
