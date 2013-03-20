class TwitsController < ApplicationController
  before_filter :login_required 

  def create
  	twit = current_user.twits.build(params[:twit])
  	  if twit.message.blank?
        flash[:error] = "Message can't be blank!"
      else
        twit.created_at = Time.now
        twit.save!
      end
    redirect_to root_path
  end

  def destroy
    @twit = current_user.twits.find(params[:id])
    @twit.destroy
    redirect_to root_path
  end	

end
