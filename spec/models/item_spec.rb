require 'rails_helper'
RSpec.describe Item, type: :model do

  before do
  @item = FactoryBot.build(:item)
  end

describe '商品の出品登録' do
  context '商品が出品できる場合' do
    it 'name,comment,price,sender_id,category_id,item_status_id,days_to_ship,delivery_changeが存在していれば保存できる' do
      expect(@item).to be_valid
    end
  end

  context '商品が出品できない場合' do
    it 'nameが空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'commentが空では出品できない' do
      @item.comment = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Comment can't be blank")
    end
    it 'priceが空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300円未満では出品できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceが9,999,999円以下でないと出品できない' do
      @item.price = '10,000,000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
    it 'priceに半角数字以外が含まれている場合は出品できない'
    @item.price = 'ああああああ'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can include half-width alphanumeric")
    end
    it 'sender_idが未選択では出品できない' do
      @item.sender_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sender can't be blank")
    end
    it 'category_idが未選択では出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'item_status_idが未選択では出品できない' do
      @item.item_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status can't be blank")
    end
    it 'days_to_ship_idが未選択では出品できない' do
      @item.days_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end
    it 'delivery_change_idが未選択では出品できない' do
      @item.delivery_change_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery change can't be blank")
    end
    it '商品画像が空では出品できない'
    @item.images = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery change can't be blank")
    end
    it 'userが紐づいていなければ出品できない'
    @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
end