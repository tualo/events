
CREATE TABLE `event_tickets_scanned` (
  `id` varchar(36) NOT NULL,
  `scanns` int(11) DEFAULT 0,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_event_tickets_scanned_id` FOREIGN KEY (`id`) REFERENCES `event_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);


create or replace view event_ticket_scanner as
select 

event_tickets.id id,
json_object(
    'id',event_tickets.id,
    'code',event_tickets.id,
    'event_name',events_event.name,
    'event_date',events_event.start,
    'ticket_type',event_tickets_categorie.categorie,
    'customer_name',ifnull(concat(event_tickets.vorname,' ',event_tickets.nachname),'nicht hinterlegt'),
    'customer_email',event_tickets.email,
    'price', blg_pos_eventrn.brutto,
    'unpaid',blg_hdr_eventrn.offen,
    'order_id',event_tickets.order_id,
    'created_at',ifnull(blg_hdr_eventrn.create_timestamp,now()),
    'scanner_user_id',null,

    'scanns', event_tickets_scanned.scanns,
    'scanned_at', event_tickets_scanned.createtime,
    'last_scanned_at', event_tickets_scanned.updatetime,
    'additional_data', ""
) ticketdata
 from 

event_tickets
join events_event
    on event_tickets.event_id = events_event.eventid
join event_tickets_categorie
    on event_tickets.categorie_id = event_tickets_categorie.id
left join blg_hdr_eventrn
    on blg_hdr_eventrn.order_id =  event_tickets.order_id
left join blg_pos_eventrn
    on blg_pos_eventrn.event_id = event_tickets.event_id
    and blg_pos_eventrn.categorie_id = event_tickets.categorie_id
    and blg_hdr_eventrn.id = blg_pos_eventrn.beleg
left join event_tickets_scanned
    on event_tickets_scanned.id = event_tickets.id 
;



SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `ds` (`allowform`,`alternativeformxtype`,`autosave`,`base_store_class`,`character_set_name`,`class_name`,`combined`,`cssstyle`,`default_pagesize`,`displayfield`,`existsreal`,`globalsearch`,`hint`,`listselectionmodel`,`listviewbaseclass`,`listxtypeprefix`,`modelbaseclass`,`overview_tpl`,`phpexporter`,`phpexporterfilename`,`read_filter`,`read_table`,`reorderfield`,`searchany`,`searchfield`,`showactionbtn`,`sortfield`,`special_add_panel`,`syncable`,`sync_table`,`sync_view`,`table_name`,`title`,`use_history`,`use_insert_for_update`,`writetable`) VALUES ('0','','0','Tualo.DataSets.data.Store','','Unklassifiziert','0','','1000','id','1','0','','cellmodel','Tualo.DataSets.ListView','','Tualo.DataSets.model.Basic','','XlsxWriter','event_ticket_scanner {DATE} {TIME}','','','','0','id','1','','','0','','','event_ticket_scanner','event_ticket_scanner','0','0','') ON DUPLICATE KEY UPDATE `allowform`=values(`allowform`),`alternativeformxtype`=values(`alternativeformxtype`),`autosave`=values(`autosave`),`base_store_class`=values(`base_store_class`),`character_set_name`=values(`character_set_name`),`class_name`=values(`class_name`),`combined`=values(`combined`),`cssstyle`=values(`cssstyle`),`default_pagesize`=values(`default_pagesize`),`displayfield`=values(`displayfield`),`existsreal`=values(`existsreal`),`globalsearch`=values(`globalsearch`),`hint`=values(`hint`),`listselectionmodel`=values(`listselectionmodel`),`listviewbaseclass`=values(`listviewbaseclass`),`listxtypeprefix`=values(`listxtypeprefix`),`modelbaseclass`=values(`modelbaseclass`),`overview_tpl`=values(`overview_tpl`),`phpexporter`=values(`phpexporter`),`phpexporterfilename`=values(`phpexporterfilename`),`read_filter`=values(`read_filter`),`read_table`=values(`read_table`),`reorderfield`=values(`reorderfield`),`searchany`=values(`searchany`),`searchfield`=values(`searchfield`),`showactionbtn`=values(`showactionbtn`),`sortfield`=values(`sortfield`),`special_add_panel`=values(`special_add_panel`),`syncable`=values(`syncable`),`sync_table`=values(`sync_table`),`sync_view`=values(`sync_view`),`table_name`=values(`table_name`),`title`=values(`title`),`use_history`=values(`use_history`),`use_insert_for_update`=values(`use_insert_for_update`),`writetable`=values(`writetable`); 
INSERT IGNORE INTO `ds_column` (`character_maximum_length`,`character_set_name`,`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`default_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_generated`,`is_nullable`,`is_primary`,`is_referenced`,`note`,`numeric_precision`,`numeric_scale`,`privileges`,`referenced_column_name`,`referenced_table`,`syncable`,`table_name`,`update_value`,`writeable`) VALUES ('36','utf8mb4','','id','varchar(36)','varchar','0','0','','0','1','','','NEVER','NO','1','','','0','0','select,insert,update,references','','','0','event_ticket_scanner','','1') ; 
INSERT IGNORE INTO `ds_column` (`character_maximum_length`,`character_set_name`,`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`is_generated`,`is_nullable`,`is_primary`,`numeric_precision`,`numeric_scale`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('65535','utf8mb4','','ticketdata','text','text','0','0','0','1','','NEVER','YES','0','0','0','select,insert,update,references','0','event_ticket_scanner','1') ; 
INSERT IGNORE INTO `ds_column` (`character_maximum_length`,`character_set_name`,`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`is_generated`,`is_nullable`,`is_primary`,`numeric_precision`,`numeric_scale`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('65535','utf8mb4','','x','text','text','0','0','0','0','','NEVER','YES','0','0','0','select,insert,update,references','0','event_ticket_scanner','0') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','start','id','','','1','0','0','id','DE','','0','','','','event_ticket_scanner','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','start','ticketdata','','','1','0','0','ticketdata','DE','','1','','','','event_ticket_scanner','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('0','start','x','','','1','0','0','x','DE','','2','','','','event_ticket_scanner','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`flex`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','id','Allgemein','1','0','id','DE','0','event_ticket_scanner','displayfield') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`flex`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','ticketdata','Allgemein','1','0','ticketdata','DE','1','event_ticket_scanner','displayfield') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`flex`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('0','0','x','Allgemein','1','0','x','DE','2','event_ticket_scanner','displayfield') ; 
INSERT IGNORE INTO `ds_access` (`append`,`delete`,`read`,`role`,`table_name`,`write`) VALUES ('0','0','1','_default_','event_ticket_scanner','0') ; 
INSERT IGNORE INTO `ds_access` (`append`,`delete`,`read`,`role`,`table_name`,`write`) VALUES ('0','0','0','administration','event_ticket_scanner','0') ; 
SET FOREIGN_KEY_CHECKS=1;

call fill_ds('event_ticket_scanner');
call fill_ds_column('event_ticket_scanner');
