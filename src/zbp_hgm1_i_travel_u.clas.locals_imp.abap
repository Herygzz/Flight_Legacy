CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*Travel = Alias en el Behavior Definition
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS create_travel FOR MODIFY
      IMPORTING it_travel_create FOR CREATE Travel.

    METHODS update_travel FOR MODIFY
      IMPORTING it_travel_update FOR UPDATE Travel.

    METHODS delete_travel FOR MODIFY
      IMPORTING it_travel_delete FOR DELETE Travel.

    METHODS read_travel FOR READ
      IMPORTING it_travel_read FOR READ Travel RESULT result.

* Método definito mediante Action en el CDS ZHG1_I_TRAVEL_U campo  STATUS
    METHODS set_status_booked FOR MODIFY
      IMPORTING it_travel_set_status_booked FOR ACTION Travel~set_status_booked RESULT et_travel_set_status_booked.

* Método para la Asosiación _Booking
    METHODS cba_Booking FOR MODIFY
      IMPORTING entities_cba FOR CREATE Travel\_Booking.

    METHODS rba_Booking FOR READ
      IMPORTING it_booking_create_ba FOR READ Travel\_Booking FULL result_requested RESULT result LINK association_links.

* Otros Métodos
    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK Travel.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.

  METHOD create_travel.

    DATA ls_travel_out TYPE /dmo/travel.
    DATA: lv_max_number TYPE /dmo/travel_id.

    SELECT MAX( travel_id ) FROM /dmo/travel INTO @lv_max_number.
    IF sy-subrc NE 0.
      lv_max_number = 1.
    ELSE.
      lv_max_number = lv_max_number + 1.
    ENDIF.


    LOOP AT it_travel_create ASSIGNING FIELD-SYMBOL(<fs_travel_create>).

*call function 'get_next_numbers_rap'
*EXPORTING i_object = 'ZTRAVELNUM'
*importing

*      CLEAR ls_travel_in.
*      ls_travel_in = CORRESPONDING #( /dmo/cl_travel_auxiliary=>map_travel_cds_to_db( CORRESPONDING #( <fs_travel_create> ) ) ).
*      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_CREATE'
*        EXPORTING
*          is_travel   = ls_travel_in
*        IMPORTING
*          es_travel   = ls_travel_out
*          et_messages = lt_messages.
*      IF lt_messages IS INITIAL.
*        INSERT VALUE #( %cid = <fs_travel_create>-%cid travelid = ls_travel_out-travel_id )
*        INTO TABLE mapped-travel.
*      ELSE.
*        lcl_message_helper=>handle_travel_messages(
*        EXPORTING
*        iv_cid = <fs_travel_create>-%cid
*        it_messages = lt_messages
*        CHANGING
*        failed = failed-travel
*        reported = reported-travel ).
*      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD update_travel.


  ENDMETHOD.

  METHOD delete_travel.

  ENDMETHOD.

  METHOD read_travel.


  ENDMETHOD.

* Método definito mediante Action en el CDS ZHG1_I_TRAVEL_U campo  STATUS
  METHOD set_status_booked.
  ENDMETHOD.

* Método para la Asosiación _Booking
  METHOD rba_Booking.
  ENDMETHOD.

  METHOD cba_Booking.
  ENDMETHOD.

* Otros Métodos
  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update_booking FOR MODIFY
      IMPORTING it_booking_update FOR UPDATE booking.

    METHODS delete_booking FOR MODIFY
      IMPORTING it_booking_delete FOR DELETE booking.

    METHODS read_booking FOR READ
      IMPORTING it_booking_read FOR READ booking RESULT et_booking_read.

    METHODS rba_Travel_booking FOR READ
      IMPORTING it_booking__rba FOR READ booking\_Travel FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.

  METHOD update_booking.
  ENDMETHOD.

  METHOD delete_booking.
  ENDMETHOD.

  METHOD read_booking.
  ENDMETHOD.

  METHOD rba_Travel_booking.
  ENDMETHOD.

ENDCLASS.

* Esta Clase se utiliza al momento de Guardar en la BD
CLASS lsc_ZHGM1_I_TRAVEL_U DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.
    METHODS check_before_save REDEFINITION.
    METHODS save REDEFINITION.
    METHODS cleanup REDEFINITION.
    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZHGM1_I_TRAVEL_U IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
