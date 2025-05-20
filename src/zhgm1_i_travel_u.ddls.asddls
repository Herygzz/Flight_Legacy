@AbapCatalog.sqlViewName: 'ZDMOITRAVEL_U'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo: { typeName: 'Travel', typeNamePlural: 'Travels', title: { type: #STANDARD, value: 'TravelID' }}
@Search.searchable: true
define root view zhgm1_I_TRAVEL_U
  as select from /dmo/travel

  composition [0..*] of zhgm1_I_BOOKING_U as _Booking
  association [0..1] to ZHGM1_I_AGENCY    as _Agency   on $projection.AgencyID = _Agency.AgencyId
  association [0..1] to zhgm1_I_CUSTOMER  as _Customer on $projection.CustomerID = _Customer.CustomerId
  association [0..1] to I_Currency        as _Currency on $projection.CurrencyCode = _Currency.Currency

{

      @UI.facet: [ { id: 'Travel', purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Travel', position: 10 },
                   { id: 'Booking', purpose: #STANDARD, type: #LINEITEM_REFERENCE, label: 'Booking', position: 20, targetElement: '_Booking'}]

      @UI.lineItem: [ { position: 10, importance: #HIGH } ]
      @UI.identification:[ { position: 10 } ]
      @UI.selectionField: [ { position: 10 } ]
      @Search.defaultSearchElement: true
  key travel_id     as TravelId,
      @UI.lineItem: [ { position: 20, importance: #HIGH } ]
      @UI.identification:[ { position: 20 } ]
      @UI.selectionField: [ { position: 20 } ]
      //      @Consumption.valueHelpDefinition: [{ entity.name: 'ZHGM1_I_AGENCY', entity.element: 'AgencyId' } ]
      @Consumption.valueHelpDefinition: [{ entity.name: 'zhgm1_I_AGENCY', entity.element: 'AgencyId' } ]
      //      @ObjectModel.text.association: '_Agency'
      @Search.defaultSearchElement: true
      agency_id     as AgencyID,
      @UI.lineItem: [ { position: 30, importance: #HIGH } ]
      @UI.identification:[ { position: 30 } ]
      @UI.selectionField: [ { position: 30 } ]
      @Consumption.valueHelpDefinition: [{ entity.name: 'ZHGM1_I_Customer', entity.element: 'CustomerId' } ]
      @ObjectModel.text.association: '_Customer'
      @Search.defaultSearchElement: true
      customer_id   as CustomerID,

      @UI: { lineItem: [ { position: 40, importance: #MEDIUM } ], identification:[ { position: 40 } ] }
      begin_date    as BeginDate,
      @UI.lineItem: [ { position: 41, importance: #MEDIUM } ]
      @UI.identification:[ { position: 41 } ]
      end_date      as EndDate,
      @UI.identification:[ { position: 42 } ]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee   as BookingFee,
      @UI.identification:[ { position: 43, label: 'Total Price' } ]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price   as TotalPrice,
      @Semantics.currencyCode: true
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      currency_code as CurrencyCode,
      @UI.identification:[ { position: 45, label: 'Comment' } ]
      description   as Description,
      @UI.lineItem: [{ position: 50, importance: #HIGH, type: #FOR_ACTION, dataAction: 'set_status_booked', label: 'Set to Booked' }]
      status        as Status,
      createdby     as Createdby,
      createdat     as Createdat,
      lastchangedby as Lastchangedby,
      lastchangedat as Lastchangedat,

      /* Associations */
      _Booking,
      _Agency,
      _Customer,
      _Currency

}
