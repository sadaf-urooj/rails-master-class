require "test_helper"
require "active_record"
require "active_support"

class ActiveSupportTest < Minitest::Test

	def setup
		ActiveSupport::Dependencies.autoload_paths = Dir["{__dir__}/test_blog/app/*"]
	end

	def test_search_for_file
		file = ActiveSupport::Dependencies.search_for_file("application_controller")
		assert_equal "#{__dir__}/test_blog/app/controllers/application_controller.rb", file
	end

	def test_search_for_file
		file = ActiveSupport::Dependencies.search_for_file("unknown")
		assert_equal nil, file
	end 

	def test_case_name
		# :post => "post" ye kam ActiveSupport core extension k through hota hey.
		# ApplicationController => "application_controller"

		assert_equal "post", :Post.to_s.underscore
		assert_equal "application_controller", :ApplicationController.to_s.underscore
	end
end 