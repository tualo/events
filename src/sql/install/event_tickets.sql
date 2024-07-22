delimiter ;
CREATE TABLE `event_tickets` (
  `id` varchar(36) NOT NULL DEFAULT uuid(),
  `event_id` varchar(32) NOT NULL,
  `categorie_id` varchar(32) NOT NULL,
  `anrede` varchar(100) DEFAULT NULL,
  `vorname` varchar(100) DEFAULT NULL,
  `nachname` varchar(100) DEFAULT NULL,
  `geboren` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `order_id` varchar(36) NOT NULL,
  `changes` tinyint(4) DEFAULT 0,
  `redeemed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_tickets_event_id` (`event_id`),
  KEY `fk_event_tickets_categorie_id` (`categorie_id`),
  CONSTRAINT `fk_event_tickets_categorie_id` FOREIGN KEY (`categorie_id`) REFERENCES `event_tickets_categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_event_tickets_event_id` FOREIGN KEY (`event_id`) REFERENCES `events_event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE
);