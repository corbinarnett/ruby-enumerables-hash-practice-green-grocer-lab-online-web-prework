# REQUIRE 'PRY'
def consolidate_cart(cart)
  updated_cart = {} #create new hash
  #iterate through cart
  cart.each do |item|
 #binding.pry
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
        if cart[coupon[:item]][:count] >= coupon[:num] #if the count of the item with the coupon in the cart is >= the number in the coupon
          #Create a new item if there is a coupon
          new_item = "#{coupon[:item]} W/COUPON" #adds a new key, value pair to the cart hash called 'ITEM NAME W/COUPON'
  if cart[new_item] #if this is true
    cart[new_item][:count] += coupon[:num]  # adds the coupon price to the property hash of couponed item
                                            #adds the count number to the property hash of couponed item
  else
      # item:count is < coupon:num, list current item
    cart[new_item] = {
      count: coupon[:num],
      price: coupon[:cost]/coupon[:num],
      clearance: cart[coupon[:item]][:clearance] #remembers if the item was on clearance
    }
  end
  cart[coupon[:item]][:count] -= coupon[:num] #  removes the number of discounted items from the original item's count
      end
    end
  end
cart
end

def apply_clearance(cart)

  cart.keys.each do |value| #iterate through cart hash using.keys to select key and .each
    if cart[value][:clearance] #if clearance is truthy
        #take 20% off price of item
      cart[value][:price] = cart[value][:price] - (cart[value][:price] * 0.20)
    end

  end
  cart #return cart with applied clearance
end

def checkout(cart, coupons)
  consol_cart = consolidate_cart(cart)
end
