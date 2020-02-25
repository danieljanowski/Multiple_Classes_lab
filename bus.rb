class Bus

  attr_reader :route, :destination, :passengers

  require_relative('bus_stop')
  require_relative('person')

  def initialize(route, destination)
    @route = route
    @destination = destination
    @passengers = []
  end

  def drive
    return "Brum brum"
  end

  def count_passengers
    return @passengers.count
  end

  def pick_up(passenger)
    @passengers << passenger
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def empty_bus
    @passengers.clear
  end

  def pick_up_from_stop(bus_stop)
    for passenger in
      bus_stop.queue.each{|passenger| @passengers.push(passenger)}
    end
    bus_stop.clear_the_queue
  end

end
