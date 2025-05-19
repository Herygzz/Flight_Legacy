@AbapCatalog.sqlViewName: 'ZDMOI_FLIGHT_R'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrirer'
@Metadata.ignorePropagatedAnnotations: true

// Se pueden aplicar las Anotaciones en la definición de la vista
// sin necesidad de Metadata Extensions
@Search.searchable: true
define view zhgm_I_CARRIER
  as select from /dmo/carrier
{
      @UI.lineItem: [{ position: 10 }]
  key carrier_id            as CarrierId,
      @UI.lineItem: [{ position: 20 }]
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      name                  as Name,
      @Semantics.currencyCode: true
      currency_code         as CurrencyCode,
      @UI.lineItem: [{ position: 30 }]
      local_created_by      as LocalCreatedBy,
      @UI.lineItem: [{ position: 40 }]
      local_created_at      as LocalCreatedAt,
      @UI.lineItem: [{ position: 50 }]
      local_last_changed_by as LocalLastChangedBy,
      @UI.lineItem: [{ position: 60 }]
      local_last_changed_at as LocalLastChangedAt,
      @UI.lineItem: [{ position: 70 }]
      last_changed_at       as LastChangedAt
}
