  def find_unique_delivery_id(delivery_ids)

    unique_delivery_id = 0

    delivery_ids.each do |delivery_id|
        unique_delivery_id ^= delivery_id
    end

    return unique_delivery_id
end