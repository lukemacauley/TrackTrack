class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, #:async,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :meals

	validates :name, presence: true

end
