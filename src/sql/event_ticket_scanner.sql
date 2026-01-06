CREATE
OR REPLACE VIEW `event_ticket_scanner` AS
select
    `event_tickets`.`id` AS `id`,
    json_object (
        'id',
        `event_tickets`.`id`,
        'code',
        `event_tickets`.`id`,
        'event_name',
        `events_event`.`name`,
        'event_date',
        `events_event`.`start`,
        'ticket_type',
        `event_tickets_categorie`.`categorie`,
        'customer_name',
        ifnull (
            concat (
                `event_tickets`.`vorname`,
                ' ',
                `event_tickets`.`nachname`
            ),
            'nicht hinterlegt'
        ),
        'customer_email',
        `event_tickets`.`email`,
        'price',
        `blg_pos_eventrn`.`brutto`,
        'unpaid',
        `blg_hdr_eventrn`.`offen`,
        'order_id',
        `event_tickets`.`order_id`,
        'created_at',
        ifnull (
            `blg_hdr_eventrn`.`create_timestamp`,
            current_timestamp()
        ),
        'scanner_user_id',
        NULL,
        'scanns',
        `event_tickets_scanned`.`scanns`,
        'scanned_at',
        `event_tickets_scanned`.`createtime`,
        'last_scanned_at',
        `event_tickets_scanned`.`updatetime`,
        'additional_data',
        ''
    ) AS `ticketdata`
from
    (
        (
            (
                (
                    (
                        `event_tickets`
                        join `events_event` on (
                            `event_tickets`.`event_id` = `events_event`.`eventid`
                            and events_event.start between current_date() - interval 2 day and current_date() + interval 7 day
                        )
                    )
                    join `event_tickets_categorie` on (
                        `event_tickets`.`categorie_id` = `event_tickets_categorie`.`id`
                    )
                )
                left join `blg_hdr_eventrn` on (
                    `blg_hdr_eventrn`.`order_id` = `event_tickets`.`order_id`
                )
            )
            left join `blg_pos_eventrn` on (
                `blg_pos_eventrn`.`event_id` = `event_tickets`.`event_id`
                and `blg_pos_eventrn`.`categorie_id` = `event_tickets`.`categorie_id`
                and `blg_hdr_eventrn`.`id` = `blg_pos_eventrn`.`beleg`
            )
        )
        left join `event_tickets_scanned` on (
            `event_tickets_scanned`.`id` = `event_tickets`.`id`
        )
    )