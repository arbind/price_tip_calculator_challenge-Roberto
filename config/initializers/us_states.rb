# frozen_string_literal: true

US_STATE_NAME_ABBREVIATION_MAP = {
  alaska: :AK,
  alabama: :AL,
  arkansas: :AR,
  american_samoa: :AS,
  arizona: :AZ,
  california: :CA,
  colorado: :CO,
  connecticut: :CT,
  district_of_columbia: :DC,
  delaware: :DE,
  florida: :FL,
  georgia: :GA,
  guam: :GU,
  hawaii: :HI,
  iowa: :IA,
  idaho: :ID,
  illinois: :IL,
  indiana: :IN,
  kansas: :KS,
  kentucky: :KY,
  louisiana: :LA,
  massachusetts: :MA,
  maryland: :MD,
  maine: :ME,
  michigan: :MI,
  minnesota: :MN,
  missouri: :MO,
  mississippi: :MS,
  montana: :MT,
  north_carolina: :NC,
  north_dakota: :ND,
  nebraska: :NE,
  new_hampshire: :NH,
  new_jersey: :NJ,
  new_mexico: :NM,
  nevada: :NV,
  new_york: :NY,
  ohio: :OH,
  oklahoma: :OK,
  oregon: :OR,
  pennsylvania: :PA,
  puerto_rico: :PR,
  rhode_island: :RI,
  south_carolina: :SC,
  south_dakota: :SD,
  tennessee: :TN,
  texas: :TX,
  utah: :UT,
  virginia: :VA,
  virgin_islands: :VI,
  vermont: :VT,
  washington: :WA,
  wisconsin: :WI,
  west_virginia: :WV,
  wyoming: :WY
}.freeze

UC_CITY_NAME_LOOKUP_MAP = {
  ny: 'New York',
  nyc: 'New York',
  new_york_city: 'New York',
  la: 'Los Angeles',
  cincy: 'Cincinnati',
  kc: 'Kansas City',
  vegas: 'Las Vegas',
  no: 'New Orleans',
  nawlins: 'New Orleans',
  oc: 'Orange County',
  the_oc: 'Orange County',
  obx: 'Outer Banks',
  philly: 'Philadelphia',
  sf: 'San Francisco',
  frisco: 'San Francisco',
  san_fran: 'San Francisco',
  dc: 'Washington',
  washington_dc: 'Washington'
}.freeze

def STATE_FOR long_state_name
  key = long_state_name.to_s.parameterize.underscore.to_sym
  st = US_STATE_NAME_ABBREVIATION_MAP[key] || long_state_name
  st.to_s.squish
end

def CITY_FOR any_city_name
  key = any_city_name.to_s.parameterize.underscore.to_sym
  city = UC_CITY_NAME_LOOKUP_MAP[key] || any_city_name
  city.to_s.titleize.squish
end

def DMA_FOR dma
  # +++ lookup zipcodes, counties, geocoordinates, etc
  dma.to_s.upcase.gsub(/\s*,\s*/, '-').squish
end
