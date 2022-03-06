# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :internal_server_error
  rescue_from GithubApiSearchReposService::GithubApiError, with: :service_unavailable

  def internal_server_error
    response = { error: 'Internal Server Error' }
    render(json: response, status: :internal_server_error)
  end

  def service_unavailable
    response = { error: 'Service Unavailable' }
    render(json: response, status: :service_unavailable)
  end
end
