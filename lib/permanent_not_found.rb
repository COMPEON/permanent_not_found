require "permanent_not_found/version"
require "set"

class PermanentNotFound
  CONTENT = '404 Not Found'.freeze

  def initialize(app, content: CONTENT, paths: [])
    @app = app
    @content = content
    @paths = Set.new(paths)
  end

  def call(env)
    if @paths.include?(env['PATH_INFO'].downcase)
      response
    else
      @app.call(env)
    end
  end

  private

  def response
    [404, { 'Content-Type' => 'text/html', 'Content-Length' => @content.size.to_s }, [@content]]
  end
end
