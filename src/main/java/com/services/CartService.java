package com.services;

import org.springframework.stereotype.Service;

import com.model.CartItem;

import java.util.Iterator;
import java.util.List;

@Service
public class CartService {

	public void incrementQuantity(List<CartItem> cart, int itemId) {
		for (CartItem item : cart) {
			if (item.getId() == itemId) {
				item.setQuantity(item.getQuantity() + 1);
				break;
			}
		}
	}

	public void decrementQuantity(List<CartItem> cart, int itemId) {
		Iterator<CartItem> iterator = cart.iterator();
		while (iterator.hasNext()) {
			CartItem item = iterator.next();
			if (item.getId() == itemId) {
				if (item.getQuantity() > 1) {
					item.setQuantity(item.getQuantity() - 1);
				} else {
					iterator.remove(); // Remove item if quantity is 1
				}
				break;
			}
		}
	}

	public void removeItem(List<CartItem> cart, int itemId) {
		cart.removeIf(item -> item.getId() == itemId);
	}
}
