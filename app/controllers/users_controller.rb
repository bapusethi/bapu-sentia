class UsersController < ApplicationController
  def index
    term = params[:term]
    page = params[:page] || 1
    per = params[:per] || 10

    @users = User.search(term).order(:first_name).page(page).per(per)
    respond_to do |format|
      format.html
      format.json { render json:  { users: @users, total_count: @users.total_count } }
    end
  end
end
