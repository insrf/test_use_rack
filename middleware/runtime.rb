class Runtime

  CORRECT_FORMATS = {"year" => "%Y", "month" => "%m", "day" => "%d", "hour" => "%H", "minute" => "%M", "second" => "%S"}

  def initialize(app)
    @app = app
  end

  def call(env)
    @env = env
    start = Time.now

    status, headers, body = @app.call(env)

    params = env["QUERY_STRING"].split("=")[1].split("%2C")
    @time = ""
    @unknown_formats = ""
    params.each  { |item|
      if CORRECT_FORMATS.include?(item)
        @time << "[#{Time.now.strftime(CORRECT_FORMATS[item])}] "
      else
        @unknown_formats << "[#{item}] "
      end
    }

    if @unknown_formats == ""
      body << "#{@time}"
    else
      status = 404
      body << "Unknown formats:"
      body << "#{@unknown_formats}"
    end
    [status, headers, body]

  end
end
