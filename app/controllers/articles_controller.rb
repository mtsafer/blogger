class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render new_article_path
		end
	end

	def destroy
		@article = Article.find(params[:id]).destroy
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :body)
		end

end
