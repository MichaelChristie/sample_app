class Micropost < ActiveRecord::Base
	#added this below (not in tutorial. Prevents ActiveModel::MassAssignmentSecurity::Error
 	attr_accessible :content

 	belongs_to :user

 	validates :content, presence: true, length: { maximum: 140 }
	validates :user_id, presence: true

  def change
  	create_table :microposts do |t|
  		t.string :content
  		t.integer :user_id

  		t.timestamps
  	end
  	add_index :microposts, [:user_id, :created_at]
  end

  default_scope order: 'microposts.created_at DESC'


end
