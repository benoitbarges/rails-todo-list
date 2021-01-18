require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase

  def setup
    login_as users(:benoit)
    visit todos_path
  end

  test "creating a comment" do
    first('.comment-btn').click

    fill_in "Content", with: "This is a comment"

    click_on "Submit comment"

    assert_text "This is a comment"
  end

  test "deleting a comment" do
    count = Comment.count
    first('.comment-btn').click
    first('.fa-minus-square').click
    sleep 1
    assert_equal count - 1, Comment.count
  end
end
