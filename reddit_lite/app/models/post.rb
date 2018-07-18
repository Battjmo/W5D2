# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

  has_many :post_subs,
    foreign_key: :post_id,
    class_name: :PostSub,
    dependent: :destroy,
    inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments,
    foreign_key: :post_id,
    class_name: :Comment
end
