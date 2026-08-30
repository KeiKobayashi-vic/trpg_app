class CommentsController < ApplicationController
  before_action :authenticate_user
  
  def create
    @comment = Comment.new(
      user_id: @current_user.id,
      log_id: params[:log_id],
      content: params[:content]
    )
    if @comment.save
      redirect_to("/logs/#{@comment.log_id}")
    else
      render("logs/#{@comment.log_id}")
      @contet = params[:content]
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to("/logs/#{@comment.log_id}")
  end
  
  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.content = params[:content]
    @comment.save
    flash[:notice] = "編集完了"
    redirect_to("/logs/#{@comment.log_id}")
  end

end