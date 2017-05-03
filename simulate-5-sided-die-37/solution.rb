#!/usr/bin/env ruby

  def rand5()
    result = 7 # arbitrarily large
    while result > 5
        result = rand7()
    end
    return result
end

  def rand5()
    roll = rand7()
    if roll <= 5 then return roll else return rand5() end
end