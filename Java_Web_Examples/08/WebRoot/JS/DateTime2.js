// ��ʾ���ں�ʱ��-------NQ
function ShowDate(Elements)
{
		var temp; 
		var datetime = new Date();
		var year = datetime.getYear();
		var month = datetime.getMonth() + 1;
		var date = datetime.getDate();
		var day = datetime.getDay();
		temp = year+"��"+month+"��"+date+"�� ";
		switch (day)
		{
			case 0:
				temp = temp+"������";
				break;
			case 1:
				temp = temp+"����һ";
				break;
			case 2:
				temp = temp+"���ڶ�";
				break;
			case 3:
				temp = temp+"������";
				break;
			case 4:
				temp = temp+"������";
				break;
			case 5:
				temp = temp+"������";
				break;
			case 6:
				temp = temp+"������";
				break;
		}
		Elements.innerHTML = temp;
}
function ShowTime(Elements)
{
		var temp = "";
		var datetime = new Date();
		var hour = datetime.getHours();
		var minu = datetime.getMinutes();
		var seco = datetime.getSeconds();
		if(hour < 10)
		hour ="0" + hour;
		if(minu < 10)
		minu ="0" + minu;
		if(seco < 10)
		seco ="0" + seco;
		temp = temp+" "+hour+":"+minu+":"+seco+" ";
		if(hour >= 0 && hour < 5)
		temp = temp + "�㳿��"
		if(hour >= 5  && hour < 8)
		temp = temp + "���Ϻ�"
		if(hour >= 8  && hour < 11)
		temp = temp + "�����"
		if(hour >= 11  && hour < 13)
		temp = temp + "�����"
		if(hour >= 13  && hour < 17)
		temp = temp + "�����"
		if(hour >= 17  && hour < 24)
		temp = temp + "���Ϻ�"
		Elements.innerHTML = temp;   //���Elements����(���)��id
		window.setTimeout("ShowTime(" + Elements.id + ")",1000)   //����Elements.name��Elements.id����Elements
		
}
