class Route
  attr_reader :stations

  def initialize(first_st, second_st)
    @stations = [first_st, second_st]
    puts "Route created from #{first_st} to #{second_st}"
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    if [stations.first, stations.last].include?
      puts"Erorr, cannot delete 1st station"
    else
      stations.delete(station)
    end
  end

  def show_route
    puts stations
  end
end