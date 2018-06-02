class TimeCalulation

  CORRECT_FORMATS = {"year" => "%Y", "month" => "%m", "day" => "%d", "hour" => "%H", "minute" => "%M", "second" => "%S"}

  def initialize(format)
    @time = ""
    @unknown_formats = "Unknown time format "
    @format = format
    time_calculation
  end

  def return_time; @time;  end

  def return_unknown_formats; @unknown_formats;  end

  def correct_parse?
    @unknown_formats == "Unknown time format "
  end

  private

  def time_calculation
    @format.each  { |item|
      if CORRECT_FORMATS.include?(item)
        @time << "[#{Time.now.strftime(CORRECT_FORMATS[item])}] "
      else
        @unknown_formats << "[#{item}] "
      end
    }
  end
end
