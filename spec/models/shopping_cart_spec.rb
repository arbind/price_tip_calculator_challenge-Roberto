describe ShoppingCart do
  let(:subject) { create :shopping_cart}

  it :exists do
    expect(subject).to be_a ShoppingCart
  end
end

# describe ShoppingCart do
#   let (:event_1) { create :event, event_set: event_set_1, reach: reach_1 }
#   let (:event_2) { create :event, event_set: event_set_2, reach: reach_2 }

#   let (:shopping_cart) { event_schedule.shopping_cart }
#   let (:shopping_cart_item) { build :shopping_cart_item, shopping_cart: shopping_cart, event: event_1, space_name: 'Booth_10x10', price_in_cents: 10000, quantity: 1 }

#   context :empty_cart do
#     context '#add_line_item_for_space' do
#       let!(:new_item_id) { shopping_cart.add_line_item_for_space event_1, "Booth_10x10", 10000, 3 }

#       it 'return an id of an item' do
#         expect(new_item_id).to be_a_kind_of BSON::ObjectId
#       end
#       it 'increases the number of line items' do
#         expect(shopping_cart.line_items_count).to be 1
#       end
#       it 'updates the total price' do
#         expect(shopping_cart.total_price_in_cents).to be (10000 * 3)
#       end
#       it 'updates total reach' do
#         expect(shopping_cart.total_reach).to be reach_1
#       end
#     end
#     it '#events' do
#       expect(shopping_cart.events).to be_empty
#     end
#     it '#lookup_line_item' do
#       expect { shopping_cart.lookup_line_item 'does_not_exist' }.to raise_error(Mongoid::Errors::DocumentNotFound)
#     end
#     it '#remove_line_item! returns nil' do
#       item = shopping_cart.remove_line_item! 'does_not_exist'
#       expect(item).to be nil
#     end
#     it '#add_quantity!' do
#       expect { shopping_cart.add_quantity 'does_not_exist', 1 }.to raise_error(Mongoid::Errors::DocumentNotFound)
#     end
#     it '#subtract_quantity!' do
#       expect { shopping_cart.subtract_quantity 'does_not_exist', 1 }.to raise_error(Mongoid::Errors::DocumentNotFound)
#     end
#     it '#clear_cart' do
#       shopping_cart.clear_cart
#       expect(shopping_cart.line_items_count).to be 0
#     end
#     it '#total_price_in_cents is 0' do
#       expect(shopping_cart.total_price_in_cents).to be 0
#     end
#     it '#total_reach is 0' do
#       expect(shopping_cart.total_reach).to be 0
#     end
#     it '#events_count is 0' do
#       expect(shopping_cart.events_count).to be 0
#     end
#     it '#line_items_count is 0' do
#       expect(shopping_cart.line_items_count).to be 0
#     end
#     it '#to_json'
#   end

#   context :cart_with_1_item do
#     let (:item_1_e1_atts) { { event: event_1, space_name: 'Booth_10x10', price_in_cents: 1100, quantity: 1 } }
#     let (:item_1_e1_id) { shopping_cart.add_line_item_for_space item_1_e1_atts[:event], item_1_e1_atts[:space_name], item_1_e1_atts[:price_in_cents], item_1_e1_atts[:quantity] }
#     let!(:item_1_e1) { shopping_cart.lookup_line_item item_1_e1_id }

#     let (:expected_price_in_cents) { item_1_e1_atts[:price_in_cents] * item_1_e1_atts[:quantity] }
#     let (:expected_reach) { reach_1 }

#     context '#add_line_item_for_space' do
#       let!(:new_item_id) { shopping_cart.add_line_item_for_space event_1, "Booth_10x10", 10000, 3 }

#       it 'increases the number of line items' do
#         expect(shopping_cart.line_items_count).to be 2
#       end
#       it 'updates the total price' do
#         expect(shopping_cart.total_price_in_cents).to be expected_price_in_cents + (10000 * 3)
#       end
#       it 'updates total reach' do
#         expect(shopping_cart.total_reach).to be reach_1
#       end
#     end

