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
  

end
