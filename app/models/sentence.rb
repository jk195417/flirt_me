class Sentence < ApplicationRecord
  module Sequence
    MAX = 5
  end
  belongs_to :dialogue
  validates_presence_of :type, :content, :sequence
end
