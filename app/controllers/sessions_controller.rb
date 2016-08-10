class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email,
          id: user.id,
          sign_in_count: user.sign_in_count
        }
        render json: data, status: 201 and return
      end
    end
  end
end
