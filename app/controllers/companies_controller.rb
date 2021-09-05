class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @companies = Company.where(user_id:current_user.id).order(id: "DESC")
    if @company.save
      flash[:notice] = "投稿に成功しました"
      redirect_to companies_path
    else
      flash[:alert] = "投稿に失敗しました"
      render 'new'
    end
  end

  def index
    @companies = Company.where(user_id:current_user.id).order(id: "DESC")
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = "保存に成功しました"
      redirect_to companies_path
    else
      flash[:alert] = "保存に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @company_destroy = Company.find(params[:id])
    @companies = Company.where(user_id:current_user.id).order(id: "DESC")
    @company = Company.new
    if @company_destroy.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to companies_path
    else
      flash[:alert] = "削除に失敗しました"
      render 'index'
    end
  end

  private
  def company_params
    params.require(:company).permit(:company_name, :company_memo, :company_cite_url, :recruit_cite_url, :recruit_cite_username, :recruit_cite_password, :industry_id, :selection_status_id, :wish_degree_id, :location).merge(user_id: current_user.id)
  end

  def correct_user
    @company = Company.find(params[:id])
    if @company.user.id != current_user.id
      flash[:alert] = "このURLは無効です"
      redirect_to companies_path
    end
  end
end
