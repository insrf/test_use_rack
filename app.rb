class App

  def call(env)
    request = Rack::Request.new(env)
    @response = Rack::Response.new
    params = request.params["format"].split(",")
    @format = TimeCalulation.new(params)
    [ status, headers, body]
    @response.finish
  end

  private

  def status
    if @format.correct_parse?
      200
    else
      404
    end
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    if @format.correct_parse?
      @response.write "#{@format.return_time}"
    else
      @response.write "#{@format.return_unknown_formats}"
    end
  end

end
