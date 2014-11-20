class Post < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	
  has_many :comments
  belongs_to :user
  before_create :add_user_to_authors
	
  acts_as_taggable
	
  extend FriendlyId
  friendly_id :title, use: :slugged
	
  def should_generate_new_friendly_id?
    title_changed?
  end
  
  def normalize_friendly_id(string)
    Russian.translit(string).parameterize
  end
  
  def add_user_to_authors
    if current_user.posts.count >= 1
      current_user.roles << Role.find_by_name("author")
    end
   end
end
