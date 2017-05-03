#!/usr/bin/env ruby

  class WordCloudData

    attr_accessor :words_to_counts

    def initialize(input_string)
        @words_to_counts = {}
        self.populate_words_to_counts(input_string)
    end

    def populate_words_to_counts(input_string)
        # iterates over each character in the input string, splitting
        # words and passing them to add_word_to_hash()

        current_word = ''
        (0...input_string.length).each do |i|

            character = input_string[i]

            # if we reached the end of the string we check if the last
            # character is a letter and add the last word to our hash
            if i == input_string.length-1
                current_word += character if self.is_letter(character)
                self.add_word_to_hash(current_word) if !current_word.empty?

            # if we reach a space or emdash we know we're at the end of a word
            # so we add it to our hash and reset our current word
            elsif character == ' ' || character == "\u2014"
                self.add_word_to_hash(current_word) if !current_word.empty?
                current_word = ''

            # we want to make sure we split on ellipses so if we get two periods in
            # a row we add the current word to our hash and reset our current word
            elsif character == '.'
                if i < input_string.length-1 && input_string[i+1] == '.'
                    self.add_word_to_hash(current_word) if !current_word.empty?
                    current_word = ''
                end

            # if the character is a letter or an apostrophe, we add it to our current word
            elsif self.is_letter(character) || character == '\''
                current_word += character

            # if the character is a hyphen, we want to check if it's surrounded by letters
            # if it is, we add it to our current word
            elsif character == '-'
                if i > 0 && self.is_letter(input_string[i-1]) && \
                        self.is_letter(input_string[i+1])
                    current_word += character
                end
            end
        end
    end

    def add_word_to_hash(word)

        # if the word is already in the hash we increment its count
        if @words_to_counts.include? word
            @words_to_counts[word] += 1

        # if a lowercase version is in the hash, we know our input word must be uppercase
        # but we only include uppercase words if they're always uppercase
        # so we just increment the lowercase version's count
        elsif @words_to_counts.include? word.downcase
            @words_to_counts[word.downcase] += 1

        # if an uppercase version is in the hash, we know our input word must be lowercase.
        # since we only include uppercase words if they're always uppercase, we add the
        # lowercase version and give it the uppercase version's count
        elsif @words_to_counts.include? word.capitalize
            @words_to_counts[word] = 1
            @words_to_counts[word] += @words_to_counts[word.capitalize]
            @words_to_counts.delete(word.capitalize)

        # otherwise, the word is not in the hash at all, lowercase or uppercase
        # so we add it to the hash
        else
            @words_to_counts[word] = 1
        end
    end

    def is_letter(character)
        return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.include? character
    end
end
