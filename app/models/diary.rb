class Diary < ApplicationRecord
  belongs_to :user

  validates :good_1, presence: true
  validates :good_2, presence: true
  validates :good_3, presence: true
  validates :entry_date, presence: true

end