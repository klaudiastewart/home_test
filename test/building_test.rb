require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/apartment'
require './lib/renter'

class BuildingTest < Minitest::Test
  def test_building_exists
    building = Building.new

    assert_instance_of Building, building
  end

  def test_building_has_no_units_by_default
    building = Building.new

    assert_equal [], building.units
  end

  def test_can_add_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})

    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal [unit1, unit2], building.units
    assert_equal [], building.renters
  end

  def test_can_add_renters
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    renter1 = Renter.new("Aurora")
    renter2 = Renter.new("Tim")
# require "pry"; binding.pry
    unit1.add_renter(renter1)
    building.add_unit(unit1)

    # require "pry"; binding.pry
    assert_equal ["Aurora"], building.renters

    # unit2.add_renter(renter2)
    # building.add_unit(unit2)
    #
    # assert_equal ["Aurora", "Tim"], building.renters
  end
end
