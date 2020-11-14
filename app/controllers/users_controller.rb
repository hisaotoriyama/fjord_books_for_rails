# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :userfind, except: :index
  USER_BOOKS_PER_PAGE_SIZE = 5

  def show
    @user_books = @user.books.order(:created_at, :id).page(params[:page]).per(USER_BOOKS_PER_PAGE_SIZE)
  end

  def index
    @users = User.order(:created_at, :id).page(params[:page]).per(USER_BOOKS_PER_PAGE_SIZE)
  end

  def following
  end

  def follower
  end

  private

  def userfind
    @user = User.find(params[:id])
  end
end
