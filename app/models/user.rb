class User < ActiveRecord::Base
	has_many :activities
	has_many :comments
end
