class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    
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

  def index
    @users = User.all
  end
  
 private
  def user_params
   params.require(:user).permit(:name,:profile_image)
  end

end
