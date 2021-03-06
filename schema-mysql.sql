CREATE TABLE `settings` (
`name` TINYTEXT NOT NULL,
`value` TEXT NOT NULL,
PRIMARY KEY ( `name`(255) )
) ENGINE = MYISAM;

INSERT INTO `settings` (`name`, `value`) VALUES ('last_read_log_smbd_line', '0');
INSERT INTO `settings` (`name`, `value`) VALUES ('last_OOS_notification', '0');

CREATE TABLE `tasks` (
`id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`action` VARCHAR( 10 ) NOT NULL,
`share` TINYTEXT NOT NULL,
`full_path` TINYTEXT NULL,
`additional_info` TINYTEXT NULL,
`complete` ENUM( 'yes',  'no', 'frozen', 'thawed', 'idle') NOT NULL,
`event_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = MYISAM;

ALTER TABLE `tasks` ADD INDEX `find_next_task` ( `complete` , `share` (64) , `id` );

CREATE TABLE `tasks_completed` (
`id` BIGINT UNSIGNED NOT NULL,
`action` VARCHAR( 10 ) NOT NULL,
`share` TINYTEXT NOT NULL,
`full_path` TINYTEXT NULL,
`additional_info` TINYTEXT NULL,
`complete` ENUM( 'yes',  'no' ) NOT NULL,
`event_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = MYISAM;
