require "product"

RSpec.describe "Product" do
  context "national" do
    it "will add basic tax for non exempt" do
      name = 'music CD',
      quantity = 1,
      price = 14.99,
      is_exempt = false,
      is_imported = false

      product = Product.new(name, quantity, price, is_exempt, is_imported)

      expected_info = "#{product.quantity} #{product.name}: #{product.total_price}"
      expect(product.total_price).to eq(16.49)
      expect(product.applied_taxes).to eq((product.price * 0.10).ceil(2))
      expect(product.inline_basic_info).to eq(expected_info)
    end

    it "will not add basic tax for exempt" do
      name = 'book',
      quantity = 2,
      price = 12.49,
      is_exempt = true,
      is_imported = false

      product = Product.new(name, quantity, price, is_exempt, is_imported)

      expected_info = "#{product.quantity} #{product.name}: #{product.total_price}"
      expect(product.total_price).to eq(24.98)
      expect(product.applied_taxes).to eq(0)
      expect(product.inline_basic_info).to eq(expected_info)
    end
  end

  context "imported" do
    it "will add importion tax considering an exempt product" do
      name = 'imported box of chocolates',
      quantity = 1,
      price = 10.00,
      is_exempt = true,
      is_imported = true

      product = Product.new(name, quantity, price, is_exempt, is_imported)

      expected_info = "#{product.quantity} #{product.name}: #{product.total_price}"
      expect(product.total_price).to eq(10.50)
      expect(product.applied_taxes).to eq(product.price * 0.05)
      expect(product.inline_basic_info).to eq(expected_info)
    end

    it "will add importion tax considering a not exempt product" do
      name = 'imported bottle of perfume',
      quantity = 1,
      price = 47.50,
      is_exempt = false,
      is_imported = true

      product = Product.new(name, quantity, price, is_exempt, is_imported)

      tax = product.price * 0.15
      expected_info = "#{product.quantity} #{product.name}: #{product.total_price}"
      expect(product.total_price).to eq(54.65)
      expect(product.applied_taxes).to eq(((tax * 20).ceil.to_f) / 20)
      expect(product.inline_basic_info).to eq(expected_info)
    end
  end
end