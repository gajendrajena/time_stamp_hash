class TimeStampHash < Hash

  def set(key, value, time_stamp)
    raise KeyError, 'key should not be nil' if key.nil?
    raise KeyError, 'time_stamp should not be nil' if time_stamp.nil?

    if self[key]
      self[key][time_stamp] = value
    else
      self[key] = {}
      self[key][time_stamp] = value
    end

    value
  end

  def get(key, time_stamp)

    value = if self[key]
      self[key][time_stamp]
    else
      nil
    end
    value
  end

end

# d.set(1, 1, 0) # set key 1 to value 1 at time 0
# d.set(1, 2, 2) # set key 1 to value 2 at time 2
# d.get(1, 1) # get key 1 at time 1 should be 1
# d.get(1, 3) # get key 1 at time 3 should be 2
# d.set(1, 1, 5) # set key 1 to value 1 at time 5
# d.get(1, 0) # get key 1 at time 0 should be null
# d.get(1, 10) # get key 1 at time 10 should be 1
# d.set(1, 1, 0) # set key 1 to value 1 at time 0
# d.set(1, 2, 0) # set key 1 to value 2 at time 0
# d.get(1, 0) # get key 1 at time 0 should be 2

