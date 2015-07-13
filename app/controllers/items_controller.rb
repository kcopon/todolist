class ItemsController < ApplicationController
  def create
    @user = User.find(params[:post_id])
    @items = @user.items

    @item = current_user.items.build( item_params )
    @item.user = current_user
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was saved"
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end


#@post = Post.find(params[:post_id])
#@comments = @post.comments

#@comment = current_user.comments.build( comment_params )
#@comment.post = @post
#@new_comment = Comment.new