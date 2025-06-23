CREATE TABLE Country (
    CountryCode text PRIMARY KEY         -- Example: 'ABW',
    ShortName text                       -- Example: 'Afghanistan',
    TableName text                       -- Example: 'Afghanistan',
    LongName text                        -- Example: 'Islamic State of Afghanistan',
    Alpha2Code text                      -- Example: 'AF',
    CurrencyUnit text                    -- Example: '',
    SpecialNotes text                    -- Example: 'Fiscal year end: March 20; reporting period for national accounts data: FY (from',
    Region text                          -- Example: '',
    IncomeGroup text                     -- Example: 'Low income',
    Wb2Code text                         -- Example: 'AF',
    NationalAccountsBaseYear text        -- Example: '2002/03',
    NationalAccountsReferenceYear text   -- Example: '',
    SnaPriceValuation text               -- Example: 'Value added at basic prices (VAB)',
    LendingCategory text                 -- Example: 'IDA',
    OtherGroups text                     -- Example: 'HIPC',
    SystemOfNationalAccounts text        -- Example: 'Country uses the 1993 System of National Accounts methodology.',
    AlternativeConversionFactor text     -- Example: '',
    PppSurveyYear text                   -- Example: '',
    BalanceOfPaymentsManualInUse text    -- Example: '',
    ExternalDebtReportingStatus text     -- Example: 'Actual',
    SystemOfTrade text                   -- Example: 'General trade system',
    GovernmentAccountingConcept text     -- Example: 'Consolidated central government',
    ImfDataDisseminationStandard text    -- Example: 'General Data Dissemination System (GDDS)',
    LatestPopulationCensus text          -- Example: '1979',
    LatestHouseholdSurvey text           -- Example: 'Multiple Indicator Cluster Survey (MICS), 2010/11',
    SourceOfMostRecentIncomeAndExpenditureData text -- Example: 'Integrated household survey (IHS), 2008',
    VitalRegistrationComplete text       -- Example: '',
    LatestAgriculturalCensus text        -- Example: '2013/14',
    LatestIndustrialData integer         -- Example: 2011,
    LatestTradeData integer              -- Example: 2013,
    LatestWaterWithdrawalData integer    -- Example: 2000
);

CREATE TABLE Series (
    SeriesCode text PRIMARY KEY          -- Example: 'AG.AGR.TRAC.NO',
    Topic text                           -- Example: 'Economic Policy & Debt: Balance of payments: Capital & financial account',
    IndicatorName text                   -- Example: 'Foreign direct investment, net (BoP, current US$)',
    ShortDefinition text                 -- Example: '',
    LongDefinition text                  -- Example: 'Foreign direct investment are the net inflows of investment to acquire a lasting',
    UnitOfMeasure text                   -- Example: '',
    Periodicity text                     -- Example: 'Annual',
    BasePeriod text                      -- Example: '',
    OtherNotes integer                   -- Example: NULL,
    AggregationMethod text               -- Example: '',
    LimitationsAndExceptions text        -- Example: '',
    NotesFromOriginalSource text         -- Example: '',
    GeneralComments text                 -- Example: 'Note: Data are based on the sixth edition of the IMF's Balance of Payments Manua',
    Source text                          -- Example: 'International Monetary Fund, Balance of Payments Statistics Yearbook and data fi',
    StatisticalConceptAndMethodology text -- Example: '',
    DevelopmentRelevance text            -- Example: '',
    RelatedSourceLinks text              -- Example: '',
    OtherWebLinks integer                -- Example: NULL,
    RelatedIndicators integer            -- Example: NULL,
    LicenseType text                     -- Example: 'Open'
);

CREATE TABLE CountryNotes (
    Countrycode text                     -- Example: 'ABW',
    Seriescode text                      -- Example: 'EG.EGY.PRIM.PP.KD',
    Description text                     -- Example: 'Sources: Estimated based on UN Energy Statistics (2014); World Development Indic',
    PRIMARY KEY (Countrycode, Seriescode),
    FOREIGN KEY (Countrycode) REFERENCES Country(CountryCode),
    FOREIGN KEY (Seriescode) REFERENCES Series(SeriesCode)
);

CREATE TABLE Footnotes (
    Countrycode text                     -- Example: 'ABW',
    Seriescode text                      -- Example: 'AG.LND.FRST.K2',
    Year text                            -- Example: 'YR1990',
    Description text                     -- Example: 'Not specified',
    PRIMARY KEY (Countrycode, Seriescode, Year),
    FOREIGN KEY (Countrycode) REFERENCES Country(CountryCode),
    FOREIGN KEY (Seriescode) REFERENCES Series(SeriesCode)
);

CREATE TABLE Indicators (
    CountryName text                     -- Example: 'Arab World',
    CountryCode text                     -- Example: 'ABW',
    IndicatorName text                   -- Example: '2005 PPP conversion factor, GDP (LCU per international $)',
    IndicatorCode text                   -- Example: 'AG.LND.AGRI.K2',
    Year integer                         -- Example: 1960,
    Value integer                        -- Example: -9824821297572060,
    PRIMARY KEY (CountryCode, IndicatorCode, Year),
    FOREIGN KEY (CountryCode) REFERENCES Country(CountryCode)
);

CREATE TABLE SeriesNotes (
    Seriescode text                      -- Example: 'DT.DOD.PVLX.CD',
    Year text                            -- Example: 'YR2014',
    Description text                     -- Example: 'Interpolated using data for 1957 and 1962.',
    PRIMARY KEY (Seriescode, Year),
    FOREIGN KEY (Seriescode) REFERENCES Series(SeriesCode)
);