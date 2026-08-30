class Log < ApplicationRecord
  validates :title, {presence: true, length:{maximum: 140}}
  validates :date, {presence: true}
end
