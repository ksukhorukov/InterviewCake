#!/usr/bin/env ruby

require 'set'

def can_two_movies_fill_flight(movie_lengths, flight_length)

    # movie lengths we've seen so far
    movie_lengths_seen = Set.new

    movie_lengths.each do |first_movie_length|

        matching_second_movie_length = flight_length - first_movie_length
        if movie_lengths_seen.include? matching_second_movie_length
            return true
        end

        movie_lengths_seen.add(first_movie_length)
    end

    # we never found a match, so return False
    return false
end

movies = [5,10,11,12,13,14,5]
puts can_two_movies_fill_flight(movies, 10)