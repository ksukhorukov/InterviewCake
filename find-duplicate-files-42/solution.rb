require 'digest'

def find_duplicate_files(starting_directory)
    files_seen_already = {}
    stack = [starting_directory]

    duplicates = []

    while stack.length > 0

        current_path = stack.pop()

        # if it's a directory,
        # put the contents in our stack
        if File::directory? current_path
            Dir.foreach(current_path) do |path|
                next if path == '.' || path == '..'
                full_path = File.join(current_path, path)
                stack.push(full_path)
            end

        # if it's a file
        else

            # get its hash
            file_hash = sample_hash_file(current_path)

            # get its last edited time
            current_last_edited_time = File::mtime(current_path)

            # if we've seen it before
            if files_seen_already.include? file_hash

                existing_last_edited_time, existing_path = files_seen_already[file_hash]

                if current_last_edited_time > existing_last_edited_time

                    # current file is the dupe!
                    duplicates.push([current_path, existing_path])

                else

                    # old file is the dupe!
                    duplicates.push([existing_path, current_path])

                    # but also update files_seen_already to have the new file's info
                    files_seen_already[file_hash] = \
                        [current_last_edited_time, current_path]
                end

            # if it's a new file, throw it in files_seen_already
            # and record its path and last edited time,
            # so we can tell later if it's a dupe
            else
                files_seen_already[file_hash] = \
                    [current_last_edited_time, current_path]
            end
        end
    end

    return duplicates
end


def sample_hash_file(path)

    num_bytes_to_read_per_sample = 4000
    total_bytes = File.size(path)

    hasher = Digest::SHA512.new

    File.open(path, 'r') do |file|

        # if the file is too short to take 3 samples, hash the entire file
        if total_bytes < num_bytes_to_read_per_sample * 3
            hasher.update file.read()

        else
            num_bytes_between_samples = (total_bytes - num_bytes_to_read_per_sample * 3) / 2

            # read first, middle, and last bytes
            0.upto(2) do |offset_multiplier|

                start_of_sample = offset_multiplier * (num_bytes_to_read_per_sample + num_bytes_between_samples)
                file.seek(start_of_sample)
                sample = file.read(num_bytes_to_read_per_sample)

                hasher.update sample
            end
        end
    end

    return hasher.hexdigest
end