require_relative "utilities"
require_relative "product_form"

include Utilities

added_products = []
loop do
  product_form = ProductForm.new
  added_products << product_form.get_product_info
  products_to_add = handle_yes_no(get_input_value('Continue adding products? NO|yes: '))

  unless products_to_add
    sales_taxes = 0
    sales_total = 0

    puts "#{'*' * 5} Shopping basket: "

    added_products.each do |product|
      sales_taxes += product.applied_taxes
      sales_total += (product.total_price)

      puts product.inline_basic_info
    end

    puts "Sales Taxes: #{sales_taxes.round(2)}"
    puts "Total: #{sales_total.round(2)}"

    break
  end

  puts '=' * 20
end