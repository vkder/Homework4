class Station
  attr_reader :station_name

  def iniatilize(name)
    @name = name 
    @trains = []
  end

  def new_train_and_type(train) 
    @trains << train 
    puts "на станцию #{name} пришел поезд № #{train.number}"
  end

  def show_train_list_and_type(type)
    @trains.each { |train_name|
    puts train_name }
    
    @trains.count { |train| train.type == type } 
  end

  def send_train(train)
    @trains.delete(train)
  end

end