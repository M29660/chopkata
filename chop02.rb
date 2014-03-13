#Write a binary chop method that takes an integer search target and a sorted array of integers. 
#It should return the integer index of the target in the array, or -1 if the target is not in the array. 
#The signature will logically be: chop(int, array_of_int)  -> int

class Chop
		 attr_accessor :int, :array_int, :startrange, :endrange

#Use of instance variables 
	def initialize(int, array_int)
		@array_int = array_int.sort!
		@int = int
		@startrange = 0
		@endrange = @array_int.length-1
	end

	def chop  
		range_overlap?
		comparison
	end

	def range_overlap?
		if @startrange > @endrange
			print -1
			abort
		end
	end

	#Midpoint index for the array
	def midpoint
		(@startrange+@endrange)/2
	end

	#Midpoint value for the array
	def midvalue
		@array_int[midpoint]
	end

	#Comparison
	def comparison
		if @int == midvalue
			puts midpoint
		else
			compare_less_than_midvalue
			compare_more_than_midvalue
		end
	end

	def compare_less_than_midvalue
		if @int < midvalue
			@endrange=midpoint-1
		  chop
		end
	end 

	def compare_more_than_midvalue
		if @int > midvalue
			@startrange=midpoint+1
			chop
		end
	end

#Creates new instance of chop used unordered array
katachop = Chop.new(10, [50,13,67,34,2,12,9,80])#Array(1..100))
katachop.chop
end
