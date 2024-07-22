CREATE OR REPLACE VIEW `view_member_booked_events` AS
select
    `events_event`.`name` AS `name`,
    `events_event`.`description_md` AS `description_md`,
    `events_event`.`genre` AS `genre`,
    `events_event`.`imagebild` AS `imagebild`,
    `events_member`.`email` AS `email`,
    `h`.`order_id` AS `order_id`,
    `p`.`anzahl` AS `anzahl`,
    `p`.`event_id` AS `event_id`,
    `p`.`categorie_id` AS `categorie_id`,
    `m`.`kundennummer` AS `kundennummer`,
    `etp`.`price` AS `preis`,
    count(`et`.`id`) AS `t_anzahl`,
    concat(
        `vae`.`tag`,
        '. ',
        `vae`.`monat_lang`,
        ' ',
        `vae`.`jahr`,
        ' • ',
        `vae`.`zeit`,
        ' Uhr'
    ) AS `tdate`,
    `view_actual_eventlist_img`.`img_str` AS `img_str`
from
    (
        (
            (
                (
                    (
                        (
                            (
                                (
                                    (
                                        `blg_hdr_eventrn` `h`
                                        join `blg_pos_eventrn` `p` on(
                                            `h`.`id` = `p`.`beleg`
                                            and `h`.`offen` = 0
                                            and `h`.`datum` >= curdate() + interval -12 month
                                        )
                                    )
                                    join `blg_pay_eventrn` `y` on(`y`.`belegnummer` = `h`.`id`)
                                )
                                join `blg_events_member_eventrn` `m` on(`m`.`id` = `h`.`id`)
                            )
                            join `events_member` on(`m`.`kundennummer` = `events_member`.`memberid`)
                        )
                        join `events_event` on(
                            `events_event`.`eventid` = `p`.`event_id`
                            and `events_event`.`start` > current_timestamp() + interval -1 hour
                        )
                    )
                    join `event_tickets` `et` on(
                        `et`.`event_id` = `p`.`event_id`
                        and `et`.`categorie_id` = `p`.`categorie_id`
                        and `et`.`order_id` = `h`.`order_id`
                    )
                )
                join `event_tickets_prices` `etp` on(
                    `etp`.`event_id` = `p`.`event_id`
                    and `etp`.`categorie_id` = `p`.`categorie_id`
                )
            )
            join `view_actual_eventlist_img` on(
                `view_actual_eventlist_img`.`id` = `events_event`.`imagebild`
            )
        )
        join `view_actual_eventlist` `vae` on(`vae`.`eventid` = `p`.`event_id`)
    )
group by
    `h`.`order_id`