package com.util;

import java.io.File;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

@Component("wordToHtml")
public class WordToHtml {

	//��ָ��Ŀ¼�����ָ��doc�ļ�ת��ΪHTML���洢��savepathsĿ¼��
	public  void change(String filepaths, String savepaths) {
	File f = new File(filepaths);
	String filename = f.getName();
	String filetype=filename.substring(filename.indexOf(".")+1);// ȡ���ļ���չ��
	if (filetype.equals("doc") || filetype.equals("docx")) {// �ж��Ƿ�Ϊdoc�ļ�
	System.out.println("��ǰ����ת��......");
	// ��ӡ��ǰĿ¼·��
	System.out.println(filepaths);
	ActiveXComponent app = new ActiveXComponent("Word.Application");// ����word
	String docpath = filepaths;
	String htmlpath = savepaths + filename.substring(0, (filename.indexOf(".")));
	String inFile = docpath;
	// Ҫת����word�ļ�
	String tpFile = htmlpath;
	// HTML�ļ�
	boolean flag = false;
	try {
	app.setProperty("Visible", new Variant(false));// ����word���ɼ�
	Object docs = app.getProperty("Documents").toDispatch();
	
	Object doc = Dispatch.invoke(docs,"Open",Dispatch.Method,new Object[] { inFile, new Variant(false),new Variant(true) },
	new int[1]).toDispatch();// ��word�ļ�
	/*
	* new Variant(10)ɸѡ������ҳ
	* new Variant(9) �����ļ���ҳ
	* new Variant(8) ���Ϊ��ҳ
	* new Variant(7) ���Ϊtxt��ʽ
	* new Variant(6) ���Ϊrtf��ʽ
	* new Variant(0) ���Ϊdoc��ʽ
	*/
	Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {tpFile, new Variant(10) }, new int[1]);// ��Ϊhtml��ʽ���浽��ʱ�ļ�
	Variant fl = new Variant(false);
	Dispatch.call(doc, "Close", fl);
	flag = true;
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	app.invoke("Quit", new Variant[] {});
	}
	System.out.println("ת����ϣ�");
	}
	}
	
	public static void main(String[] args) {
	//ת��Ŀ¼�µ�����doc�ļ�
	// String paths = new String("D://test//");
	String savepaths = new String("e://test//");
	// changeAll(paths, savepaths);
	//
	//ת��ָ��doc�ļ�
	String filepaths = "e://test//a.doc";
	WordToHtml wth=new WordToHtml();
	wth.change(filepaths, savepaths);
	}
}
