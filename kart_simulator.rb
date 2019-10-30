# Requires
require_relative 'utils'
require_relative 'parser'
require_relative 'race'
require_relative 'pilot'

# Parsing Input file
p = Parser.new("input.txt")
logs = p.parse

# Transforming parsed Logs in Race -> Pilots -> Laps
r = Race.new(logs)

# Final Scoreboard
puts "-----Scoreboard----"
r.scoreboard
# Best Race Lap
puts "-----Best Race Lap----"
r.best_lap
# Best Pilots Laps
puts "-----Best Pilots Laps----"
r.pilots_best_laps
# Pilots AVG Speeds
puts "-----Pilots Average Speeds----"
r.pilots_avg_speed
# Pilots Total Time Comparison
puts "-----Time Comparison----"
r.pilots_time_comparison
