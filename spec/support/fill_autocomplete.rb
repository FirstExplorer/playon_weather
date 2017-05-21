module FillAutocomplete
  def fill_autocomplete(field, options = {})
    fill_in field, with: options[:with]

    page.execute_script %Q{ $("##{field}").trigger('focus') }
    page.execute_script %Q{ $("##{field}").trigger('keydown') }
    selector = "ul.ui-autocomplete a:contains('#{options[:select]}')"
    wait_for_ajax
    page.execute_script "$(\"#{selector}\").mouseenter().click()"
  end
end

RSpec.configure do |config|
  config.include FillAutocomplete, type: :feature
end
