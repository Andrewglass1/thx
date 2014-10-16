class ThanksController < ApplicationController

  before_action :authenticate_user!

  def index
    if params["filter"] = "me"
      @thanks = current_user.all_thanks
    elsif params["filter"] == "friends"
      #THIS SHOULD ONLY DO FRIENDS WHEN FRIENDS ARE A THING
      @thanks = current_user.all_thanks
    else
      @thanks = Thanks.all
    end
  end

  def new
    @thank = Thank.new
  end

  def create
    @thank = Thank.create(thank_params)
    if @thank.save
      redirect_to thanks_path
    else
      render action: 'new', alert: "couldnt give your thanks"
    end
  end
private

  def thank_params
    params.require(:thank).permit(:recipient_id, :sender_id, :message)
  end
end
