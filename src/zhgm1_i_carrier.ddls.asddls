@AbapCatalog.sqlViewName: 'ZDMOICARRIER_RE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier'
@Metadata.ignorePropagatedAnnotations: true
define view zhgm1_I_CARRIER
  as select from /dmo/carrier
{
  key carrier_id            as Airlineid,
      @Semantics.text: true
      name                  as Name,
      @Semantics.currencyCode: true
      currency_code         as CurrencyCode,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt
}
