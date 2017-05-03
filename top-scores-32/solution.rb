#!/usr/bin/env ruby

  def sort_scores(unsorted_scores, highest_possible_score)

    # array of 0s at indices 0..highest_possible_score
    score_counts = [0] * (highest_possible_score+1)

    # populate score_counts
    unsorted_scores.each do |score|
        score_counts[score] += 1
    end

    # populate the final sorted array
    sorted_scores = []

    # for each item in score_counts
    score_counts.each_with_index do |count, score|

        # for the number of times the item occurs
        (0...count).each do |time|

            # add it to the sorted array
            sorted_scores.push(score)
        end
    end

    return sorted_scores
end