#     it '#events' do
#       expect(shopping_cart.events).to include event_1
#       expect(shopping_cart.events.count).to eq 1
#     end
#     it '#lookup_line_item' do
#       expect(shopping_cart.lookup_line_item item_1_e1_id).to eq item_1_e1
#     end

#     context '#remove_line_item!' do
#       let!(:removed_item) { shopping_cart.remove_line_item! item_1_e1_id }

#       it 'returns the removed item' do
#         expect(removed_item.id).to eq item_1_e1_id
#       end
#       it 'reduces the number of line items' do
#         expect(shopping_cart.line_items_count).to be 0
#       end
#       it 'removes the event when it was the last item of the event' do
#         expect(shopping_cart.events).not_to include event_1
#       end
#     end

#     context '#add_quantity!' do
#       let!(:amount_to_add) { 3 }
#       let (:expected_price_in_cents) { item_1_e1_atts[:price_in_cents] * (item_1_e1_atts[:quantity] + amount_to_add) }

#       before(:each) do
#         shopping_cart.add_quantity item_1_e1_id, amount_to_add
#       end

#       it 'bumps up the quantity' do
#         expect(item_1_e1.quantity).to eq 4
#       end
#       it 'does not change the number of line items' do
#         expect(shopping_cart.line_items_count).to eq 1
#       end
#       it 'does change the total price' do
#         expect(shopping_cart.total_price_in_cents).to eq expected_price_in_cents
#       end
#     end

#     context '#subtract_quantity!' do
#       let (:item_1_e1_atts) { { event: event_1, space_name: 'Booth_10x10', price_in_cents: 1100, quantity: 3 } }
#       let!(:amount_to_subtract) { 1 }
#       let (:expected_price_in_cents) { item_1_e1_atts[:price_in_cents] * (item_1_e1_atts[:quantity] - amount_to_subtract) }

#       before(:each) do
#         shopping_cart.subtract_quantity! item_1_e1_id, amount_to_subtract
#       end

#       it 'bumps up the quantity' do
#         expect(item_1_e1.quantity).to eq 2
#       end
#       it 'does not change the number of line items' do
#         expect(shopping_cart.line_items_count).to eq 1
#       end
#       it 'does change the total price' do
#         expect(shopping_cart.total_price_in_cents).to eq expected_price_in_cents
#       end

#       context 'given all quantity is removed' do
#         let!(:amount_to_subtract) { item_1_e1_atts[:quantity] }

#         it 'removes the line item' do
#           expect(shopping_cart.line_items_count).to eq 0
#         end
#         it 'does change the total price' do
#           expect(shopping_cart.total_price_in_cents).to eq 0
#         end
#       end

#       context 'given more than quantity is removed' do
#         let!(:amount_to_subtract) { item_1_e1_atts[:quantity] + 1 }

#         it 'removes the line item' do
#           expect(shopping_cart.line_items_count).to eq 0
#         end
#         it 'does change the total price' do
#           expect(shopping_cart.total_price_in_cents).to eq 0
#         end
#       end
#     end

#     it '#total_price_in_cents' do
#       expect(shopping_cart.total_price_in_cents).to be expected_price_in_cents
#     end
#     it '#total_reach' do
#       expect(shopping_cart.total_reach).to be expected_reach
#     end
#     it '#events_count is 1' do
#       expect(shopping_cart.events_count).to be 1
#     end
#     it '#line_items_count is 1' do
#       expect(shopping_cart.line_items_count).to be 1
#     end

#     it '#to_json'
#   end

