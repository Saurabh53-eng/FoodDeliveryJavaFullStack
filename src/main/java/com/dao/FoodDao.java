package com.dao;

import java.util.List;

import com.model.FoodModel;

public interface FoodDao {
	public String addFood(FoodModel fm);

	public List<FoodModel> getFoodById(int fid);

	public void update(FoodModel fm);

	public void deleteFoodById(int fid);

	public FoodModel GetFoodById(int fid);

	public List<FoodModel> getAllFoods();
}
