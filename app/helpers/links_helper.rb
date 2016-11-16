module LinksHelper
	
	def active_link_to(text, destination, options = {})
	  match_text = options.delete(:match_text)

	  classes = options[:class].present? ? options[:class].split(" ") : []
	  classes << "active" if request.fullpath.downcase == destination.downcase || (match_text && request.fullpath.downcase.include?(match_text.downcase))

	  options = options.except(:class)
	  options.merge!(:class => classes.join(" ")) unless classes.empty?

	  link_to(text, destination, options)
	end

end