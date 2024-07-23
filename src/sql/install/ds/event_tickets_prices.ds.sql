DELIMITER;
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `ds` (`allowform`,`alternativeformxtype`,`character_set_name`,`class_name`,`combined`,`cssstyle`,`default_pagesize`,`displayfield`,`existsreal`,`globalsearch`,`hint`,`listselectionmodel`,`listviewbaseclass`,`listxtypeprefix`,`modelbaseclass`,`overview_tpl`,`phpexporter`,`phpexporterfilename`,`read_filter`,`read_table`,`reorderfield`,`searchany`,`searchfield`,`showactionbtn`,`sortfield`,`special_add_panel`,`syncable`,`sync_table`,`sync_view`,`table_name`,`title`,`use_history`,`writetable`) VALUES ('1','','','Events','0','','100','event_id','1','0','','cellmodel','Tualo.DataSets.ListView','listview','Tualo.DataSets.model.Basic','','XlsxWriter','{GUID}','','','event_id','1','','1','event_id','','0','','','event_tickets_prices','Tickets','0','') ON DUPLICATE KEY UPDATE `allowform`=values(`allowform`),`alternativeformxtype`=values(`alternativeformxtype`),`character_set_name`=values(`character_set_name`),`class_name`=values(`class_name`),`combined`=values(`combined`),`cssstyle`=values(`cssstyle`),`default_pagesize`=values(`default_pagesize`),`displayfield`=values(`displayfield`),`existsreal`=values(`existsreal`),`globalsearch`=values(`globalsearch`),`hint`=values(`hint`),`listselectionmodel`=values(`listselectionmodel`),`listviewbaseclass`=values(`listviewbaseclass`),`listxtypeprefix`=values(`listxtypeprefix`),`modelbaseclass`=values(`modelbaseclass`),`overview_tpl`=values(`overview_tpl`),`phpexporter`=values(`phpexporter`),`phpexporterfilename`=values(`phpexporterfilename`),`read_filter`=values(`read_filter`),`read_table`=values(`read_table`),`reorderfield`=values(`reorderfield`),`searchany`=values(`searchany`),`searchfield`=values(`searchfield`),`showactionbtn`=values(`showactionbtn`),`sortfield`=values(`sortfield`),`special_add_panel`=values(`special_add_panel`),`syncable`=values(`syncable`),`sync_table`=values(`sync_table`),`sync_view`=values(`sync_view`),`table_name`=values(`table_name`),`title`=values(`title`),`use_history`=values(`use_history`),`writetable`=values(`writetable`); 
INSERT IGNORE INTO `ds_column` (`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`note`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('','available_from','datetime','datetime','10000000','0','0','1','','','NO','0','','select,insert,update,references','0','event_tickets_prices','1') ; 
INSERT IGNORE INTO `ds_column` (`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`note`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('','available_to','datetime','datetime','10000000','0','0','1','','','NO','0','','select,insert,update,references','0','event_tickets_prices','1') ; 
INSERT IGNORE INTO `ds_column` (`character_maximum_length`,`character_set_name`,`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`note`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('32','utf8mb3','PRI','categorie_id','varchar(32)','varchar','10000000','0','0','1','','','NO','1','','select,insert,update,references','0','event_tickets_prices','1') ; 
INSERT IGNORE INTO `ds_column` (`character_maximum_length`,`character_set_name`,`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`note`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('32','utf8mb3','PRI','event_id','varchar(32)','varchar','10000000','0','0','1','','','NO','1','','select,insert,update,references','0','event_tickets_prices','1') ; 
INSERT IGNORE INTO `ds_column` (`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`note`,`numeric_precision`,`numeric_scale`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('','personalized','tinyint(4)','tinyint','10000000','0','0','1','','','YES','0','','3','0','select,insert,update,references','0','event_tickets_prices','1') ; 
INSERT IGNORE INTO `ds_column` (`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`note`,`numeric_precision`,`numeric_scale`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('','price','decimal(10,2)','decimal','10000000','0','0','1','','','YES','0','','10','2','select,insert,update,references','0','event_tickets_prices','1') ; 
INSERT IGNORE INTO `ds_column` (`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`note`,`numeric_precision`,`numeric_scale`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('','quota','int(10) unsigned','int','10000000','0','0','1','','','YES','0','','10','0','select,insert,update,references','0','event_tickets_prices','1') ; 
INSERT IGNORE INTO `ds_column` (`column_key`,`column_name`,`column_type`,`data_type`,`default_max_value`,`default_min_value`,`deferedload`,`existsreal`,`fieldtype`,`hint`,`is_nullable`,`is_primary`,`note`,`numeric_precision`,`numeric_scale`,`privileges`,`syncable`,`table_name`,`writeable`) VALUES ('','sold','int(11)','int','10000000','0','0','1','','','YES','0','','10','0','select,insert,update,references','0','event_tickets_prices','1') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','','available_from','','','','1.00','0','0','Verfügbar ab','DE','','999','','','','event_tickets_prices','datecolumn') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','','available_to','','','','1.00','0','0','Verfügbar bis','DE','','999','','','','event_tickets_prices','datecolumn') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','left','categorie_id','ASC','','','1.00','0','0','Kategorie','DE','','0','','','','event_tickets_prices','column_event_tickets_categorie_event_tickets_categorie') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','','event_id','','','','1.00','0','0','event_id','DE','','0','','','','event_tickets_prices','column_events_event_events_event') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','','personalized','','','','1.00','0','0','Personalisieren','DE','','999','','','','event_tickets_prices','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','','price','','','','1.00','0','0','Preis (brutto)','DE','','999','','','','event_tickets_prices','tualocolumnnumber2') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','','quota','','','','1.00','0','0','Anzahl','DE','','999','','','','event_tickets_prices','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_list_label` (`active`,`align`,`column_name`,`direction`,`editor`,`filterstore`,`flex`,`grouped`,`hidden`,`label`,`language`,`listfiltertype`,`position`,`renderer`,`summaryrenderer`,`summarytype`,`table_name`,`xtype`) VALUES ('1','','sold','','','','1.00','0','0','Verkauft','DE','','999','','','','event_tickets_prices','gridcolumn') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','available_from','Allgemein','0','Verfügbar ab','DE','2','event_tickets_prices','datefield') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','available_to','Allgemein','0','Verfügbar bis','DE','3','event_tickets_prices','datefield') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','categorie_id','Allgemein','0','Kategorie','DE','1','event_tickets_prices','combobox_event_tickets_categorie_event_tickets_categorie') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','event_id','Allgemein','0','event_id','DE','0','event_tickets_prices','combobox_events_event_events_event') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','personalized','Allgemein','0','Personalisieren','DE','999','event_tickets_prices','checkbox') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','price','Allgemein','0','Preis (brutto)','DE','5','event_tickets_prices','number2') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','quota','Allgemein','0','Anzahl','DE','4','event_tickets_prices','number0') ; 
INSERT IGNORE INTO `ds_column_form_label` (`active`,`allowempty`,`column_name`,`field_path`,`hidden`,`label`,`language`,`position`,`table_name`,`xtype`) VALUES ('1','0','sold','Allgemein','0','Verkauft','DE','999','event_tickets_prices','displayfield') ; 
INSERT IGNORE INTO `ds_reference_tables` (`active`,`autosync`,`columnsdef`,`constraint_name`,`existsreal`,`path`,`position`,`reference_table_name`,`searchable`,`table_name`,`tabtitle`) VALUES ('1','1','{\"event_tickets_prices__event_id\":\"events_event__eventid\"}','fk_event_tickets_prices_event_id','0','\'\'','99999','events_event','0','event_tickets_prices','') ; 
INSERT IGNORE INTO `ds_reference_tables` (`active`,`autosync`,`columnsdef`,`constraint_name`,`existsreal`,`path`,`position`,`reference_table_name`,`searchable`,`table_name`,`tabtitle`) VALUES ('1','1','{\"event_tickets_prices__categorie_id\":\"event_tickets_categorie__id\"}','fk_event_tickets_prices_categorie_id','0','\'\'','99999','event_tickets_categorie','0','event_tickets_prices','') ; 
INSERT IGNORE INTO `ds_access` (`append`,`delete`,`read`,`role`,`table_name`,`write`) VALUES ('0','0','0','_default_','event_tickets_prices','0') ; 
INSERT IGNORE INTO `ds_access` (`append`,`delete`,`read`,`role`,`table_name`,`write`) VALUES ('1','0','1','administration','event_tickets_prices','1') ; 
SET FOREIGN_KEY_CHECKS=1;