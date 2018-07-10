package test;

import java.io.*;
import java.util.Date;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FileUploadAction extends ActionSupport {
	private static final long serialVersionUID = 572146812454l;
	private static final int BUFFER_SIZE = 16 * 1024;
	// ע�⣬�ļ��ϴ�ʱ<s:file/>ͬʱ��myFile��myFileContentType,myFileFileName��
	// ����ͬʱҪ�ṩmyFileContentType,myFileFileName��set����
	private File myFile; // �ϴ��ļ�
	private String contentType;// �ϴ��ļ�����
	private String fileName; // �ϴ��ļ���
	private String imageFileName;
	private String caption;// �ļ�˵������ҳ�����԰�

	public void setMyFileContentType(String contentType) {
		this.contentType = contentType;
	}

	public void setMyFileFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	@Override
	public String execute() {
		imageFileName = new Date().getTime() + getExtention(fileName);
		File imageFile = new File(ServletActionContext.getServletContext()
				.getRealPath("tongxunlu/UploadImages") + "/" + imageFileName);
		copy(myFile, imageFile);
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
        session.put("imageFileName",imageFileName);
		
		return SUCCESS;
	}
}
