return{
	'nvim-lualine/lualine.nvim',
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
