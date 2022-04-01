class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  # enum role: [:user, :admin]
  # after_initialize :set_defaut_role, :if => :new_record?
  #
  # def set_defaullt_role
  #   self.role ||= :user
  # end
end
