class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plans
  has_many :comments
  has_many :reads, dependent: :destroy

  validates :name, presence: true 

  VALID_NAME_REGEX =/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ 

end
