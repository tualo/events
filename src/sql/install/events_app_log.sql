delimiter ;
CREATE TABLE `events_app_log` (
  `id` varchar(36) NOT NULL,
  `created` datetime NOT NULL,
  `request_data` longtext DEFAULT NULL,
  `result_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
);