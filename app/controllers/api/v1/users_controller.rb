class Api::V1::UsersController < Api::V1::BaseController
    skip_before_action :authorize_request

    def block_user_update

        process_users(User.where(username: "sanjana")) do |user|
          user.update(username: "sanjanav")
        end
    
        process_users(User.where(username: "akhandpratprai")) do |user|
          user.update(username: "akhandprai")
        end
    
        render json: { message: "Users updated successfully." }, status: :ok
    end

    def lamba_user
        users = User.all 
        specific_user = ->(user) { user.username == 'akhandpratprai'}
        user = process_lambda(users, specific_user)
        render json: { user: user }, status: :ok
    end

    private

    def process_lambda(users, lambda)
        users.select(&lambda)
    end

    def process_users(users)
      users.each do |user|
        yield(user) if block_given?
      end
    end

end
