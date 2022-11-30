package com.ecopic.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ecopic.entity.PictureOrder;

public class OrderDAO extends JpaDAO<PictureOrder> implements GenericDAO<PictureOrder> {

	@Override
	public PictureOrder create(PictureOrder order) {
		order.setOrderDate(new Date());
		order.setStatus("Processing");
		return super.create(order);
	}

	@Override
	public PictureOrder update(PictureOrder t) {
		return super.update(t);
	}

	@Override
	public PictureOrder get(Object id) {
		return super.find(PictureOrder.class,id);
	}
	
	public PictureOrder get(Integer orderId, Integer customerId) {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("orderId", orderId);
		parameters.put("customerId", customerId);
		List<PictureOrder> result = super.findWithNamedQuery("PictureOrder.findByIdAndCustomer", parameters);
		
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public void delete(Object id) {
		super.delete(PictureOrder.class, id);
	}

	@Override
	public List<PictureOrder> listAll() {
		return super.findWithNamedQuery("PictureOrder.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("PictureOrder.countAll");
	}
	
	public List<PictureOrder> listByCustomer(Integer customerId){
		return super.findWithNamedQuery("PictureOrder.findByCustomer", 
				"customerId", customerId);
	}
	
	public List<PictureOrder> listMostRecentSales(){
		return super.findWithNamedQuery("PictureOrder.findAll", 0, 3);
	}
	
}
