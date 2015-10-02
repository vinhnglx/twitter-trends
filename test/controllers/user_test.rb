require "test_helper"

class UserModelTest < ActiveSupport::TestCase

  def test_that_user_is_valid
    user = User.new
    user.first_name = "Test"
    user.last_name = "Test"
    user.email = "email@email.com"
    user.provider = "twitter"
    assert_not user.save, "Saved the user without a uid"
  end

end
