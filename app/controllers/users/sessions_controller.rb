class Users::SessionsController < Devise::SessionsController
  # GET /resource/sign_in


  # POST /resource/sign_in
  def create
    puts "Parameters received: #{params.inspect}"
    super
  end
end
