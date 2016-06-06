class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
			flash[:notice] = "#{@article.title} Created!"
		else
			render new_article_path
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		if @article.save
			redirect_to @article
			flash.notice = "Article '#{@article.title}' Updated!"
		else
			flash.notice = @article.errors.full_messages.join(", ")
			redirect_to edit_article_path
		end
	end

	def destroy
		@article = Article.find(params[:id]).destroy
		redirect_to articles_path
		flash[:notice] = "#{@article.title} has been deleted!"
	end

	private
		def article_params
			params.require(:article).permit(:title, :body, :tag_list)
		end

end
