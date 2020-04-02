describe Space do
  let(:subject) { build :space}

  it :exists do
    expect(subject).to be_a Space
  end

end
