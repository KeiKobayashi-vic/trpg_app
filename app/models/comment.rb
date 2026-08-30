class Comment < ApplicationRecord
  validates :user_id, {presence: true}
  validates :log_id, {presence: true}
  validates :content, {presence: true}


  def user
    return User.find_by(id: self.user_id)
  end

end
