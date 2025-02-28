package com.hari.daoimplementaion;

import java.util.HashMap;
import java.util.Map;

import com.hari.model.CartItem;


public class CartItemDaoImplementation {

	// cart items stored as a map of items <id's ,CartItem> objects
	private static  Map<Integer, CartItem> items;

	public CartItemDaoImplementation() {
		if(items==null) {
			items = new HashMap<>();
		}
	}

	// Add an item to the cart and return

	//item is nothing but menu(item)when it is in restaurant but in cart it is item
	public Map<Integer, CartItem> addItem(CartItem item) {
		int itemId = item.getItemId();
		if (items.containsKey(itemId)) {
			// if item is already presents ,increase the quantity
			CartItem existingItem = items.get(itemId);
			// increase the quantity by (take the value of quantity inside map) + current
			// adding item quantity
			existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
			;
		} else {
			// else put the item id and CartItem object item
			items.put(itemId, item);
		}
		return items;
	}

	public Map<Integer, CartItem> updateItem(int itemId, int quantity) {
		System.out.println("items "+items);
	    if (items.containsKey(itemId)) {
	        CartItem item = items.get(itemId);
	        item.setQuantity(quantity);  // Update the quantity
	        items.put(itemId, item);     // Ensure the updated item is placed back into the map
	        System.out.println("Updated CartItem: " + item);  // Log the updated item for debugging
	    } else {
	        System.out.println("Item not found in the cart.");
	    }
	    return items;
	}


	// Remove an item from the cart
	public Map<Integer, CartItem> removeItem(int itemId) {
		items.remove(itemId);
		return items;
	}

	// Clear all items from the cart
	public void clearAllItems() {
		items.clear();
	}

}


//
