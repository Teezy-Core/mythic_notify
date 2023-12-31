shared_script '@cfx-tcd-packmenu/shared_fg-obfuscated.lua'
shared_script '@cfx-tcd-packmenu/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }
name 'Mythic Framework Notification System'
author 'Alzar - https://github.com/Alzar'
version 'v1.0.4'
ui_page {
    'html/ui.html',
}
files {
	'html/ui.html',
	'html/js/app.js', 
	'html/css/style.css',
}
client_scripts {
	'client/main.lua',
	'client/depracated.lua'
}
server_scripts {
	'server/*.lua'
}
exports {
	'SendAlert',
	'PersistentAlert',
	
--[[ WARNING: These are depracated and may be removed at a future date, Suggest not using it ]]--
	'DoShortHudText',
	'DoHudText',
	'DoLongHudText',
	'DoCustomHudText',
	'PersistentHudText'
}