@AbapCatalog.sqlViewName: 'ZDMOICONNECT_R'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read-Only Data Model Connection'
@Metadata.ignorePropagatedAnnotations: true

// Se pueden aplicar las Anotaciones en la definición de la vista
// sin necesidad de Metadata Extensions
@UI.headerInfo: { typeName: 'Conexión', typeNamePlural: 'Conexiones' }
@Search.searchable: true
define view zhgm_i_connection_r
  as select from /dmo/connection as Connections
  association [1..*] to zhgm_I_FLIGHT_R as _Flight  on $projection.AirlineID = _Flight.CarrierId
  association [1]    to zhgm_I_CARRIER  as _Airline on $projection.AirlineID = _Airline.CarrierId
{
      @UI.facet: [ { purpose: #STANDARD, type: #COLLECTION, label: 'Collector 1', position: 10, id: 'ID_C1', targetQualifier: 'COLL1' },
                   { parentId: 'ID_C1', purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Connection Info.', position: 10, id: 'ID_1', targetQualifier: 'TQ1' },
                   { parentId: 'ID_C1', purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Time information', position: 20, id: 'ID_2', targetQualifier: 'TQ2' },
                   { id: 'Flight', purpose: #STANDARD, type: #LINEITEM_REFERENCE, label: 'Flight', position: 30, targetElement: '_Flight' }
                    ]

      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 10, label: 'Aerolinea', qualifier: 'TQ1' }]
      @ObjectModel.text.association: '_Airline'
      @Search.defaultSearchElement: true
  key carrier_id      as AirlineID,
      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 20, label: 'Id Conexión', qualifier: 'TQ1' }]
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position: 30 }]
      @UI.selectionField: [ { position: 10 } ]
      @UI.identification: [{ position: 30, label: 'Aeropueroto de Salida', qualifier: 'TQ1' }]
      @EndUserText.quickInfo: 'Aeropurto de Salida'
      @Consumption.valueHelpDefinition: [{entity.name: 'zhgm_I_AIRPORT', entity.element: 'AirportId'}]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      airport_from_id as DepartureAirport,
      @UI.lineItem: [{ position: 40 }]
      @UI.selectionField: [ { position: 20 } ]
      @UI.identification: [{ position: 40, label: 'Aeropuerto Destino', qualifier: 'TQ1' }]
      @Consumption.valueHelpDefinition: [{entity.name: 'zhgm_I_AIRPORT', entity.element: 'AirportId'}]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      airport_to_id   as DestinationAirport,
      @UI.lineItem: [{ position: 50 }]
      @UI.identification: [{ position: 50, label: 'Hora de Salida', qualifier: 'TQ2' }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60 }]
      @UI.identification: [{ position: 60, label: 'Hora de Llegada', qualifier: 'TQ2' }]
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'Distance'
      @UI.identification: [{ position: 70, label: 'Distancia Total', qualifier: 'TQ2' }]
      distance        as Distance,
      @Semantics.unitOfMeasure: true
      distance_unit   as DistanceUnit,

      @Search.defaultSearchElement: true
      _Flight,
      _Airline
}
