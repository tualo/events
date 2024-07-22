delimiter ;
CREATE TABLE `eventz_gutschein` (
  `id` varchar(36) NOT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `events_member_states` varchar(36) NOT NULL,
  `memberid` varchar(50) DEFAULT NULL,
  `activated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eventz_gutschein_events_member_states` (`events_member_states`),
  KEY `fk_eventz_gutschein_memberid` (`memberid`),
  CONSTRAINT `fk_eventz_gutschein_events_member_states` FOREIGN KEY (`events_member_states`) REFERENCES `events_member_states` (`stateid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_eventz_gutschein_memberid` FOREIGN KEY (`memberid`) REFERENCES `events_member` (`memberid`) ON DELETE SET NULL ON UPDATE CASCADE
);