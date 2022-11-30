package com.ecopic.dao;

import java.util.List;

import com.ecopic.entity.Category;

public class CategoryDAO extends JpaDAO<Category> implements GenericDAO<Category> {

	public CategoryDAO() {
	}

	@Override
	public Category create(Category t) {
		return super.create(t);
	}

	@Override
	public Category update(Category t) {
		// TODO Auto-generated method stub
		return super.update(t);
	}

	@Override
	public Category get(Object id) {
		return super.find(Category.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Category.class, id);
	}

	@Override
	public List<Category> listAll() {
		return super.findWithNamedQuery("Category.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Category.countAll");
	}
	
	public Category findByName(String catName) {
		List<Category> listResult = super.findWithNamedQuery("Category.findByName","name", catName);
		
		if (listResult != null && listResult.size() > 0) {
			return listResult.get(0);
		}
		return null;
	}

}
