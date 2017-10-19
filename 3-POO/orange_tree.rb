class OrangeTree


attr_accessor :height, :age, :oranges	
	@@count=0
	@@sum_age=0

	def initialize(height)
		@height = height
		@age=0
		@oranges=0
		@@count += 1
	end	

	def one_year_passes
		
		if @age>4 && @age<49
			@age += 1
			@height +=1
			@oranges = 20+@age
		elsif @age<49
			@age += 1
			@height +=1			
		else
			puts "the tree just died"
			@height = 0
			@age = 0
			@oranges=0
		end

	end
	
	def pick_an_orange
		
		if @oranges>0
		@oranges -= 1
		else
			puts "Il n'y a plus d'orange"
		end
	end
	
	#def self.average
	#	return @@sum_age/@@count
	#end

end

class OrangeTreeOrchard
	attr_accessor :tree
end


orange_

	



myTree = OrangeTreeOrchard.new(12)
yourTree= OrangeTreeOrchard.new(15)
hisTree= OrangeTreeOrchard.new(2)

OrangeTreeOrchard.each do |tree|
	tree.one_year_passes
	puts tree.age
end




	



