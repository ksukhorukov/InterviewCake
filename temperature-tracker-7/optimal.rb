class TempTracker

    def initialize

        # for mode
        @occurrences = [0] * (111) # array of 0s at indices 0..110
        @max_occurrences = 0
        @mode = nil

        # for mean
        @total_numbers = 0
        @total_sum = 0.0 # mean should be float
        @mean = nil

        # for min and max
        @min_temp = nil
        @max_temp = nil
    end

    def insert(temperature)

        # for mode
        @occurrences[temperature] += 1
        if @occurrences[temperature] > @max_occurrences
            @mode = temperature
            @max_occurrences = @occurrences[temperature]
        end

        # for mean
        @total_numbers += 1
        @total_sum += temperature
        @mean = @total_sum / @total_numbers

        # for min and max
        if @max_temp.nil? or temperature > @max_temp
            @max_temp = temperature
        end
        if @min_temp.nil? or temperature < @min_temp
            @min_temp = temperature
        end
    end

    def get_max
        return @max_temp
    end

    def get_min
        return @min_temp
    end

    def get_mean
        return @mean
    end

    def get_mode
        return @mode
    end
end