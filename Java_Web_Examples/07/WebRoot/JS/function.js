//�ж�����������Ƿ���ȷ
function CheckDate(INDate) {
	if (INDate == "") // �����������Ϊ��
	{
		return true;
	}
	subYY = INDate.substr(0, 4) // ��ȡ�������ڵ�ǰ4λ
	if (isNaN(subYY) || subYY <= 0) { // �������Ĳ������ֻ����Ǹ���
		return true;
	}
	// ת���·ݣ����������ֵĵ�0λ��ʼ���ң��ж��Ƿ����ַ���"-"������н�separate��ֵ����Ϊ"-"
	if (INDate.indexOf('-', 0) != -1) {
		separate = "-"
	} else {
		if (INDate.indexOf('/', 0) != -1) {
			separate = "/"
		}// ���û���ַ���"-"����ô��separate��ֵ����Ϊ"/"
		else {
			return true;
		}// ����������߾���ѯ�������򷵻�true
	}
	area = INDate.indexOf(separate, 0)// ���ַ����ĵ�һ��λ�ÿ�ʼ���ң������ض��ַ���λ��
	subMM = INDate.substr(area + 1, INDate.indexOf(separate, area + 1)
			- (area + 1))
	if (isNaN(subMM) || subMM <= 0) {
		return true;
	}
	if (subMM.length < 2) {
		subMM = "0" + subMM
	}// ����·�ֻ��1λ����ô������ǰ���"0"
	// ת����
	area = INDate.lastIndexOf(separate)// ���ַ��������һλ��ʼ���ң������ض��ַ���λ��
	subDD = INDate.substr(area + 1, INDate.length - area - 1)
	if (isNaN(subDD) || subDD <= 0) {
		return true;
	}
	if (eval(subDD) < 10) {
		subDD = "0" + eval(subDD)
	} // ����Ϊ���ֱ��ʽ���ַ�����ֵ
	NewDate = subYY + "-" + subMM + "-" + subDD
	if (NewDate.length != 10) {
		return true;
	} // ����������ڵĳ���С��10
	if (NewDate.substr(4, 1) != "-") {
		return true;
	} // ����������ڵĵ�5λ����"-"
	if (NewDate.substr(7, 1) != "-") {
		return true;
	} // ����������ڵĵ�8λ����"-"
	var MM = NewDate.substr(5, 2); // �ӵ�5λ��ʼ��ȡ�ַ�������ȡ2Ϊ��������·�
	var DD = NewDate.substr(8, 2); // �ӵ�8λ��ʼ��ȡ�ַ�������ȡ2Ϊ���������
	// �ж��Ƿ�Ϊ���꣨�ܱ�4�������Ҳ��ܱ�100��������ֻ�ܱ�400��������ݾ�Ϊ���꣩
	if ((subYY % 4 == 0 && subYY % 100 != 0) || subYY % 400 == 0) { // �ж��Ƿ�Ϊ����
		if (parseInt(MM) == 2) { // ��MMת��Ϊ����
			if (DD > 29) {
				return true;
			}
		}
	} else {
		if (parseInt(MM) == 2) {
			if (DD > 28) {
				return true;
			}
		}
	}
	var mm = new Array(1, 3, 5, 7, 8, 10, 12); // �ж�ÿ���е��������
	for (i = 0; i < mm.length; i++) {
		if (parseInt(MM, 10) == mm[i]) { // �ж��·��Ƿ�Ϊ�����е�ֵ
			if (parseInt(DD) > 31) {
				return true;
			} else {
				return false;
			}
		}
	}
	if (parseInt(DD) > 30) {
		return true;
	}
	if (parseInt(MM) > 12) {
		return true;
	}// ����·ݴ���12
	return false; // �����������������򷵻�false
}
