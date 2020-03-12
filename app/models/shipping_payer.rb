class ShippingPayer < ActiveHash::Base
  self.data = [ 
    {id: 0, cost: '選択してください'},
    {id: 1, cost: '送料込み(出品者負担)'},
    {id: 2, cost: '着払い(購入者負担)'}, 
  ]
end