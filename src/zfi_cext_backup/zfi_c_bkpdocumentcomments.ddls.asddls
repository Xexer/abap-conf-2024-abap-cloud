@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View'
@Metadata.allowExtensions: true
define root view entity ZFI_C_BKPDocumentComments
  provider contract transactional_query
  as projection on ZFI_R_BKPDocumentComments
{
  key CompanyCode,
  key AccountingDocument,
  key FiscalYear,
  key AccountingDocumentItem,
      CompanyCodeName,
      DocumentDate,
      AccountingDocumentHeaderText,
      PostingKey,
      DocumentItemText,
      CostCenter,
      DocumentComment
}
