SimpleForm.setup do |config|

  config.error_notification_class = "ui error message"
  config.button_class = "ui blue submit button"
  config.boolean_label_class = nil
  config.form_class = "ui form"

  # Semantic-UI wrappers
  # ------------------------------------------------

  # Standard text input
  config.wrappers(
    :vertical_form,
    tag: "div",
    class: "field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Datepicker
  config.wrappers(
    :datepicker,
    tag: "div",
    class: "field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.wrapper :ui_calendar, tag: "div", class: "ui calendar", html: { "data-ui-behavior": "calendar_date" } do |calendar|
      calendar.wrapper :left_icon_input, tag: "div", class: "ui input left icon" do |left_icon_input|
        left_icon_input.wrapper :icon, tag: "i", class: "calendar icon" do
        end
        left_icon_input.use :input, class: "hidden"
      end
    end
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Timepicker
  config.wrappers(
    :timepicker,
    tag: "div",
    class: "field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.wrapper :ui_calendar, tag: "div", class: "ui calendar", html: { "data-ui-behavior": "calendar_time" } do |calendar|
      calendar.wrapper :left_icon_input, tag: "div", class: "ui input left icon" do |left_icon_input|
        left_icon_input.wrapper :icon, tag: "i", class: "clock icon" do
        end
        left_icon_input.use :input, class: "hidden"
      end
    end
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Toggle Switch
  config.wrappers(
    :toggle_switch,
    tag: "div",
    class: "inline field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.wrapper :toggle, tag: "div", class: "ui toggle checkbox", html: { "data-ui-behavior": "checkbox" } do |toggle|
      toggle.use :input, class: "hidden"
      toggle.use :label
    end
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Slider
  config.wrappers(
    :slider,
    tag: "div",
    class: "field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.wrapper :toggle, tag: "div", class: "ui slider checkbox", html: { "data-ui-behavior": "checkbox" } do |toggle|
      toggle.use :input
      toggle.use :label
    end
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Slider group
  config.wrappers(
    :slider_group,
    tag: "div",
    class: "grouped fields",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.optional :readonly
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Collection radio buttons
  config.wrappers(
    :vertical_radio_buttons,
    tag: "div",
    class: "grouped fields",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Collection radio buttons horizontal
  config.wrappers(
    :horizontal_radio_buttons,
    tag: "div",
    class: "inline fields",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.optional :readonly
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Check box
  config.wrappers(:check_box, tag: "div", class: "field", error_class: "error") do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.wrapper :toggle, tag: "div", class: "ui checkbox", html: { "data-ui-behavior": "checkbox" } do |toggle|
      toggle.use :input
      toggle.use :label
    end
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Collection check boxes
  config.wrappers(
    :vertical_check_boxes,
    tag: "div",
    class: "grouped fields",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.optional :readonly
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Collection check boxes horizontal
  config.wrappers(
    :horizontal_check_boxes,
    tag: "div",
    class: "inline fields",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.optional :readonly
    b.use :label
    b.use :input
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Vertical select
  config.wrappers(
    :vertical_select,
    tag: "div",
    class: "field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.use :input, class: "ui dropdown", "data-ui-behavior": "dropdown"
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Vertical searchable select
  config.wrappers(
    :vertical_search_select,
    tag: "div",
    class: "field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.use :input, class: "ui search dropdown", "data-ui-behavior": "dropdown"
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Vertical multiselect
  config.wrappers(
    :vertical_multiselect,
    tag: "div",
    class: "field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.use :input, class: "ui dropdown", "data-ui-behavior": "dropdown", multiple: ""
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Vertical multiselect
  config.wrappers(
    :vertical_search_multiselect,
    tag: "div",
    class: "field",
    error_class: "error"
  ) do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label
    b.use :input, class: "ui search superdropdown", "data-ui-behavior": "dropdown", multiple: ""
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint, wrap_with: { tag: "p", class: "help-block" }
  end

  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :vertical_form
  config.wrapper_mappings = {
    check_boxes: :vertical_checkboxes,
    radio_buttons: :vertical_inline_radio_buttons,
    # file: :vertical_file_input,
    boolean: :slider,
    select: :vertical_select,
    datepicker: :datepicker
  }

end
