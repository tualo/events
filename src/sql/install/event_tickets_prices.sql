delimiter ;
CREATE TABLE `event_tickets_prices` (
  `event_id` varchar(32) NOT NULL,
  `categorie_id` varchar(32) NOT NULL,
  `available_from` datetime NOT NULL DEFAULT current_timestamp(),
  `available_to` datetime NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quota` int(10) unsigned DEFAULT NULL,
  `sold` int(11) DEFAULT 0,
  `personalized` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`event_id`,`categorie_id`),
  KEY `fk_event_tickets_prices_categorie_id` (`categorie_id`),
  CONSTRAINT `fk_event_tickets_prices_categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `event_tickets_categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_event_tickets_prices_event_id` FOREIGN KEY (`event_id`) REFERENCES `events_event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE
);