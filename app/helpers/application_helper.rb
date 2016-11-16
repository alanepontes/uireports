module ApplicationHelper
	def titulo(titulo_da_pagina)
		content_for(:titulo){ " - #{titulo_da_pagina}" }
	end

	def average_rating(id)
		rate = Rating.where(user_id: id).average(:score)
	end
end
