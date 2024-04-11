class ApplicationController < ActionController::Base
  before_action :doorkeeper_authorize!
  skip_before_action :verify_authenticity_token
end
