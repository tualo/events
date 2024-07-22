<?php
namespace Tualo\Office\Events\Commandline;
use Tualo\Office\Basic\ICommandline;
use Tualo\Office\Basic\CommandLineInstallSQL;

class Install extends CommandLineInstallSQL  implements ICommandline{
    public static function getDir():string {   return dirname(__DIR__,1); }
    public static $shortName  = 'ds';
    public static $files = [
        'install/event_tickets_categorie' => 'setup event_tickets_categorie',
        'install/events_app_log' => 'setup events_app_log',
        'install/events_app_texts' => 'setup events_app_texts',
        'install/events_member_states' => 'setup events_member_states',
        'install/events_member' => 'setup events_member',
        'install/events_event' => 'setup events_event',
        'install/event_tickets' => 'setup event_tickets',
        'install/event_tickets_prices' => 'setup event_tickets_prices',
        'install/events_event_state' => 'setup events_event_state',
        'install/events_member_credentials' => 'setup events_member_credentials',
        'install/events_member_event' => 'setup events_member_event',
        'install/events_member_state' => 'setup events_member_state',
        'install/events_member_vist_event' => 'setup events_member_vist_event',
        'install/events_member_vist_event_scanned' => 'setup events_member_vist_event_scanned',
        
        'install/events_bilder.ds' => 'setup events_bilder.ds',
        'install/events_bilder' => 'setup events_bilder',
        'install/events_bilder_typen.ds' => 'setup events_bilder_typen.ds',
        'install/events_bilder_typen' => 'setup events_bilder_typen',

        'install/eventz_gutschein' => 'setup eventz_gutschein',
        'install/view_event_einlassliste' => 'setup view_event_einlassliste',
        'install/view_event_order_tickets' => 'setup view_event_order_tickets',
        'install/view_event_tickets_detail' => 'setup view_event_tickets_detail',
        'install/view_events_member' => 'setup view_events_member',
        'install/view_member_booked_events' => 'setup view_member_booked_events',



        'install/ds/event_tickets.ds' => 'setup event_tickets.ds',
        'install/ds/event_tickets_categorie.ds' => 'setup event_tickets_categorie.ds',
        'install/ds/event_tickets_prices.ds' => 'setup event_tickets_prices.ds',
        'install/ds/events_app_log.ds' => 'setup events_app_log.ds',
        'install/ds/events_app_texts.ds' => 'setup events_app_texts.ds',
        'install/ds/events_bilder.ds' => 'setup events_bilder.ds',
        'install/ds/events_bilder_typen.ds' => 'setup events_bilder_typen.ds',
        'install/ds/events_event.ds' => 'setup events_event.ds',
        'install/ds/events_event_state.ds' => 'setup events_event_state.ds',
        'install/ds/events_member.ds' => 'setup events_member.ds',
        'install/ds/events_member_credentials.ds' => 'setup events_member_credentials.ds',
        'install/ds/events_member_event.ds' => 'setup events_member_event.ds',
        'install/ds/events_member_state.ds' => 'setup events_member_state.ds',
        'install/ds/events_member_states.ds' => 'setup events_member_states.ds',
        'install/ds/events_member_vist_event.ds' => 'setup events_member_vist_event.ds',
        'install/ds/events_member_vist_event_scanned.ds' => 'setup events_member_vist_event_scanned.ds',
        'install/ds/eventz_gutschein.ds' => 'setup eventz_gutschein.ds',
        'install/ds/view_event_einlassliste.ds' => 'setup view_event_einlassliste.ds',
        'install/ds/view_event_order_tickets.ds' => 'setup view_event_order_tickets.ds',
        'install/ds/view_event_tickets_detail.ds' => 'setup view_event_tickets_detail.ds',
        'install/ds/view_events_member.ds' => 'setup view_events_member.ds',
        'install/ds/view_member_booked_events.ds' => 'setup view_member_booked_events.ds',
        'install/ds/view_tickets_available.ds' => 'setup view_tickets_available.ds',
            
    ];
    
}