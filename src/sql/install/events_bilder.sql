DELIMITER ;
CREATE TABLE IF NOT EXISTS `events_bilder` (
  `id` varchar(36) NOT NULL,
  `eventid` varchar(36) NOT NULL,
  `typ` varchar(36) default 'teaser',
  `file_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_events_bilder_typ` (`typ`),
  KEY `idx_events_bilder_eventid` (`eventid`),
  CONSTRAINT `fk_events_bilder_typ` FOREIGN KEY (`typ`) REFERENCES `events_bilder_typen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_events_bilder_eventid` FOREIGN KEY (`eventid`) REFERENCES `events_event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE
) ;



CREATE VIEW if not exists `view_readtable_events_bilder` AS
select
    `events_bilder`.`id` AS `id`,
    `events_bilder`.`typ` AS `typ`,
    `events_bilder`.`eventid` AS `eventid`,
    
    `ds_files`.`name` AS `__file_name`,
    `ds_files`.`path` AS `path`,
    `ds_files`.`size` AS `__file_size`,
    `ds_files`.`mtime` AS `mtime`,
    `ds_files`.`ctime` AS `ctime`,
    `ds_files`.`type` AS `__file_type`,
    `ds_files`.`file_id` AS `__file_id`,
    `ds_files`.`hash` AS `hash`,
    '' AS `__file_data`
from
    (
        `events_bilder`
        left join `ds_files` on(
            `events_bilder`.`file_id` = `ds_files`.`file_id`
        )
    );
    