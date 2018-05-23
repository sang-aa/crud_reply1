class Post < ActiveRecord::Base
    has_many :replies, dependent: :destroy
    #게시글이 삭제되면 dependent 관계에 있는 데이터도 삭제된다.
end
