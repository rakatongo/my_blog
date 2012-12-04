# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Post < ActiveRecord::Base
  attr_accessible :content, :title 
  has_many :comments, dependent: :destroy
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  
  scope :previo, lambda { |id| where("id < ?", id).order('id DESC').limit(1) }
  scope :siguiente, lambda { |id| where("id > ?", id).limit(1) } 
  scope :ultimos_post, where('id <= ?', Post.last).order('id DESC').limit(5)
  def self.otros(id)
    [previo(id),siguiente(id)]
  end  

end
