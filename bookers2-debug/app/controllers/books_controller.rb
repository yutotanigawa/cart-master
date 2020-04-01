class BooksController < ApplicationController


  before_action :configure_permitted_parameters, if: :devise_controller?
  #デバイス機能実行前にconfigure_permitted_parametersの実行をする。
  protect_from_forgery with: :exception

  def show
  	@book = Book.find(params[:id])
  end

  def index
    @book = Book.new
  	@books = Book.all #一覧表示するためにBookモデルの情報を全てくださいのall
  end

  def create
    @books = Book.all
  	@book = Book.new(book_params) #Bookモデルのテーブルを使用しているのでbookコントローラで保存する。
    @user = current_user
    @users = User.all
  	if @book.save #入力されたデータをdbに保存する。
  		redirect_to @book, notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
  		@books = Book.all
  		render 'index'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end



  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		redirect_to @book, notice: "successfully updated book!"
  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
  		render "edit"
  	end
  end

  def delete
  	@book = Book.find(params[:id])
  	@book.destoy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

   def correct_user
    book = Book.find(params[:id])

     if current_user.id != book.user.id
        redirect_to books_path
     end
   end


end
