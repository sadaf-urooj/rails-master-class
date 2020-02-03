require "test_helper"

require "active_record"


class ActiveRecordTest < Minitest::Test

	def setup	
		Post.establish_connection(database: "#{__dir__}/test_blog/db/development.sqlite3")
	end

	def test_initialize
		post = Post.new(id: 1, title: "post 1")
		assert_equal 1, post.id
		assert_equal "post 1", post.title
	end

	def test_find
			post = Post.find(1)
			assert_kind_of Post, post
			assert_equal 1, post.id
			assert_equal "post 1", post.title
	end

	def test_all
			post = Post.all.first		
			assert_kind_of Post, post
			assert_equal 1, post.id
			assert_equal "post 1", post.title
	end


	def test_execute_sql
		rows = Post.connection.execute("SELECT * FROM posts")
		p rows
	end

end
