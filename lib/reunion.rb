require './lib/activity'

class Reunion
  attr_reader :location

  def initialize(location, activities = [])
    @location = location
    @activities = activities
  end


  def activities
    @activities.map do |activity|
      activity.name
    end
  end

  def add_activity(name, cost)
    @activities << Activity.new(name, cost)
  end
  
  def evaluate_cost
    costs = @activities.map do |activity|
      activity.cost
    end
    costs.sum
  end

  def evaluate_payment
    all_names = @activities.map do |activity|
      activity.participants.keys
    end.flatten.uniq
    # Evaluate amount owed for each activity
    amounts_per_activity = @activities.map do |activity|
      activity.evaluate_amount_owed(activity.participants)
    end

    payments_owed = {}
    all_names.each do |name|
      amounts_per_activity.each do |activity_amount|
        if payments_owed[name]
          payments_owed[name] += activity_amount[name]
        else
          payments_owed[name] = activity_amount[name]
        end
      end
    end
    payments_owed
  end
end
