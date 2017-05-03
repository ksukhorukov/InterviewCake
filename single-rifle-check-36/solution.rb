  def is_single_riffle(half1, half2, shuffled_deck)
    half1_index = 0
    half2_index = 0
    half1_max_index = half1.length - 1
    half2_max_index = half2.length - 1

    shuffled_deck.each do |card|
        # if we still have cards in half1
        # and the "top" card in half1 is the same
        # as the top card in shuffled_deck
        if half1_index <= half1_max_index and \
                card == half1[half1_index]
            half1_index += 1

        # if we still have cards in half2
        # and the "top" card in half2 is the same
        # as the top card in shuffled_deck
        elsif half2_index <= half2_max_index and \
                card == half2[half2_index]
            half2_index += 1

        # if the top card in shuffled_deck doesn't match the top
        # card in half1 or half2, this isn't a single riffle.
        else
            return false
        end
    end

    # all cards in shuffled_deck have been "accounted for"
    # so this is a single riffle!
    return true
end