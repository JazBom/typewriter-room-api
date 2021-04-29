class ApplicationController < ActionController::API
    before_action :user_valid
    attr_accessor :current_user

    def encode_token(user_id)
      token_payload = { 'user_id': user_id }
      JWT.encode token_payload, Rails.application.credentials.secret_key_base, 'HS256'
    end
  
    def decode_token
      encoded_auth_token = request.headers['Authorization']
      if encoded_auth_token
        begin
          decoded_auth_token = JWT.decode encoded_auth_token.gsub('Bearer ', ''), Rails.application.credentials.secret_key_base, true
          puts 'decoded token:'
          puts decoded_auth_token
          decoded_auth_token
        rescue JWT::DecodeError
          puts 'Error decoding the JWT token!'
          nil
        end
      end
    end
  
    def user_valid
      valid_token = decode_token
        if valid_token && valid_token[0]['user_id'].present?
          @current_user = User.find(valid_token[0]['user_id'])
            if @current_user.present?
              true
            else
              render json: { message: 'Unauthorized' }, status: :unauthorized
            end
        else
          render json: { message: 'Unauthorized' }, status: :unauthorized
        end
    end

end