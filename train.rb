class Train
  attr_accessor :speed, :station
  attr_reader :number, :type, :vagon, :route, :index

  def initialize(number, type, vagon, route)
    @number = number
    @type = type
    @vagon = vagon
    @speed = 0
    puts "номер поезда: #{number}, тип: #{type}, количество вагонов: #{vagon}}"
  end

  def up_speed(speed)
    @speed += speed
  end

  def current_speed
    speed
  end

  def stop
    speed = 0
  end

  def add_vagon
    vagon += vagon if speed == 0
  end

  def delete_vagon
    if vagon.zero?
      puts"Error"
    else
     vagon -= 1 if speed == 0
     end
   end

  def take_route(route)
    @route = route
    @index = 0
  end

  def current_station
    @index = 0
  end

  def last_station?
    current_station == route.stations.last
  end

  def first_station?
    current_station == route.stations[0]
  end


  def next_station
    route.stations[@index + 1] unless last_station?
  end

  def last_station
    if @index == 0 
      puts"Error"
    else
      route.stations[@index - 1]
    end
  end

 def go_to(station)
    if route.nil?
      puts "Error, нет маршрута"
    elsif route.stations.include?(station)
      @station.send_train(self) if @station
      station.take_the_train(self)
      index += 1
    else
      puts "такого маршрута не существует"
    end
  end


  def move_back(station)
    if route.nil?
      puts "Error, нет маршрута"
    elsif route.stations.include?(station)
      @station.send_train(self) if @station
      station.take_the_train(self)
      index -= 1
    else
      puts "такого маршрута не существует"
    end
  end
end