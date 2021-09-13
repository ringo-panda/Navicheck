class SelectionStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @selection_status = SelectionStatus.new(selection_status_params)
    @selection_statuses = SelectionStatus.where(user_id:current_user.id).order(id: "DESC")
    if @selection_status.save
      flash[:notice] = "投稿に成功しました"
      redirect_to selection_statuses_path
    else
      flash[:alert] = "投稿に失敗しました"
      render 'index'
    end
  end

  def index
    @selection_statuses = SelectionStatus.where(user_id:current_user.id).order(id: "DESC")
    @selection_status = SelectionStatus.new
  end

  def edit
    @selection_status = SelectionStatus.find(params[:id])
  end

  def update
    @selection_status = SelectionStatus.find(params[:id])
    if @selection_status.update(selection_status_params)
      flash[:notice] = "保存に成功しました"
      redirect_to selection_statuses_path
    else
      flash[:alert] = "保存に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @selection_status_destroy = SelectionStatus.find(params[:id])
    @selection_statuses = SelectionStatus.where(user_id:current_user.id).order(id: "DESC")
    @selection_status = SelectionStatus.new
    if @selection_status_destroy.company.count >= 1
      flash[:alert] = "この選考状況カテゴリは使用されているので削除できません"
      render 'index'
    else
      if @selection_status_destroy.destroy
        flash[:notice] = "削除に成功しました"
        redirect_to selection_statuses_path
      else
        flash[:alert] = "削除に失敗しました"
        render 'index'
      end
    end
  end

  private
  def selection_status_params
    params.require(:selection_status).permit(:status_name).merge(user_id: current_user.id)
  end

  def correct_user
    @selection_status = SelectionStatus.find(params[:id])
    if @selection_status.user.id != current_user.id
      flash[:alert] = "このURLは無効です"
      redirect_to selection_statuses_path
    end
  end
end
