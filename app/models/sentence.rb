class Sentence < ApplicationRecord
  belongs_to :dialogue
  validates_presence_of :content, :sequence
end
