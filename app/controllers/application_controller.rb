class ApplicationController < ActionController::Base
  before_action :doorkeeper_authorize!
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
end
