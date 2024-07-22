delimiter ;
CREATE TABLE `events_member_credentials` (
  `memberid` varchar(32) NOT NULL,
  `psw` varchar(255) NOT NULL,
  `pswsalt` varchar(255) NOT NULL,
  PRIMARY KEY (`memberid`),
  CONSTRAINT `fk_events_member_credentials_memberid` FOREIGN KEY (`memberid`) REFERENCES `events_member` (`memberid`) ON DELETE CASCADE ON UPDATE CASCADE
);