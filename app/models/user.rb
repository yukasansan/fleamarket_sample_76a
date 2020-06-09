class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthyear, :birthmonth, :birthday, :telephone, presence: true

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: "は７文字以上の英数混在で入力してください。"
  validates_format_of :last_name, :first_name, with: /\A[一-龥]+\z/, message: "全角漢字で入力してください"
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください"
  validates_format_of :telephone, with: /\A\d{11}\z/, message: "半角数字を入力してください"
  validates_format_of :birthyear, :birthmonth, :birthday, with: /\A[0-9]+\z/, message: "半角数字を入力してください"
  has_many :sns_credentials
  has_one :address

  
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end


end
