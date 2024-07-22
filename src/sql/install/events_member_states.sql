delimiter ;
CREATE TABLE `events_member_states` (
  `stateid` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(16,5) DEFAULT 0.00000,
  `duration` int(11) DEFAULT 0,
  PRIMARY KEY (`stateid`),
  UNIQUE KEY `uidx_events_members_states_name` (`name`)
);