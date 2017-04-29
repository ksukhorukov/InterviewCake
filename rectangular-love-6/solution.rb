#!/usr/bin/env ruby

def find_range_overlap(point1, length1, point2, length2)

    # find the highest start point and lowest end point.
    # the highest ("rightmost" or "upmost") start point is
    # the start point of the overlap.
    # the lowest end point is the end point of the overlap.
    highest_start_point = [point1, point2].max
    lowest_end_point = [point1 + length1, point2 + length2].min

    # return nil overlap if there is no overlap
    if highest_start_point >= lowest_end_point
        return [nil, nil]
    end

    # compute the overlap length
    overlap_length = lowest_end_point - highest_start_point

    return [highest_start_point, overlap_length]
end

def find_rectangular_overlap(rect1, rect2)

    # get the x and y overlap points and lengths
    x_overlap_point, overlap_width  = find_range_overlap(\
        rect1['left_x'], rect1['width'],  rect2['left_x'], rect2['width'])
    y_overlap_point, overlap_height = find_range_overlap(\
        rect1['bottom_y'], rect1['height'], rect2['bottom_y'], rect2['height'])

    # return nil rectangle if there is no overlap
    if !overlap_width || !overlap_height
        return {
            'left_x' => nil,
            'bottom_y' => nil,
            'width' => nil,
            'height' => nil,
        }
    end

    return {
        'left_x' => x_overlap_point,
        'bottom_y' => y_overlap_point,
        'width' => overlap_width,
        'height' => overlap_height,
    }
end