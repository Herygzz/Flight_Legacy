@AbapCatalog.sqlViewName: 'ZDMOIBOOKING_U'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: { typeName: 'Booking', typeNamePlural: 'Bookings', title: { type: #STANDARD, value: 'BookingID' }}
@Search.searchable: true
define view zhgm1_I_BOOKING_U
  as select from /dmo/booking
  association        to parent zhgm1_I_TRAVEL_U as _Travel     on  $projection.TravelId = _Travel.TravelId
  association [1..1] to zhgm1_I_CUSTOMER        as _Customer   on  $projection.CustomerId = _Customer.CustomerId
  association [1..1] to zhgm1_I_CARRIER         as _Carrier    on  $projection.Airlineid = _Carrier.Airlineid
  association [1..1] to zhgm1_I_CONNECTION      as _Connection on  $projection.Airlineid    = _Connection.Airlineid
                                                               and $projection.ConnectionId = _Connection.ConnectionId
{
      @UI.facet: [ { id: 'Booking', purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Booking', position: 10 }]

      @Search.defaultSearchElement: true
  key travel_id             as TravelId,
      @UI.lineItem: [ { position: 20, importance: #HIGH } ]
  key booking_id            as BookingId,
      @UI.lineItem: [ { position: 30, importance: #HIGH }]
      @UI.identification: [ { position: 30 } ]
      booking_date          as BookingDate,
      @UI: { lineItem: [ { position: 40, importance: #HIGH } ],
      identification: [ { position: 40 } ] }
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZHGM1_I_CUSTOMER', element: 'CustomerID' }}]
      @Search.defaultSearchElement: true
      customer_id           as CustomerId,
      @UI.lineItem: [ { position: 50, importance: #HIGH } ]
      @UI.identification: [ { position: 50 } ]
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZHGM1_I_CARRIER', element: 'AirlineID' }}]
      @ObjectModel.text.association: '_Carrier'
      carrier_id            as Airlineid,
      @UI.lineItem: [ { position: 60, importance: #HIGH } ]
      @UI.identification: [ { position: 60 } ]

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZHGM1_I_FLIGHT', element: 'ConnectionId' },
      additionalBinding: [{ localElement: 'FlightDate', element: 'FlightDate'},
      { localElement: 'AirlineID', element: 'AirlineID'},
      { localElement: 'FlightPrice', element: 'Price' },
      { localElement: 'CurrencyCode', element: 'CurrencyCode' }]}]
      @ObjectModel.text.association: '_Connection'
      connection_id         as ConnectionId,
      @UI.lineItem: [ { position: 70, importance: #HIGH } ]
      @UI.identification: [ { position: 70 } ]

      @Consumption.valueHelpDefinition: [{entity: {name: 'ZHGM1_I_FLIGHT', element: 'FlightDate' },
      additionalBinding: [{ localElement: 'ConnectionID', element: 'ConnectionID'},
      { localElement: 'AirlineID', element: 'AirlineID'},
      { localElement: 'FlightPrice', element: 'Price' },
      { localElement: 'CurrencyCode', element: 'CurrencyCode' }]}]
      flight_date           as FlightDate,
      @UI.lineItem: [ { position: 80, importance: #HIGH } ]
      @UI.identification: [ { position: 80 } ]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      currency_code         as CurrencyCode,

      _Travel.Lastchangedat as LastChangedAt, -- Take over ETag from parent

      /* Associations */
      _Travel,
      _Customer,
      _Carrier,
      _Connection
}
