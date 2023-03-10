# bookers2 books controller
class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
 
  def index
    @book = Book.new #投稿機能。全ページ共通で実装されているため、application.htmlで実行したいが現時点ではbooksのindex.htmlで実行中
    @books = Book.all
    @user = current_user
  end
  
  def create #保存機能、投稿が成功したら投稿したidの詳細ページへ、失敗したら一覧へ
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice]="You have created book successfully."
     redirect_to book_path(@book.id)
    else
     @books = Book.all
     @user = current_user
     render:index
    end
  end

  def show
    @book = Book.new
    @bookid = Book.find(params[:id])
    @user = @bookid.user
  end

  def edit
    @book = Book.find(params[:id])
    user_id = @book.user_id
    unless user_id == current_user.id
     redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice]="You have updated book successfully."
     redirect_to book_path(@book.id)
    else
     render:edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
   
 private
  def book_params
   params.require(:book).permit(:title,:body)
  end

end
