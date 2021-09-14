class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました。ナビチェックへようこそ。"
    if resource.wish_degrees.count == 0 && resource.selection_statuses.count == 0 && resource.industries.count == 0 && resource.sign_in_count == 1
      WishDegree.create(wish_degree_name: "高", user_id: resource.id, edit_permission: true)
      WishDegree.create(wish_degree_name: "中", user_id: resource.id, edit_permission: true)
      WishDegree.create(wish_degree_name: "低", user_id: resource.id, edit_permission: true)
      EventCategory.create(event_category_name: "インターン", user_id: resource.id, edit_permission: true)
      EventCategory.create(event_category_name: "会社説明会", user_id: resource.id, edit_permission: true)
      EventCategory.create(event_category_name: "面接", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "インターン申し込み前", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "インターン選考待ち", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "インターン前", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "インターン不合格", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "インターン参加後", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "会社説明会申し込み前", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "会社説明会前", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "会社説明会参加後", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "面接日程調整前", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "面接日程調整待ち", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "面接前", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "面接結果待ち", user_id: resource.id, edit_permission: true)
      SelectionStatus.create(status_name: "内定", user_id: resource.id, edit_permission: true)
      Industry.create(industry_name: "メーカー", user_id: resource.id)
      Industry.create(industry_name: "商社", user_id: resource.id)
      Industry.create(industry_name: "小売", user_id: resource.id)
      Industry.create(industry_name: "金融", user_id: resource.id)
      Industry.create(industry_name: "サービス", user_id: resource.id)
      Industry.create(industry_name: "マスコミ", user_id: resource.id)
      Industry.create(industry_name: "ソフトウェア・通信", user_id: resource.id)
      Industry.create(industry_name: "官公庁・公社・団体", user_id: resource.id)
    end
    user_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました。御疲れ様でした。ゆっくりお休みください。"
    root_path # ログアウト後に遷移するpathを設定
  end

  def after_update_path_for(resource)
    user_path(resource) # ログアウト後に遷移するpathを設定
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
