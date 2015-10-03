class UsersController < ApplicationController

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you soon!'
    end
    redirect_to root_path
  end

  def show
    if current_user
      if request.fullpath != user_path(current_user)
        flash[:info] = "Currently you may only visit your own profile."
        redirect_to current_user
      else
        @user = current_user
        get_search_stats
      end
    else
      flash[:notice] = "You must be logged in to view that resource."
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated."
      redirect_to user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :first_visit)
  end

  def get_search_stats
    @query_hash = {}
    current_user.searches.each do |s|
      query = s.query
      if !@query_hash.has_key? query
        @query_hash[query] = 0
      end
      @query_hash[query] = @query_hash[query] + 1
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
