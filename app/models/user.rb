class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :zxcvbnable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates_presence_of :first_name, :last_name

  def name
  	"#{self.first_name} #{self.last_name}"
  end
end
