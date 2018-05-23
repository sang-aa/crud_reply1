class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :editor
      t.text :content
      
      #댓글에는 모델명_id라는 열을 하나 반드시 더 만들어줘야 한다.
      #안 만들었더니 SQLite3::SQLException: no such column: replies.post_id: SELECT "replies".* FROM "replies" WHERE "replies"."post_id" = ?
      #위와 같은 오류 발생!
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
