#!ruby
END{
	puts "end time is : #{Time.now.to_s}"
}

module MyModule
	module AddClassMethods
		def annie
			puts "annie baby is best of all"
		end
	end

	def self.included(model)
		def model.foo
			puts "class method foo"
		end

		model.extend(AddClassMethods, Module.new{ def bar; puts "extend class method bar" end } )
	end

	def instance_foo
		puts "instance method foo"
	end
end

class MyClass
	include MyModule
end

MyClass.foo
MyClass.bar
MyClass.annie
MyClass.new.instance_foo

BEGIN{
	puts "begin time is : #{Time.now.to_s}"
}
