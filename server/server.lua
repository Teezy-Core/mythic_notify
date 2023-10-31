RegisterServerEvent('mythic_notify:server:SendAlert')
AddEventHandler('mythic_notify:server:SendAlert', function(data)
    TriggerClientEvent('mythic_notify:client:SendAlert', -1, data)
end)

RegisterServerEvent('mythic_notify:server:PersistentAlert')
AddEventHandler('mythic_notify:server:PersistentAlert', function(data)
    TriggerClientEvent('mythic_notify:client:PersistentAlert', -1, data)
end)
