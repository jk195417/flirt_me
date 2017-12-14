class Dialogue < ApplicationRecord
  belongs_to :user, optional: true
  has_many :sentences, dependent: :destroy
  has_many :questions
  has_many :answers

  accepts_nested_attributes_for :sentences, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :title
end
