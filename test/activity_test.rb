require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("hiking")
  end

  def test_activity_exists
    assert_instance_of Activity, @activity
  end

  def test_activity_can_have_a_namew
    assert_equal "hiking", @activity.name
  end
  
end
