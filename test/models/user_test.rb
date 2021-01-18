require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:benoit)
  end

  test '#todos' do
    assert_equal 2, @user.todos.size
  end

  test '#commment' do
    assert_equal 2, @user.comments.size
  end
end
