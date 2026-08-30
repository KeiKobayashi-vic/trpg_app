class Sys < ApplicationRecord
  validates :name, presence: true
  has_many :logs, foreign_key: "sys"
end