#   context :shopping_cart_with_2_items_from_same_event do
#     let (:item_1_e1_atts) { { event: event_1, space_name: 'Booth_10x10', price_in_cents: 1100, quantity: 1 } }
#     let (:item_1_e1_id) { shopping_cart.add_line_item_for_space item_1_e1_atts[:event], item_1_e1_atts[:space_name], item_1_e1_atts[:price_in_cents], item_1_e1_atts[:quantity] }
#     let!(:item_1_e1) { shopping_cart.lookup_line_item item_1_e1_id }

#     let (:item_2_e1_atts) { { event: event_1, space_name: 'Booth_10x20', price_in_cents: 2100, quantity: 2 } }
#     let (:item_2_e1_id) { shopping_cart.add_line_item_for_space item_2_e1_atts[:event], item_2_e1_atts[:space_name], item_2_e1_atts[:price_in_cents], item_2_e1_atts[:quantity] }
#     let!(:item_2_e1) { shopping_cart.lookup_line_item item_2_e1_id }

#     let (:expected_price_in_cents) { (item_1_e1_atts[:price_in_cents] * item_1_e1_atts[:quantity]) + (item_2_e1_atts[:price_in_cents] * item_2_e1_atts[:quantity]) }
#     let (:expected_reach) { reach_1 }

#     it '#events' do
#       expect(shopping_cart.events).to include event_1
#       expect(shopping_cart.events.count).to eq 1
#     end

#     context '#add_line_item_for_space' do
#       let!(:new_item_id) { shopping_cart.add_line_item_for_space event_1, "Booth_10x10", 10000, 3 }

#       it 'increases the number of line items' do
#         expect(shopping_cart.line_items_count).to be 3
#       end
#       it 'updates the total price' do
#         expect(shopping_cart.total_price_in_cents).to be expected_price_in_cents + (10000 * 3)
#       end
#       it 'updates total reach' do
#         expect(shopping_cart.total_reach).to be reach_1
#       end
#     end

#     context '#remove_line_item!' do
#       let!(:removed_item) { shopping_cart.remove_line_item! item_1_e1_id }

#       it 'reduces the number of line items' do
#         expect(shopping_cart.line_items_count).to be 1
#       end
#       it 'does not removes the event when the event still has other line items' do
#         expect(shopping_cart.events).to include event_1
#       end
#     end

#     it '#total_price_in_cents' do
#       expect(shopping_cart.total_price_in_cents).to be expected_price_in_cents
#     end
#     it '#total_reach' do
#       expect(shopping_cart.total_reach).to be expected_reach
#     end
#     it '#events_count is 1' do
#       expect(shopping_cart.events_count).to be 1
#     end
#     it '#line_items_count is 1' do
#       expect(shopping_cart.line_items_count).to be 2
#     end

#     it '#to_json'
#   end

#   context :shopping_cart_with_3_items_from_2_events do
#     let (:item_1_e1_atts) { { event: event_1, space_name: 'Booth_10x10', price_in_cents: 1100, quantity: 1 } }
#     let (:item_1_e1_id) { shopping_cart.add_line_item_for_space item_1_e1_atts[:event], item_1_e1_atts[:space_name], item_1_e1_atts[:price_in_cents], item_1_e1_atts[:quantity] }
#     let!(:item_1_e1) { shopping_cart.line_items.where(id: item_1_e1_id).first }

#     let (:item_2_e1_atts) { { event: event_1, space_name: 'Booth_10x20', price_in_cents: 2100, quantity: 2 } }
#     let (:item_2_e1_id) { shopping_cart.add_line_item_for_space item_2_e1_atts[:event], item_2_e1_atts[:space_name], item_2_e1_atts[:price_in_cents], item_2_e1_atts[:quantity] }
#     let!(:item_2_e1) { shopping_cart.line_items.where(id: item_2_e1_id).first }

