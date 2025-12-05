<?php

namespace Tualo\Office\Events\Routes;

use Tualo\Office\Basic\TualoApplication as App;
use Tualo\Office\Basic\Route as BasicRoute;
use Tualo\Office\Basic\IRoute;
use Tualo\Office\DS\DSFiles;

class ValidateTicket extends \Tualo\Office\Basic\RouteWrapper
{
    public static function register()
    {

        BasicRoute::alias('/ticket-scanner-app/ping', '/dashboard/ping');

        BasicRoute::add('/ticket-scanner-app/info' . '', function ($matches) {
            try {
                $db = App::get('session')->getDB();
                App::contenttype('application/json');
                App::result('appIcon', "https://kaiserwerke.de/img/kw.svg");
                App::result('appTitle', "KAISERWERKE");
                App::result('baseColor', "rgb(200,0,0)");
                App::result('textColor', "rgb(200,200,200)");
                App::result('appInfoText', "Tualo Ticket Scanner App v1.0\nDeveloped by Tualo GmbH");
                App::result('success', true);
            } catch (\Exception $e) {
                App::result('msg', $e->getMessage());
            }
        }, ['get'], false);

        BasicRoute::add('/ticket-scanner-app/scanTicket' . '', function ($matches) {
            try {
                $db = App::get('session')->getDB();
                App::result('success', false);
                App::contenttype('application/json');
                $searchcode = isset($_POST['ticket_code']) ? $_POST['ticket_code'] : '';

                $event_tickets_scanned = \Tualo\Office\DS\DSTable::instance('event_tickets_scanned');
                $event_tickets_scanned->f('id', 'eq', $searchcode);
                $scanned = $event_tickets_scanned->read()->getSingle();
                if (!isset($scanned['id'])) $scanned = false;

                $o = [
                    'id' => $searchcode,
                    'scanns' => isset($scanned['scanns']) ? ($scanned['scanns'] + 1) : 1
                ];
                if (isset($scanned['createtime'])) {
                    $o['createtime'] = $scanned['createtime'];
                }
                $event_tickets_scanned->insert($o);
                App::result('success', true);
            } catch (\Exception $e) {
                App::result('msg', $e->getMessage());
            }
        }, ['get', 'post'], true);

        BasicRoute::add('/ticket-scanner-app/validateTicket' . '', function ($matches) {
            try {
                $db = App::get('session')->getDB();
                App::contenttype('application/json');

                $searchcode = isset($_POST['ticket_code']) ? $_POST['ticket_code'] : '';

                $view_event_order_tickets = \Tualo\Office\DS\DSTable::instance('event_tickets');
                $view_event_order_tickets->f('id', '=', $searchcode);
                $ticket = $view_event_order_tickets->read()->getSingle();

                if (!isset($ticket['order_id'])) $ticket = false;


                if ($ticket !== false) {
                    $event_tickets_scanned = \Tualo\Office\DS\DSTable::instance('event_tickets_scanned');
                    $event_tickets_scanned->f('id', 'eq', $ticket['id']);
                    $scanned = $event_tickets_scanned->read()->getSingle();
                    if (!isset($scanned['id'])) $scanned = false;

                    $o = [
                        'id' => $ticket['id'],
                        'scanns' => isset($scanned['scanns']) ? ($scanned['scanns'] + 1) : 1
                    ];
                    if (isset($scanned['createtime'])) {
                        $o['createtime'] = $scanned['createtime'];
                    }
                    $event_tickets_scanned->insert($o);
                }

                App::result('success', $ticket !== false);
                App::result(
                    'ticket',
                    json_decode(\Tualo\Office\DS\DSTable::instance('event_ticket_scanner')->f('id', 'eq', $ticket['id'])->read()->getSingleValue('ticketdata'), true)
                );
                App::result('scanned', isset($scanned['id']));
                App::result('lastScanned', isset($scanned['id']) ? $scanned['createtime'] : null);
            } catch (\Exception $e) {
                App::result('msg', $e->getMessage());
            }
        }, ['get', 'post'], true);
    }
}
