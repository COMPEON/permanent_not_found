require "permanent_not_found/version"
require "set"

class PermanentNotFound
  BLOCKED_ROUTES = Set.new(
    %w[
      /.git/head
      /.well-known/apple-app-site-association
      /.well-known/assetlinks.json
      /apple-app-site-association
      /autodiscover/autodiscover.xml
      /browserconfig.xml
      /mysqldumper
      /phpmyadmin
      /wordpress/wp-login.php
      /wp-content/plugins/woocommerce/i18n/locale-info.php
      /wp-login.php
    ]
  ).freeze

  CONTENT = '404 Not Found'
  NOT_FOUND_RESPONSE = [
    404, { 'Content-Type' => 'text/html', 'Content-Length' => CONTENT.size.to_s }, [CONTENT]
  ].freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    if BLOCKED_ROUTES.include?(env['PATH_INFO'].downcase)
      NOT_FOUND_RESPONSE
    else
      @app.call(env)
    end
  end
end
