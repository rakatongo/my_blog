# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  name       :string(255)
#  content    :text
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  leido      :boolean          default(FALSE)
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
