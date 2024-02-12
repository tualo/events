DELIMITER ;
CREATE TABLE IF NOT EXISTS `events_bilder_typen` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_events_bilder_typ` (`name`)
);


insert ignore into events_bilder_typen (id,name) values ('teaser','teaser');