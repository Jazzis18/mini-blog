class User < ActiveRecord::Base
	before_create :create_role
	
  has_many :users_roles
  has_many :roles, :through => :users_roles
  has_many :posts
  has_many :comments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def has_role?(role)
  	roles.map(&:name).include? role.to_s
  end
  
  def can_edit?(post)
  	posts.include? post
  end
  
  private
  def create_role
  	self.roles << Role.find_by_name(:user)
  end
end
