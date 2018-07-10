package excel;

import java.io.*;
import java.util.List;

import jxl.*;
import jxl.write.*;
//import jxl.write.WritableSheet;
import jxl.format.*;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import static java.lang.System.out;


public class SetExcelText {
	
	public List<String[]> getContextList() {
		return contextList;
	}


	public void setContextList(List<String[]> contextList) {
		this.contextList = contextList;
	}


	public List<String[]> contextList;
	



	public void write(List<String[]> yuangongList)throws JXLException,IOException{
		WritableWorkbook wb=Workbook.createWorkbook(new File("E:/","hxy.xls"));
		
			WritableSheet sheet=wb.createSheet("实施", 1);
			//createSheet(string name,)
			WritableCellFormat cellFormat=new WritableCellFormat();
			
		
			cellFormat.setAlignment(Alignment.CENTRE);
			cellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
			
			sheet.addCell(new Label(0,0,"name"));
			sheet.addCell(new Label(1,0,"picture"));
			sheet.addCell(new Label(2,0,"tellphone"));
			sheet.addCell(new Label(3,0,"email"));
			sheet.addCell(new Label(4,0,"remark"));
			sheet.addCell(new Label(5,0,"fenzu"));
			
			for(int i=0;i<contextList.size();i++){
				
				sheet.addCell(new Label(0,i+1,contextList.get(i)[0]));
				sheet.addCell(new Label(1,i+1,contextList.get(i)[1]));
				sheet.addCell(new Label(2,i+1,contextList.get(i)[2]));
				sheet.addCell(new Label(3,i+1,contextList.get(i)[3]));
				sheet.addCell(new Label(4,i+1,contextList.get(i)[4]));
				sheet.addCell(new Label(5,i+1,contextList.get(i)[5]));
					
			}
	

	    wb.write();
		wb.close();
	}

}
