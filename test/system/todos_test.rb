require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase

  def setup
    login_as users(:benoit)
    visit todos_path
  end

  test "viewing the index" do
    assert_selector "h1", text: "Todo App"
  end

  test "creating a todo" do
    click_on(class: 'add-todo-btn')

    fill_in "Title", with: "Creating a todo"
    find('.datepicker').click
    find('.today').click

    click_on "Add Todo"

    assert_text "Creating a todo"
  end

  test "deleting a todo" do
    count = Todo.count
    first('.delete-todo').click
    page.accept_alert
    sleep 1
    assert_equal count - 1, Todo.count
  end
end
