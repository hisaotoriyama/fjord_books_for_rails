# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]
  BOOK_PER_PAGE_SIZE = 10

  def index
    @books = Book.order(:created_at, :id).page(params[:page]).per(BOOK_PER_PAGE_SIZE)
  end

  def show; end

  def new
    @book = Book.new
  end

  def edit; end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to @book, notice: t('.success')
    else
      render :new, notice: t('.failure')
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t('.success')
    else
      render :edit,  notice: t('.failure')
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: t('.success')
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :memo, :author, :picture)
  end
end
