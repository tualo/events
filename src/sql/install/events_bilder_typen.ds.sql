DELIMITER ;

INSERT INTO
    `ds` (
        `table_name`,
        `title`,
        `reorderfield`,
        `use_history`,
        `searchfield`,
        `displayfield`,
        `sortfield`,
        `searchany`,
        `hint`,
        `overview_tpl`,
        `sync_table`,
        `writetable`,
        `globalsearch`,
        `listselectionmodel`,
        `sync_view`,
        `syncable`,
        `cssstyle`,
        `alternativeformxtype`,
        `read_table`,
        `class_name`,
        `special_add_panel`,
        `existsreal`,
        `character_set_name`,
        `read_filter`,
        `listxtypeprefix`,
        `phpexporter`,
        `phpexporterfilename`,
        `combined`,
        `default_pagesize`,
        `allowForm`,
        `listviewbaseclass`,
        `showactionbtn`,
        `modelbaseclass`
    )
VALUES
    (
        'events_bilder_typen',
        'CMS-Bildertyp',
        '',
        0,
        'id',
        'name',
        'name',
        0,
        '',
        '',
        '',
        '',
        0,
        'rowmodel',
        '',
        0,
        '',
        '',
        '',
        'Content-Management-System',
        '',
        1,
        '',
        '',
        '',
        'XlsxWriter',
        'events_bilder_typen{DATE}',
        0,
        1000,
        0,
        'Tualo.DataSets.ListView',
        1,
        'Tualo.DataSets.model.Basic'
    ) ON DUPLICATE KEY
UPDATE
    title =
VALUES
(title),
    reorderfield =
VALUES
(reorderfield),
    use_history =
VALUES
(use_history),
    searchfield =
VALUES
(searchfield),
    displayfield =
VALUES
(displayfield),
    sortfield =
VALUES
(sortfield),
    searchany =
VALUES
(searchany),
    hint =
VALUES
(hint),
    overview_tpl =
VALUES
(overview_tpl),
    sync_table =
VALUES
(sync_table),
    writetable =
VALUES
(writetable),
    globalsearch =
VALUES
(globalsearch),
    listselectionmodel =
VALUES
(listselectionmodel),
    sync_view =
VALUES
(sync_view),
    syncable =
VALUES
(syncable),
    cssstyle =
VALUES
(cssstyle),
    alternativeformxtype =
VALUES
(alternativeformxtype),
    read_table =
VALUES
(read_table),
    class_name =
VALUES
(class_name),
    special_add_panel =
VALUES
(special_add_panel),
    existsreal =
VALUES
(existsreal),
    character_set_name =
VALUES
(character_set_name),
    read_filter =
VALUES
(read_filter),
    listxtypeprefix =
VALUES
(listxtypeprefix),
    phpexporter =
VALUES
(phpexporter),
    phpexporterfilename =
VALUES
(phpexporterfilename),
    combined =
VALUES
(combined),
    default_pagesize =
VALUES
(default_pagesize),
    allowForm =
VALUES
(allowForm),
    listviewbaseclass =
VALUES
(listviewbaseclass),
    showactionbtn =
VALUES
(showactionbtn),
    modelbaseclass =
VALUES
(modelbaseclass);

INSERT
    IGNORE INTO `ds_column` (
        `table_name`,
        `column_name`,
        `default_value`,
        `default_max_value`,
        `default_min_value`,
        `update_value`,
        `is_primary`,
        `syncable`,
        `referenced_table`,
        `referenced_column_name`,
        `is_nullable`,
        `is_referenced`,
        `writeable`,
        `note`,
        `data_type`,
        `column_key`,
        `column_type`,
        `character_maximum_length`,
        `numeric_precision`,
        `numeric_scale`,
        `character_set_name`,
        `privileges`,
        `existsreal`,
        `deferedload`,
        `hint`,
        `fieldtype`
    )
VALUES
    (
        'events_bilder_typen',
        'id',
        '{:uuid()}',
        0,
        0,
        '',
        1,
        0,
        '',
        '',
        'NO',
        '',
        1,
        '',
        'varchar',
        'PRI',
        'varchar(36)',
        36,
        NULL,
        NULL,
        'utf8mb3',
        'select,insert,update,references',
        1,
        0,
        '',
        ''
    ),
(
        'events_bilder_typen',
        'name',
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        NULL,
        'NO',
        NULL,
        1,
        NULL,
        'varchar',
        'UNI',
        'varchar(255)',
        255,
        NULL,
        NULL,
        'utf8mb3',
        'select,insert,update,references',
        1,
        NULL,
        NULL,
        ''
    );

INSERT
    IGNORE INTO `ds_column_list_label` (
        `table_name`,
        `column_name`,
        `language`,
        `label`,
        `xtype`,
        `editor`,
        `position`,
        `summaryrenderer`,
        `renderer`,
        `summarytype`,
        `hidden`,
        `active`,
        `filterstore`,
        `grouped`,
        `flex`,
        `direction`,
        `align`,
        `listfiltertype`,
        `hint`
    )
VALUES
    (
        'events_bilder_typen',
        'id',
        'DE',
        'ID',
        'gridcolumn',
        NULL,
        0,
        '',
        '',
        '',
        0,
        1,
        '',
        0,
        1.00,
        'ASC',
        'left',
        '',
        NULL
    ),
(
        'events_bilder_typen',
        'name',
        'DE',
        'Name',
        'gridcolumn',
        NULL,
        1,
        '',
        '',
        '',
        0,
        1,
        '',
        0,
        1.00,
        'ASC',
        'left',
        '',
        NULL
    );

INSERT
    IGNORE INTO `ds_column_form_label` (
        `table_name`,
        `column_name`,
        `language`,
        `label`,
        `xtype`,
        `field_path`,
        `position`,
        `hidden`,
        `active`,
        `allowempty`,
        `fieldgroup`,
        `flex`,
        `hint`
    )
VALUES
    (
        'events_bilder_typen',
        'id',
        'DE',
        'ID',
        'textfield',
        'Allgemein/Angaben',
        0,
        0,
        1,
        0,
        '1',
        1.00,
        '\'\''
    ),
(
        'events_bilder_typen',
        'name',
        'DE',
        'Name',
        'textfield',
        'Allgemein/Angaben',
        1,
        0,
        1,
        0,
        '1',
        1.00,
        '\'\''
    );

INSERT
    IGNORE INTO `ds_dropdownfields` (
        `table_name`,
        `name`,
        `idfield`,
        `displayfield`,
        `filterconfig`
    )
VALUES
    ('events_bilder_typen', 'id', 'id', 'name', '');

INSERT
    IGNORE INTO `ds_access` (
        `role`,
        `table_name`,
        `read`,
        `write`,
        `delete`,
        `append`,
        `existsreal`
    )
VALUES
    (
        'administration',
        'events_bilder_typen',
        1,
        1,
        1,
        1,
        1
    ),
('_default_', 'events_bilder_typen', 1, 0, 0, 0, 1);