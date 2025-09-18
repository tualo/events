<?php

namespace Tualo\Office\Events\Routes;

use Tualo\Office\Basic\TualoApplication as App;
use Tualo\Office\Basic\Route as BasicRoute;
use Tualo\Office\PUG\DomPDFRenderingHelper;
use Tualo\Office\Basic\IRoute;
use Tualo\Office\DS\DSFiles;
use Tualo\Office\PUG\PDF as P;
use Tualo\Office\PUG\PDF2 as PDF2;

class TicketMail implements IRoute
{
    public static function register()
    {


        BasicRoute::add('/ticketmail' . '', function ($matches) {
            try {
                $db = App::get('session')->getDB();
                App::contenttype('application/json');
                set_time_limit(600);

                if (!file_exists(App::get("basePath") . '/cache/' . $db->dbname)) {
                    mkdir(App::get("basePath") . '/cache/' . $db->dbname);
                }
                if (!file_exists(App::get("basePath") . '/cache/' . $db->dbname . '/ds')) {
                    mkdir(App::get("basePath") . '/cache/' . $db->dbname . '/ds');
                }
                $GLOBALS['pug_cache'] = App::get("basePath") . '/cache/' . $db->dbname . '/ds';


                $sql = 'select distinct order_id,email,name from view_member_booked_events ';
                $list = $db->direct($sql);
                foreach ($list as $key => $row) {
                    $attachments = [];
                    $sql = 'select id from event_tickets where order_id = {order_id} and email is null';
                    $trows = $db->direct($sql, $row);
                    if (count($trows) > 0) {

                        foreach ($trows as $trow) {
                            $attachments[] = [
                                'path' => App::get('tempPath') . '/' . $trow['id'] . '.pdf',
                                'name' => $trow['id'] . '.pdf'
                            ];
                            $data = PDF2::render('event_tickets', 'ticket', $trow['id']);
                            file_put_contents(App::get('tempPath') . '/' . $trow['id'] . '.pdf', $data);
                        }
                        App::result('attachments', $attachments);

                        \Tualo\Office\Mail\Spooler::addMail(
                            App::configuration('events', 'mail_subject', 'Dein Ticketkauf'), // "Dein Ticketkauf bei Kaiserwerke Gera",
                            App::configuration('events', 'mail_from', 'eventservice@kaiserwerke.de'),
                            $row['email'],
                            strip_tags(
                                \Tualo\Office\PUG\PUG::render(
                                    'text-mail-ticket',
                                    [
                                        'data' => [
                                            'ticketname' => $row['name'],
                                        ]
                                    ]
                                )
                            ),
                            $attachments

                        );
                        foreach ($trows as $trow) {
                            $sql = 'update event_tickets set email={email} where id={id}';
                            $db->direct($sql, [
                                'email' => $row['email'],
                                'id' => $trow['id']
                            ]);
                        }
                        /*
                        foreach($attachments as $attachment){
                            if (file_exists($attachment['path'])){
                                unlink($attachment['path']);
                            }
                        }
                            */
                    }
                }
                //$mail->addAttachment( App::get("tempPath").'/'.$item->get('attachment_file') ,$name);

                App::result('success', true);
            } catch (\Exception $e) {
                App::result('msg', $e->getMessage());
            }
        }, ['get'], true);
    }
}
/*

\Tualo\Office\Mail\Spooler::addMail(
    "Deine Authentifikations-PIN",
    'eventservice@kaiserwerke.de',
    $cms['session']->get('mail'),
    strip_tags(\Tualo\Office\PUG\PUG::render('text-mail-pin',[ 'data'=>[
        'ticketname'=>$cms['session']->get('tickettypes',[['name'=>'FEHLER']])[0]['name'],
        'emailPIN'=>$cms['session']->get('emailPIN','*****')
    ] ]))

);
*/