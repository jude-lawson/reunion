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

  def split_cost
    num_participants = @participants.length
    return 0 if num_participants == 0
    if @cost % num_participants == 0
      @cost / num_participants
    else
      base_cost = @cost / num_participants
      cost_with_remainder = base_cost + (@cost % num_participants)
      [cost_with_remainder, base_cost]
    end
  end




end
