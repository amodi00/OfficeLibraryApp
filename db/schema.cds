namespace OfficeLibrary;

entity Books {
  key ID: UUID;
  Title: String(50) @assert.unique @mandatory;
  ISBN: String(20);
  PublicationDate: Date;
  Genre: String(50);
  Price: Decimal;
  Author: Association to Authors;
}

entity Authors {
  key ID: UUID;
  Name: String(50) @assert.unique @mandatory;
  Nationality: String(50);
  BirthDate: Date;
  Biography: String;
}
