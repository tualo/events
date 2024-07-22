delimiter ;
CREATE TABLE `events_member_state` (
  `stateid` varchar(50) NOT NULL DEFAULT '',
  `memberid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`memberid`,`stateid`),
  UNIQUE KEY `uidx_events_members_state_memberid` (`memberid`),
  KEY `fk_events_member_state_stateid` (`stateid`),
  CONSTRAINT `fk_events_member_state_event_members` FOREIGN KEY (`memberid`) REFERENCES `events_member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_events_member_state_stateid` FOREIGN KEY (`stateid`) REFERENCES `events_member_states` (`stateid`) ON DELETE CASCADE ON UPDATE CASCADE
);