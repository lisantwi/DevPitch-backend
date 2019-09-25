class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end

      def index 
        render json: @user.to_json(user_serializer_options)
      end

    private
    def user_params
      params.require(:user).permit(:username, :password)
    end

    def user_serializer_options 
      {:include => [
        :projects => {:except=>[:password_digest, :created_at, :updated_at],
        :include => {
          :images => {
            :except => [:created_at, :updated_at]
          }
        }}
        ],
    :except => [:created_at, :updated_at]}
    end
end
