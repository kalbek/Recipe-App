# app/controllers/api_controller.rb
class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json
end
