<?php
namespace Tualo\Office\Events\Routes;
use Tualo\Office\Basic\TualoApplication as App;
use Tualo\Office\Basic\Route as BasicRoute;
use Tualo\Office\Basic\IRoute;
use Tualo\Office\DS\DSFiles;
use Tualo\Office\PUG\PDF as P;

class TicketMail implements IRoute{
    public static function register(){


        BasicRoute::add('/ticketmail'.'',function($matches){
            try{
                App::contenttype('application/json');

                $sql = 'select distinct order_id,email,description,name from view_member_booked_events where email="thomas.hoffmann@tualo.de"';
                $db = TualoApplication::get('session')->getDB();
                $list = $db->execute($sql);
                foreach($list as $key=>$row){
                    $sql = 'select id from event_tickets where order_id = {order_id}';
                    $db->direct($sql,$trows);
                    foreach($trows as $trow){
                        $_REQUEST['save']=$trow['id'].'.pdf';
                        P::get('event_tickets','ticket',$trow['id']);
                    }
                }
                $mail->addAttachment( App::get("tempPath").'/'.$item->get('attachment_file') ,$name);

                App::result('sucess', true);
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