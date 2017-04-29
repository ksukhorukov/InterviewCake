 #complexity O(NlgN)
  def merge_ranges(meetings)

    # sort by start times
    sorted_meetings = meetings.sort

    # initialize merged_meetings with the earliest meeting
    merged_meetings = [sorted_meetings[0]]

    sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|

        last_merged_meeting_start, last_merged_meeting_end = merged_meetings[-1]

        # if the current and last meetings overlap, use the latest end time
        if current_meeting_start <= last_merged_meeting_end
            merged_meetings[-1] = [last_merged_meeting_start, [last_merged_meeting_end, current_meeting_end].max]

        # add the current meeting since it doesn't overlap
        else
            merged_meetings.push([current_meeting_start, current_meeting_end])
        end
    end

    return merged_meetings
end