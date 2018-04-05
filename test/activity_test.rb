require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("hiking", 100)
  end

  def test_activity_exists
    assert_instance_of Activity, @activity
  end

  def test_activity_can_have_a_namew
    assert_equal "hiking", @activity.name
  end

  def test_activity_has_a_cost
    assert_equal 100, @activity.cost
  end

  def test_participants_can_be_added_to_activity
    @activity.add_participant("Jules", 20)
  end

  def test_participants_can_be_retrieved
    @activity.add_participant(:Jules, 20)
    @activity.add_participant(:Ida, 20)
    @activity.add_participant(:Jerry, 0)
    
    assert_instance_of Hash, @activity.participants
    assert_equal 20, @activity.participants[:Jules]
    assert_equal 20, @activity.participants[:Ida]
    assert_equal 0, @activity.participants[:Jerry]
  end

  def test_cost_can_be_split_evenly_between_participants
    @activity.add_participant(:Jules, 20)
    @activity.add_participant(:Ida, 20)
    @activity.add_participant(:Jerry, 0)
    @activity.add_participant(:Larry, 12)

    assert_equal 25, @activity.split_cost
  end

  def test_cost_split_is_correct_with_uneven_split
    @activity.add_participant(:Jules, 20)
    @activity.add_participant(:Ida, 20)
    @activity.add_participant(:Jerry, 0)

    assert_equal [34, 33], @activity.split_cost
  end

end
