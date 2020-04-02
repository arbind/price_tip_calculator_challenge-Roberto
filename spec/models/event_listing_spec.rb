describe EventListing do
  let(:subject) { create :event_listing}

  let (:space_type1) { :booth_10x10 }

  it :exists do
    expect(subject).to be_an EventListing
  end

  context "by default" do
    it 'has no spaces' do
      expect(subject.spaces.count).to be_zero
    end
    it '#space_for type returns nil' do
      expect(subject.space_for space_type1).to be_nil
    end
  end

  context "#add_space!" do
    let!(:added_space)  { subject.add_space! space_type1, space_price1 }
    let (:space_1)      { subject.space_for space_type1 }
    let (:space_price1) { 11000 }

    it 'increases the number of available spaces by 1' do
      expect(subject.spaces.count).to eq 1
    end

    it '#space_for :booth_10x10' do
      expect(space_1).to be_a Space
    end

    it 'space_1 to cost $450' do
      expect(space_1.price_in_cents).to be space_price1
    end

    context "2x times" do
      let!(:added_space2)  { subject.add_space! space_type1, space_price2 }
      let (:space_price2) { 22000 }

      it 'does not increase the number of spaces' do
        expect(subject.spaces.count).to eq 1
      end

      it 'does update the price' do
        expect(space_1.price_in_cents).to be space_price2
      end
    end
  end

end
