class Tag < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged
	
	def should_generate_new_friendly_id?
		name_changed?
	end
  
	def normalize_friendly_id(string)
		Russian.translit(string).parameterize
	end
end
