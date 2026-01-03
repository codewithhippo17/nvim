-- Neovim Configuration Test Script
-- Tests major shortcuts and functionality

local function test_function_exists(name, func)
    local success, result = pcall(func)
    local status = success and "✅" or "❌"
    print(string.format("%s %s: %s", status, name, success and "OK" or tostring(result)))
    return success
end

print("🧪 Testing Neovim Configuration...")
print("=====================================")

-- Test Snacks functions
test_function_exists("Snacks Dashboard", function() return type(Snacks.dashboard) == 'function' end)
test_function_exists("Snacks Explorer", function() return type(Snacks.explorer) == 'function' end)  
test_function_exists("Snacks Picker", function() return type(Snacks.picker.smart) == 'function' end)
test_function_exists("Snacks Terminal", function() return type(Snacks.terminal) == 'function' end)

-- Test key bindings exist
local keymaps = vim.api.nvim_get_keymap('n')
local leader_keymaps = {}
for _, map in ipairs(keymaps) do
    if map.lhs:match('^<leader>') then
        leader_keymaps[map.lhs] = map.desc or map.rhs
    end
end

local critical_keys = {
    '<leader>f', '<leader>b', '<leader> ', '<leader>e',
    '<leader>0', '<leader>p', '<leader>m', '<leader>t'
}

print("\n📋 Critical Key Bindings:")
print("=========================")
for _, key in ipairs(critical_keys) do
    local exists = leader_keymaps[key] ~= nil
    local status = exists and "✅" or "❌"
    print(string.format("%s %s: %s", status, key, leader_keymaps[key] or "NOT FOUND"))
end

print("\n🔧 Plugin Status:")
print("=================")
-- Test major plugins
local plugins = {
    'snacks',
    'copilot', 
    'fzf-lua',
    'nvim-lspconfig',
    'nvim-treesitter'
}

for _, plugin in ipairs(plugins) do
    local success = pcall(require, plugin)
    local status = success and "✅" or "❌"
    print(string.format("%s %s", status, plugin))
end

print("\n🎯 Test Complete!")