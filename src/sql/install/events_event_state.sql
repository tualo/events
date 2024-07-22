delimiter ;
CREATE TABLE `events_event_state` (
  `eventid` varchar(32) NOT NULL,
  `stateid` varchar(32) NOT NULL,
  PRIMARY KEY (`eventid`,`stateid`),
  KEY `fk_events_member_states_stateid` (`stateid`),
  CONSTRAINT `fk_events_event_state_eventid` FOREIGN KEY (`eventid`) REFERENCES `events_event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_events_member_states_stateid` FOREIGN KEY (`stateid`) REFERENCES `events_member_states` (`stateid`) ON DELETE CASCADE ON UPDATE CASCADE
);