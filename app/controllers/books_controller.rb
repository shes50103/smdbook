class BooksController < ApplicationController


def index
  @books = Book.all
end

def new
  @book = Book.new
end

def create
  clean_params = params.require(:book).permit(:title)
  @book = Book.new(clean_params)
   
  if @book.save
  
  redirect_to root_path ,notice: '新增成功啦 Mother Fucker'
  else
  render new_book_path
  end
  
end

def show
  @book = Book.find(params[:id])
end

def edit
  @book = Book.find(params[:id])
end

def update
  clean_params = params.require(:book).permit(:title)
  @book = Book.find(params[:id])
  if @book.update(clean_params)
  redirect_to root_path , notice: '更新完成'
  else
    # render new_book_path

    render edit_book_path(13) #, notice: '更新失敗'
  end
end

def delete
end


end