# mythic_notify

> This is a re-skin of the legendary notification system from FiveM, known as mythic_notify. LOL

Preview: https://streamable.com/g8nwpv

![image](https://github.com/Teezy-Core/mythic_notify/assets/93441579/6a3494d0-635b-434a-b602-c595c8b55e75)

# Example Usage

Client
```lua
RegisterCommand('testall', function()
 	exports['mythic_notify']:SendAlert('inform', 'This is a test of the notification system. INFORM', 2500)
 	exports['mythic_notify']:SendAlert('success', 'This is a test of the notification system. SUCCESS', 2500)
 	exports['mythic_notify']:SendAlert('warning', 'This is a test of the notification system. WARNING', 2500)
 	exports['mythic_notify']:SendAlert('error', 'This is a test of the notification system. ERROR', 2500)
 	exports['mythic_notify']:SendAlert('status', 'This is a test of the notification system. STATUS', 2500)
	exports['mythic_notify']:PersistentAlert('start', 'test', 'status', 'This is a test of the notification system. PERSISTENT', 2500)
 	Wait(10000)
 	exports['mythic_notify']:PersistentAlert('end', 'test')
end)
```
Server
```lua
RegisterCommand('testServernotif', function()
    TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'inform', text = 'This is a test of the notification system. INFORM', 2500})
     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'success', text = 'This is a test of the notification system. SUCCESS', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'warning', text = 'This is a test of the notification system. WARNING', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'error', text = 'This is a test of the notification system. ERROR', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'status', text = 'This is a test of the notification system. STATUS', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
     TriggerServerEvent('mythic_notify:server:PersistentAlert', { action = 'start', id = 'test', type = 'status', text = 'This is a test of the notification system. PERSISTENT', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
     Wait(10000)
     TriggerServerEvent('mythic_notify:server:PersistentAlert', { action = 'end', id = 'test' })
end)
```
