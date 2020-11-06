# frozen_string_literal: true

class UsersController < ApplicationController
  USER_PER_PAGE_SIZE = 5
  def show
    @user = User.find(params[:id])
    @user_books = @user.books.order(:created_at, :id).page(params[:page]).per(USER_PER_PAGE_SIZE)
  end

  def index
    @users = User.order(:created_at, :id).page(params[:page]).per(USER_PER_PAGE_SIZE)
  end
end
