class Todo < ActiveRecord::Base

#	attr_accessible :todo_item, :completed
	validates :todo_item, presence: true

end
