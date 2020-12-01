# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    new_comment_params = comment_params.merge!(user_id: current_user.id)
    @comment = @commentable.comments.new(new_comment_params)
    if @comment.save
      redirect_to @commentable, notice: t('.success')
    else
      render :edit
    end
  end

  def update
    if @comment.update(comment_params) && current_user.id == @comment.user_id
      redirect_to @commentable, notice: t('.success')
    else
      render :edit, notice: t('.failure')
    end
  end

  def destroy
    if @comment.destroy && current_user.id == @comment.user_id
      redirect_to @commentable, notice: t('.success')
    else
      render :@commentable, notice: t('.failure')
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_commentable
    @commentable = params[:book_id] ? Book.find(params[:book_id]) : Report.find(params[:report_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
