CREATE OR REPLACE VIEW `view_event_einlassliste` AS
select
    `events_member_vist_event_scanned`.`createtime` AS `createtime`,
    `events_member`.`email` AS `email`,
    `events_member`.`member_phone` AS `member_phone`,
    `events_member`.`member_firstname` AS `member_firstname`,
    `events_member`.`member_lastname` AS `member_lastname`,
    `events_member`.`member_street` AS `member_street`,
    `events_member`.`member_zipcode` AS `member_zipcode`,
    `events_member`.`member_town` AS `member_town`,
    `events_event`.`name` AS `name`,
    `events_event`.`start` AS `start`
from
    (
        (
            `events_member_vist_event_scanned`
            join `events_member` on(
                `events_member`.`memberid` = `events_member_vist_event_scanned`.`memberid`
            )
        )
        join `events_event` on(
            `events_event`.`eventid` = `events_member_vist_event_scanned`.`eventid`
        )
    )