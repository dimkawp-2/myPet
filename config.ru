class Application
  def call(env)
    [200, {'Content-Type' => 'text/html'}, ["This is Rack!"]]
  end
end

run Application.new