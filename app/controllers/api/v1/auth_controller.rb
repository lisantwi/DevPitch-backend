class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    
    def profile
        render json: { user: @user.new(current_user) }, status: :accepted
    end

    def create
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])
          token = encode_token({ user_id: @user.id })
          render json: {user:@user.to_json(user_serializer_options) , jwt: token }, status: :accepted
        else
          render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
      end

      private
      def user_serializer_options 
        {:include => {
          :projects => {:except=>[:created_at, :updated_at],
          :include => {
            :images => {
              :except => [:created_at, :updated_at]
            }
          }}
        },
      :except => [:created_at, :updated_at]}
      end
 
      def user_login_params
        params.require(:user).permit(:username, :password)
      end
end