#     let (:item_1_e2_atts) { { event: event_2, space_name: 'Video_Wall', price_in_cents: 1200, quantity: 3 } }
#     let (:item_1_e2_id) { shopping_cart.add_line_item_for_space item_1_e2_atts[:event], item_1_e2_atts[:space_name], item_1_e2_atts[:price_in_cents], item_1_e2_atts[:quantity] }
#     let!(:item_1_e2) { shopping_cart.line_items.where(id: item_1_e2_id).first }

#     let (:expected_price_in_cents) { (item_1_e1[:price_in_cents] * item_1_e1[:quantity]) + (item_2_e1[:price_in_cents] * item_2_e1[:quantity]) + (item_1_e2_atts[:price_in_cents] * item_1_e2_atts[:quantity]) }
#     let (:expected_reach) { reach_1 + reach_2 }

#     it '#events' do
#       expect(shopping_cart.events).to include event_1, event_2
#       expect(shopping_cart.events.count).to eq 2
#     end

#     it '#lookup_line_item' do
#       expect(shopping_cart.lookup_line_item item_1_e1_id).to eq item_1_e1
#       expect(shopping_cart.lookup_line_item item_2_e1_id).to eq item_2_e1
#       expect(shopping_cart.lookup_line_item item_1_e2_id).to eq item_1_e2
#     end

#     context '#add_line_item_for_space' do
#       let!(:new_item_id) { shopping_cart.add_line_item_for_space event_1, "Booth_10x10", 1000, 3 }

#       it 'increases the number of line items' do
#         expect(shopping_cart.line_items_count).to be 4
#       end
#       it 'updates the total price' do
#         expect(shopping_cart.total_price_in_cents).to be expected_price_in_cents + (1000 * 3)
#       end
#       it 'updates total reach' do
#         expect(shopping_cart.total_reach).to be expected_reach
#       end
#     end

#     context '#remove_line_item! for event with only one item' do
#       let (:expected_price_in_cents) { (item_1_e1[:price_in_cents] * item_1_e1[:quantity]) + (item_2_e1[:price_in_cents] * item_2_e1[:quantity]) }
#       let (:expected_reach) { reach_1 }
#       let!(:removed_item) { shopping_cart.remove_line_item! item_1_e2_id }

#       it 'reduces the number of events by 1 when the last item from an event is removed' do
#         expect(shopping_cart.events_count).to be 1
#       end
#       it 'reduces the number of line items by 1' do
#         expect(shopping_cart.line_items_count).to be 2
#       end
#       it 'readjusts total price' do
#         expect(shopping_cart.total_price_in_cents).to be expected_price_in_cents
#       end
#       it 'readjusts total reach' do
#         expect(shopping_cart.total_reach).to be expected_reach
#       end
#       it 'removes the event when the event has no other line items' do
#         expect(shopping_cart.events).not_to include event_2
#         expect(shopping_cart.events.count).to be 1
#       end
#     end

#     context '#remove_line_item! for event for more than one item' do
#       let (:expected_price_in_cents) { (item_1_e1[:price_in_cents] * item_1_e1[:quantity]) + (item_1_e2[:price_in_cents] * item_1_e2[:quantity]) }
#       let!(:removed_item) { shopping_cart.remove_line_item! item_2_e1_id }

#       it 'does not change the number of events' do
#         expect(shopping_cart.events_count).to be 2
#       end
#       it 'reduces the number of line items by 1' do
#         expect(shopping_cart.line_items_count).to be 2
#       end
#       it 'readjusts total price' do
#         expect(shopping_cart.total_price_in_cents).to be expected_price_in_cents
#       end
#       it 'does not change expected reach' do
#         expect(shopping_cart.total_reach).to be expected_reach
#       end
#       it 'does not removes the event' do
#         expect(shopping_cart.events).to include event_1, event_2
#         expect(shopping_cart.events.count).to be 2
#       end
#     end
#     it '#clear_cart' do
#       shopping_cart.clear_cart
#       expect(shopping_cart.line_items_count).to be 0
#     end
#     it '#total_price_in_cents' do
#       expect(shopping_cart.total_price_in_cents).to be expected_price_in_cents
#     end
#     it '#total_reach' do
#       expect(shopping_cart.total_reach).to be expected_reach
#     end
#     it '#events_count is 2' do
#       expect(shopping_cart.events_count).to be 2
#     end
#     it '#line_items_count is 3' do
#       expect(shopping_cart.line_items_count).to be 3
#     end
#     it '#to_json'

