class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  layout 'admin'

  protected

  def authorize_admin
    fail Pundit::NotAuthorizedError unless current_user.admin?
  end
end
