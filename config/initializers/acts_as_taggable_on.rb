ActsAsTaggableOn.delimiter = ',' # use space as delimiter
ActsAsTaggableOn.force_lowercase = true
ActsAsTaggableOn::Tag.class_eval do
	extend FriendlyId
	friendly_id :name,
		          :use => :slugged,
		          :slug_column => :slug,
		          :reserved_words => ['show', 'edit', 'create', 'update', 'destroy']
end
