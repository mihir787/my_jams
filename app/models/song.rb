class Song < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  validates :user_id, presence: true

end
