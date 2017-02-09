#create todo list class
class TodoList
	#initialize
	def initialize(arr)
		@list = arr
	end

	def get_items
		@list
	end

	def add_item(chore)
		@list.push(chore)
	end

	def delete_item(chore)
		@list.delete(chore)
	end

	def get_item(num)
		@list[num]
	end
end


# p todolist = TodoList.new(["do the dishes", "mow the lawn"])

# p todolist.get_items
#store items in a list

# Add item to the list

# delete item

# retrieve item by index 
