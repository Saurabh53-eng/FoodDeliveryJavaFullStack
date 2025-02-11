package com.services;

import java.util.List;

import com.model.FoodModel;

public interface FoodServices {
	public String addFood(FoodModel fm);

	public List<FoodModel> getAllFoods();

	public void update(FoodModel fm);

	public FoodModel GetFoodById(int fid);

	public void deleteFoodById(int fid);

	public List<FoodModel> getFoodById(int fid);
}
