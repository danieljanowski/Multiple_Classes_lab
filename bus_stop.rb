class BusStop

  attr_reader :name, :queue

  require_relative ('person')

  def initialize(name)
    @name = name
    @queue = []
  end

  def queue_length
    return @queue.count
  end

  def add_to_queue(passenger)
    @queue << passenger
  end

  def clear_the_queue
    @queue.clear
  end

end
