DELIMITER //

insert into ds_files 
(
    file_id,
    name,
    path,
    size,
    mtime,
    ctime,
    type,
    hash,
    login,
    table_name
)

select  
    distinct 
        events_event_doc.doc_id file_id,
        original_filename,
        concat('files/',original_filename) path,
        filesize size,
        now() mtime,
        now() ctime,
        mime type,
        uuid() hash,
        'none' login,
        'events_bilder' table_name
from 
    events_event_doc 
    join 
        events_event_docdata on events_event_doc.doc_id = events_event_docdata.doc_id 
    -- and events_event_doc.eventid in (select eventid from events_event where `stop`>curdate() +interval - 3 month )
    join events_event on events_event.eventid =  events_event_doc.eventid
        and `stop`>curdate() +interval - 3 month
 //


 set group_concat_max_len=2048576000 //

insert into ds_files_data   (file_id,data)   

select  
 
    events_event_doc.doc_id file_id,
    concat('data:',mime,';base64,',to_base64( from_base64(group_concat(events_event_docdata.data order by page separator '')))) data

from 
    events_event_doc 
    join events_event_docdata on events_event_doc.doc_id = events_event_docdata.doc_id and events_event_doc.eventid in (select eventid from events_event where `stop`>curdate() +interval - 3 month )
group by events_event_doc.doc_id //


-- events_bilder



insert into events_bilder 
(
    id,
    eventid,
    typ,
    file_id
)


select  
    distinct 
        events_event_doc.doc_id id,
        events_event.eventid,
        'teaser',
        events_event_doc.doc_id file_id
        
from 
    events_event_doc 
    join 
        events_event_docdata on events_event_doc.doc_id = events_event_docdata.doc_id 
    -- and events_event_doc.eventid in (select eventid from events_event where `stop`>curdate() +interval - 3 month )
    join events_event on events_event.eventid =  events_event_doc.eventid
        and `stop`>curdate() +interval - 3 month
//