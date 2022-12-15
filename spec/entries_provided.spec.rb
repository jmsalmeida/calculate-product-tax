require "product"

RSpec.describe "Test the provided entries in the chalenge resume" do
  before(:each) do
    @cart_applied_taxes = 0
    @cart_total_products = 0
  end

  it "Sannity test =: input 1" do
    name = 'book',
    quantity = 2,
    price = 12.49,
    is_exempt = true,
    is_imported = false
    book = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += book.total_price
    @cart_applied_taxes += book.applied_taxes
    expect(book.total_price).to eq(24.98)

    name = 'music CD',
    quantity = 1,
    price = 14.99,
    is_exempt = false,
    is_imported = false
    music_cd = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += music_cd.total_price
    @cart_applied_taxes += music_cd.applied_taxes
    expect(music_cd.total_price).to eq(16.49)

    name = 'chocolate bar',
    quantity = 1,
    price = 0.85,
    is_exempt = true,
    is_imported = false
    chocolate_bar = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += chocolate_bar.total_price
    @cart_applied_taxes += chocolate_bar.applied_taxes
    expect(chocolate_bar.total_price).to eq(0.85)

    expect(@cart_applied_taxes).to eq(1.50)
    expect(@cart_total_products).to eq(42.32)
  end

  it "Sannity test =: input 2" do
    name = 'imported box of chocolates',
    quantity = 1,
    price = 10.00,
    is_exempt = true,
    is_imported = true
    imported_chocolates_box = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += imported_chocolates_box.total_price
    @cart_applied_taxes += imported_chocolates_box.applied_taxes
    expect(imported_chocolates_box.total_price).to eq(10.50)

    name = 'imported bottle of perfume',
    quantity = 1,
    price = 47.50,
    is_exempt = false,
    is_imported = true
    imported_perfume = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += imported_perfume.total_price
    @cart_applied_taxes += imported_perfume.applied_taxes
    expect(imported_perfume.total_price).to eq(54.65)

    expect(@cart_applied_taxes).to eq(7.65)
    expect(@cart_total_products).to eq(65.15)
  end

  it "Sannity test =: input 3" do
    name = 'imported bottle of perfume',
    quantity = 1,
    price = 27.99,
    is_exempt = false,
    is_imported = true
    imported_perfume = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += imported_perfume.total_price
    @cart_applied_taxes += imported_perfume.applied_taxes
    expect(imported_perfume.total_price).to eq(32.19)

    name = 'bottle of perfume',
    quantity = 1,
    price = 18.99,
    is_exempt = false,
    is_imported = false
    perfume = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += perfume.total_price
    @cart_applied_taxes += perfume.applied_taxes
    expect(perfume.total_price).to eq(20.89)

    name = 'packet of headache pills at',
    quantity = 1,
    price = 9.75,
    is_exempt = true,
    is_imported = false
    headache_pills = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += headache_pills.total_price
    @cart_applied_taxes += headache_pills.applied_taxes
    expect(headache_pills.total_price).to eq(9.75)

    name = 'imported box of chocolates',
    quantity = 3,
    price = 11.25,
    is_exempt = true,
    is_imported = true
    imported_chocolates_box = Product.new(name, quantity, price, is_exempt, is_imported)

    @cart_total_products += imported_chocolates_box.total_price
    @cart_applied_taxes += imported_chocolates_box.applied_taxes
    expect(imported_chocolates_box.total_price).to eq(35.55)

    expect(@cart_applied_taxes.round(2)).to eq(7.90)
    expect(@cart_total_products).to eq(98.38)
  end
end