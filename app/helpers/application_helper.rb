module ApplicationHelper
	def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
    		autolink: true,
    		no_intra_emphasis: true,
    		fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
  
  def tag_urls(post)
  	post.tags.map do |tag|
  		link_to tag.name, tag_path(tag)
  	end.join(', ')
  end
  
  def user_roles(user)
  	user.roles.map(&:name)
  end
  
  def resource_name
  	:user
  end
  
  def resource
  	@resource ||= User.new
  end
  
  def devise_mapping
  	@devise_mapping ||= Devise.mappings[:user]
  end
end
