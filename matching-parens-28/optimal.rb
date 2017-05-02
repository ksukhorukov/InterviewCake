#!/usr/bin/env ruby

def get_closing_paren(sentence, opening_paren_index)
    open_nested_parens = 0

    (opening_paren_index + 1).upto(sentence.length - 1) do |position|
        char = sentence[position]

        if char == '('
            open_nested_parens += 1
        elsif char == ')'
            if open_nested_parens == 0
                return position
            else
                open_nested_parens -= 1
            end
        end
    end

    raise Exception, "No closing parenthesis :("
end