class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def create #保存機能、投稿が成功したら投稿したidの詳細ページへ
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book.id)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path(@user.id)
  end

  def index
    @users = User.all
    @user = current_user
  end
  
 private
  def user_params
   params.require(:user).permit(:name,:image,:introduction)
  end

end
