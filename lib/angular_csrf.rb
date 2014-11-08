module AngularCsrf
  ANGULAR_CSRF_COOKIE_NAME = 'XSRF-TOKEN'
  ANGULAR_CSRF_HEADER_NAME = 'X-XSRF-Token'

  def self.setup
    ActiveSupport.on_load(:action_controller) do
      after_action :set_csrf_cookie_for_angular_js

      define_method :set_csrf_cookie_for_angular_js do
        cookies[ANGULAR_CSRF_COOKIE_NAME] = form_authenticity_token if protect_against_forgery?
      end
      private :set_csrf_cookie_for_angular_js

      define_method :verified_request_with_angular_header? do
        verified_request_without_angular_header? ||
          form_authenticity_token == request.headers[ANGULAR_CSRF_HEADER_NAME]
      end
      alias_method_chain :verified_request?, :angular_header
    end
  end
end
