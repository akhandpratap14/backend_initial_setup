class Api::V1::UsersController < Api::V1::BaseController
    skip_before_action :authorize_request, only: %i[login register]

    
      

end
