require ('minitest/autorun')
require ('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../person.rb')
require_relative('../bus_stop.rb')

class TestBusStop < Minitest::Test

  def setup
    @bus_stop1 = BusStop.new("Gorebridge")
    @passenger1 = Person.new('Daniel', 42)
  end

  def test_queue_length
    assert_equal(0, @bus_stop1.queue_length)
  end

  def test_add_to_queue
    @bus_stop1.add_to_queue(@passenger1)
    assert_equal(1, @bus_stop1.queue_length)
  end

end
