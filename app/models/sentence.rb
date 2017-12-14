class Sentence < ApplicationRecord
  module Sequence
    MAX = 5
  end
  belongs_to :dialogue
  validates_presence_of :type, :content
  validates_numericality_of :sequence,
                            only_integer: true,
                            greater_than_or_equal_to: 1,
                            less_than_or_equal_to: Sequence::MAX
end
