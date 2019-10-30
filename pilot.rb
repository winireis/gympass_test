class Pilot
  attr_reader :code, :name, :laps, :total_laps, :total_time, :best_lap_number, :best_lap_time, :avg_speed
  def initialize(code, name)
    @code = code
    @name = name
    @laps = []
    @total_laps = 0
    @total_time = 0
    @best_lap_number = 0
    @best_lap_time = 1.0/0
    @avg_speed = 0.0
  end

  def add_lap(lap_number, lap_time, avg_speed)
    lap = {}
    lap[:number] = lap_number
    lap[:time] = lap_time
    lap[:avg_speed] = avg_speed
    @laps.push lap
    update_total_laps
    update_total_time(lap_time)
    update_best_lap(lap_time, lap_number)
    update_avg_speed
  end

  private

  def update_total_laps
    @total_laps += 1
  end

  def update_total_time(lap_time)
    @total_time += lap_time
  end

  def update_best_lap(lap_time, lap_number)
    if @best_lap_time > lap_time
      @best_lap_number = lap_number
      @best_lap_time = lap_time
    end
  end

  def update_avg_speed
    avg = 0.0
    @laps.each do |lap|
        avg+= lap[:avg_speed]
    end
    @avg_speed = avg/@laps.size
  end
end
