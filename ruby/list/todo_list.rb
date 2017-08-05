class TodoList
  attr_accessor :todo_list

  def initialize(todo_list)
    @todo_list = todo_list
  end

  def get_items
    @todo_list
  end

  def add_item(item)
    @todo_list << item
  end

  def delete_item(item)
    @todo_list.delete(item)
  end

  def get_item(num)
    @todo_list[num]
  end
end
