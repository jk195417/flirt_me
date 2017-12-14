module SentenceHelper
  def sentence_btn(content, klass: '')
    content_tag :div, content, class: "btn btn-sm br-20 m-1 #{klass}"
  end

  def question_btn(content)
    sentence_btn(content, klass: 'btn-light')
  end

  def answer_btn(content)
    sentence_btn(content, klass: 'btn-success')
  end

  def sentences_list(sentences, type)
    return nil if sentences.blank?
    klass = 'list-group-item'
    btns = []
    if type == :question
      btns = sentences.map { |sentence| question_btn(sentence.content) }
    elsif type == :answer
      btns = sentences.map { |sentence| answer_btn(sentence.content) }
      klass += ' text-right'
    end
    content_tag :li, sanitize(btns.join), class: klass
  end

  def question_list(sentences)
    sentences_list(sentences, :question)
  end

  def answer_list(sentences)
    sentences_list(sentences, :answer)
  end
end
