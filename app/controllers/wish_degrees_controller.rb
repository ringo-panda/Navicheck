class WishDegreesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @wish_degree = WishDegree.new(wish_degree_params)
    @wish_degrees = WishDegree.where(user_id:current_user.id).order(id: "DESC")
    if @wish_degree.save
      flash[:notice] = "投稿に成功しました"
      redirect_to wish_degrees_path
    else
      flash[:alert] = "投稿に成功しました"
      render 'index'
    end
  end

  def index
    @wish_degrees = WishDegree.where(user_id:current_user.id).order(id: "DESC")
    @wish_degree = WishDegree.new
  end

  def edit
    @wish_degree = WishDegree.find(params[:id])
  end

  def update
    @wish_degree = WishDegree.find(params[:id])
    if @wish_degree.update(wish_degree_params)
      flash[:notice] = "保存に成功しました"
      redirect_to wish_degrees_path
    else
      flash[:alert] = "保存に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @wish_degree_destroy = WishDegree.find(params[:id])
    @wish_degrees = WishDegree.where(user_id:current_user.id).order(id: "DESC")
    @wish_degree = WishDegree.new
    if @wish_degree_destroy.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to wish_degrees_path
    else
      flash[:alert] = "削除に失敗しました"
      render 'index'
    end

  end

  private
  def wish_degree_params
    params.require(:wish_degree).permit(:wish_degree_name).merge(user_id: current_user.id)
  end

  def correct_user
    @wish_degree = WishDegree.find(params[:id])
    if @wish_degree.user.id != current_user.id
      flash[:alert] = "このURLは無効です"
      redirect_to wish_degrees_path
    end
  end
end
