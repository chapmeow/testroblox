local function logRemote(obj)
    print(string.format("[%s] %s", obj.ClassName, obj:GetFullName()))
end

game.Loaded:Wait()

for _, obj in game:GetDescendants() do
    if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") or obj:IsA("UnreliableRemoteEvent") then
        logRemote(obj)
    end
end

game.DescendantAdded:Connect(function(obj)
    if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") or obj:IsA("UnreliableRemoteEvent") then
        logRemote(obj)
    end
end)
