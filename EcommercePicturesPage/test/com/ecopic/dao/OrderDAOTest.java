package com.ecopic.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.ecopic.entity.Customer;
import com.ecopic.entity.OrderDetail;
import com.ecopic.entity.OrderDetailId;
import com.ecopic.entity.Picture;
import com.ecopic.entity.PictureOrder;

public class OrderDAOTest {
	
	private static OrderDAO orderDAO;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}
	
	@Test
	public void testCreatePictureOrder2() {
		PictureOrder order = new PictureOrder();
		Customer customer = new Customer();
		customer.setCustomerId(21);
		
		order.setCustomer(customer);
		order.setRecipientName("Bao Long");
		order.setRecipientPhone("1234567890");
		order.setShippingAddress("261/15/47 Dinh Phong Phu");
		
		Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
		OrderDetail orderDetail1 = new OrderDetail();
		
		Picture picture1 = new Picture(3);
		orderDetail1.setPicture(picture1);
		orderDetail1.setQuantity(2);
		orderDetail1.setSubtotal(2.0f);
		orderDetail1.setPictureOrder(order);
		
		orderDetails.add(orderDetail1);
		
		OrderDetail orderDetail2 = new OrderDetail();
		Picture picture2 = new Picture(5);
		orderDetail2.setPicture(picture2);
		orderDetail2.setQuantity(1);
		orderDetail2.setSubtotal(1.0f);
		orderDetail2.setPictureOrder(order);
		
		orderDetails.add(orderDetail2);
		
		order.setOrderDetails(orderDetails);
		
		orderDAO.create(order);
		
		assertTrue(order.getOrderId() >0 && order.getOrderDetails().size() == 2);
	}

	@Test
	public void testCreatePictureOrder() {
		PictureOrder order = new PictureOrder();
		Customer customer = new Customer();
		customer.setCustomerId(13);
		
		order.setCustomer(customer);
		order.setRecipientName("Bao Long");
		order.setRecipientPhone("1234567890");
		order.setShippingAddress("261/15/47 Dinh Phong Phu");
		
		Set<OrderDetail> orderDetails = new HashSet<OrderDetail>();
		OrderDetail orderDetail = new OrderDetail();
		
		Picture picture = new Picture(2);
		orderDetail.setPicture(picture);
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(41.5f);
		orderDetail.setPictureOrder(order);
		
		orderDetails.add(orderDetail);
		
		order.setOrderDetails(orderDetails);
		
		orderDAO.create(order);
		
		assertTrue(order.getOrderId() >0);
	}

	@Test
	public void testUpdatePictureOrderShippingAddress() {
		Integer orderId = 3;
		PictureOrder order = orderDAO.get(orderId);
		order.setShippingAddress("New Shipping Address");
		
		orderDAO.update(order);
		
		PictureOrder updatedOrder = orderDAO.get(orderId);
		
		assertEquals(order.getShippingAddress(), updatedOrder.getShippingAddress());
	}
	
	@Test
	public void testUpdatePictureOrderDetail() {
		Integer orderId = 4;
		PictureOrder order = orderDAO.get(orderId);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
		while(iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getPicture().getPictureId() == 5 ) {
				orderDetail.setQuantity(3);
				orderDetail.setSubtotal(3f);
			}
		}
		
		orderDAO.update(order);
		
		PictureOrder updatedOrder = orderDAO.get(orderId);
		
		iterator = order.getOrderDetails().iterator();
		
		int expectedQuantity = 3;
		float expectedSubtotal = 3f;
		int actualQuantity = 0;
		float actualSubtotal = 0;
		
		while(iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getPicture().getPictureId() == 5 ) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal, 0.0f);
	}

	@Test
	public void testGet() {
		Integer orderId = 3;
		PictureOrder order = orderDAO.get(orderId);
		
		assertEquals(1, order.getOrderDetails().size());
	}

	@Test
	public void testDeleteObject() {
		int orderId =3;
		orderDAO.delete(orderId);
		
		PictureOrder order = orderDAO.get(orderId);
		
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<PictureOrder> lisOrders = orderDAO.listAll();
		
		assertTrue(lisOrders.size()>0);
	}

	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		
		assertEquals(2,	 totalOrders);
	}

}
