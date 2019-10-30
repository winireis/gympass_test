class Parser
  def initialize(file_path)
    @input = file_path
  end

  def parse
    # Reading Log file
    logs =[]
    f = File.open(@input, "r")
    f.each_line do |line|
      entry = line.split
      entry.delete_at(2)
      logs.push entry
    end
    f.close
    # Discarding first line
    logs.shift
    return logs.sort_by { |entry| entry[0] }
  end
end
