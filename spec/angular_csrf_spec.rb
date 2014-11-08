require 'rails_helper'

describe 'angular_csrf', type: :request do
  it 'sets expected AngularJS csrf cookie' do
    get '/'
    expect(response.cookies[AngularCsrf::ANGULAR_CSRF_COOKIE_NAME]).to_not be_nil
    expect(response.cookies[AngularCsrf::ANGULAR_CSRF_COOKIE_NAME]).to eq(session[:_csrf_token])
  end

  it 'checks AngularJS csrf http header for csrf protection' do
    get '/'
    post '/', { }, AngularCsrf::ANGULAR_CSRF_HEADER_NAME => session[:_csrf_token]
    expect(response.status).to eq(201)
  end

  it 'not modify behavior for default csrf http header' do
    get '/'
    post '/', { }, 'X-CSRF-Token' => session[:_csrf_token]
    expect(response.status).to eq(201)
  end

  it 'changes AngularJS csrf cookie value on csrf token change' do
    get '/'
    old_csrf_token = session[:_csrf_token]

    post '/create_and_reset_session', { },
         AngularCsrf::ANGULAR_CSRF_HEADER_NAME => response.cookies[AngularCsrf::ANGULAR_CSRF_COOKIE_NAME]
    expect(response.status).to eq(201)

    expect(response.cookies[AngularCsrf::ANGULAR_CSRF_COOKIE_NAME]).to_not eq(old_csrf_token)
    expect(response.cookies[AngularCsrf::ANGULAR_CSRF_COOKIE_NAME]).to eq(session[:_csrf_token])
  end
end