class Api::V1::UsersController < ApplicationController
  rescue_from ArgumentError, with: :invalid_parameters

  def index
    users = User.all
    options = {}
    options[:meta] = {total: users.count}
    render json: UserSerializer.new(users, options)
  end

  def show
    user = User.find_by(id: params[:id])
    options = {}
    options[:include] = [:festivals]
    render json: UserSerializer.new(user, options)
  end

  private

  def invalid_parameters(exception)
    render json: ErrorSerializer.format_error(ErrorMessage.new(exception, 404)), status: :not_found
  end
end
