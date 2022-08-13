# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
 before_action :sign_up_state,only:[:create]
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
     super
     user = current_user
     user.lists.create(name: "このサイトの使い方",user_id: user.id)
     user.lists.each do |list|
      list.tasks.create([
       {list_id: list.id,
        user_id: user.id,
        name: "タスクを追加する",
        explanation: "・マイページの「タスクを追加する」ボタンかタスク一覧画面の「＋」ボタンをクリックするとタスクの新規登録画面に移動します。
・一覧画面のチェックマークをクリックするとタスクが完了します。",
        start_time: Time.current,
        finish_time: Time.current},
       {
        list_id: list.id,
        user_id: user.id,
        name: "タスク新規作成時の各項目について",
        explanation: "リストを選択: リストを設定することでタスクを分類できます。
タスク名: タスクの名前、タイトルを設定できます。
MEMO: 簡単なメモが書けます。
タグ: タグを設定することでタグを検索して目的のタスクが見つけやすくなります。
時間の設定: 開始日時、終了日時を設定してカレンダーに反映します。",
        start_time: Time.current,
        finish_time: Time.current
       },
       {
        list_id: list.id,
        user_id: user.id,
        name: "チャレンジについて",
        explanation: "・チャレンジでは日々の習慣や毎日の目標などを設定し、達成することでポイントを貯められます。
・ポイントを消費して自分で設定した「ご褒美」が貰えます。",
        start_time: Time.current,
        finish_time: Time.current
       }])
     end
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  
  def sign_up_state
   if @user = User.find_by(email: params[:user][:email])
    redirect_to new_user_registration_path,alert: '登録済みのユーザーです。'
   else
    return if !@user
   end
  end
   

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
