require 'test_helper'

class TodoTest < ActiveSupport::TestCase

  def setup
    @user = users(:benoit)
    @todo = todos(:clean_garage)
  end

  test "should not save todo without attributes" do
    todo = Todo.new
    assert_not todo.save, "Saved the todo without any attributes"
  end

  test "should save todo with all attributes" do
    todo = Todo.new(title: 'Clean the garage', deadline: Date.today, user: @user)
    assert todo.save, "Did not saved the todo with all attributes"
  end

  test "should not save todo without user" do
    todo = Todo.new(title: 'Clean the garage', deadline: Date.today)
    assert_not todo.save, "Saved the todo without user"
  end

  test "should not save todo without deadline" do
    todo = Todo.new(title: 'Clean the garage', user: @user)
    assert_not todo.save, "Saved the todo without deadline"
  end

  test "should not save todo without title" do
    todo = Todo.new(deadline: Date.today, user: @user)
    assert_not todo.save, "Saved the todo without title"
  end

  test "comments" do
    assert_equal 2, @todo.comments.size
  end
end
