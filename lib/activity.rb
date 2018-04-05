class Activity
  attr_reader :cost,
              :participants,
              :name

  def initialize(name, cost)
    @name = name
    @cost = cost
    @participants = {}
  end

  def add_participant(name, initial_payment)
    participants[name] = initial_payment
  end



end
