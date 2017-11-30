class User < ApplicationRecord
  validates :email, :presence => true
  validates :email, :uniqueness => true

  validates :username, :presence => true
  validates :username, :uniqueness => true

  validates :password, :presence => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => {:medium => '300x300>', :thumb => '100x100#' }, :default_url => '/images/missing.png'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  ## THIS IS KEY FOR LOGGING IN WITH USERNAME INSTEAD OF EMAIL:

  # ALSO GO TO CONFIG INITIALIZERS DEVISE.RB and UNCOMMENT LINE 37 AND CHANGE TO USERNAME
  def email_required?
    false
  end

  # def email_changed?
  #   false
  # end
end
