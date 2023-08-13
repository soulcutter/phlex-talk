class ArticlesController < ApplicationController
	layout -> { ApplicationLayout }
	
	def index
    # explicit rendering is required
		render Articles::IndexView.new(
			articles: Article.all.load_async
		)
	end

	def show
		render Articles::ShowView.new(
			article: Article.find(params[:id])
		)
	end
end