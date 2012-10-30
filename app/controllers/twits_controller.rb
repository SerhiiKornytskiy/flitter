class TwitsController < ApplicationController
  before_filter :login_required 

  def create
  	twit = current_user.twits.build(params[:twit])
  	if twit != nil
      twit.created_at = Time.now
      twit.save!
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @twit = current_user.twits.find(params[:id])
    @twit.destroy
    redirect_to root_path
  end	

end
