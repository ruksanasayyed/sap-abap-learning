REPORT ZABAP_FIELD_SYMBOLS.

DATA: gv_field TYPE I VALUE 50.

FIELD-SYMBOLS: <fs_field> TYPE i.

WRITE: / 'The value before assigning a field symbol', gv_field.

ASSIGN gv_field TO <fs_field>.

IF <fs_field> IS ASSIGNED.

  WRITE: / 'The value through field symbol', <fs_field>.

  <fs_field> = 34.

  WRITE: / 'The value of new field symbol', <fs_field>.

ENDIF.