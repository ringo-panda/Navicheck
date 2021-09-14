class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def new
    @event = Event.new
    if current_user.companies.count == 0
      flash[:alert] = "イベントの新規登録には企業の登録が必須です。"
      redirect_to new_company_path
    end
  end

  def create
    @event = Event.new(event_params)
    @events = Event.where(user_id:current_user.id).order(id: "DESC")
    if @event.save
      flash[:notice] = "投稿に成功しました"
      redirect_to events_path
    else
      flash[:alert] = "投稿に失敗しました"
      render 'new'
    end
  end

  def index
    @events = Event.where(user_id:current_user.id).order(id: "DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "保存に成功しました"
      redirect_to events_path
    else
      flash[:alert] = "保存に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @event_destroy = Event.find(params[:id])
    @events = Event.where(user_id:current_user.id).order(id: "DESC")
    @event = Event.new
    if @event_destroy.destroy
      flash[:notice] = "削除に成功しました"
      redirect_to events_path
    else
      flash[:alert] = "削除に失敗しました"
      render 'index'
    end
  end

  private
  def event_params
    params.require(:event).permit(:company_id, :event_category_id, :event_name, :start_datetime, :finish_datetime, :limit_datetime, :location, :meeting_url, :meeting_id, :meeting_password, :belongings, :clothes, :event_memo).merge(user_id: current_user.id)
  end

  def correct_user
    @event = Event.find(params[:id])
    if @event.user.id != current_user.id
      flash[:alert] = "このURLは無効です"
      redirect_to events_path
    end
  end
end
