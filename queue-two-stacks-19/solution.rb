  class QueueTwoStacks
    def initialize
        @in_stack  = []
        @out_stack = []
    end

    def enqueue(item)
        @in_stack.push(item)
    end

    def dequeue()
        if @out_stack.length == 0
            # Move items from in_stack to out_stack, reversing order
            while @in_stack.length > 0 do
                newest_in_stack_item = @in_stack.pop
                @out_stack.push(newest_in_stack_item)
            end
            # If out_stack is still empty, return nil
            if @out_stack.length == 0
                return nil
            end
        end
        return @out_stack.pop
    end
end