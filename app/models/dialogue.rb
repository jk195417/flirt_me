class Dialogue < ApplicationRecord
  belongs_to :user, optional: true
  has_many :sentences, dependent: :destroy
  has_many :questions
  has_many :answers

  accepts_nested_attributes_for :sentences,
                                allow_destroy: true,
                                reject_if: :all_blank

  validates_presence_of :title

  scope :random, -> { order('RANDOM()').first }
  scope :random_id, -> { order('RANDOM()').pluck(:id).first }
  scope :find_or_random, ->(id) { find_by(id: id) || random }

  def self.line_msg(d_id = nil, sequence: 1)
    # If no d_id then random one
    d_id ||= random_id
    # Query
    q = Question.where(dialogue_id: d_id, sequence: sequence)
    a = Answer.where(dialogue_id: d_id, sequence: sequence)
    # Set attributes
    alt_text = "撩妹金句 ##{d_id}"
    text = (sequence == 1 ? "##{d_id}\n\n#{q.content}" : q.content)
    actions = if a.blank?
                [
                  LineBot::Formats::Actions::Postback.new(
                    '可以', { action: 'voting', dialogue_id: d_id, feel: 'like' }.to_query, text: '可以'),
                  LineBot::Formats::Actions::Postback.new(
                    '不行', { action: 'voting', dialogue_id: d_id, feel: 'dislike' }.to_query, text: '不行'),
                  LineBot::Formats::Actions::Uri.new(
                    '去網站看這則撩妹金句',
                    Rails.application.routes.url_helpers.dialogue_url(
                      d_id,
                      Rails.application.config.action_mailer.default_url_options
                    )
                  ),
                  LineBot::Formats::Actions::Message.new('再來一個', '撩我')
                ]
              else
                a.to_line_actions
              end
    # Use attributes to build message
    template = LineBot::Formats::Templates::Buttons.new(text, actions)
    LineBot::Formats::Messages::Template.new(alt_text, template)
  end
end
