class CommentsController < ApplicationController
	# http_basic_authenticate_with name: "Jarek", password: "123", except: [:index, :show, :create]

before_action :authorize, :only => [:create]
before_action :admin_authorize, :only => [:destroy]

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		if @comment.save
		redirect_to article_path(@article), notice:
		"You successfully created a comment."
		else
		redirect_to article_path(@article), alert:
		"Comment could not be created."
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end
private
	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end		

end
