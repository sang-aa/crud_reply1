class BoardController < ApplicationController
  def index
    #게시글 목록을 보여줄 수 있는 곳.
    @list_post = Post.all
  end
  
  def show
    #게시글을 보여준다.
    @show_post = Post.find(params[:show_id])
    
    #replies를 하기위해 모델rb파일에 미리 관계를 정의해 두어서 아래 코드가 가능!
    @show_reply = @show_post.replies
  end

  def new
  end

  def create
    #실질적으로 게시글을 만들어주자!모델에 넣어줘야겠지??
    created_post = Post.new
    created_post.title= params[:title]
    created_post.editor = params[:editor]
    created_post.content = params[:content]
    
    created_post.save
    redirect_to "/"
  end

  def edit
    #편집 폼
    @edit_post = Post.find(params[:edit_id])
  end

  def update
     #실질적 편집하는 곳
     # url로 받아온 parameter로 post모델에서 찾아온다.
     update_post = Post.find(params[:update_id])
     #파라미터로 받아온 데이터를 저장한다.
     update_post.title = params[:title]
     update_post.editor = params[:editor]
     update_post.content = params[:content]
     
     update_post.save
     
     redirect_to "/home/show/#{update_post.id}"
  end

  def delete
    #게시글 삭제
    destroy_post = Post.find(params[:destroy_id])
    destroy_post.destroy
    
    redirect_to "/"
  end
end
