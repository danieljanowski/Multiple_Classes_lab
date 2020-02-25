require ('minitest/autorun')
require ('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bus.rb')
require_relative('../person.rb')
require_relative('../bus_stop.rb')

class TestBus < Minitest::Test

  def setup
    @bus1 = Bus.new("21", "Gyle Centre")
    @passenger1 = Person.new("Richard", 27)
    @passenger2 = Person.new("Daniel", 42)
    @bus_stop1 = BusStop.new("Corstorphine")
  end

  def test_number
    assert_equal("21", @bus1.route)
  end

  def test_route
    assert_equal("Gyle Centre", @bus1.destination)
  end

  def test_drive
    assert_equal("Brum brum", @bus1.drive)
  end

  def test_number_passengers
    assert_equal(0, @bus1.count_passengers)
  end

  def test_pick_up
    @bus1.pick_up(@passenger1)
    assert_equal(1, @bus1.count_passengers)
  end

  def test_drop_off
    @bus1.pick_up(@passenger1)
    @bus1.pick_up(@passenger2)
    @bus1.drop_off(@passenger2)
    assert_equal(1, @bus1.count_passengers)
  end

  def test_empty_bus
    @bus1.pick_up(@passenger1)
    @bus1.pick_up(@passenger2)
    @bus1.empty_bus
    assert_equal(0, @bus1.count_passengers)
  end

  def test_pick_up_from_stop
    @bus_stop1.add_to_queue(@passenger1)
    @bus_stop1.add_to_queue(@passenger2)
    @bus1.pick_up_from_stop(@bus_stop1)
    assert_equal(0, @bus_stop1.queue_length)
    assert_equal(2, @bus1.count_passengers)

  end

end
