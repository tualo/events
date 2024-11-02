<?php
namespace Tualo\Office\Events\Routes;
use Tualo\Office\Basic\TualoApplication as App;
use Tualo\Office\Basic\Route as BasicRoute;
use Tualo\Office\PUG\DomPDFRenderingHelper;
use Tualo\Office\Basic\IRoute;
use Tualo\Office\DS\DSFiles;
use Tualo\Office\PUG\PDF as P;

class TicketMail implements IRoute{
    public static function register(){


        BasicRoute::add('/ticketmail'.'',function($matches){
            try{
                App::contenttype('application/json');
                set_time_limit(600);
        
                if (!file_exists(App::get("basePath").'/cache/'.$db->dbname)){
                    mkdir(App::get("basePath").'/cache/'.$db->dbname);
                }
                if (!file_exists(App::get("basePath").'/cache/'.$db->dbname.'/ds')){
                    mkdir(App::get("basePath").'/cache/'.$db->dbname.'/ds');
                }
                $GLOBALS['pug_cache']=App::get("basePath").'/cache/'.$db->dbname.'/ds';
            
                
                $sql = 'select distinct order_id,email,name from view_member_booked_events where email="thomas.hoffmann@tualo.de"';
                $db = App::get('session')->getDB();
                $list = $db->direct($sql);
                foreach($list as $key=>$row){
                    $attachments = [];
                    $sql = 'select id from event_tickets where order_id = {order_id} and email is null';
                    $trows = $db->direct($sql,$row);
                    if (count($trows)>0){

                        foreach($trows as $trow){
                            $_REQUEST['save']=App::get('tempPath') . '/'.$trow['id'].'.pdf';
                            $attachments[] = [
                                'path'=>$_REQUEST['save'],
                                'name'=>$trow['id'].'.pdf'
                            ];
                            $_REQUEST['tablename']='event_tickets';
                            $matches=[
                                'tablename'=>'event_tickets',
                                'template'=>'ticket',
                                'id'=>$trow['id']
                            ];
                            DomPDFRenderingHelper::render($matches,$_REQUEST);
                        }
                        App::result('attachments', $attachments);

                        \Tualo\Office\Mail\Spooler::addMail(
                            "Dein Ticketkauf bei Kaiserwerke Gera",
                            'eventservice@kaiserwerke.de',
                            $row['mail'],
                            strip_tags(
                                \Tualo\Office\PUG\PUG::render('text-mail-ticket',[ 
                                    'data'=>[
                                        'ticketname'=>$row['name'],
                                    ] 
                                ]
                                )
                            ),
                            $attachments
                        
                        );

                    }
                }
                //$mail->addAttachment( App::get("tempPath").'/'.$item->get('attachment_file') ,$name);

                App::result('success', true);
            }catch(\Exception $e){
                App::result('msg', $e->getMessage());
            }
        
        },['get'],true);

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