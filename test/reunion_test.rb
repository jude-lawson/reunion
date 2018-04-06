require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new('Estes Park', ['hiking', 'skiing'])
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
    @reunion.add_activity('camping')
    assert_equal ['hiking', 'skiing', 'camping'], @reunion.activities
  end

end
