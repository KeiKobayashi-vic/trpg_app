class SysController < ApplicationController
  before_action :authenticate_user
  def new
  end

  def create
    @sy = Sys.new
    @sy.name = params[:name]
    if @sy.save
      flash[:notice] = "登録完了"
      redirect_to("/sys/new")
    else
      render("sys/new")
    end
  end


  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

def show
  @sys = Sys.find(params[:id])
  @logs = Log.where(system: @sys.id)
end

end
