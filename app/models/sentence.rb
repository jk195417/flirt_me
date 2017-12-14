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

  scope :to_flirt_me_struct, -> {
    result = {
      q: Array.new(Sequence::MAX) { Array.new },
      a: Array.new(Sequence::MAX) { Array.new }
    }
    order(sequence: :asc).each do |s|
      result[:q][s.sequence-1] << s if s.is_a? Question
      result[:a][s.sequence-1] << s if s.is_a? Answer
    end
    result
  }
end
