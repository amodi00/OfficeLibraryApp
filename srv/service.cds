using { OfficeLibrary } from '../db/schema.cds';

service OfficeLibrarySrv {
  @odata.draft.enabled
  entity Books as projection on OfficeLibrary.Books;
  @odata.draft.enabled
  entity Authors as projection on OfficeLibrary.Authors;
}