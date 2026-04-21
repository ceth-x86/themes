local M = {}

M.name = 'Stradarium Modern'

M.scheme = {
  foreground = '#100F0F',
  background = '#FFFCF0',

  cursor_bg = '#100F0F',
  cursor_fg = '#FFFCF0',
  cursor_border = '#100F0F',

  selection_bg = '#E8E2D6',
  selection_fg = '#100F0F',

  scrollbar_thumb = '#CFC9B9',
  split = '#CFC9B9',

  ansi = {
    '#100F0F',
    '#C13D31',
    '#5B7500',
    '#8D6400',
    '#205EA6',
    '#A02F6F',
    '#197870',
    '#403E3C',
  },

  brights = {
    '#6D6C67',
    '#D65A4F',
    '#6F8C08',
    '#A97B00',
    '#3C76B7',
    '#B74583',
    '#25867E',
    '#100F0F',
  },

  tab_bar = {
    background = '#F8F4EA',
    inactive_tab_edge = '#F8F4EA',

    active_tab = {
      bg_color = '#F2EDE3',
      fg_color = '#100F0F',
      intensity = 'Bold',
      underline = 'None',
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = '#F8F4EA',
      fg_color = '#6D6C67',
      intensity = 'Normal',
    },

    inactive_tab_hover = {
      bg_color = '#F2EDE3',
      fg_color = '#100F0F',
      italic = false,
    },

    new_tab = {
      bg_color = '#F8F4EA',
      fg_color = '#6D6C67',
    },

    new_tab_hover = {
      bg_color = '#F2EDE3',
      fg_color = '#100F0F',
    },
  },

  color_overrides = {
    ['#575653'] = '#F2EDE3',
    ['#585754'] = '#F2EDE3',
    ['#225FA6'] = '#F2EDE3',
  },
}

function M.apply(config)
  config.color_schemes = config.color_schemes or {}
  config.color_schemes[M.name] = M.scheme
  config.color_scheme = M.name
  config.window_frame = config.window_frame or {}
  config.window_frame.active_titlebar_bg = '#FFFCF0'
  config.window_frame.inactive_titlebar_bg = '#FFFCF0'
  config.window_frame.active_titlebar_fg = '#100F0F'
  config.window_frame.inactive_titlebar_fg = '#6D6C67'
  return config
end

return M
