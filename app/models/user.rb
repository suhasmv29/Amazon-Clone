class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :email
  validates_presence_of :password
  has_one :cart


  after_create :welcome_send
  def welcome_send
    WelcomeMailer.welcome_send(self).deliver
    
  end
  
  def after_confirmation
    
    AfterConfirmationJob.perform_later(self)
  end

end
