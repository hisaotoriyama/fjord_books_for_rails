# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def follow
    other = User.find(params[:id])
    current_user.follow(other)
    redirect_to user_path(other)
  end

  def unfollow
    other = User.find(params[:id])
    current_user.unfollow(other)
    redirect_to user_path(other)
  end
end
