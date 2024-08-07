CREATE OR REPLACE VIEW `view_event_order_tickets` AS
select
    `view_actual_eventlist`.`eventid` AS `event_id`,
    `view_actual_eventlist`.`name` AS `name`,
    `view_actual_eventlist`.`datum_de` AS `start`,
    `view_actual_eventlist`.`genre` AS `genre`,
    `view_actual_eventlist`.`wtag_lang` AS `wtag`,
    `event_tickets_prices`.`price` AS `price`,
    `event_tickets_prices`.`quota` AS `konti`,
    `event_tickets_prices`.`sold` AS `sold`,
    `event_tickets_prices`.`quota` - ifnull(`event_tickets_prices`.`sold`, 0) AS `available`,
    `event_tickets_prices`.`categorie_id` AS `cat_id`,
    `event_tickets_categorie`.`categorie` AS `categorie`,
    `event_tickets_prices`.`personalized` AS `personalized`
from
    (
        (
            `view_actual_eventlist`
            join `event_tickets_prices` on(
                `event_tickets_prices`.`event_id` = `view_actual_eventlist`.`eventid`
            )
        )
        join `event_tickets_categorie` on(
            `event_tickets_categorie`.`id` = `event_tickets_prices`.`categorie_id`
        )
    )