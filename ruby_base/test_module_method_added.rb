#!ruby

module AddBeforeFilter
	def self.included(model)
		def model.before_filter *methods
			@@befores ||= []
			@@befores += methods.map{|m| m.to_s}
		end

		def model.method_added(method)
			@@defined_methods ||= []
			method = method.to_s
			if (method =~ /cusnew/).nil? and (method =~ /initialize/).nil? and !@@befores.include?(method) and !@@defined_methods.include?(method)
			  	alias_method "cusnew_#{method}".to_sym, method
			  	@@defined_methods << method

			  	self.class_eval do 
			  		define_method(method.to_sym) do |*params|
			  			@@befores.each { |bmethod| __send__(bmethod) }
			  			__send__("cusnew_#{method}".to_sym, *params)
		  			end
		  		end
			end
		end
		
	end

end

class MyClass
	include AddBeforeFilter
	before_filter :foo, :bar


	def hello(name)
		puts "hello #{name}"
	end

	def done
		puts "done"
	end

	private
	def foo
		puts "first aa"
	end

	def bar
		puts "first bb"
	end
end

MyClass.new.hello("annie")
MyClass.new.done