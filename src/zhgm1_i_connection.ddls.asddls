@AbapCatalog.sqlViewName: 'ZDMOICONNECT_RE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection'
@Metadata.ignorePropagatedAnnotations: true
define view zhgm1_I_CONNECTION
  as select from /dmo/connection
{
  key carrier_id      as Airlineid,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      @Semantics.unitOfMeasure: true
      distance_unit   as DistanceUnit
}
