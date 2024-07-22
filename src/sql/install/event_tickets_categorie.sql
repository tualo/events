delimiter ;
CREATE TABLE `event_tickets_categorie` (
  `id` varchar(32) NOT NULL DEFAULT uuid(),
  `categorie` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorie` (`categorie`)
);