class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # before_save { self.email = email.downcase }

  validates :name, length: {minimum: 1, maximum: 100}, presence: true

  has_many :registered_apps, dependent: :destroy
end
