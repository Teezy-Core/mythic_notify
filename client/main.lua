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


RegisterCommand('testall', function()
	exports['mythic_notify']:SendAlert('inform', 'A', 2500)
	exports['mythic_notify']:SendAlert('success', 'B', 2500)
	exports['mythic_notify']:SendAlert('warning', 'C', 2500)
	exports['mythic_notify']:SendAlert('error', 'D', 2500)
	exports['mythic_notify']:SendAlert('status', 'E', 2500)
	exports['mythic_notify']:PersistentAlert('start', 'test', 'status', 'F')
	Wait(10000)
	exports['mythic_notify']:PersistentAlert('end', 'test')
end)