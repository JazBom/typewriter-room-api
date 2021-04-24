require 'test_helper'

class UserTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true
  test 'user count' do
    assert_equal 2, User.count
  end
  test 'find all users by name' do
    assert_equal 2, users(:user_one, :user_two).length
  end
  test 'find one user' do
    assert_equal 'jess', users(:user_one).name
  end
  test 'find by id' do
     jess_user = User.find(users(:user_one).id)
     assert_equal jess_user.name, users(:user_one).name
  end
end
