DELIMITER //

CREATE OR REPLACE TRIGGER event_tickets_ai
    after INSERT
    ON event_tickets FOR EACH ROW
BEGIN
    
    update event_tickets_prices set sold=ifnull( (select count(0) from event_tickets where event_tickets.categorie_id=new.categorie_id and event_tickets.event_id=new.event_id), 0)
    where event_tickets_prices.categorie_id=new.categorie_id and event_tickets_prices.event_id=new.event_id;

END //


CREATE OR REPLACE TRIGGER event_tickets_au
    after update
    ON event_tickets FOR EACH ROW
BEGIN
    
    update event_tickets_prices set sold=ifnull( (select count(0) from event_tickets where event_tickets.categorie_id=new.categorie_id and event_tickets.event_id=new.event_id), 0)
    where event_tickets_prices.categorie_id=new.categorie_id and event_tickets_prices.event_id=new.event_id;

END //


CREATE OR REPLACE TRIGGER event_tickets_ad
    after delete
    ON event_tickets FOR EACH ROW
BEGIN
    
    update event_tickets_prices set sold=ifnull( (select count(0) from event_tickets where event_tickets.categorie_id=old. categorie_id and event_tickets.event_id=old. event_id), 0)
    where event_tickets_prices.categorie_id=old. categorie_id and event_tickets_prices.event_id=old. event_id;

END //