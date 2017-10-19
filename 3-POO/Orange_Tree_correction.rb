class OrangeTree
	attr_accessor :height, :age, :oranges
	@@all_infos = []

	def initialize(height)
		@height = height
		@age = 0
		@oranges = 0
		@@all_infos << self
	end

	def self.my_info
		@@all_infos
	end

	def one_year_passes
		if @age > 4 && @age < 49
			@age += 1
			@oranges = 20 + @age
			@height += 1
		elsif @age <= 4
			@age += 1
			@height += 1
		else
			@height = 0
			@age = 0
			@oranges = 0
		end
	end

	def pick_an_orange
		if @oranges > 0
			@oranges -= 1
		else 
			@oranges = 0
		end
	end

	def count_the_oranges
		return @oranges
	end
end

class OrangeTreeOrchard
	attr_accessor :all_trees

	def initialize()
		@all_trees = OrangeTree.my_info
	end

	def age_all_trees_by_one_year
		@all_trees.each do |tree|
			tree.one_year_passes
		end
	end

	def pick_and_count_all_fruits
		fruit_count = 0

		@all_trees.each do |tree|
			fruit_count += tree.oranges
			(1..tree.oranges).each do |i|
				tree.pick_an_orange
			end
		end

		puts "The total number of fruits picked is #{fruit_count}"
		return fruit_count
	end

	def average_height_average_fruit_trees
		total_height = 0
		total_oranges = 0

		@all_trees.each do |tree|
			total_height += tree.height
			total_oranges += tree.oranges
		end

		height_avg = total_height.to_f/(@all_trees.length)
		orange_avg = total_oranges.to_f/(@all_trees.length)

		puts "The average height is #{height_avg} and the average number of oranges is #{orange_avg}"
	end
end

orange1 = OrangeTree.new (30)
orange2 = OrangeTree.new (10)
orange3 = OrangeTree.new (15)
orange4 = OrangeTree.new (25)

orange1.one_year_passes
orange1.one_year_passes

#Create an orchard with thos 4 orange trees
new_orchard = OrangeTreeOrchard.new

(1..7).each do |i|
	new_orchard.age_all_trees_by_one_year
end

new_orchard.average_height_average_fruit_trees
new_orchard.pick_and_count_all_fruits