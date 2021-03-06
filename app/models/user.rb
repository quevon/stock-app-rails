class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :validatable

  enum status: {
    pending: 0,
    active: 1,
    archived: 2
  }, _prefix: true


  has_many :investments, dependent: :destroy
  has_many :stocks, through: :investments

  validates :email, presence: true, uniqueness: true
  validates_presence_of :firstname, :lastname
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
