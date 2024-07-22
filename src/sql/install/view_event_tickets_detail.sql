CREATE OR REPLACE VIEW `view_event_tickets_detail` AS
select
    `et`.`id` AS `id`,
    `et`.`event_id` AS `event_id`,
    `et`.`categorie_id` AS `categorie_id`,
    `et`.`anrede` AS `anrede`,
    `et`.`vorname` AS `vorname`,
    `et`.`nachname` AS `nachname`,
    `et`.`geboren` AS `geboren`,
    `et`.`email` AS `email`,
    `et`.`order_id` AS `order_id`,
    `et`.`changes` AS `changes`,
    `event_tickets_categorie`.`categorie` AS `cat`,
    `event_tickets_prices`.`personalized` AS `pers`,
    `m`.`kundennummer` AS `memberid`
from
    (
        (
            (
                (
                    `blg_hdr_eventrn` `h`
                    join `blg_events_member_eventrn` `m` on(`m`.`id` = `h`.`id`)
                )
                join `event_tickets` `et` on(`h`.`order_id` = `et`.`order_id`)
            )
            join `event_tickets_categorie` on(
                `event_tickets_categorie`.`id` = `et`.`categorie_id`
            )
        )
        join `event_tickets_prices` on(
            (
                `event_tickets_prices`.`event_id`,
                `event_tickets_prices`.`categorie_id`
            ) = (`et`.`event_id`, `et`.`categorie_id`)
        )
    )