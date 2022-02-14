  // 3%	4%	5%	7%	8%	9%	10%	11%	12%	13%	15%	20%
Map<String, double>  percentageDiscountMap = {
  '0': 0.03,
  '1': 0.04,
  '2': 0.05,
  '3': 0.07,
  '4': 0.08,
  '5': 0.09,
  '6': 0.10,
  '7': 0.11,
  '8': 0.12,
  '9': 0.13,
  '10': 0.15,
  '11': 0.20
};

//  S/.0.0459 S/.0.0954 S/.0.1369 S/.0.9350 S/.0.2499 S/.0.4921 S/.1.0000 S/.1.5957 S/.6.3500 S/.10.0000
// Fijo Local	Fijo Nacional	Móviles	Fijo Rural	LDi1	LDi2	LDi3	LDi4	LDi5	LDi  Espercial
Map<String, Map<String, dynamic>> nameWithFeedMap = {
  'local_landline': {
    'name': 'Fijo Local',
    'feed': 0.0459
  },
  'national_landline': {
    'name': 'Fijo Nacional',
    'feed': 0.0954
  },
  'mobile': {
    'name': 'Móviles',
    'feed': 0.1369
  },
  'rural_landline': {
    'name': 'Fijo Rural',
    'feed': 0.9350
  },
  'ldi1': {
    'name': 'LDi1',
    'feed': 0.2499
  },
  'ldi2': {
    'name': 'LDi2',
    'feed': 0.4921
  },
  'ldi3': {
    'name': 'LDi3',
    'feed': 1.0000
  },
  'ldi4': {
    'name': 'LDi4',
    'feed': 1.5957
  },
  'ldi5': {
    'name': 'LDi5',
    'feed': 6.3500
  },
  'ldi_special': {
    'name': 'LDi Espercial',
    'feed': 10.0000
  }
};