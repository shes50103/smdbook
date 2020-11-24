class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :uptate, :delete]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    #整理 creat update 的清洗 book_params代入
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path, notice: "新增成功啦 Mother Fucker"
    else
      render new_book_path
    end
  end

  def show
    #原本有 @book = Book.find(params[:id]) 有BA之後可不寫
  end

  def edit
    #原本有 @book = Book.find(params[:id]) 有BA之後可不寫
  end

  def update

    #整理 creat update 的清洗 book_params代入
    #原本有 @book = Book.find(params[:id]) 有BA之後可不寫
    if @book.update(book_params)
      redirect_to root_path, notice: "更新完成"
    else
      render :edit, notice: "更新失敗"
    end
  end

  def destroy
    #原本有 @book = Book.find(params[:id]) 有BA之後可不寫
    @book.destroy
    redirect_to root_path notice: "書籍已刪除"
  end

  private

  def find_book
    @book = Book.find(params[:id])
    # 可取代 show edit update delete
    #用before_action(BA) 強制先行
  end

  def book_params
    params.require(:book).permit(:title)
    #整理 creat update 的清洗
  end
end
