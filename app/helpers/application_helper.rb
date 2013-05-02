module ApplicationHelper
	def markdown_format(string)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
		markdown.render(string).html_safe
	end

	def current_user_has_voted_on?(votable)
		votable.votes.where({user: current_user}).count > 0
	end
end
