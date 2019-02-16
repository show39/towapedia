module ApplicationHelper

  # フォームに文字数カウントを表示する
  def countable_field(model_name, model, attribute, maxlength)
    sanitized_model_name = model_name.gsub(/\]\[|[^-a-zA-Z0-9:.]/, '_').sub(/_$/, '')
    content_tag(:span, class: 'text_count') do
      len = model.send(attribute).to_s.length
      style = 'color: red;' if len > maxlength
      if attribute == :meanings
        len = 0
      end
      concat content_tag(:span, len, id: "#{sanitized_model_name}_#{attribute}_len", style: style)
      concat ' / '
      concat content_tag(:span, maxlength, id: "#{sanitized_model_name}_#{attribute}_max") + '文字'
    end
  end

end
