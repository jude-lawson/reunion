require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @hiking = Activity.new('hiking', 40)
    @skiing = Activity.new('skiing', 80)
    @reunion = Reunion.new('Estes Park', [@hiking, @skiing])
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

  def test_that_total_cost_can_be_evaluated
    total = @reunion.evaluate_cost
    assert_equal 120, total
  end

  def test_total_amount_owed_can_be_calculated
    @hiking.add_participant(:Jules, 20)
    @hiking.add_participant(:Albert, 10)
    @skiing.add_participant(:Jules, 10)
    @skiing.add_participant(:Elias, 40)
    @skiing.add_participant(:Albert, 0)
    @skiing.add_participant(:Jaime, 12)

    actual = @reunion.evaluate_payment

    expected = {Jules: 10, Albert: 30, Elias: -20, Jaime: 8}

    assert_equal expected, actual
  end

end
