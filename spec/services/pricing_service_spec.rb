describe PricingService do
  let (:tip_in_cents) { PricingService.suggested_price_tip_in_cents reach, duration_in_hours, space_type }
  let (:tip_in_dollars) { PricingService.suggested_price_tip_in_dollars reach, duration_in_hours, space_type }
  let (:reach) { 1000 }

  context :food_truck do
    let (:space_type) { :food_truck }

    context :for_10_hours do
      let (:duration_in_hours) { 10 }
      it ".suggested_price_tip_in_cents = 9000"  do
        expect(tip_in_cents).to eq 9000
      end

      it ".suggested_price_tip_in_dollars = 90" do
        expect(tip_in_dollars).to eq 90
      end

    end

    context :for_20_hours do
      let (:duration_in_hours) { 20 }
      it ".suggested_price_tip_in_cents = 12000"  do
        expect(tip_in_cents).to eq 12000
      end

      it ".suggested_price_tip_in_dollars = 120" do
        expect(tip_in_dollars).to eq 120
      end
    end
  end


  context :booth_10x10 do
    let (:space_type) { :booth_10x10 }

    context :for_10_hours do
      let (:duration_in_hours) { 10 }
      it ".suggested_price_tip_in_cents = 18000"  do
        expect(tip_in_cents).to eq 18000
      end

      it ".suggested_price_tip_in_dollars = 180" do
        expect(tip_in_dollars).to eq 180
      end

    end

    context :for_20_hours do
      let (:duration_in_hours) { 20 }
      it ".suggested_price_tip_in_cents = 24000"  do
        expect(tip_in_cents).to eq 24000
      end

      it ".suggested_price_tip_in_dollars = 240" do
        expect(tip_in_dollars).to eq 240
      end

    end
  end


  context :booth_10x20 do
    let (:space_type) { :booth_10x20 }

    context :for_10_hours do
      let (:duration_in_hours) { 10 }
      it ".suggested_price_tip_in_cents = 27000"  do
        expect(tip_in_cents).to eq 27000
      end

      it ".suggested_price_tip_in_dollars = 270" do
        expect(tip_in_dollars).to eq 270
      end

    end

    context :for_20_hours do
      let (:duration_in_hours) { 20 }
      it ".suggested_price_tip_in_cents = 36000"  do
        expect(tip_in_cents).to eq 36000
      end

      it ".suggested_price_tip_in_dollars = 360" do
        expect(tip_in_dollars).to eq 360
      end

    end
  end

  context :booth_20x40 do
    let (:space_type) { :booth_20x40 }

    context :for_10_hours do
      let (:duration_in_hours) { 10 }
      it ".suggested_price_tip_in_cents = 36000"  do
        expect(tip_in_cents).to eq 36000
      end

      it ".suggested_price_tip_in_dollars = 360" do
        expect(tip_in_dollars).to eq 360
      end
    end

    context :for_20_hours do
      let (:duration_in_hours) { 20 }
      it ".suggested_price_tip_in_cents = 48000"  do
        expect(tip_in_cents).to eq 48000
      end

      it ".suggested_price_tip_in_dollars = 480" do
        expect(tip_in_dollars).to eq 480
      end

    end
  end

  context :booth_40x60 do
    let (:space_type) { :booth_40x60 }

    context :for_10_hours do
      let (:duration_in_hours) { 10 }
      it ".suggested_price_tip_in_cents = 45000"  do
        expect(tip_in_cents).to eq 45000
      end

      it ".suggested_price_tip_in_dollars = 450" do
        expect(tip_in_dollars).to eq 450
      end

    end

    context :for_20_hours do
      let (:duration_in_hours) { 20 }
      it ".suggested_price_tip_in_cents = 60000"  do
        expect(tip_in_cents).to eq 60000
      end

      it ".suggested_price_tip_in_dollars = 600" do
        expect(tip_in_dollars).to eq 600
      end

    end
  end


end