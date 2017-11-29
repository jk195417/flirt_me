class Dialogue < ApplicationRecord
  belongs_to :user, optional: true
  has_many :sentences
  has_many :questions
  has_many :answers
end
