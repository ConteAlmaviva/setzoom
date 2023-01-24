_addon.author   = 'Almavivaconte';
_addon.name     = 'SetZoom';
_addon.version  = '0.0.1';

require 'common'

local town_zones = {
    26,
    48,
    50,
    53,
    71,
    80,
    87,
    94,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    238,
    239,
    240,
    241,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    252
}

function set_zoom()
    current_zone = AshitaCore:GetDataManager():GetParty():GetMemberZone(0);
    AshitaCore:GetChatManager():QueueCommand("/minimap zoom .2", 1);
    for k,v in pairs(town_zones) do
        if v == current_zone then
            AshitaCore:GetChatManager():QueueCommand("/minimap zoom .7", 1);
            return
        end
    end
end

ashita.register_event('incoming_packet', function(id, size, data, modified, blocked)
    
    if (id == 0x00A) then
        ashita.timer.once(5,set_zoom);
    end
    return false;
end);