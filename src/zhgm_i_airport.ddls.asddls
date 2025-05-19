@AbapCatalog.sqlViewName: 'ZDMOI_AIRPORT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aeropuerto'
@Metadata.ignorePropagatedAnnotations: true
define view zhgm_I_AIRPORT
  as select from /dmo/airport
{
      @UI.lineItem: [{ position: 10 }]
  key airport_id as AirportId,
      @UI.lineItem: [{ position: 20 }]
      name       as Name,
      @UI.lineItem: [{ position: 30 }]
      city       as City,
      @UI.lineItem: [{ position: 40 }]
      country    as Country
}
