# frozen_string_literal: true

class PricingService
  PRICE_TIP_CONSTANTS = {
    base_exponent: 0.3,
    curve_exponent: 0.1,
    atendance_weight: 1.2,
    space_type: {
      booth_10x10: { multipler: 1.00, min: 225 },
      booth_10x20: { multipler: 1.5, min: 400 },
      booth_20x40: { multipler: 2.0, min: 600 },
      booth_40x60: { multipler: 2.5, min: 788 },
      food_truck: { multipler: 0.5, min: 40 }
    }
  }.freeze

  def self.available_spaces
    PRICE_TIP_CONSTANTS[:space_type].keys
  end

  def self.suggested_price_tip_in_cents reach, duration_in_hours, space_type = :booth_10x10
    hours = [duration_in_hours, 1].max
    100 * suggested_price_tip_in_dollars(reach, hours, space_type).round
  end

  def self.suggested_price_tip_in_dollars reach, hours, space_type = :booth_10x10
    return 0 if reach.to_i.zero? || hours.to_i.zero?

    type = space_type.to_sym
    space_type_constants = PRICE_TIP_CONSTANTS[:space_type][type]
    space_type_constants ||= PRICE_TIP_CONSTANTS[:space_type][:booth_10x10]
    min = space_type_constants[:min]
    sm = space_type_constants[:multipler]
    be = PRICE_TIP_CONSTANTS[:base_exponent]
    ce = PRICE_TIP_CONSTANTS[:curve_exponent]
    aw = PRICE_TIP_CONSTANTS[:atendance_weight]
    r = reach.to_i
    h = hours.to_i
    tip = sm * (r**be) * ((h * 1000)**be) * (((h * (r**aw) / 1000)**ce))
    tip = (tip / 10).round * 10 # round to nearest $10
    tip
  end
end
