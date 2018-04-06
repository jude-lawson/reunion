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
    if @cost % num_participants != 0
      base_cost = @cost / num_participants
      cost_with_remainder = base_cost + (@cost % num_participants)
      [cost_with_remainder, base_cost]
    else
      [0, @cost / num_participants]
    end
  end

  def evaluate_amount_owed(participants)
    split_base_cost = split_cost[1]
    amounts_owed = {}
    participants.each do |name, initial_payment|  
      owes = split_base_cost - initial_payment
      amounts_owed[name] = owes
    end
    if split_cost[0] == 0
      amounts_owed[:leftovers] = 0
    else
      amounts_owed[:leftover] = split_cost[0] - split_base_cost
    end
    amounts_owed
  end

end
