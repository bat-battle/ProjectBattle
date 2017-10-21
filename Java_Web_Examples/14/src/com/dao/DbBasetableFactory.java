package com.dao;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.model.*;
import com.core.BasetableFactory;
import com.core.Database;
import com.core.FileUtils;
import com.core.FinalConstants;
import com.jspsmart.upload.Request;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: MR</p>
 * @version 1.0
 * ���幤��
 */

public class DbBasetableFactory extends BasetableFactory {
    public DbBasetableFactory() {//���췽��
    }
    //��ȡ��¼����
    public int getRow(String sql) {
        return Database.getRow(sql);
    }
//�����û�
    public boolean CreateUser(HttpServletRequest request) {
        return (new Dbuser(request)).Insert();
    }
//��ȡ�û���Ϣ
    public User SearchUser(String sql) {
        return new Dbuser(sql);
    }
//��ѯ�û���Ϣ�б�
    public Collection ListUser(int page, String sql) {
        return new Dbuser().Select(page, sql);
    }
//��ѯͷ���б�
    public Collection ListHead(int page, String sql) {
        return new Dbhead().Select(page, sql);
    }
//��ȡͷ����Ϣ
    public Head SearchHead(String sql) {
        return new Dbhead(sql);
    }
//���ͷ����Ϣ
    public boolean CreateHead(String iid, String path, int state) {
        return new Dbhead(iid, path, state).Insert();
    }
//��ѯ������Ϣ�б�
    public Collection ListAffiche(int page, String sql) {
        return new Dbaffiche().Select(page, sql);
    }
    public Collection ListAffiche(String sql) {
        return new Dbaffiche().Select(sql);
    }
//��ӹ�����Ϣ
    public boolean CreateAffiche(HttpServletRequest request) {
        return new Dbaffiche(request).Insert();
    }
//��ȡ������Ϣ
    public Affiche SearchAffiche(String sql) {
        return new Dbaffiche(sql);
    }
//ɾ��������Ϣ
    public boolean DeleteAffiche(String sql) {
        return Database.Delete(FinalConstants.DELETE_AFFICHE + sql);
    }
//��ѯ�����б�
    public Collection ListNew(int page, String sql) {
        return new Dbnew().Select(page, sql);
    }
//��ȡ������Ϣ
    public New SearchNew(String sql) {
        return new Dbnew(sql);
    }
    //���������Ϣ
    public boolean CreateNew(HttpServletRequest request) {
        return new Dbnew(request).Insert();
    }
    //ɾ��������Ϣ
    public boolean DeleteNew(String sql) {
        return Database.Delete(FinalConstants.DELETE_NEW + sql);
    }
    //��ѯ����������Ϣ�б�
    public Collection ListLink(int page, String sql) {
        return new Dblink().Select(page, sql);
    }
    //��ȡ����������Ϣ
    public Link SearchLink(String sql) {
        return new Dblink(sql);
    }
    //�������������Ϣ
    public boolean CreateLink(HttpServletRequest request) {
        return new Dblink(request).Insert();
    }
    //ɾ������������Ϣ
    public boolean DeleteLink(String sql) {
        return Database.Delete(FinalConstants.DELETE_LINK + sql);
    }
    //��ѯ��������Ϣ�б�
    public Collection ListSsort(int page, String sql) {
        return new Dbssort().Select(page, sql);
    }
    //��ȡ��������Ϣ
    public Ssort SearchSsort(String sql) {
        return new Dbssort(sql);
    }
    //�����������Ϣ
    public boolean CreateSsort(HttpServletRequest request) {
        return new Dbssort(request).Insert();
    }
    //ɾ����������Ϣ
    public boolean DeleteSsort(String sql) {
        return Database.Delete(FinalConstants.DELETE_SSORT + sql);
    }
    //��ѯ�����Դ��Ϣ�б�
    public Collection ListSoft(int page, String sql) {
        return new Dbsoft().Select(page, sql);
    }
    //��ȡ�����Դ��Ϣ�б�
    public Soft SearchSoft(String sql) {
        return new Dbsoft(sql);
    }
    //��������Դ��Ϣ�б�
    public boolean CreateSoft(Request request, String path) {
        return new Dbsoft(request, path).Insert();
    }
    //ɾ�������Դ��Ϣ�б�
    public boolean DeleteSoft(HttpServletRequest request,String sql) {
        if (!FileUtils.FileDel(request, "upload\\"+SearchSoft(sql).getPath())) {
            System.out.println("�ļ�ɾ��ʧ��");  //ɾ���ϴ����ļ�
        }
        if (Database.Delete(FinalConstants.DELETE_SOFT + sql)) {
            return true;
        }
        return false;
    }
    //��ȡ��������Ϣ
    public Collection ListSsort(String sql) {
        return new Dbssort().Select(sql);
    }
    //��ȡ���������Ϣ
    public Resolvent SearchResolvent(String sql) {
        return new Dbresolvent(sql);
    }
    //��ӽ��������Ϣ
    public boolean CreateResolvent(Request request, String iid) {
        return new Dbresolvent(request, iid).Insert();
    }
    //ɾ�����������Ϣ
    public boolean DeleteResolvent(String sql) {
        return Database.Delete(FinalConstants.DELETE_RESOLVENT + sql);
    }
    //��ѯ�����Դ��Ϣ�б�
    public Collection ListSoft(String sql) {
        return new Dbsoft().Select(sql);
    }
    //��ѯ���������Ϣ�б�
    public Collection ListResolvent(String sql) {
        return new Dbresolvent().Select(sql);
    }
    //��ѯ���������Ϣ�б�������ҳ��
    public Collection ListResolvent(int page, String sql) {
        return new Dbresolvent().Select(page, sql);
    }
    //��ѯ���������б�������ҳ��
    public Collection ListQuestion(int page, String sql) {
        return new Dbquestion().Select(page, sql);
    }
    //��ȡ����������Ϣ
    public Question SearchQuestion(String sql) {
        return new Dbquestion(sql);
    }

