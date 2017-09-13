package com.wy.tools;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.ImageIcon;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import java.io.FileOutputStream;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageUtils {

	public static boolean createMark(String filePath, String printPath,
			String markContent) {
		ImageIcon imgIcon = new ImageIcon(filePath);
		Image theImg = imgIcon.getImage();
		int width = theImg.getWidth(null);
		int height = theImg.getHeight(null);
		BufferedImage bimage = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D g = bimage.createGraphics();
		g.setColor(Color.red);
		g.drawImage(theImg, 0, 0, null);
		Font font = new Font(markContent, Font.BOLD, 200);
		g.setFont(font);
		g.setComposite(AlphaComposite
				.getInstance(AlphaComposite.SRC_OVER, 0.5f));// 10%͸��
		g.rotate(0.3f); // ���ֵ���ת�Ƕ�
		g.drawString(markContent, width / 3, height / 3);// ����ˮӡ��λ��
		g.dispose();
		try {
			FileOutputStream out = new FileOutputStream(printPath);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bimage);
			param.setQuality(100f, true);
			encoder.encode(bimage, param);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static void createSmallPhoto(String photoPath, String smallPath) {
		File _file = new File(photoPath); // �����ļ�
		Image src;
		try {
			src = javax.imageio.ImageIO.read(_file);
			int wideth = 110; // �õ�Դͼ��
			int height = 80; // �õ�Դͼ��
			BufferedImage tag = new BufferedImage(wideth, height,
					BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(src, 0, 0, wideth, height, null); // ������С���ͼ
			FileOutputStream out = new FileOutputStream(smallPath); // ������ļ���
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(tag); // ��JPEG����
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
