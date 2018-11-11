class Application
  def call(env)
    [200, {'Content-Type' => 'text/html'}, ["This is Rack 2222!"]]
  end
end

run Application.new