CREATE OR REPLACE VIEW `view_events_member` AS
select
    `events_member`.`memberid` AS `memberid`,
    `events_member`.`email` AS `email`,
    `events_member`.`email_confirmed` AS `email_confirmed`,
    `events_member`.`member_firstname` AS `member_firstname`,
    `events_member`.`member_lastname` AS `member_lastname`,
    `events_member`.`member_street` AS `member_street`,
    `events_member`.`member_zipcode` AS `member_zipcode`,
    `events_member`.`member_town` AS `member_town`,
    `events_member`.`emailtoken` AS `emailtoken`,
    `events_member`.`kostenstelle` AS `kostenstelle`,
    `events_member`.`accesscontroll` AS `accesscontroll`,
    `events_member`.`preiskategorie` AS `preiskategorie`,
    `events_member`.`aktiv` AS `aktiv`,
    `events_member`.`request_retry` AS `request_retry`,
    `events_member`.`memberid` AS `kundennummer`
from
    `events_member`