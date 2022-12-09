require_relative "product"
require_relative "utilities"

class ProductForm
  include Utilities

  def get_product_info
    product_name = get_input_value('Enter the product name: ')
    product_quantity = handle_product_quantity(request_quantity)
    product_price = handle_product_price(request_price)
    product_is_exempt = handle_yes_no(get_input_value('Is product exempt from taxes? NO|yes: '))
    product_is_imported = handle_yes_no(get_input_value('Is product imported? NO|yes: '))

    Product.new(product_name, product_quantity, product_price, product_is_exempt, product_is_imported)
  end

  private
  def request_price
    get_input_value('Enter the product price: ').to_f
  end

  def request_quantity
    get_input_value('Enter the product quantity: ').to_i
  end

  def handle_product_quantity(quantity)
    if quantity <= 0
      puts "Invalid quantity, please try again"
      handle_product_quantity(request_quantity)
    else
      quantity
    end
  end

  def handle_product_price(price)
    if price <= 0
      puts "Invalid price, please try again"
      handle_product_price(request_price)
    else
      price
    end
  end
end