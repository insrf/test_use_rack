class App

  def call(env)
    request = Rack::Request.new(env)
    @response = Rack::Response.new
    params = request.params["format"].split(",")
    @time = TimeCalulation.new(params)
    [ status, headers, body ]
    @response.finish
  end

  private

  def status
    if @time.correct_parse?
      200
    else
      404
    end
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    if @time.correct_parse?
      @response.write "#{@time.return_time}"
    else
      @response.write "#{@time.return_time}"
    end
  end

end
