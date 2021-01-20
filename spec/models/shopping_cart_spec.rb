describe ShoppingCart do
  let(:subject) { create :shopping_cart}

  it :exists do
    expect(subject).to be_a ShoppingCart
  end
end