require 'rack/proxy'

class AppProxy < Rack::Proxy

  def perform_request(env)
    request = Rack::Request.new(env)
    if request.path =~ %r{^/health}
      env["HTTP_HOST"] = ENV.fetch('API_ENDPOINT', 'api.heroku.support')
      env["SERVER_PORT"] = 80
      super(env)
    else
      @app.call(env)
    end
  end

end
