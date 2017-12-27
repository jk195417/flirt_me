class Dialogue < ApplicationRecord
  belongs_to :user, optional: true
  has_many :sentences, dependent: :destroy
  has_many :questions
  has_many :answers

  accepts_nested_attributes_for :sentences, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :title

  scope :ramdom_id, -> { order('RANDOM()').pluck(:id).first }

  def self.line_msg(d_id = nil, sequence: 1)
    d_id ||= ramdom_id
    q = Question.where(dialogue_id: d_id, sequence: sequence)
    a = Answer.where(dialogue_id: d_id, sequence: sequence)
    if a.blank?
      LineBot::Formats::Messages::Text.new(q.content)
    else
      t = LineBot::Formats::Templates::Buttons.new(q.content, a.to_line_actions)
      LineBot::Formats::Messages::Template.new("撩妹金句##{d_id}", t)
    end
  end
end
