class TodolistsController < ApplicationController
  def new
  	@list=List.new
  end

  def create
  	list=List.new(list_params)
  	list.save
  	redirect_to todolist_path(list.id)
  end

  def index
  	@lists=List.all
  end

  def show
  	@list=List.find(params[:id])
  end

  def edit
  	@list = List.find(params[:id])
  end

  def update
  	list=List.find(params[:id])#レコードを取得
  	list.update(list_params)#list_paramsはビューで入力した値、つまり引数
  	redirect_to todolist_path(list.id)
  end

  def destroy
  	list=List.find(params[:id])#指定したIDの削除レコードを取得してlistモデルインスタンス変数に入れる
  	list.destroy#list変数のレコードを削除
  	redirect_to todolists_path#indexへリダイレクト
  end

  private
  def list_params
  	params.require(:list).permit(:title, :body, :image)
  end
end
