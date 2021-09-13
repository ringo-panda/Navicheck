class IndustriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def create
    @industry = Industry.new(industry_params)
    @industries = Industry.where(user_id:current_user.id).order(id: "DESC")
    if @industry.save
      flash[:notice] = "投稿に成功しました"
      redirect_to industries_path
    else
      flash[:alert] = "投稿に成功しました"
      render 'index'
    end
  end

  def index
    @industries = Industry.where(user_id:current_user.id).order(id: "DESC")
    @industry = Industry.new
  end

  def show
    @industry = Industry.find(params[:id])
    @companies = @industry.companies
  end

  def edit
    @industry = Industry.find(params[:id])
  end

  def update
    @industry = Industry.find(params[:id])
    if @industry.update(industry_params)
      flash[:notice] = "保存に成功しました"
      redirect_to industries_path
    else
      flash[:alert] = "保存に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @industry_destroy = Industry.find(params[:id])
    @industries = Industry.where(user_id:current_user.id).order(id: "DESC")
    @industry = Industry.new
    if @industry_destroy.company.count >= 1
      flash[:alert] = "この業界は使用されているので削除できません"
      render 'index'
    else
      if @industry_destroy.destroy
        flash[:notice] = "削除に成功しました"
        redirect_to industries_path
      else
        flash[:alert] = "削除に失敗しました"
        render 'index'
      end
    end
  end

  private
  def industry_params
    params.require(:industry).permit(:industry_name).merge(user_id: current_user.id)
  end

  def correct_user
    @industry = Industry.find(params[:id])
    if @industry.user.id != current_user.id
      flash[:alert] = "このURLは無効です"
      redirect_to industries_path
    end
  end
end
