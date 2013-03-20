class HomeController < ApplicationController
  before_filter :login_required  

	def index
    @twits = current_user.all_twits
      if current_user.twits.last == nil
        @last_twit = "no messages yet."
      else
        @last_twit = "Latest:  #{current_user.twits.last.message}"
      end
    @search_result = User.search(params[:search_query])
    render "home/search" if @search_result.blank?

	end	

	def show
    @user = User.find_by_username(params[:username])
      if @user.username == current_user.username 
        redirect_to root_path
      end
    @twits = @user.all_twits
	end	
 

  def do_follow
    @user = User.find_by_username(params[:username])
      if current_user.is_friend? @user 
        current_user.remove_friend(@user) 
        flash[:notice] = "You are no longer friends with #{@user.username}."
        
      else
        current_user.add_friend(@user)  
        flash[:notice] = "#{@user.username} is your friend now." 
        
      end
        redirect_to root_path
  end

end
