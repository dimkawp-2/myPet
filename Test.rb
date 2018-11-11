class Test
  def call(env)
    req = Rack::Request.new(env)
    [404, {"Content-Type" => "text/html"}, ["test"]]
  end
end