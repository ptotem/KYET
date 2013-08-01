class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :provider, :uid
  # attr_accessible :title, :body

  has_many :authentications, dependent: :destroy
  has_many :responses, :dependent => :destroy


  def superadmin?
    role=="Superadmin"
  end

  def admin?
    role=="Admin"
  end

end
