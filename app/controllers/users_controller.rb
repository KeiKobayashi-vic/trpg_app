class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:show, :new, :create, :logout, :index, :edit, :update]}
  before_action :forbid_login_uesr,{only:[:login_form, :login]}
  
  def show
    @user = User.find_by(id: params[:id])
    @logGm = Log.where(gm: params[:id])
    @logPl = Log.where(pl1: params[:id]).or(Log.where(pl2: params[:id])).or(Log.where(pl3: params[:id])).or(Log.where(pl4: params[:id])).or(Log.where(pl5: params[:id])).or(Log.where(pl6: params[:id]))
    @logUser = Log.where(gm: params[:id]).or(Log.where(pl1: params[:id])).or(Log.where(pl2: params[:id])).or(Log.where(pl3: params[:id])).or(Log.where(pl4: params[:id])).or(Log.where(pl5: params[:id])).or(Log.where(pl6: params[:id])).order(date: :desc)
    @logAll = @logGm + @logPl
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      image: "gm-icon.png"
    )
    if @user.save
      flash[:notice] = "登録完了"
      redirect_to("/users/new")
    else
      render("users/new")
    end
  end

  def login_form
  end

  def login
    @user =User.find_by(
      name: params[:name],
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログイン完了"
      redirect_to("/logs/index")
    else
      @error_message = "ハンドルネームまたはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウト完了"
    redirect_to("/login")
  end

  def index
    @users = User.all
    @sys = Sys.all
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.password = params[:password]
    
    if params[:image]
      @user.image = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image}",image.read)
    end

    if @user.save
      flash[:notice] = "編集完了"
      redirect_to("/users/#{@user.id}")
    else
      render("users/#{@user.id}/edit")
    end
  end

end