    public boolean CreateQuestion(HttpServletRequest request) {
        return new Dbquestion(request).Insert();
    }

    public boolean DeleteQuestion(String sql) {
        return Database.Delete(FinalConstants.DELETE_QUESTION + sql);
    }

    public Collection ListNew(String sql) {
        return new Dbnew().Select(sql);
    }

    public Collection ListQuestion(String sql) {
        return new Dbquestion().Select(sql);
    }

    public Collection ListGuestboard(int page, String sql) {
        return new Dbguestboard().Select(page, sql);
    }

    public Collection ListGuestboard(String sql) {
        return new Dbguestboard().Select(sql);
    }
    //��ȡ���Բ���Ϣ
    public Guestboard SearchGuestboard(String sql) {
        return new Dbguestboard(sql);
    }

    public boolean CreateGuestboard(HttpServletRequest request) {
        return new Dbguestboard(request).Insert();
    }

    public boolean DeleteGuestboard(String sql) {
        return Database.Delete(FinalConstants.DELETE_GUESTBOARD + sql);
    }

    public Collection ListMend(int page, String sql) {
        return new Dbmend().Select(page, sql);
    }

    public Collection ListMend(String sql) {
        return new Dbmend().Select(sql);
    }
    //��ȡ���߲���������Ϣ
    public Mend SearchMend(String sql) {
        return new Dbmend(sql);
    }

    public boolean CreateMend(Request request, String path) {
        return new Dbmend(request, path).Insert();
    }

    public boolean DeleteMend(HttpServletRequest request,String sql) {
        if (!FileUtils.FileDel(request, "upload"+SearchMend(sql).getPath())) {
            System.out.println("����/����ɾ��ʧ��");
        }
        return Database.Delete(FinalConstants.DELETE_MEND + sql);
    }

    public boolean DeleteHead(HttpServletRequest request, String sql) {
        if (!FileUtils.FileDel(request, SearchHead(sql).getPath())) {
            System.out.println("ͼƬɾ��ʧ��");
        }
        if (Database.Delete(FinalConstants.DELETE_HEAD + sql)) {
            return true;
        }
        return false;
    }
}
