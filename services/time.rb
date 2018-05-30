class TimeCalulation

  CORRECT_FORMATS = {"year" => "%Y", "month" => "%m", "day" => "%d", "hour" => "%H", "minute" => "%M", "second" => "%S"}

  def initialize(format)
    @time = ""
    @unknown_formats = "Unknown time format "
    @format = format
    time_calculation
  end

  def return_time
    if correct_parse?
      @time
    else
      @unknown_formats
    end
  end

  def correct_parse?
    if @unknown_formats == "Unknown time format "
      true
    else
      false
    end
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
