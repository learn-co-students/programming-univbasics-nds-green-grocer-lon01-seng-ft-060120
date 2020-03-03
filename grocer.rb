require 'pry'

def find_item_by_name_in_collection(name, collection)
index =0 
  while index<collection.length;
  collection[index];
    if collection[index][:item] == name
    return collection[index]
    end
    index+=1
  end
end


def consolidate_cart(cart)
 new_cart= []
 index = 0
while index<cart.length
  new_item = find_item_by_name_in_collection(cart[index][:item], new_cart)
    if new_item != nil
      new_item[:count] += 1
    else 
      new_item = {
        :item => cart[index][:item],
        :price => cart[index][:price],
        :clearance => cart[index][:clearance],
        :count => 1}
      new_cart.push(new_item)
    end
  index +=1
end
return new_cart 
end
 

def apply_coupons(cart, coupons)
index = 0
  while index<coupons.length
    coupon_item = find_item_by_name_in_collection(coupons[index][:item], cart)
    couponed_name = "#{coupons[index][:item]} W/COUPON"
    cart_with_coupons = find_item_by_name_in_collection(couponed_name, cart) 
      if coupon_item != nil && coupon_item[:count] >= coupons[index][:num]
        if cart_with_coupons 
        cart_with_coupons[:count] += coupons[index][:num]
        coupon_item[:count] -= coupons[index][:num]
        else
          cart_with_coupons = {
            :item => couponed_name,
            :price => coupons[index][:cost] / coupons[index][:num],
            :clearance => coupon_item[:clearance],
            :count => coupons[index][:num]}
          cart.push(cart_with_coupons)
          coupon_item[:count] -= coupons[index][:num]
        end
      end
      index+=1
  end
return cart  
end
# Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart


def apply_clearance(cart)
  clearance_cart = []
  index =0
  while index<cart.length
    if cart[index][:clearance]# == TRUE
      clearance_item = {
        :item => cart[index][:item],
        :price => (cart[index][:price] *= 0.8).round(2),
        :clearance => cart[index][:clearance],
        :count => cart[index][:count]}
      
      clearance_cart.push(clearance_item)
    else clearance_item = {
        :item => cart[index][:item],
        :price => cart[index][:price],
        :clearance => cart[index][:clearance],
        :count => cart[index][:count]}
      clearance_cart.push(clearance_item)
      end
      index+=1
  end
clearance_cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  last_cart= apply_clearance(couponed_cart)
#binding.pry
index = 0
total = 0

while index< last_cart.length
  total += last_cart[index][:price] * last_cart[index][:count]
  index +=1
end   
if total > 100
    total = (total * 0.9).round(2)
  return total
  end
p total  
end

# Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers






  #values = collection.map {|x| x.values}
  #flat_values = values.flatten
  #result = nil;
  #if flat_values.include? "#{name}"
  #  index_no= flat_values.index(name)
  #  return collection[index_no]
  #end
  #p result
  # Implement me first!
  #
  # Consult README for inputs and outputs
#end


#coupon_array =[]
#index = 0;
#  while index<cart.length
#    inner = 0;
#      while inner<coupons.length;
 #     coupon_use = find_item_by_name_in_collection(coupons[inner][:item], #coupon_array)
#      if coupon_use != nil
#        coupon_array[index][:count] - coupons[inner][:num]
#        coupon_item = {}
#          coupon_array.push(coupon_item)
#        else coupon_use = {
#          :item => cart[index][:item],
#          :price => cart[index][:price],
#          :clearance => cart[index][:clearance],
#          :count => cart[index][:count]}
#          coupon_array.push(coupon_use)
#      end
#      inner+=1
#      end
 #   index +=1
 # p coupon_array