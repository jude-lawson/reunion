require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    hiking = Activity.new('hiking', 40)
    skiing = Activity.new('skiing', 80)
    @reunion = Reunion.new('Estes Park', [hiking, skiing])
  end

  def test_reunion_exists
    assert_instance_of Reunion, @reunion
  end

  def test_reunion_has_location
    assert_equal 'Estes Park', @reunion.location
  end

  def test_reunion_has_activities
    assert_equal ['hiking', 'skiing'], @reunion.activities
  end

  def test_activites_can_be_added_to_reunion
    @reunion.add_activity('camping', 90)
    assert_equal ['hiking', 'skiing', 'camping'], @reunion.activities
  end

end
