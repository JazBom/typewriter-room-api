class Api::AuthController < ApplicationController
    skip_before_action :user_valid
    def login
      user = User.find_by(name: params[:name])
      if user&.authenticate(params[:password])
        token = encode_token(user.id)
        render json: { user: user, token: token }
      else
        render json: { message: 'user not found' }, status: :not_found
      end
    end
  end