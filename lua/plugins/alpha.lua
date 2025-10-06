--Startup screen/navigation
return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    _Gopts = {
      position = 'center',
      hl = 'Type',
      wrap = 'overflow',
    }

    -- DASHBOARD HEADER

    local function getGreeting(name)
      local tableTime = os.date '*t'
      local datetime = os.date ' %Y-%m-%d-%A   %H:%M:%S '
      local hour = tableTime.hour
      local greetingsTable = {
        [1] = '  Sleep well',
        [2] = '  Good morning',
        [3] = '  Good afternoon',
        [4] = '  Good evening',
        [5] = '󰖔  Good night',
      }
      local greetingIndex = 0
      if hour == 23 or hour < 7 then
        greetingIndex = 1
      elseif hour < 12 then
        greetingIndex = 2
      elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
      elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
      elseif hour >= 21 then
        greetingIndex = 5
      end
      return datetime .. '  ' .. greetingsTable[greetingIndex] .. ', ' .. name
    end

    local logo = [[










                                             
       ███████████           █████     ███
      ███████████             █████ 
      ████████████████ ███████████ ███   ███████
     ████████████████ ████████████ █████ ██████████████
    █████████████████████████████ █████ █████ ████ █████
  ██████████████████████████████████ █████ █████ ████ █████
 ██████  ███ █████████████████ ████ █████ █████ ████ ██████
 ██████   ██  ███████████████   ██ █████████████████

      ]]

    local userName = 'Lazy'
    local greeting = getGreeting(userName)
    local marginBottom = 0

    -- Highlight groups configuration for each segment
    local header_hl = {
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } },
      { { 'Red', 1, 1 } }, -- Empty lines
      { { 'AlphaHeader0_0', 45, 47 } }, -- Line 10
      { -- Line 11
        { 'AlphaHeader1_0', 7, 22 },
        { 'AlphaHeader1_1', 33, 40 },
        { 'AlphaHeader1_2', 40, 51 },
      },
      { -- Line 12
        { 'AlphaHeader2_0', 6, 21 },
        { 'AlphaHeader2_1', 33, 45 },
      },
      { -- Line 13
        { 'AlphaHeader3_0', 6, 19 },
        { 'AlphaHeader3_1', 19, 20 },
        { 'AlphaHeader3_2', 20, 35 },
        { 'AlphaHeader3_3', 35, 45 },
        { 'AlphaHeader3_4', 45, 90 },
      },
      { -- Line 14
        { 'AlphaHeader4_0', 5, 18 },
        { 'AlphaHeader4_1', 18, 36 },
        { 'AlphaHeader4_2', 36, 45 },
        { 'AlphaHeader4_3', 45, 90 },
      },
      { -- Line 15
        { 'AlphaHeader5_0', 4, 17 },
        { 'AlphaHeader5_1', 17, 24 },
        { 'AlphaHeader5_2', 24, 28 },
        { 'AlphaHeader5_3', 28, 37 },
        { 'AlphaHeader5_4', 37, 46 },
        { 'AlphaHeader5_5', 46, 90 },
      },
      { -- Line 16
        { 'AlphaHeader6_0', 2, 17 },
        { 'AlphaHeader6_1', 17, 38 },
        { 'AlphaHeader6_2', 38, 45 },
        { 'AlphaHeader6_3', 46, 90 },
      },
      { -- Line 17
        { 'AlphaHeader7_0', 1, 17 },
        { 'AlphaHeader7_1', 17, 38 },
        { 'AlphaHeader7_2', 38, 45 },
        { 'AlphaHeader7_3', 46, 90 },
      },
      { -- Line 18
        { 'AlphaHeader8_0', 1, 37 },
        { 'AlphaHeader8_1', 37, 91 },
      },
    }

    -- vim.api.nvim_set_hl(0, 'AlphaHeader0_0', { fg = '#a6c9ab' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_0', { fg = '#bb7744' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_1', { fg = '#386c3f' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_2', { fg = '#a6c9ab' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_0', { fg = '#be7d46' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_1', { fg = '#3d7344' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_0', { fg = '#c18250' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_1', { fg = '#5c441e' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_2', { fg = '#d6c383' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_3', { fg = '#407b48' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_4', { fg = '#98c09c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_0', { fg = '#c38950' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_1', { fg = '#e0c785' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_2', { fg = '#44844b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_3', { fg = '#a0c4a3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_0', { fg = '#c58f56' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_1', { fg = '#e2cb85' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_2', { fg = '#5c441e' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_3', { fg = '#e2cb85' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_4', { fg = '#488c51' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_5', { fg = '#a6c9ab' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_0', { fg = '#c7955b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_1', { fg = '#e3cf88' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_2', { fg = '#4d9356' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_3', { fg = '#aecdb3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_0', { fg = '#c89b62' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_1', { fg = '#e5d38a' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_2', { fg = '#509b59' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_3', { fg = '#b7d1b9' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_0', { fg = '#5c441e' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_1', { fg = '#2e4e2a' })

    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_0', { fg = '#5c441e' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_1', { fg = '#5c441e' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_2', { fg = '#5c441e' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_0', { fg = '#bb7744' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_0', { fg = '#be7d46' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_0', { fg = '#c18250' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_0', { fg = '#c38950' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_0', { fg = '#c58f56' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_0', { fg = '#c7955b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_0', { fg = '#c89b62' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_2', { fg = '#d6c383' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_1', { fg = '#e0c785' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_1', { fg = '#e2cb85' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_3', { fg = '#e2cb85' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_1', { fg = '#e3cf88' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_1', { fg = '#e5d38a' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_1', { fg = '#2e4e2a' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_1', { fg = '#386c3f' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_1', { fg = '#3d7344' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_3', { fg = '#407b48' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_2', { fg = '#44844b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_4', { fg = '#488c51' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_2', { fg = '#4d9356' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_2', { fg = '#509b59' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_4', { fg = '#98c09c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_3', { fg = '#a0c4a3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader0_0', { fg = '#a6c9ab' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_2', { fg = '#a6c9ab' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_5', { fg = '#a6c9ab' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_3', { fg = '#aecdb3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_3', { fg = '#b7d1b9' })

    -- Blues & Purples Theme for Alpha Dashboard
    vim.api.nvim_set_hl(0, 'AlphaHeader8_0', { fg = '#3b2f6e' })
    vim.api.nvim_set_hl(0, 'AlphaHeader3_1', { fg = '#3b2f6e' })
    vim.api.nvim_set_hl(0, 'AlphaHeader5_2', { fg = '#3b2f6e' })
    vim.api.nvim_set_hl(0, 'AlphaHeader1_0', { fg = '#5e4a96' })
    vim.api.nvim_set_hl(0, 'AlphaHeader2_0', { fg = '#6a59a5' })
    vim.api.nvim_set_hl(0, 'AlphaHeader3_0', { fg = '#7768b4' })
    vim.api.nvim_set_hl(0, 'AlphaHeader4_0', { fg = '#8477c3' })
    vim.api.nvim_set_hl(0, 'AlphaHeader5_0', { fg = '#9186d2' })
    vim.api.nvim_set_hl(0, 'AlphaHeader6_0', { fg = '#9e95e1' })
    vim.api.nvim_set_hl(0, 'AlphaHeader7_0', { fg = '#a8a4f0' })
    vim.api.nvim_set_hl(0, 'AlphaHeader3_2', { fg = '#beb3f5' })
    vim.api.nvim_set_hl(0, 'AlphaHeader4_1', { fg = '#c6bdf7' })
    vim.api.nvim_set_hl(0, 'AlphaHeader5_1', { fg = '#cec7f9' })
    vim.api.nvim_set_hl(0, 'AlphaHeader5_3', { fg = '#d6d1fb' })
    vim.api.nvim_set_hl(0, 'AlphaHeader6_1', { fg = '#dedcfd' })
    vim.api.nvim_set_hl(0, 'AlphaHeader7_1', { fg = '#e6e8ff' })
    vim.api.nvim_set_hl(0, 'AlphaHeader8_1', { fg = '#2f3c7e' })
    vim.api.nvim_set_hl(0, 'AlphaHeader1_1', { fg = '#3b4a8d' })
    vim.api.nvim_set_hl(0, 'AlphaHeader2_1', { fg = '#47589c' })
    vim.api.nvim_set_hl(0, 'AlphaHeader3_3', { fg = '#5366ab' })
    vim.api.nvim_set_hl(0, 'AlphaHeader4_2', { fg = '#5f74ba' })
    vim.api.nvim_set_hl(0, 'AlphaHeader5_4', { fg = '#6b82c9' })
    vim.api.nvim_set_hl(0, 'AlphaHeader6_2', { fg = '#7790d8' })
    vim.api.nvim_set_hl(0, 'AlphaHeader7_2', { fg = '#80a2e3' })
    vim.api.nvim_set_hl(0, 'AlphaHeader3_4', { fg = '#8a9fd0' })
    vim.api.nvim_set_hl(0, 'AlphaHeader4_3', { fg = '#95a6d3' })
    vim.api.nvim_set_hl(0, 'AlphaHeader5_5', { fg = '#b6bddc' })
    vim.api.nvim_set_hl(0, 'AlphaHeader6_3', { fg = '#c1c4df' })
    vim.api.nvim_set_hl(0, 'AlphaHeader0_0', { fg = '#cccbe2' })
    vim.api.nvim_set_hl(0, 'AlphaHeader1_2', { fg = '#cccbe2' })
    vim.api.nvim_set_hl(0, 'AlphaHeader7_3', { fg = '#cccbe2' })

    -- vim.api.nvim_set_hl(0, 'AlphaHeader0_0', { fg = '#89C4F4' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_0', { fg = '#C39BD3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_1', { fg = '#5DADE2' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_2', { fg = '#89C4F4' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_0', { fg = '#AF7AC5' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_1', { fg = '#3498DB' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_0', { fg = '#9B59B6' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_1', { fg = '#2E86C1' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_2', { fg = '#AF7AC5' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_3', { fg = '#884EA0' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_4', { fg = '#C39BD3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_0', { fg = '#5DADE2' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_1', { fg = '#AF7AC5' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_2', { fg = '#3498DB' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_3', { fg = '#89C4F4' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_0', { fg = '#9B59B6' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_1', { fg = '#C39BD3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_2', { fg = '#6C3483' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_3', { fg = '#C39BD3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_4', { fg = '#2E86C1' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_5', { fg = '#89C4F4' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_0', { fg = '#9B59B6' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_1', { fg = '#AF7AC5' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_2', { fg = '#5DADE2' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_3', { fg = '#C39BD3' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_0', { fg = '#884EA0' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_1', { fg = '#AF7AC5' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_2', { fg = '#3498DB' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_3', { fg = '#89C4F4' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_0', { fg = '#6C3483' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_1', { fg = '#2471A3' })

    -- vim.api.nvim_set_hl(0, 'AlphaHeader0_0', { fg = '#bd93f9' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_0', { fg = '#ffb86c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_1', { fg = '#50fa7b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_2', { fg = '#bd93f9' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_0', { fg = '#ffb86c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_1', { fg = '#50fa7b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_0', { fg = '#ffb86c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_1', { fg = '#6272a4' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_2', { fg = '#f1fa8c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_3', { fg = '#50fa7b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_4', { fg = '#bd93f9' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_0', { fg = '#ffb86c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_1', { fg = '#f1fa8c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_2', { fg = '#50fa7b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_3', { fg = '#bd93f9' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_0', { fg = '#ffb86c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_1', { fg = '#f1fa8c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_2', { fg = '#6272a4' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_3', { fg = '#f1fa8c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_4', { fg = '#50fa7b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_5', { fg = '#bd93f9' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_0', { fg = '#ffb86c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_1', { fg = '#f1fa8c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_2', { fg = '#50fa7b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_3', { fg = '#bd93f9' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_0', { fg = '#ffb86c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_1', { fg = '#f1fa8c' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_2', { fg = '#50fa7b' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_3', { fg = '#bd93f9' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_0', { fg = '#6272a4' })
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_1', { fg = '#6272a4' })

    -- Dracula colors blended to create a "blur" effect
    -- vim.api.nvim_set_hl(0, 'AlphaHeader0_0', { fg = '#bd93f9' }) -- Brightest Purple/Muted Tone
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_0', { fg = '#ffb86c' }) -- Main Orange
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_1', { fg = '#325e47' }) -- Darkest Green
    -- vim.api.nvim_set_hl(0, 'AlphaHeader1_2', { fg = '#bd93f9' }) -- Brightest Purple/Muted Tone
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_0', { fg = '#ffb86c' }) -- Main Orange
    -- vim.api.nvim_set_hl(0, 'AlphaHeader2_1', { fg = '#3c9258' }) -- Dark Green
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_0', { fg = '#ffb86c' }) -- Main Orange
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_1', { fg = '#937151' }) -- Dark Orange/Brown
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_2', { fg = '#f1fa8c' }) -- Brightest Yellow
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_3', { fg = '#50fa7b' }) -- Brightest Green
    -- vim.api.nvim_set_hl(0, 'AlphaHeader3_4', { fg = '#8f82ce' }) -- Muted Purple
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_0', { fg = '#ffb86c' }) -- Main Orange
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_1', { fg = '#f1fa8c' }) -- Brightest Yellow
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_2', { fg = '#50fa7b' }) -- Brightest Green
    -- vim.api.nvim_set_hl(0, 'AlphaHeader4_3', { fg = '#bd93f9' }) -- Brightest Purple/Muted Tone
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_0', { fg = '#ffb86c' }) -- Main Orange
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_1', { fg = '#f1fa8c' }) -- Brightest Yellow
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_2', { fg = '#937151' }) -- Dark Orange/Brown
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_3', { fg = '#f1fa8c' }) -- Brightest Yellow
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_4', { fg = '#50fa7b' }) -- Brightest Green
    -- vim.api.nvim_set_hl(0, 'AlphaHeader5_5', { fg = '#bd93f9' }) -- Brightest Purple/Muted Tone
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_0', { fg = '#ffb86c' }) -- Main Orange
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_1', { fg = '#f1fa8c' }) -- Brightest Yellow
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_2', { fg = '#50fa7b' }) -- Brightest Green
    -- vim.api.nvim_set_hl(0, 'AlphaHeader6_3', { fg = '#8f82ce' }) -- Muted Purple
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_0', { fg = '#ffb86c' }) -- Main Orange
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_1', { fg = '#f1fa8c' }) -- Brightest Yellow
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_2', { fg = '#3c9258' }) -- Dark Green
    -- vim.api.nvim_set_hl(0, 'AlphaHeader7_3', { fg = '#8f82ce' }) -- Muted Purple
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_0', { fg = '#937151' }) -- Dark Orange/Brown
    -- vim.api.nvim_set_hl(0, 'AlphaHeader8_1', { fg = '#325e47' }) -- Darkest Green

    local utils = require 'alpha.utils'

    local header_val = vim.split(logo, '\n')
    header_hl = utils.charhl_to_bytehl(header_hl, header_val, false)

    dashboard.section.header.opts.hl = header_hl
    dashboard.section.header.val = header_val
    -- Split logo into lines
    local logoLines = {}
    for line in logo:gmatch '[^\r\n]+' do
      table.insert(logoLines, line)
    end

    -- Calculate padding for centering the greeting
    local logoWidth = logo:find '\n' - 1 -- Assuming the logo width is the width of the first line
    local greetingWidth = #greeting
    local padding = math.floor((logoWidth - greetingWidth) / 2)

    -- Generate spaces for padding
    local paddedGreeting = string.rep(' ', padding) .. greeting

    -- Add margin lines below the padded greeting
    local margin = string.rep('\n', marginBottom)

    -- Concatenate logo, padded greeting, and margin
    local adjustedLogo = logo .. '\n' .. paddedGreeting .. margin

    local init_path = vim.fn.stdpath 'config'
    dashboard.section.buttons.val = {
      dashboard.button('n', '  New file', ':ene <BAR> startinsert<CR>'),
      dashboard.button('r', '󰄉  Recent files', ':Telescope recent_files<CR>'),
      dashboard.button('u', '󱐥  Update plugins', '<cmd>Lazy update<CR>'),
      dashboard.button('c', '󰈞  Find file in C:', ':cd C: | silent Telescope find_files hidden=true no_ignore=true <CR>'),
      dashboard.button('d', '󰮗  Find file in D:', ':cd D: | silent Telescope find_files hidden=true no_ignore=true <CR>'),
      dashboard.button('s', '  Settings', ':cd ' .. init_path .. '<CR>:e init.lua<CR>'),
      dashboard.button('q', '󰿅  Quit', '<cmd>q<CR>'),
      -- dashboard.button('', ''),
    }

    dashboard.section.buttons.opts.hl = 'AlphaHeader1_0'
    -- local function footer()
    -- 	return "Footer Text"
    -- end

    -- dashboard.section.footer.val = vim.split('\n\n' .. getGreeting 'Lazy', '\n')

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      desc = 'Add Alpha dashboard footer',
      once = true,
      callback = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        dashboard.section.footer.val = {
          ' ',
          ' ',
          ' ',
          ' Loaded ' .. stats.count .. ' plugins  in ' .. ms .. ' ms ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
          ' ',
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
    -- Hide all the unnecessary visual elements while on the dashboard, and add
    -- them back when leaving the dashboard.
    local group = vim.api.nvim_create_augroup('CleanDashboard', {})

    vim.api.nvim_create_autocmd('User', {
      group = group,
      pattern = 'AlphaReady',
      callback = function()
        -- vim.opt.showtabline = 0
        -- vim.opt.showmode = true
        -- vim.opt.laststatus = 3
        vim.opt.showcmd = false
        vim.opt.ruler = false
      end,
    })

    vim.api.nvim_create_autocmd('BufUnload', {
      group = group,
      pattern = '<buffer>',
      callback = function()
        -- vim.opt.showtabline = 0
        -- vim.opt.showmode = true
        -- vim.opt.laststatus = 3
        vim.opt.showcmd = true
        vim.opt.ruler = true
      end,
    })
    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
