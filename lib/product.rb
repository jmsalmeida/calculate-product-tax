class Product
  BASIC_TAX = 0.1
  IMPORTION_TAX = 0.05

  attr_accessor :name, :quantity, :price, :is_exempt, :is_imported, :applied_taxes, :total_price

  def initialize(name, quantity, price, is_exempt, is_imported)
    @name = name
    @quantity = quantity
    @price = price
    @is_exempt = is_exempt
    @is_imported = is_imported
    @applied_taxes = 0
    @total_price = @price

    calculate_basic_tax
    calculate_importion_tax
    compute_total_price
  end

  def inline_basic_info
    return "#{@quantity} #{@name}: #{@total_price.round(2)}"
  end

  private
  def tax_value(value, base_tax)
    value * base_tax
  end

  def calculate_basic_tax
    if @is_exempt
      @price_with_tax = @price
    else
      basic_tax = tax_value(@price, BASIC_TAX)
      @applied_taxes += basic_tax

      @price_with_tax = @price + basic_tax
    end
  end

  def calculate_importion_tax
    if @is_imported
      importion_tax = tax_value(@price, IMPORTION_TAX)
      @applied_taxes += importion_tax

      @price_with_tax += importion_tax
    else
      @price_with_tax
    end
  end

  def compute_total_price
    @total_price = (@price_with_tax * @quantity).round(2)
  end
end