#     context 'saved_line_items' do
#       context '#save_for_later_line_item_for_space' do
#         let!(:new_item_id) { shopping_cart.save_for_later_line_item_for_space event_1, "Booth_10x10", 10000, 3 }

#         it 'return an id of an item' do
#           expect(new_item_id).to be_a_kind_of BSON::ObjectId
#         end
#         it 'increases the number of saved line items' do
#           expect(shopping_cart.saved_line_items_count).to be 1
#         end
#       end

#       context '#save_for_later one of the items for an event' do
#         let!(:count) { shopping_cart.save_for_later event_1 }

#         it 'expect 2 items to be saved for later' do
#           expect(count).to be 2
#         end
#         it 'event count reduces by 1' do
#           expect(shopping_cart.events_count).to be 1
#         end
#         it 'reduces the number of line items by 2' do
#           expect(shopping_cart.line_items_count).to be 1
#         end
#         it 'increases the number of saved line items by 2' do
#           expect(shopping_cart.saved_line_items_count).to be 2
#         end
#         it 'item can no longer be found in list of line items' do
#           expect { shopping_cart.lookup_line_item item_1_e1_id }.to raise_error(Mongoid::Errors::DocumentNotFound)
#         end
#         it '#saved_line_items_for_event has 2 items' do
#           expect(shopping_cart.saved_line_items_for_event(event_1).count).to be 2
#         end
#         it '#line_items_for_event has 1 items' do
#           expect(shopping_cart.line_items_for_event(event_1).count).to be 0
#         end

#         context '#lookup_saved_line_item' do
#           let (:saved_line_item_id) { shopping_cart.saved_line_items.first.id }

#           it 'can be found on the list of saved line items' do
#             saved_item = shopping_cart.lookup_saved_line_item saved_line_item_id
#             expect(shopping_cart.saved_line_items).to include saved_item
#           end
#           it 'raises and exception when not found' do
#             expect { shopping_cart.lookup_saved_line_item 'does_not_exist' }.to raise_error(Mongoid::Errors::DocumentNotFound)
#           end
#         end

#         context '#has_saved_line_item' do
#           let (:saved_line_item_id) { shopping_cart.saved_line_items.first.id }

#           it 'returns true when found' do
#             expect(shopping_cart.has_saved_line_item? saved_line_item_id).to be true
#           end
#           it 'returns false when not found' do
#             expect(shopping_cart.has_saved_line_item? 'does_not_exist').to be false
#           end
#         end

#         context '#remove_saved_line_item' do
#           let (:saved_line_item_id) { shopping_cart.saved_line_items.first.id }
#           let!(:removed_item) { shopping_cart.remove_saved_line_item saved_line_item_id }

#           it 'reduces the saved line items count by 1' do
#             expect(shopping_cart.saved_line_items_count).to be 1
#           end
#           it 'can not be found in the saved line items' do
#             expect(shopping_cart.saved_line_items_count).to be 1
#           end
#         end

#         context '#move_to_cart! one of the items for an event' do
#           let!(:moved_items_count) { shopping_cart.move_to_cart! event_1 }

#           it 'expect 2 items to be moved' do
#             expect(moved_items_count).to be 2
#           end
#           it 'event count increases by 1' do
#             expect(shopping_cart.events_count).to be 2
#           end
#           it 'increases the number of line items by 2' do
#             expect(shopping_cart.line_items_count).to be 3
#           end
#           it 'decreases the number of saved line items by 2' do
#             expect(shopping_cart.saved_line_items_count).to be 0
#           end
#           it '#line_items_for_event has 2 items' do
#             expect(shopping_cart.line_items_for_event(event_1).count).to be 2
#           end
#           it '#saved_line_items_for_event has 0 items' do
#             expect(shopping_cart.saved_line_items_for_event(event_1).count).to be 0
#           end
#         end

