package com.lyq.model.product;

import java.io.Serializable;
import java.util.Date;

import com.lyq.model.Sex;
/**
 * ��Ʒ��Ϣ
 * @author Li Yongqiang
 */
public class ProductInfo implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;// ��Ʒ���
	private String name;// ��Ʒ����
	private String description;// ��Ʒ˵��
	private Date createTime = new Date();// �ϼ�ʱ��
	private Float baseprice;// ��Ʒ�ɹ��۸�
	private Float marketprice;// �����г��۸�
	private Float sellprice;// �̳����ۼ۸�
	private Sex sexrequest;// �����Ա�
	private Boolean commend = false;// �Ƿ����Ƽ���Ʒ��Ĭ��ֵΪfalse��
	private Integer clickcount = 1;// ��������ͳ���ܻ�ӭ�ĳ̶ȣ�
	private Integer sellCount = 0;// ����������ͳ��������Ʒ��
	private ProductCategory category;// �������
	private UploadFile uploadFile;// �ϴ��ļ�
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Float getBaseprice() {
		return baseprice;
	}
	public void setBaseprice(Float baseprice) {
		this.baseprice = baseprice;
	}
	public Float getMarketprice() {
		return marketprice;
	}
	public void setMarketprice(Float marketprice) {
		this.marketprice = marketprice;
	}
	public Float getSellprice() {
		return sellprice;
	}
	public void setSellprice(Float sellprice) {
		this.sellprice = sellprice;
	}
	public Sex getSexrequest() {
		return sexrequest;
	}
	public void setSexrequest(Sex sexrequest) {
		this.sexrequest = sexrequest;
	}
	public Boolean getCommend() {
		return commend;
	}
	public void setCommend(Boolean commend) {
		this.commend = commend;
	}
	public Integer getClickcount() {
		return clickcount;
	}
	public void setClickcount(Integer clickcount) {
		this.clickcount = clickcount;
	}
	public Integer getSellCount() {
		return sellCount;
	}
	public void setSellCount(Integer sellCount) {
		this.sellCount = sellCount;
	}
	public ProductCategory getCategory() {
		return category;
	}
	public void setCategory(ProductCategory category) {
		this.category = category;
	}
	public UploadFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(UploadFile uploadFile) {
		this.uploadFile = uploadFile;
	}
}
