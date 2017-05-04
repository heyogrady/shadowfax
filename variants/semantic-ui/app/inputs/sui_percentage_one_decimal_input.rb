class SuiPercentageOneDecimalInput < SimpleForm::Inputs::Base

  def input(wrapper_options=nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    input_markup = @builder.text_field(attribute_name, merged_input_options)

    tag = String.new
    tag << "<div class='ui right labeled input'>".html_safe
    tag << input_markup
    tag << "<div class='ui label'>%</div>".html_safe
    tag << "</div>".html_safe
    tag
  end

  protected

  def input_html_options
    super.deep_merge(
      {
        data: { input_mask: "onedecimal_percentage" },
        type: "text"
      }
    )
  end

end
