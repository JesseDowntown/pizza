require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../pizza'

describe Pizza::Pie do
  describe '.initialize' do
  	it 'records all of the toppings' do
  		toppings = [
  			Pizza::Topping.new('mushrooms', vegetarian: true),
  			Pizza::Topping.new('pepperoni')
  		]
  		pizza = Pizza::Pie.new(toppings)

  		expect(pizza.toppings).to eq(toppings)
  	end

  	it 'defaults the toppings to cheese only, if the pizza has no toppings' do
  		pizza = Pizza::Pie.new

  		expect(pizza.toppings.size).to eq(1)
  		expect(pizza.toppings.first.name).to eq('cheese')
  	end
  end

  describe '#vegetarian?' do
    it 'returns true if all toppings on this pie are vegetarian' do
      toppings = [
        Pizza::Topping.new('mushrooms', vegetarian: true),
        Pizza::Topping.new('pepperoni')
      ]
      pizza = Pizza::Pie.new(toppings)
      pizza.vegetarian?

      expect(pizza.vegetarian?).to eq(false)
    end
  end

  describe '#add_topping' do
    it 'accepts a Topping object and adds it to the @toppings array' do
      pepperoni = [
        Pizza::Topping.new('pepperoni')
      ]
      pizza = Pizza::Pie.new()
      pizza.add_topping(pepperoni)

      expect(pizza.toppings.size).to eq(2)
    end
  end

  describe '#deliver!' do
    it 'marks a delivery time attribute on the pizza for 30 minutes from now' do
      pizza = Pizza::Pie.new()
      now = Time.now
      pizza.deliver!(now)

      expect(pizza.delivery_time).to eq(now + 30*60)
    end
  end

end 

describe Pizza::Topping do
	describe '.initialize' do
 		it "sets the name of the topping" do
 			topping = Pizza::Topping.new('olives') 		

 			expect(topping.name).to eq('olives')
 		end

 		it 'sets whether or not the topping is vegetarian' do
 			topping = Pizza::Topping.new 'bell peppers', vegetarian: true

 			expect(topping.vegetarian).to eq(true)
 		end
 	end

end