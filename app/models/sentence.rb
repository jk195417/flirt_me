class Sentence < ApplicationRecord
  belongs_to :dialogue
  validates_presence_of :type, :content, :sequence
end
