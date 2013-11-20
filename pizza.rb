module Pizza
	class Pie

		attr_accessor :toppings

		# Instantiate a new pizza.
		#
		# toppings - An array of topping objects.
		#
		# Returns a new Pie object.

		def initialize(toppings = [Pizza::Topping.new('cheese', vegetarian: true)])
			@toppings = toppings
		end

		def vegetarian?
			if @toppings.any? { |topping| topping.vegetarian === false}
				return false
			else
				return true
			end
		end

		def add_topping(topping)
			@toppings << topping
		end

	end

	class Topping
		attr_accessor :name, :vegetarian

		# Instantiate a new topping.
		#
		# name - The String name of the topping.
		#
		# vegetarian - The Boolean indicating whether or not the topping is
		# 						 vegetarian.
		#
		# Returns a new Topping object.

		def initialize(name, vegetarian: false)
			@name = name
			@vegetarian = vegetarian
		end
		
	end

end