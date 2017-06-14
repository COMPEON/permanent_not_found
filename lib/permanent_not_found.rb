require "permanent_not_found/version"
require "set"

class PermanentNotFound
  CONTENT = '404 Not Found'.freeze

  def initialize(app, content: CONTENT, paths: [], pattern: [])
    @app     = app
    @content = content
    @paths   = Set.new(paths)
    @pattern = Regexp.union(pattern)
  end

  def call(env)
    if permanent_redirected?(env['PATH_INFO'].downcase)
      response_with_404
    else
      @app.call(env)
    end
  end

  private

  def permanent_redirected?(path)
    @paths.include?(path) || @pattern =~ path
  end

  def response_with_404
    [404, { 'Content-Type' => 'text/html', 'Content-Length' => @content.size.to_s }, [@content]]
  end
end
