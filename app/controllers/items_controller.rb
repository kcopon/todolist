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

  
  
  def destroy
    #@user = current_user
    #@item = current_user.items.build ( item_params )
    ##@comment = @post.comments.find(params[:id])
    ##@item = items.find(params[:id])
    @user = current_user
    @item = @user.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item was removed"
    else
      flash[:notice] = "There was an error deleting the item"
    end

    respond_to do |format|
      format.html
      format.js
    end
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