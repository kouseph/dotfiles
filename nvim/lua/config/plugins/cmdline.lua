return{
	'nvim-lualine/lualine.nvim',
  enabled=false,
	dependencies = {
		'DaikyXendo/nvim-material-icon',
 },
	config = function()
		require('lualine').setup()
		require('lualine').get_config()
		options = {
			theme = 'gruvbox',
		}
	end,
}
