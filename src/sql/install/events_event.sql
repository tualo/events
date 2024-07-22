delimiter ;
CREATE TABLE `events_event` (
  `eventid` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description_md` longtext DEFAULT NULL,
  `description_html` longtext DEFAULT NULL,
  `start` datetime NOT NULL,
  `stop` datetime NOT NULL,
  `external_url` varchar(255) DEFAULT '',
  `steuersatz` int(11) DEFAULT 19,
  `bruttopreis` decimal(15,6) DEFAULT 0.000000,
  `promotion` tinyint(4) DEFAULT 0,
  `imagebild` int(11) DEFAULT 532,
  `genre` varchar(100) DEFAULT 'Party',
  PRIMARY KEY (`eventid`)
);