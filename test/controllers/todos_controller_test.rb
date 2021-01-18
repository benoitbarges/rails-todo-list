require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest

  def setup
    login_as users(:benoit)
    @user = users(:benoit)
    @todo = todos(:clean_garage)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should create todo and redirect to anchor" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { title: 'test', user: @user, deadline: Date.today } }
    end

    assert_redirected_to "/#todo-#{Todo.last.id}"
  end

  test "should delete todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end
  end
end
