using { OfficeLibrarySrv } from '../srv/service.cds';

annotate OfficeLibrarySrv.Books with {
  Author @Common.ValueList: {
    CollectionPath: 'Authors',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: Author_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Nationality'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'BirthDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Biography'
      },
    ],
  }
};
annotate OfficeLibrarySrv.Books with @UI.HeaderInfo: {
  TypeName: 'Book',
  TypeNamePlural: 'Books',
  Title: { Value: Title }
};
annotate OfficeLibrarySrv.Books with {
  ID @UI.Hidden
};
annotate OfficeLibrarySrv.Books with @UI.Identification: [{ Value: Title }];
annotate OfficeLibrarySrv.Books with {
  Title @Common.Label: 'Title';
  ISBN @Common.Label: 'ISBN';
  PublicationDate @Common.Label: 'Publication Date';
  Genre @Common.Label: 'Genre';
  Price @Common.Label: 'Price';
  Author @Common.Label: 'Author'
};
annotate OfficeLibrarySrv.Books with {
  ID @Common.Text: { $value: Title, ![@UI.TextArrangement]: #TextOnly };
  Author @Common.Text: { $value: Author.Name, ![@UI.TextArrangement]: #TextOnly };
};
annotate OfficeLibrarySrv.Books with @UI.SelectionFields: [
  Author_ID
];
annotate OfficeLibrarySrv.Books with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: Title },
    { $Type: 'UI.DataField', Value: ISBN },
    { $Type: 'UI.DataField', Value: PublicationDate },
    { $Type: 'UI.DataField', Value: Genre },
    { $Type: 'UI.DataField', Value: Price }
];
annotate OfficeLibrarySrv.Books with @UI.FieldGroup #bookDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Title },
    { $Type: 'UI.DataField', Value: ISBN },
    { $Type: 'UI.DataField', Value: PublicationDate },
    { $Type: 'UI.DataField', Value: Genre },
    { $Type: 'UI.DataField', Value: Price }

  ]
};


annotate OfficeLibrarySrv.Books with @UI.FieldGroup #authorDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Author.Name },
    { $Type: 'UI.DataField', Value: Author.Nationality },
    { $Type: 'UI.DataField', Value: Author.BirthDate },
    { $Type: 'UI.DataField', Value: Author.Biography }

  ]
};


annotate OfficeLibrarySrv.Books with @UI.Facets: [
  {
    $Type: 'UI.CollectionFacet',
    ID: 'bookInfo',
    Label: 'Book Information',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'bookDetails', Label: 'Book Details', Target: '@UI.FieldGroup#bookDetails' } ]
  },
  {
    $Type: 'UI.CollectionFacet',
    ID: 'authorInfo',
    Label: 'Author Information',
    Facets: [
      { $Type: 'UI.ReferenceFacet', ID: 'authorDetails', Label: 'Author Details', Target: '@UI.FieldGroup#authorDetails' } ]
  }
];
annotate OfficeLibrarySrv.Authors with @UI.HeaderInfo: {
  TypeName: 'Author',
  TypeNamePlural: 'Authors',
  Title: { Value: Name }
};
annotate OfficeLibrarySrv.Authors with {
  ID @UI.Hidden
};
annotate OfficeLibrarySrv.Authors with @UI.Identification: [{ Value: Name }];
annotate OfficeLibrarySrv.Authors with {
  Name @Common.Label: 'Name';
  Nationality @Common.Label: 'Nationality';
  BirthDate @Common.Label: 'Birth Date';
  Biography @Common.Label: 'Biography'
};
annotate OfficeLibrarySrv.Authors with {
  ID @Common.Text: { $value: Name, ![@UI.TextArrangement]: #TextOnly };
};
annotate OfficeLibrarySrv.Authors with @UI.SelectionFields: [
  Name
];
annotate OfficeLibrarySrv.Authors with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: Name },
    { $Type: 'UI.DataField', Value: Nationality },
    { $Type: 'UI.DataField', Value: BirthDate },
    { $Type: 'UI.DataField', Value: Biography }
];
annotate OfficeLibrarySrv.Authors with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: Name },
    { $Type: 'UI.DataField', Value: Nationality },
    { $Type: 'UI.DataField', Value: BirthDate },
    { $Type: 'UI.DataField', Value: Biography }
]};
annotate OfficeLibrarySrv.Authors with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];