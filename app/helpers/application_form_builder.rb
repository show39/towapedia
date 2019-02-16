class ApplicationFormBuilder < ActionView::Helpers::FormBuilder

  def countable_field(method, maxlength)
    @template.countable_field(@object_name, @object, method, maxlength)
  end

end
