package com.ecopic.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ecopic.entity.Picture;

public class PictureDAO extends JpaDAO<Picture> implements GenericDAO<Picture> {

	public PictureDAO() {
	}

	@Override
	public Picture create(Picture t) {
		t.setLastUpdateTime(new Date());
		return super.create(t);
	}

	@Override
	public Picture update(Picture t) {
		t.setLastUpdateTime(new Date());
		return super.update(t);
	}

	@Override
	public Picture get(Object id) {
		return super.find(Picture.class, id);
	}

	@Override
	public void delete(Object id) {
		super.delete(Picture.class	, id);
	}

	@Override
	public List<Picture> listAll() {
		return super.findWithNamedQuery("Picture.findAll");
	}
	
	public Picture findByTitle(String title) {
		List<Picture> result = super.findWithNamedQuery("Picture.findByTitle","title",title);
		
		if( !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public List<Picture> listByCategory(int categoryId, int step, int current){
		
		List<Picture> findWithNamedQuery = super.findWithNamedQuery("Picture.findByCategory","catId",categoryId,current-step,current);
		
		return findWithNamedQuery;
	}
	
	public List<Picture> search(String keyword){
		return super.findWithNamedQuery("Picture.search","keyword",keyword);
	}
	
	public List<Picture> listNewPictures(){
		return super.findWithNamedQuery("Picture.listNew", 0, 8);
	}
	
	public List<Picture> listOffsetPictures(int step, int current){
		return super.findWithNamedQuery("Picture.findAll", current-step , current);
	}
	
	@Override
	public long count() {
		return super.countWithNamedQuery("Picture.countAll");
	}
	
	public long countByCategory(int categoryId) {
		return super.countWithNamedQuery("Picture.countByCategory","catId",categoryId);
	}
	
	public List<Picture> listBestSellingPictures(){
		return super.findWithNamedQuery("OrderDetail.bestSelling", 0, 4);
	}
	
	public List<Picture> listMostFavoredPictures(){
		List<Picture> mostFavoredPictures = new ArrayList<Picture>();
		List<Object[]> result = super.findWithNamedQueryObject("Review.mostFavoredPictures", 0, 4);
		
		if(!result.isEmpty()) {
			for(Object[] element : result) {
				Picture picture = (Picture) element[0];
				mostFavoredPictures.add(picture);
			}
		}
		
		return mostFavoredPictures;
	}
}
