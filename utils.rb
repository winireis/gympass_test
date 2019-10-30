require 'time'

module Utils
  def hours_to_float(time_string)
    t = Time.parse(time_string)
    hours = t.strftime("%H").to_i
    minutes = t.strftime("%M").to_i
    seconds = t.strftime("%S").to_i
    milisseconds = t.strftime("%L").to_f
    return ((hours*3600)+(minutes*60 + seconds)+(milisseconds/1000))
  end
  def minutes_to_float(time_string)
    t = Time.parse("0:" + time_string)
    minutes = t.strftime("%M").to_i
    seconds = t.strftime("%S").to_i
    milisseconds = t.strftime("%L").to_f
    return ((minutes*60 + seconds)+(milisseconds/1000))
  end

  def float_to_time(time_float)
    Time.at(time_float.to_f).strftime("%M:%S.%L")
  end
end
