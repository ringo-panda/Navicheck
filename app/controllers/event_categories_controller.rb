class EventCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_category, only: [:edit, :update, :correct_user]
  before_action :set_event_categories, only: [:create, :index, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @event_category = EventCategory.new(event_category_params)
    if @event_category.save
      flash[:notice] = "投稿に成功しました"
      redirect_to event_categories_path
    else
      flash[:alert] = "投稿に失敗しました"
      render 'index'
    end
  end

  def index
    @event_category = EventCategory.new
  end

  def edit

  end

  def update
    if @event_category.update(event_category_params)
      flash[:notice] = "保存に成功しました"
      redirect_to event_categories_path
    else
      flash[:alert] = "保存に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @event_category_destroy = EventCategory.find(params[:id])
    @event_category = EventCategory.new
    if @event_category_destroy.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to event_categories_path
    else
      flash[:alert] = "削除に失敗しました"
      render 'index'
    end
  end

  private
  def event_category_params
    params.require(:event_category).permit(:event_category_name).merge(user_id: current_user.id)
  end

  def correct_user
    if @event_category.user.id != current_user.id
      flash[:alert] = "このURLは無効です"
      redirect_to event_categories_path
    end
  end

  def set_event_category
    @event_category = EventCategory.find(params[:id])
  end

  def set_event_categories
    @event_categories = EventCategory.where(user_id:current_user.id).order(id: "DESC")
  end

end
