def hand_value(hand)
    sum = 0
    hand.each do |card|
      sum += card
    end
    sum
  end