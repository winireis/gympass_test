# Requires
require_relative 'parser'
# Parsing Input file
p = Parser.new("input.txt")
logs = p.parse
# Transforming parsed Logs in Race -> Pilots -> Laps
