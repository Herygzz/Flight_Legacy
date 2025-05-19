@AbapCatalog.sqlViewName: 'ZDMOI_CARRIER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vuelos'
@Metadata.ignorePropagatedAnnotations: true

// Se pueden aplicar las Anotaciones en la definición de la vista
// sin necesidad de Metadata Extensions
@Search.searchable: true
define view zhgm_I_FLIGHT_R
  as select from /dmo/flight
{
      @UI.lineItem: [{ position: 10 }]
  key carrier_id     as CarrierId,
      @UI.lineItem: [{ position: 20 }]
  key connection_id  as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
  key flight_date    as FlightDate,
      @UI.lineItem: [{ position: 40 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      @Semantics.currencyCode: true
      currency_code  as CurrencyCode,
      @UI.lineItem: [{ position: 50 }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      plane_type_id  as PlaneTypeId,
      @UI.lineItem: [{ position: 60 }]
      seats_max      as SeatsMax,
      @UI.lineItem: [{ position: 70 }]
      seats_occupied as SeatsOccupied
}
