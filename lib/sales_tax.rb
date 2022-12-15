require_relative "utilities"

class SalesTax
  include Utilities

  BASIC_TAX = 0.1
  IMPORTION_TAX = 0.05

  attr_reader :computed_tax

  def initialize(shelf_price, is_exempt, is_imported)
    @tax = 0
    @shelf_price = shelf_price
    @is_exempt = is_exempt
    @is_imported = is_imported

    @computed_tax = compute_tax_value
  end

  def compute_tax_value
    tax = 0
    tax += BASIC_TAX unless @is_exempt
    tax += IMPORTION_TAX if @is_imported
    round_tax(@shelf_price * tax)
  end

  def calculate_product_price_with_taxes
    @shelf_price + @computed_tax
  end
end