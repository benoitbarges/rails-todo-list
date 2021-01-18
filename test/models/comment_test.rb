require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @todo = todos(:clean_garage)
  end

  test "should not save comment without content" do
    comment = Comment.new
    assert_not comment.save, "Saved the comment without a content"
  end

  test "should not save comment without todo" do
    comment = Comment.new(content: "I'm a comment")
    assert_not comment.save, "Saved the comment without a todo"
  end

  test "should save comment with content and todo" do
    comment = Comment.new(content: "I'm a comment", todo: @todo)
    assert comment.save, "Did not saved the comment with a content"
  end
end
