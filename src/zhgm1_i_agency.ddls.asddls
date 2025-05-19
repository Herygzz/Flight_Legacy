@AbapCatalog.sqlViewName: 'ZDMOIAGENCY_RE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
define view zhgm1_I_AGENCY
  as select from /dmo/agency
  association [0..1] to I_Country as _Country on $projection.CountryCode = _Country.Country
{
      @UI.lineItem: [{ position: 10 }]
  key agency_id             as AgencyId,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      name                  as Name,
      street                as Street,
      postal_code           as PostalCode,
      city                  as City,
      country_code          as CountryCode,
      phone_number          as PhoneNumber,
      email_address         as EmailAddress,
      web_address           as WebAddress,
      attachment            as Attachment,
      mime_type             as MimeType,
      filename              as Filename,
      local_created_by      as LocalCreatedBy,
      local_created_at      as LocalCreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      dummy_field           as DummyField,
      /dmo/zzsloganzag,
      zzcategory_zag        as ZzcategoryZag,
      zztunisia_address_zag as ZztunisiaAddressZag,
      zzsad_rating_zag      as ZzsadRatingZag,
      zzagtypezag           as Zzagtypezag,
      zzremarks_zag         as ZzremarksZag,

      _Country
}
