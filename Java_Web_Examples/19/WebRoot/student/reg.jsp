<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.bwm.page.Show"%>
<%@ page import="com.bwm.db.Data"%>
<%@ page import="com.bwm.string.Str"%> 
<%request.setCharacterEncoding("GB2312");%>
<jsp:useBean id="student" class="job.Student" scope="request" />
<jsp:setProperty name="student" property="*"/>
<%
Str str=new Str();
Show show=new Show();
student.setBirthday(str.dbEncode(student.getBirthday()));
student.setEmail(str.dbEncode(student.getEmail()));
student.setKnowledge(str.dbEncode(student.getKnowledge()));
student.setName(str.dbEncode(student.getName()));
student.setPassword(str.dbEncode(student.getPassword()));
student.setResume(str.dbEncode(student.getResume()));
student.setSchool(str.dbEncode(student.getSchool()));
student.setSname(str.dbEncode(student.getSname()));
student.setSpecialty(str.dbEncode(student.getSpecialty()));
if(student.getSname().equals("")||student.getName().equals("")||student.getPassword().equals("")||student.getEmail().equals("")||student.getBirthday().equals("")){
        out.print(show.errorBox("����д������Ϣ��","������Ϣ"));
        return;
}else{
        if(student.getSname().compareTo("z")>=0||student.getSname().compareTo("0")<=0){
                out.print(show.errorBox("ע���û���������Ϊ�����ַ��ͺ��֣�","������Ϣ"));
                return;
        }
        int intT=0;
        Data data=new Data();
        intT=data.getRowCount("tb_student WHERE sname='"+student.getSname()+"'");
        if(intT>0){
            out.print(show.errorBox("���û����ѱ�ע�ᣡ","ע����Ϣ"));
            return;
        }else{
            intT=data.insert("INSERT INTO tb_student(sname,password,name,age,sex,birthday,school,specialty,knowledge,email,resume) VALUES('"+
                student.getSname()+"','"+student.getPassword()+"','"+student.getName()+"','"+student.getAge()+"','"+
                student.getSex()+"','"+student.getBirthday()+"','"+student.getSchool()+"','"+student.getSpecialty()+"','"+
                student.getKnowledge()+"','"+student.getEmail()+"','"+student.getResume()+"')");
            if(intT<=0){
                        out.print(show.errorBox("ע��ʧ�ܣ����ݿ����!","������Ϣ"));
                        return;
            }else{
                        out.print("<script>alert('ע��ɹ���');document.location='../';</script>");
            }
        }
}
%>
