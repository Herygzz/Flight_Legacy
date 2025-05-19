@AbapCatalog.sqlViewName: 'ZDMOICUSTOM_RE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
define view zhgm1_I_CUSTOMER
  as select from /dmo/customer
  association [0..1] to I_Country as _Country on $projection.CountryCode = _Country.Country
{
      @UI.lineItem: [{ position: 10 }]
  key customer_id           as CustomerId,
      first_name            as FirstName,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      last_name             as LastName,
      title                 as Title,
      street                as Street,
      postal_code           as PostalCode,
      city                  as City,
      country_code          as CountryCode,
      phone_number          as PhoneNumber,
      email_address         as EmailAddress,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,

      _Country
}
