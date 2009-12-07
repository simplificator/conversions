module UnitConversions
  UNITS = ['kg', 'g', 't', 'mm2', 'm2']
  CONVERT_TO_PATTERN = /(#{UNITS.join('|')})_to_(#{UNITS.join('|')})/
  CONVERSIONS = {
    'kg' => {
      't' => lambda() {|kg| kg / 1000.0 },
      'g' => lambda() {|kg| kg * 1000 },
    },
    'g' => {
      'kg' => lambda() {|g| g / 1000.0},
      't' => lambda() {|g| g / (1000.0 * 1000) },
    },
    't' => {
      'kg' => lambda() {|t| t * 1000},
      'g' => lambda() {|t| t * (1000 * 1000)},
    },
    'm2' => {
      'mm2' => lambda() {|m2| m2 * (1000 * 1000.0)},
    },
    'mm2' => {
      'm2' => lambda() {|mm2| mm2 / (1000 * 1000.0)},
    },
  }
  
  
  def method_missing_with_unit_conversions(m, *args)
    if args.length == 0
      m.to_s =~ CONVERT_TO_PATTERN    
      return CONVERSIONS[$1][$2].call(self) if CONVERSIONS[$1] && CONVERSIONS[$1][$2]
    end
    method_missing_without_unit_conversions(m, args)
  end
  
end

class Fixnum
  include UnitConversions
  alias :method_missing_without_unit_conversions :method_missing
  alias :method_missing :method_missing_with_unit_conversions
end

class Float
  include UnitConversions
  alias :method_missing_without_unit_conversions :method_missing
  alias :method_missing :method_missing_with_unit_conversions
end