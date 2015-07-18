class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = current_user.items.build( item_params )
    
    if @item.save
      flash[:notice] = "Item was saved"
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end

    redirect_to @user
    
  end 
  
  private

  def item_params
    params.require(:item).permit(:name)
  end
end




#  def create
#    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
#    authorize @topic
#    if @topic.save
#       redirect_to @topic, notice: "Topic was saved successfully."
#    else
#      flash[:error] = "Error creating topic. Please try again."
#      render :new
#    end
#  end

#@post = Post.find(params[:post_id])
#@comments = @post.comments

#@comment = current_user.comments.build( comment_params )
#@comment.post = @post
#@new_comment = Comment.new