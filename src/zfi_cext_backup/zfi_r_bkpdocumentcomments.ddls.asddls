@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Comments for FI Documents'
define root view entity ZFI_R_BKPDocumentComments
  as select from I_OperationalAcctgDocItem
  association [0..1] to ZFI_B_BKPComments as _Comment on  _Comment.CompanyCode            = $projection.CompanyCode
                                                      and _Comment.AccountingDocument     = $projection.AccountingDocument
                                                      and _Comment.FiscalYear             = $projection.FiscalYear
                                                      and _Comment.AccountingDocumentItem = $projection.AccountingDocumentItem
{
  key CompanyCode,
  key AccountingDocument,
  key FiscalYear,
  key AccountingDocumentItem,
      _CompanyCode.CompanyCodeName,
      _JournalEntry.DocumentDate,
      _JournalEntry.AccountingDocumentHeaderText,
      PostingKey,
      DocumentItemText,
      CostCenter,
      _Comment.DocumentComment
}
