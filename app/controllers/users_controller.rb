# frozen_string_literal: true

class UsersController < ApplicationController

  USERBOOKS_NUMBER = 8

  def show
    @user = User.find(params[:id])
    @usersbooks = @user.books.page(params[:page]).per(USERBOOKS_NUMBER)
  end

  def index
    @users = User.all
  end
end
