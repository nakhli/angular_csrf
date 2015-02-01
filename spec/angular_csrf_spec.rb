require 'rails_helper'

describe 'angular_csrf', type: :request do
  it 'validates csrf protection using AngularJS set header name and with AngularJS cookie value' do
    get '/'

    expect do
      post '/'
    end.to raise_error(ActionController::InvalidAuthenticityToken)

    post '/', { }, AngularCsrf::ANGULAR_CSRF_HEADER_NAME => response.cookies[AngularCsrf::ANGULAR_CSRF_COOKIE_NAME]
    expect(response.status).to eq(201)
  end

  it 'does not modify behavior for default csrf http header' do
    get '/'

    expect do
      post '/'
    end.to raise_error(ActionController::InvalidAuthenticityToken)

    post '/', { }, 'X-CSRF-Token' => session[:_csrf_token]
    expect(response.status).to eq(201)
  end
end