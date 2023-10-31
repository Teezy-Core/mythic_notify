RegisterNetEvent('mythic_notify:client:SendAlert')
AddEventHandler('mythic_notify:client:SendAlert', function(data)
    SendAlert(data.type, data.text, data.length, data.style)
end)

RegisterNetEvent('mythic_notify:client:PersistentAlert')
AddEventHandler('mythic_notify:client:PersistentAlert', function(data)
    PersistentAlert(data.action, data.id, data.type, data.text, data.style)
end)

function SendAlert(type, text, length, style)
	local badge = ''
	if type == 'inform' then
		badge = '<span class="badge text-bg-info">INFO</span>'
	elseif type == 'success' then
		badge = '<span class="badge bg-success">SUCCESS</span>'
	elseif type == 'warning' then
		badge = '<span class="badge text-bg-warning">WARNING</span>'
	elseif type == 'error' then
		badge = '<span class="badge text-bg-danger">ERROR</span>'
	elseif type == 'status' then
		badge = '<span class="badge text-bg-danger">STATUS</span>'
	else
		badge = '<span class="badge bg-secondary">NOTIFICATION</span>'
	end

    local notification = badge .. ' ' .. text
    SendNUIMessage({
        type = type,
        text = notification,
        length = length,
        style = style
    })
end

function PersistentAlert(action, id, type, text, style)
    if action:upper() == 'START' then
        local badge = ''
        if type == 'inform' then
            badge = '<span class="badge text-bg-info">INFO</span>'
        elseif type == 'success' then
            badge = '<span class="badge bg-success">SUCCESS</span>'
        elseif type == 'warning' then
            badge = '<span class="badge text-bg-warning">WARNING</span>'
        elseif type == 'error' then
            badge = '<span class="badge text-bg-danger">ERROR</span>'
		elseif type == 'status' then
			badge = '<span class="badge text-bg-danger">STATUS</span>'
        else
            badge = '<span class="badge bg-secondary">NOTIFICATION</span>'
        end

        local notification = badge .. ' ' .. text

        SendNUIMessage({
            persist = action,
            id = id,
            type = type,
            text = notification,
            style = style
        })
    elseif action:upper() == 'END' then
        SendNUIMessage({
            persist = action,
            id = id
        })
    end
end


-- RegisterCommand('testall', function()
-- 	exports['mythic_notify']:SendAlert('inform', 'This is a test of the notification system. INFORM', 2500)
-- 	exports['mythic_notify']:SendAlert('success', 'This is a test of the notification system. SUCCESS', 2500)
-- 	exports['mythic_notify']:SendAlert('warning', 'This is a test of the notification system. WARNING', 2500)
-- 	exports['mythic_notify']:SendAlert('error', 'This is a test of the notification system. ERROR', 2500)
-- 	exports['mythic_notify']:SendAlert('status', 'This is a test of the notification system. STATUS', 2500)
-- 	exports['mythic_notify']:PersistentAlert('start', 'test', 'status', 'This is a test of the notification system. PERSISTENT', 2500)
-- 	Wait(10000)
-- 	exports['mythic_notify']:PersistentAlert('end', 'test')
-- end)

-- RegisterCommand('testServernotif', function()
--     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'inform', text = 'This is a test of the notification system. INFORM', 2500})
--     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'success', text = 'This is a test of the notification system. SUCCESS', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
--     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'warning', text = 'This is a test of the notification system. WARNING', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
--     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'error', text = 'This is a test of the notification system. ERROR', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
--     TriggerServerEvent('mythic_notify:server:SendAlert', { type = 'status', text = 'This is a test of the notification system. STATUS', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
--     TriggerServerEvent('mythic_notify:server:PersistentAlert', { action = 'start', id = 'test', type = 'status', text = 'This is a test of the notification system. PERSISTENT', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
--     Wait(10000)
--     TriggerServerEvent('mythic_notify:server:PersistentAlert', { action = 'end', id = 'test' })
-- end)