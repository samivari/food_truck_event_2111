require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe '#event' do
  it 'exist' do
    event = Event.new('South Pearl Street Farmers Market')
    expect(event).to be_a(Event)
  end

  it 'has a name' do
    event = Event.new('South Pearl Street Farmers Market')
    expect(event.name).to eq('South Pearl Street Farmers Market')
  end

  it 'has no food_truck' do
    event = Event.new('South Pearl Street Farmers Market')
    expect(event.food_trucks).to eq([])
  end

  it 'has  food_trucks' do
    event = Event.new('South Pearl Street Farmers Market')

    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    expect(food_truck1).to be_a(FoodTruck)

    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    expect(food_truck2).to be_a(FoodTruck)

    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    expect(food_truck3).to be_a(FoodTruck)

    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.food_trucks).to eq([food_truck1, food_truck2, food_truck3])
  end

  it 'has a list food_truck by name' do
    event = Event.new('South Pearl Street Farmers Market')

    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    expect(food_truck1).to be_a(FoodTruck)

    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    expect(food_truck2).to be_a(FoodTruck)

    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    expect(food_truck3).to be_a(FoodTruck)

    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.food_truck_names).to eq(['Rocky Mountain Pies', 'Ba-Nom-a-Nom', 'Palisade Peach Shack'])
  end

  it 'has a list of what food_trucks sell what' do
    event = Event.new('South Pearl Street Farmers Market')

    item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    item3 = Item.new({ name: 'Peach-Raspberry Nice Cream', price: '$5.30' })
    item4 = Item.new({ name: 'Banana Nice Cream', price: '$4.25' })
    expect(item1).to be_a(Item)
    expect(item2).to be_a(Item)
    expect(item3).to be_a(Item)
    expect(item4).to be_a(Item)

    food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    expect(food_truck1).to be_a(FoodTruck)

    food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    expect(food_truck2).to be_a(FoodTruck)

    food_truck3 = FoodTruck.new('Palisade Peach Shack')
    food_truck3.stock(item1, 65)
    expect(food_truck3).to be_a(FoodTruck)

    event.add_food_truck(food_truck1)
    event.add_food_truck(food_truck2)
    event.add_food_truck(food_truck3)

    expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
    expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
  end
end
