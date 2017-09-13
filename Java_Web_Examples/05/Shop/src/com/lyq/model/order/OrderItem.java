package com.lyq.model.order;

import java.io.Serializable;
/**
 * �����е���Ʒ��Ŀ
 * @author Li Yongqiang
 */
public class OrderItem implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;// ��Ʒ��Ŀ���
	private Integer productId;// ��Ʒid
	private String productName;// ��Ʒ����
	private Float productMarketprice;// �г��۸�
	private Float productPrice;// ��Ʒ���ۼ۸�
	private Integer amount=1;// ��������
	private Order order;// ��������
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Float getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Float productPrice) {
		this.productPrice = productPrice;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Float getProductMarketprice() {
		return productMarketprice;
	}
	public void setProductMarketprice(Float productMarketprice) {
		this.productMarketprice = productMarketprice;
	}
}
