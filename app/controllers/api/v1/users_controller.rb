class Api::V1::UsersController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def index
    user = User.all
    render json: user
  end

end