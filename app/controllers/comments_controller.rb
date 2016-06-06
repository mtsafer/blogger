class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		if @comment.save
			flash[:notice] = "#{@comment.author_name} Created!"
		else
			flash[:notice] = @comment.errors.full_messages.join(", ")
		end
		redirect_to article_path(@comment.article)
	end

	private
		def comment_params
			params.require(:comment).permit(:author_name, :body)
		end

end
