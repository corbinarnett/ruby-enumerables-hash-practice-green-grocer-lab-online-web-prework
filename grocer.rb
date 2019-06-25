require 'pry'
def consolidate_cart(cart)
  updated_cart = {} #create new hash
  #iterate through cart
  cart.each do |item|
      binding.pry
    if updated_cart[item.keys[0]] #if updated_cart returns keys  increase count.  But this returns falsy so we move on.
      updated_cart[item.keys[0]][:count] += 1
    else

      updated_cart[item.keys[0]] = {
            count: 1,
            price: item.values[0][:price],
            clearance: item.values[0][:clearance]
      }
    end
  end
updated_cart
end

def apply_coupons(cart, coupons)
  #Iterating through coupon hash...
  #def coupons
  # 	[
  # 		{:item => "AVOCADO", :num => 2, :cost => 5.00},
  # 		{:item => "BEER", :num => 2, :cost => 20.00},
  # 		{:item => "CHEESE", :num => 3, :cost => 15.00}
  # 	]
  # end
    coupons.each do |coupon|
      if cart.keys.include? coupon[:item] #does cart include? a key that matches a key in the coupon hash
        if cart[coupon[:item]][:count] >= coupon[:num]
  new_name = "#{coupon[:item]} W/COUPON"
  if cart[new_name]
    cart[new_name][:count] += coupon[:num]
  else
    cart[new_name] = {
      count: coupon[:num],
      price: coupon[:cost]/coupon[:num],
      clearance: cart[coupon[:item]][:clearance]
    }
  end
  cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  end
cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
