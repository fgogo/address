package excel;


import excel.GetExcelText;

public class importCurriList1 {
	private String uploadFile;
	
	
    public String getUploadFile() {
		return uploadFile;
	}


	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}


	public String aa()throws Exception{	
		GetExcelText getExcel=new GetExcelText();
		String path = "C:/Users/付果果/Documents/"+this.uploadFile;
		System.out.print(path+"1111");
		getExcel.initStuInfo(path); // 找到文件路径
//		getExcel.initStuInfo("C:/Users/付果果/Documents/test.xlsx");
	
		return "success";
	}

}
