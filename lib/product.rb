require_relative "sales_tax"

class Product
  attr_accessor :name, :quantity, :price, :is_exempt, :is_imported, :applied_taxes, :total_price

  def initialize(name, quantity, price, is_exempt, is_imported)
    @name = name
    @quantity = quantity
    @price = price
    @is_exempt = is_exempt
    @is_imported = is_imported

    sales_tax = SalesTax.new(@price, @is_exempt, @is_imported)
    @applied_taxes = sales_tax.computed_tax * @quantity
    @price_with_tax = sales_tax.calculate_product_price_with_taxes
    @total_price = compute_total_price
  end

  def inline_basic_info
    "#{@quantity} #{@name}: #{@total_price}"
  end

  private
  def compute_total_price
    (@price_with_tax * @quantity).round(2)
  end
end