class MicropostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      flash[:success] = "error"
      render 'home/index'
    end
  end


  def destroy
  end







  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

end
