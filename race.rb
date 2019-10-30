class Race
  include Utils
  def initialize(logs)
    @logs = logs
    @pilots = {}
    @positions_per_lap = {}
    reset_positions
    simulate
  end

  # A partir de um input de um arquivo de log do formato acima, montar o resultado da corrida com as seguintes informações:
  # Posição Chegada, Código Piloto, Nome Piloto, Qtde Voltas Completadas e Tempo Total de Prova.
  def scoreboard
    position = 1
    score_order = set_positions
    score_order.each do |pilot_code|
      puts "#{position} - #{pilot_code} - #{@pilots[pilot_code].name} - #{@pilots[pilot_code].total_laps} - #{float_to_time(@pilots[pilot_code].total_time)}"
      position += 1
    end
  end

  def best_lap
    best_laps = {}
    @pilots.each_value do |pilot|
      best_laps[pilot.name] = pilot.best_lap_time
    end
    best_time = best_laps.values.min
    pilot_name = best_laps.key(best_time)
    puts "#{pilot_name} - #{float_to_time(best_time)}"
  end

  def pilots_best_laps
    @pilots.each_value do |pilot|
      puts "#{pilot.name} - #{pilot.best_lap_number} - #{float_to_time(pilot.best_lap_time)}"
    end
  end

  def pilots_avg_speed
    @pilots.each_value do |pilot|
      puts "#{pilot.name} - #{pilot.avg_speed.round(2)}"
    end
  end

  def pilots_time_comparison
    position = 1
    score_order = set_positions
    best_race_time = @pilots[score_order.first].total_time
    score_order.each do |pilot_code|
      comparison = @pilots[pilot_code].total_time - best_race_time
      puts "#{position} - #{pilot_code} - #{@pilots[pilot_code].name} - #{float_to_time(comparison)}"
      position += 1
    end
  end

  private

  def reset_positions
    @positions_per_lap[1]=[]
    @positions_per_lap[2]=[]
    @positions_per_lap[3]=[]
    @positions_per_lap[4]=[]
  end

  def simulate
    @logs.each do |log|
      add_lap(log)
    end
  end

  def set_positions
    @positions_per_lap[4] | @positions_per_lap[3] | @positions_per_lap[2] | @positions_per_lap[1]
  end

  def add_lap(lap)
    log_time = lap.shift
    pilot_code = lap.shift
    pilot_name = lap.shift
    lap_number = lap.shift.to_i
    lap_time = minutes_to_float(lap.shift)
    avg_speed = lap.shift.to_f
    #Create Pilot entry if none
    unless @pilots[pilot_code]
      p = Pilot.new(pilot_code, pilot_name)
      @pilots[pilot_code] = p
    else
      p = @pilots[pilot_code]
    end
    #Add lap to Pilot Entry
    p.add_lap(lap_number, lap_time, avg_speed)
    #Add lap do positions_per_lap
    @positions_per_lap[lap_number].push pilot_code
  end
end
