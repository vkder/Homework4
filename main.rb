
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'pass_train'
require_relative 'cargo_train'
require_relative 'wagon'
require_relative 'pass_wagon'
require_relative 'cargo_wagon'

class Train_console
  attr_accessor :trains, :stations, :routes

  def initialize
    @trains = []
    @stations = []
    @routes = []
  end


def menu
  loop do
    options
    puts "Choose right option: "

    case choice
    when 1 then create_station
    when 2 then create_train
    when 3 then create_route
    when 4 then add_station_to_route
    when 5 then delete_station_from_route
    when 6 then assign_to_a_route
    when 7 then add_wagon
    when 8 then delete_wagon
    when 9 then move_train
    when 11 then move_back
    when 11 then display_stations
    else break
    end
  end
end

  def options
    puts '1. Create a station'
    puts '2. Create a train'
    puts '3. Create a route'
    puts '4. Add station to route'
    puts '5. Delete Station to route'
    puts '6. Add route to the train'
    puts '7. Add wagon to the train'
    puts '8. Delete wagon to the train'
    puts '9. Move forward the train'
    puts '10. Move back the train'
    puts '11. Display station'
    puts '0. Exit'
  end

  def create_station
    puts "Add station name"
    @stations << Station.new(gets.chomp)
    puts "Station added"
  end

  def create_train
    number, type, vagon = train_input
    create_train!(number, type, vagon)
  end

  def create_train!(number, type, carriages_count)
    wagon = get_wagon(type)
    train = get_train(number, type)
    wagon_count.times { train_add_wagon(wagon)}
    trains << train
    puts "train : #{number} , #{type}"
  end

  def get_train(number, type)
    case type
    when "cargo"
      Cargo_train.new
    when "passanger"
      Pass_train.new
    else
      Train.new
    end
  end


  def train_input
    puts "Train number:"
    number = gets.chomp

    puts 'Input type("cargo" for cargo or "passanger" for passanger) of the train'
    type = gets.chomp

    puts "Input count of wagon"
    wagon_count = gets.chomp.to_i
    return number, type, wagon_count
  end

  def create_route
    if @stations.size >= 2
      @stations.each_with_index do |station, index|
    end
      print "Put first station: "
      first_station = gets.chomp.to_i
      print "Put last station: "
      last_station = gets.chomp.to_i
      @routes << Route.new(@stations[first_station, @stations[last_station]])
      puts "Route created"
    end
  end

  def add_station_to_route(index)
    index = choose_route

    if routes[index].nil?(index)
      puts"wrong index"
    else
      station = gets.to_i
      @routes[route].add_station(@stations[station])
    end
  end

  def delete_station_from_route(index)
    index = choose_route

    if routes[index].nil?(index)
      puts"wrong index"
    else
      station = gets.to_i
      @routes[route].delete_station(@stations[station])
    end
  end

  def choose_route
    puts routes
    puts "Choose train by index from 0 to #{routes.size - 1}"
    gets.chomp.to_i
  end

  def add_wagon
    index = choose_train

    if check_train_index?(index)
      puts"Wrong index"
    else
      wagon = get_wagon(@trains[index].type?)
      @trains[index].add_wagon(wagon)
    end
  end

  def get_wagon(type)
    case type
    when "cargo"
      Cargo_wagon.new
    when "passanger"
      Pass_wagon.new
    else
      Wagon.new
    end
  end

  def choose_train
    puts trains
    puts "Choose train by index from 0 to #{trains.size - 1}"
    gets.chomp.to_i
  end

  def check_train_index?(index)
    @trains[index].nil?
  end

  def move_train
    train_index = choose_train
    if check_train_index?(index)
      puts"Wrong index"
    else
      station_index = choose_station
      move_train!(train_index2, station_index) unless check_station_index(station_index)
    end
  end

  def move_back
    if !@trains.empty?
      puts "trains list"
      @trains.each_with_index do |train, index|
        puts "#{index} - #{train.number}"
      end
      puts "Choose train"
      train = gets.to_i
      @trains[train].go_backward
    else
      puts "no such train"
    end
  end


  def move_train!(train_index, station_index)
    route = Route.new(@trains[train_index].current_station, @stations[station_index])
    @trains[train_index].route = route
    @trains[train_index].go
  end

  def choose_station
    puts stations
    puts "Choose station by index from 0 to #{stations.size -1}"
    gets.chomp.to_i
  end

  def delete_wagon
    index = choose_train
    if @trains[index].nil?
      puts "wrong wagon"
    else
      @train[index].delete_wagon
      puts"deleted"
    end
  end

  def move_train(index)
    train_index = choose_train

    if check_train_index?(train_index)
      puts "wrong index"
    else
      station_index = choose_station
      move_train!(train_index, station_index) unless stations[index].nil?(station_index)
    end
  end

  def move_train!(train_index, station_index)
    route = Route.new(trains[train_index].current_station, stations[station_index])
    trains[train_index].route = route
    trains[train_index].go
  end

  def display_stations
    index = choose_station
    puts stations[index].trains
  end

  def show_route
    index = choose_train
    puts trains[index].route
  end

  def assign_a_route
    if !@trains.empty? || !@routes.empty?
      @trains.each_with_index do |train, index|
        puts "trains list"
        puts "#{index} - #{train.number}"
      end
      @routes.each_with_index do |route, index|
        puts "routes list"
        puts "#{index} - #{route.name}"
      end
      puts 'Введите номер маршрута:'
      route = gets.to_i
      puts 'Введите номер поезда:'
      train = gets.to_i

      @trains[train].take_a_route(@routes[route])
    else
      puts "error"
    end
  end
end



