package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.FoodDao;
import com.model.FoodModel;

@Service
public class FoodServiceImpl implements FoodServices {
	@Autowired
	FoodDao fdao;

	@Transactional
	public String addFood(FoodModel fm) {
		// TODO Auto-generated method stub
		return fdao.addFood(fm);
	}

	@Transactional
	public List<FoodModel> getAllFoods() {
		// TODO Auto-generated method stub
		return fdao.getAllFoods();
	}

	@Transactional
	public List<FoodModel> getFoodById(int fid) {
		// TODO Auto-generated method stub
		return fdao.getFoodById(fid);
	}

	@Transactional
	public void update(FoodModel fm) {
		// TODO Auto-generated method stub
		fdao.update(fm);
	}

	@Transactional
	public FoodModel GetFoodById(int fid) {
		// TODO Auto-generated method stub
		return fdao.GetFoodById(fid);
	}

	@Transactional
	public void deleteFoodById(int fid) {
		// TODO Auto-generated method stub
		fdao.deleteFoodById(fid);
	}

}
