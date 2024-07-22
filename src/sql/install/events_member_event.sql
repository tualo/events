delimiter ;
CREATE TABLE `events_member_event` (
  `eventid` varchar(32) NOT NULL DEFAULT '',
  `memberid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`memberid`,`eventid`),
  KEY `fk_events_event_stateid` (`eventid`),
  CONSTRAINT `fk_events_event_stateid` FOREIGN KEY (`eventid`) REFERENCES `events_event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_events_member_event_memberid` FOREIGN KEY (`memberid`) REFERENCES `events_member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE
);