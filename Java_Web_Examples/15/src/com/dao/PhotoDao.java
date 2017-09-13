package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.toolsBean.Change;
import com.toolsBean.DB;
import com.valueBean.PhotoSingle;

public class PhotoDao extends SuperDao {
	/**
	 * @���ܣ���ȡ�ڸ�����ҳ��ʾ�������ϴ���ǰ4��ͼƬ
	 */
	public List getDefaultPhoto(int id) throws SQLException{
		String sql="select top 4 * from tb_photo where photo_whoId=? order by photo_uptime desc";
		Object[] params={id};		
		List list=getList(sql,params);
		List photolist=defaultDivide(list);
		return photolist;
	}
	/**
	 * @���ܣ���ȡ�ڽ��룢�ҵ���ᣢ���ڵ�ǰҳ��ʾ������ͼƬ
	 */
	public List getListPhoto(int id,String showPage,String goWhich) throws SQLException{
		List photolist=null;
		String sqlall="select * from tb_photo where photo_whoId=?";
		Object[] params={id};
		
		setPerR(12);
		createPage(sqlall,params,showPage,goWhich);

		int currentP=getPage().getCurrentP();
		int top1=getPage().getPerR();
		int top2=(currentP-1)*top1;
		String sql="";
		if(currentP<=1)
			sql="SELECT TOP "+top1+" * FROM tb_photo WHERE photo_whoId=? ORDER BY photo_uptime DESC";
		else
			sql="SELECT TOP "+top1+" * FROM tb_photo i WHERE (photo_whoId = ?) AND (photo_uptime < (SELECT MIN(photo_uptime) FROM (SELECT TOP "+top2+" * FROM tb_photo WHERE photo_whoId = i.photo_whoId ORDER BY photo_uptime DESC) AS minv)) ORDER BY photo_uptime DESC";
		List list=getList(sql,params);		
		photolist=divide(list);
		return photolist;			
	}
	/**
	 * @���ܣ���ȡͼƬ��ϸ��Ϣ
	 */	
	public PhotoSingle getSinglePhoto(int id) throws SQLException{
		String sql="select * from tb_photo where id=?";
		Object[] params={id};
		
		List list=getList(sql,params);
		if(list!=null)
			return (PhotoSingle)list.get(0);
		else
			return null;
	}	
	private List getList(String sql,Object[] params) throws SQLException{
		List list=null;
		DB mydb=new DB();
		mydb.doPstm(sql,params);
		ResultSet rs=mydb.getRs();
		if(rs!=null){
			list=new ArrayList();
			while(rs.next()){
				PhotoSingle single=new PhotoSingle();
				single.setId(rs.getInt(1));
				single.setPhotoWhoId(rs.getInt(2));
				single.setPhotoSrc(rs.getString(3));
				single.setPhotoInfo(rs.getString(4));
				single.setPhotoUptime(Change.dateTimeChange(rs.getTimestamp(5)));
				list.add(single);
			}
		}
		return list;
	}
	/**
	 *@���ܣ���list�д洢��12��Ԫ��(PhotoSingle����)����˳��ƽ���ֳ�3�ݣ�����ÿһ���е�Ԫ�ش洢��һ���½���List����(temp)�У����temp�洢��photolist�С�<br>
	 * 		������photolist�оʹ洢�ˣ���Ԫ�أ�ÿ��Ԫ��Ϊһ��List���ϣ�ÿ�������д洢�ˣ���PhotoSingle����ת��Ϊphotolist����һ�����ϣ�������JSPҳ����ͨ������forEachѭ��������ǩ����3��4�еĸ�ʽ���ͼƬ
	 */
	private List divide(List list){
		List photolist=null;
		if(list!=null){
			photolist=new ArrayList();
			/* �����Ȳ��볤�� */
			int blank=12-list.size();			//��Ϊÿҳ��ʾ12����¼������list�ĳ���ֻ�ܵ���12��С��12
			if(blank>0){						//��list�ĳ���С��12������list�д��blank��nullֵ����list���Ȳ��뵽12
				for(int i=0;i<blank;i++)
					list.add(null);
			}			
			/* ��Ȼ����л��� */
			for(int i=0;i<3;i++){				//ƽ���ֳ�3��
				List temp=new ArrayList();
				for(int j=0;j<4;j++){			//��ÿ���е�Ԫ�ش洢��temp��
					temp.add(list.get(4*i+j));
				}
				photolist.add(temp);			//�洢temp��photolist��
			}			
		}
		return photolist;
	}
	private List defaultDivide(List list){
		if(list!=null){
			int blank=4-list.size();			//��ΪҪ��ֻ��ʾ4����¼������list�ĳ���ֻ�ܵ���4��С��4
			if(blank>0){						//��list�ĳ���С��4������list�д��blank��nullֵ����list���Ȳ��뵽4
				for(int i=0;i<blank;i++)
					list.add(null);
			}					
		}
		return list;
	}
	/**
	 * @���ܣ�ɾ��ͼƬ
	 * @throws SQLException
	 */
	public int delete(int id) throws SQLException{
		String sql="delete from tb_photo where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
	/**
	 * @���ܣ��ϴ�ͼƬ
	 * @throws SQLException
	 */
	public int upLoad(Object[] params) throws SQLException{
		String sql="insert into tb_photo values(?,?,?,?)";
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		int i=mydb.getCount();
		return i;
	}
}
