package com.ecopic.control.frontend.shoppingcart;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;

import com.ecopic.entity.Picture;

public class ShoppingCartTest {
	private static ShoppingCart cart;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception{
		cart = new ShoppingCart();
		Picture picture = new Picture(2);
		picture.setPrice(10);
		cart.addItem(picture);
		cart.addItem(picture);
	}
	
	@Test
	public void testAddItem() {
		
		Map<Picture, Integer> items = cart.getItems();
		int quantity = items.get( new Picture(2));
		
		assertEquals(2, quantity);
	
	}
	
	@Test
	public void testRemoveItem() {
		cart.removeItem(new Picture(2));
		
		assertTrue(cart.getItems().isEmpty());
	}

	@Test
	public void testRemoveItem2() {
		Picture picture2 = new Picture(2);
		cart.addItem(picture2);
		cart.removeItem(new Picture(2));
		
		assertNull(cart.getItems().get(picture2));
	}
	
	@Test
	public void testGetTotalQuantity() {
		Picture picture3 = new Picture(3);
		cart.addItem(picture3);
		cart.addItem(picture3);
		cart.addItem(picture3);
		int totalQuantity = cart.getTotalQuantity();
		
		assertEquals(5, totalQuantity);
	}
	
	@Test
	public void testGetTotalAmount() {
		ShoppingCart cart = new ShoppingCart();
		assertEquals(0.0f, cart.getTotalAmount(),0.0f);
	}
	
	@Test
	public void testGetTotalAmount2() {
		assertEquals(20.0f, cart.getTotalAmount(),0.0f);
	}
	
	@Test
	public void testClear() {
		cart.clear();
		int totalQuantity = cart.getTotalQuantity();
		assertEquals(0, totalQuantity);
	}
	
	@Test
	public void testUpdateCart() {
		ShoppingCart cart = new ShoppingCart();
		Picture picture1 = new Picture(2);
		Picture picture2 = new Picture(3);

		cart.addItem(picture1);
		cart.addItem(picture2);
		
		int[] pictureIds = {2,3};
		int[] quantities = {3, 4};
		
		cart.updateCart(pictureIds, quantities);
		
		assertEquals(7, cart.getTotalQuantity());
	}
}
