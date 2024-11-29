CLASS lhc_Comment DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Comment RESULT result.

    METHODS setComment FOR MODIFY
      IMPORTING keys FOR ACTION Comment~setComment RESULT result.

ENDCLASS.


CLASS lhc_Comment IMPLEMENTATION.
  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD setComment.
    READ ENTITIES OF ZFI_R_BKPDocumentComments IN LOCAL MODE
         ENTITY Comment ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(lt_data).

    LOOP AT lt_data INTO DATA(ls_data).
      DATA(ls_key) = keys[ %tky = ls_data-%tky ].

      MODIFY ENTITIES OF ZFI_R_BKPDocumentComments IN LOCAL MODE
             ENTITY Comment UPDATE FROM VALUE #( ( %tky                     = ls_data-%tky
                                                   DocumentComment          = ls_key-%param-DocumentComment
                                                   %control-DocumentComment = if_abap_behv=>mk-on ) ).
    ENDLOOP.

    READ ENTITIES OF ZFI_R_BKPDocumentComments IN LOCAL MODE
         ENTITY Comment ALL FIELDS WITH CORRESPONDING #( keys )
         RESULT DATA(lt_update).

    result = VALUE #( FOR ls_update IN lt_update
                      ( %tky = ls_update-%tky %param = CORRESPONDING #( ls_update ) ) ).
  ENDMETHOD.
ENDCLASS.


CLASS lsc_ZFI_R_BKPDOCUMENTCOMMENTS DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.
    METHODS
      save_modified REDEFINITION.

    METHODS
      cleanup_finalize REDEFINITION.

ENDCLASS.


CLASS lsc_ZFI_R_BKPDOCUMENTCOMMENTS IMPLEMENTATION.
  METHOD save_modified.
    LOOP AT update-comment INTO DATA(ls_comment).
      MODIFY zfi_comments FROM @( VALUE #( bukrs       = ls_comment-CompanyCode
                                           belnr       = ls_comment-AccountingDocument
                                           gjahr       = ls_comment-FiscalYear
                                           buzei       = ls_comment-AccountingDocumentItem
                                           commt       = ls_comment-DocumentComment
                                           create_user = cl_abap_context_info=>get_user_technical_name( )
                                           create_time = utclong_current( ) ) ).
    ENDLOOP.
  ENDMETHOD.


  METHOD cleanup_finalize.
  ENDMETHOD.
ENDCLASS.
