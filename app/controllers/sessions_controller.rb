class SessionsController < Devise::SessionsController
  respond_to :html, :json
  after_filter :print_response_body

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

  def print_response_body 
    print "Response Body: "
    puts response.body
  end
end
