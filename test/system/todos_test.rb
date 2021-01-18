require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase

  test "viewing the index" do
    login_as users(:benoit)
    visit todos_path
    assert_selector "h1", text: "Todo App"
  end

  test "creating a todo" do
    login_as users(:benoit)
    visit todos_path

    click_on(class: 'add-todo-btn')
    save_and_open_screenshot

    fill_in "Title", with: "Creating a todo"
    find('.datepicker').click
    find('.today').click

    click_on "Add Todo"

    assert_text "Creating a todo"
  end
end
