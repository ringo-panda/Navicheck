class JobCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @job_category = JobCategory.new
  end

  def create
    @job_category = JobCategory.new(job_category_params)
    @job_categories = JobCategory.where(user_id:current_user.id).order(id: "DESC")
    if @job_category.save
      flash[:notice] = "投稿に成功しました"
      redirect_to company_path(@job_category.company.id)
    else
      flash[:alert] = "投稿に失敗しました"
      render 'new'
    end
  end

  def index
    @job_categories = JobCategory.where(user_id:current_user.id).order(id: "DESC")
  end

  def show
    @job_category = JobCategory.find(params[:id])
  end

  def edit
    @job_category = JobCategory.find(params[:id])
  end

  def update
    @job_category = JobCategory.find(params[:id])
    if @job_category.update(job_category_params)
      flash[:notice] = "保存に成功しました"
      redirect_to company_path(@job_category.company.id)
    else
      flash[:alert] = "保存に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @job_category_destroy = JobCategory.find(params[:id])
    @job_categories = JobCategory.where(user_id:current_user.id).order(id: "DESC")
    @job_category = JobCategory.new
    @company = @job_category_destroy.company
    if @job_category_destroy.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to company_path(@company.id)
    else
      flash[:alert] = "削除に失敗しました"
      render 'index'
    end
  end

  private
  def job_category_params
    params.require(:job_category).permit(:company_id, :job_name, :salary, :base_salary, :allowance, :annual_holiday, :bonus, :salary_increase, :overtime_hours, :paid_leave, :working_place, :jobcategories_memo).merge(user_id: current_user.id)
  end

  def correct_user
    @job_category = JobCategory.find(params[:id])
    if @job_category.user.id != current_user.id
      flash[:alert] = "このURLは無効です"
      redirect_to job_categories_path
    end
  end

end
