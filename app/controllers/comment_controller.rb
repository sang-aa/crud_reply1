class CommentController < ApplicationController
  def reply_create
    #새로운 댓글을 생성하는 액션
    new_reply = Reply.new
    new_reply.post_id = params[:post_id]
    new_reply.editor = params[:editor]
    new_reply.content = params[:content]
    
    new_reply.save
    
    redirect_to :back
  end

  def reply_delete
    #댓글 삭제
    del_reply = Reply.find(params[:reply_id])
    del_reply.destroy
    
    redirect_to :back
  end
end
