DELIMITER;
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `ds` (`allowform`,`alternativeformxtype`,`character_set_name`,`class_name`,`combined`,`default_pagesize`,`existsreal`,`globalsearch`,`listselectionmodel`,`listviewbaseclass`,`listxtypeprefix`,`modelbaseclass`,`phpexporter`,`phpexporterfilename`,`searchany`,`showactionbtn`,`syncable`,`table_name`,`use_history`) VALUES ('1','','','Events','0','100','1','0','cellmodel','Tualo.DataSets.ListView','listview','Tualo.DataSets.model.Basic','XlsxWriter','{GUID}','1','1','0','events_member_credentials','0') ON DUPLICATE KEY UPDATE `allowform`=values(`allowform`),`alternativeformxtype`=values(`alternativeformxtype`),`character_set_name`=values(`character_set_name`),`class_name`=values(`class_name`),`combined`=values(`combined`),`default_pagesize`=values(`default_pagesize`),`existsreal`=values(`existsreal`),`globalsearch`=values(`globalsearch`),`listselectionmodel`=values(`listselectionmodel`),`listviewbaseclass`=values(`listviewbaseclass`),`listxtypeprefix`=values(`listxtypeprefix`),`modelbaseclass`=values(`modelbaseclass`),`phpexporter`=values(`phpexporter`),`phpexporterfilename`=values(`phpexporterfilename`),`searchany`=values(`searchany`),`showactionbtn`=values(`showactionbtn`),`syncable`=values(`syncable`),`table_name`=values(`table_name`),`use_history`=values(`use_history`); 
INSERT IGNORE INTO `ds_column` (`character_maximum_length`,`character_set_name`,`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`is_referenced`,`note`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('32','utf8mb3','PRI','memberid','varchar(32)','varchar','10000000','0','0','1','','','NO','1','NO','','select,insert,update,references','0','events_member_credentials','1') ; 
INSERT IGNORE INTO `ds_column` (`character_maximum_length`,`character_set_name`,`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`is_referenced`,`note`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('255','utf8mb3','','psw','varchar(255)','varchar','10000000','0','0','1','','','NO','0','NO','','select,insert,update,references','0','events_member_credentials','1') ; 
INSERT IGNORE INTO `ds_column` (`character_maximum_length`,`character_set_name`,`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`is_referenced`,`note`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('255','utf8mb3','','pswsalt','varchar(255)','varchar','10000000','0','0','1','','','NO','0','NO','','select,insert,update,references','0','events_member_credentials','1') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','left','memberid','ASC','','','1.00','0','0','memberid','DE','','0','','','','events_member_credentials','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('0','start','psw','ASC','','','1.00','0','1','psw','DE','','999','','','','events_member_credentials','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('0','start','pswsalt','ASC','','','1.00','0','1','pswsalt','DE','','999','','','','events_member_credentials','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('0','1','memberid','Allgemein','0','memberid','DE','0','events_member_credentials','displayfield') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('0','0','psw','Allgemein','1','psw','DE','999','events_member_credentials','displayfield') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('0','0','pswsalt','Allgemein','1','pswsalt','DE','999','events_member_credentials','displayfield') ; 
INSERT IGNORE INTO `ds_reference_tables` (`active`,`autosync`,`columnsdef`,`constraint_name`,`existsreal`,`path`,`position`,`reference_table_name`,`searchable`,`table_name`,`tabtitle`) VALUES ('0','1','{\"events_member_credentials__memberid\":\"events_member__memberid\"}','fk_events_member_credentials_memberid','0','','99999','events_member','0','events_member_credentials','') ; 
INSERT IGNORE INTO `ds_access` (`append`,`delete`,`read`,`role`,`table_name`,`write`) VALUES ('0','0','0','_default_','events_member_credentials','0') ; 
INSERT IGNORE INTO `ds_access` (`append`,`delete`,`read`,`role`,`table_name`,`write`) VALUES ('0','0','0','administration','events_member_credentials','0') ; 
SET FOREIGN_KEY_CHECKS=1;