#         # context 'when an event with multiple saved line items expires' do
#         #   it 'they are removed automatically on initialize'
#         #   it 'decreases the number of saved line items by 2'
#         #   it 'item can not be found in the list of saved line items'
#         #   it 'other items from the same event can not be found in the list of saved line items'
#         # end
#       end

#       context '#save_for_later the only item for an event' do
#         let!(:count) { shopping_cart.save_for_later event_2 }

#         it 'expect 1 items to be saved for later' do
#           expect(count).to be 1
#         end
#         it 'event count reduces by 1' do
#           expect(shopping_cart.events_count).to be 1
#         end
#         it 'reduces the number of line items by 1' do
#           expect(shopping_cart.line_items_count).to be 2
#         end
#         it 'increases the number of saved line items by 1' do
#           expect(shopping_cart.saved_line_items_count).to be 1
#         end
#         it 'item can no longer be found in list of line items' do
#           expect { shopping_cart.lookup_line_item item_1_e2_id }.to raise_error(Mongoid::Errors::DocumentNotFound)
#         end
#         it '#line_items_for_event has 0 items' do
#           expect(shopping_cart.line_items_for_event(event_2).count).to be 0
#         end
#         it '#saved_line_items_for_event has 1 item' do
#           expect(shopping_cart.saved_line_items_for_event(event_2).count).to be 1
#         end

#         context '#move_to_cart one of the items for an event' do
#           let!(:moved_items_count) { shopping_cart.move_to_cart! event_2 }

#           it 'expect 1 items to be moved' do
#             expect(moved_items_count).to be 1
#           end
#           it 'event count increases by 1' do
#             expect(shopping_cart.events_count).to be 2
#           end
#           it 'increases the number of line items by 1' do
#             expect(shopping_cart.line_items_count).to be 3
#           end
#           it 'decreases the number of saved line items by 1' do
#             expect(shopping_cart.saved_line_items_count).to be 0
#           end
#           it '#line_items_for_event has 1 items' do
#             expect(shopping_cart.line_items_for_event(event_2).count).to be 1
#           end
#           it '#saved_line_items_for_event has 0 items' do
#             expect(shopping_cart.saved_line_items_for_event(event_2).count).to be 0
#           end

#           it 'item can not be found in the list of saved line items' do
#             expect { shopping_cart.lookup_saved_line_item moved_items_count }.to raise_error(Mongoid::Errors::DocumentNotFound)
#           end
#         end

#         # context 'when an event with only one saved line item expires' do
#         #   it 'the saved line item is removed automatically on initialize'
#         #   it 'decreases the number of saved line items by 1'
#         #   it 'item can not be found in the list of saved line items'
#         # end
#       end
#     end

#     # context 'when an event expires' do
#     #   context 'given the event has a line item' do
#     #     it 'the line item is removed automatically on initialize'
#     #     it 'the number of events goes down by 1'
#     #     it 'decreases the number of line items by 1'
#     #     it 'item can not be found in the list of line items'
#     #   end
#     #   context 'given the event has multiple line items' do
#     #     it 'is removed automatically on initialize'
#     #     it 'the number of events goes down by 1'
#     #     it 'decreases the number of line items by 1'
#     #     it 'other items from the same event can not be found in the list of line items'
#     #   end
#     # end
#   end

#   context '#prune' do
#     # 0. Add an event that is not expired
#     # 1. Use let to add an expired to line items and then prune it
#     # 2. Add an expired event to the saved line items and then prune it
#     it 'removes all expired events from both lists'
#   end
# end