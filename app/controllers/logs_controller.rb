class LogsController < ApplicationController
  before_action :authenticate_user
  
  def show
    @log = Log.find_by(id: params[:id])
    @tags = Tag.find_by(log_id: params[:id])
    @comments = Comment.where(log_id: params[:id])
  end

  def index
    @logs = Log.all.order(date: :desc).page(params[:page])
  end

def create
  if params[:gm] == ""
    gm = nil
  else
    gm = User.find_by(name: params[:gm]).id
  end

  pl1 = params[:pl1].present? ? User.find_by(name: params[:pl1])&.id : nil
  pl2 = params[:pl2].present? ? User.find_by(name: params[:pl2])&.id : nil
  pl3 = params[:pl3].present? ? User.find_by(name: params[:pl3])&.id : nil
  pl4 = params[:pl4].present? ? User.find_by(name: params[:pl4])&.id : nil
  pl5 = params[:pl5].present? ? User.find_by(name: params[:pl5])&.id : nil
  pl6 = params[:pl6].present? ? User.find_by(name: params[:pl6])&.id : nil

  @log = Log.new(
    title: params[:title],
    system: params[:system],
    date: params[:date],
    gm: gm,
    pl1: pl1,
    pc1: params[:pc1],
    pl2: pl2,
    pc2: params[:pc2],
    pl3: pl3,
    pc3: params[:pc3],
    pl4: pl4,
    pc4: params[:pc4],
    pl5: pl5,
    pc5: params[:pc5],
    pl6: pl6,
    pc6: params[:pc6],
    other: params[:other]
  )

  if @log.save
    flash[:notice] = "登録完了"
    redirect_to("/logs/#{@log.id}")
else
  @title = params[:title]
  @system = params[:system]
  @date = params[:date]
  @gm = params[:gm]
  @pl1 = params[:pl1]
  @pc1 = params[:pc1]
  @pl2 = params[:pl2]
  @pc2 = params[:pc2]
  @pl3 = params[:pl3]
  @pc3 = params[:pc3]
  @pl4 = params[:pl4]
  @pc4 = params[:pc4]
  @pl5 = params[:pl5]
  @pc5 = params[:pc5]
  @pl6 = params[:pl6]
  @pc6 = params[:pc6]
  @other = params[:other]

  # ★ new.html.erb が必要とする変数を追加
  @systems = Sys.all
  @lists = User.all
  @log = Log.new

  flash[:notice] = "シナリオタイトルを入力してください"
  render("logs/new")
end

end


def new
  @log = Log.new
  @systems = Sys.all   # ← 変数名を変える（これが最も安全）
  @lists = User.all
end

  def edit
    @log = Log.find_by(id: params[:id])
    @lists = User.all
    @sys = Sys.all
  end

  def update
    @log = Log.find_by(id: params[:id])
    @log.title = params[:title]
    @log.system = params[:system]
    @log.date = params[:date]
    @log.gm = params[:gm]
    @log.pl1 = params[:pl1]
    @log.pc1 = params[:pc1]
    @log.pl2 = params[:pl2]
    @log.pc2 = params[:pc2]
    @log.pl3 = params[:pl3]
    @log.pc3 = params[:pc3]
    @log.pl4 = params[:pl4]
    @log.pc4 = params[:pc4]
    @log.pl5 = params[:pl5]
    @log.pc5 = params[:pc5]
    @log.pl6 = params[:pl6]
    @log.pc6 = params[:pc6]
    @log.other = params[:other]
    
    if @log.save
      flash[:notice] = "編集完了"
      redirect_to("/logs/#{@log.id}")
    else
      render("log/#{@log.id}/edit")
    end

  end

def destroy
  @log = Log.find_by(id: params[:id])
  @log.destroy

  Comment.where(log_id: params[:id]).destroy_all

  flash[:notice] = "削除完了"
  redirect_to("/logs/index")
end


  # def search
  #   @logs = Log.all
  #   @log_back = @logs.find_by_sql([user_search,name: params[:name]])
  #   render("logs/back")
  # end

end
