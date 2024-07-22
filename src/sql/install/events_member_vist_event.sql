delimiter ;
CREATE TABLE `events_member_vist_event` (
  `memberid` varchar(50) NOT NULL DEFAULT '',
  `eventid` varchar(36) NOT NULL,
  `scanns` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`memberid`,`eventid`),
  KEY `fk_events_member_vist_event_events` (`eventid`),
  CONSTRAINT `fk_events_member_vist_event_events` FOREIGN KEY (`eventid`) REFERENCES `events_event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_events_member_vist_event_members` FOREIGN KEY (`memberid`) REFERENCES `events_member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE
);