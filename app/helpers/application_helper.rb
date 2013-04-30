module ApplicationHelper
	def markdown_format(string)
		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
		markdown.render(string).html_safe
	end
end
