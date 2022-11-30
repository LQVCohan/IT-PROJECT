package com.ecopic.control.frontend.shoppingcart;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.ecopic.entity.Picture;

public class ShoppingCart {
	private Map<Picture, Integer> cart = new HashMap<Picture, Integer>();
	
	public void addItem(Picture picture) {
		if(cart.containsKey(picture)) {
			Integer quantity = cart.get(picture) +1 ;
			cart.put(picture, quantity);
		}else {
			cart.put(picture, 1);
		}
	}
	
	public void removeItem(Picture picture) {
		cart.remove(picture);
	}
	
	public int getTotalQuantity() {
		int total = 0;
		
		Iterator<Picture> iterator = cart.keySet().iterator();
		
		while(iterator.hasNext()) {
			Picture next = iterator.next();
			Integer quantity = cart.get(next);
			total +=  quantity;
		}
		
		return total;
	}
	
	public float getTotalAmount() {
		float total = 0.0f;
		
		Iterator<Picture> iterator = cart.keySet().iterator();
		
		while(iterator.hasNext()) {
			Picture picture = iterator.next();
			Integer quantity = cart.get(picture);
			double subTotal = quantity * picture.getPrice();
			total +=  subTotal;
		}
		
		return total;
	}
	
	public void updateCart(int[] pictureIds, int[] quantities) {
		for(int i=0; i< pictureIds.length;i++) {
			Picture key = new Picture(pictureIds[i]);
			Integer  value = quantities[i];
			cart.put(key, value);
			
		}
	}
	
	public void clear() {
		cart.clear();
	}
	
	public int getTotalItems() {
		return cart.size();
	}
	
	public Map<Picture, Integer> getItems(){
		return this.cart;
	}
}
