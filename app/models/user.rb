class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  # has_many :items, dependent: :destroy
  has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :destroy
  has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
  
  # has_many :messages, dependent: :destroy
  has_many :buyer_messages, class_name: 'Message', foreign_key: 'buyer_id', dependent: :destroy
  has_many :seller_messages, class_name: 'Message', foreign_key: 'seller_id', dependent: :destroy

  has_one :address, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :card
  has_many :sns_credentials

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthyear, :birthmonth, :birthday, :telephone, presence: true

  validates_format_of :password, with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: "７文字以上の英数混在で入力してください。"
  validates_format_of :last_name, :first_name, with: /\A[一-龥ぁ-ん]/, message: "全角で入力してください"
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください"
  validates_format_of :telephone, with: /\A\d{11}\z/, message: "11桁の半角数字を入力してください"
  validates_format_of :birthyear, with: /\A\d{4}\z/, message: "4桁の半角数字を入力してください"
  validates_format_of :birthmonth, :birthday, with: /\A[0-9]+\z/, message: "半角数字を入力してください"

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

  has_one :card
  has_many :cards
  has_many :items

end
