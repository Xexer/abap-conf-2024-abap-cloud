@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comments'
define view entity ZFI_B_BKPComments
  as select from zfi_comments
{
  key bukrs       as CompanyCode,
  key belnr       as AccountingDocument,
  key gjahr       as FiscalYear,
  key buzei       as AccountingDocumentItem,
      commt       as DocumentComment,
      create_user as CreationUser,
      create_time as CreationTime
}
