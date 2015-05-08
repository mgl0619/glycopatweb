package glycopat.model;
import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.MCRConfiguration;

import cleaveProt.protDigest;

public class Digest{
	String filedirectory;
	String protseqfilename;
	String fixedptmfilename;
	String variableptmfilename;
	private final String outputfilename="localtemp.txt";
	String enzname;
	private protDigest digest;
	
	@SuppressWarnings("unused")
	private String getFiledirectory() {
		return filedirectory;
	}

	private void setFiledirectory(String filedirectory) {
		this.filedirectory = filedirectory;
	}

	@SuppressWarnings("unused")
	private String getProtseqfilename() {
		return protseqfilename;
	}

	private void setProtseqfilename(String protseqfilename) {
		this.protseqfilename = protseqfilename;
	}

	@SuppressWarnings("unused")
	private String getFixedptmfilename() {
		return fixedptmfilename;
	}

	private void setFixedptmfilename(String fixedptmfilename) {
		this.fixedptmfilename = fixedptmfilename;
	}

	@SuppressWarnings("unused")
	private String getVariableptmfilename() {
		return variableptmfilename;
	}

	private void setVariableptmfilename(String variableptmfilename) {
		this.variableptmfilename = variableptmfilename;
	}

	@SuppressWarnings("unused")
	private String getEnzname() {
		return enzname;
	}

	private void setEnzname(String enzname) {
		this.enzname = enzname;
	}

	public Digest() throws Exception{
		this.digest = new protDigest();
	}
	
	public String cleave(String filedirectory,
	 String protseqfilename,String fixedptmfilename,String variableptmfilename,String enzname,
	 int MissedMax,int MinPepLen,int MaxPepLen,int minPTM,int maxPTM){
	
	    this.setEnzname(enzname);this.setFiledirectory(filedirectory);
	    this.setProtseqfilename(protseqfilename);this.setFixedptmfilename(fixedptmfilename);
	    this.setVariableptmfilename(variableptmfilename);
	     
		Object[] digestRes = null;
		String listPepString = null;
		try {
			digestRes = digest.digestSGP(2,this.filedirectory,this.protseqfilename,
					 this.fixedptmfilename,this.variableptmfilename,this.outputfilename,this.enzname,
					 MissedMax,MinPepLen,MaxPepLen,minPTM,maxPTM);
			MWCharArray listOfPeptideToDisplay= (MWCharArray) digestRes[1];
			listPepString = listOfPeptideToDisplay.toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		finally
		{
	       if(digest!=null){
	    	   digest.dispose();	    	   
	       }
	    }
		
		return listPepString;
	}

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		
        System.out.println("MCRROOT: " + System.getenv("MCRROOT"));
	    System.out.println("PATH: " + System.getenv("PATH"));
	    System.out.println("JAVA.LIBRARY.PATH: "+ System.getProperty("java.library.path"));
	    System.out.println("MCR is installed "+ MCRConfiguration.isInstalledMCR());
	    String filedirectory="/Users/gangliu/Documents/workspace/testDigestSGP";
		String protseqfilename="PSGL1.txt";
		String fixedptmfilename="fixedptmtest.txt";
		String variableptmfilename="variableptm_new.txt";
		String enzname="Tryp";
		int MissedMax=1,MinPepLen=4,MaxPepLen=30,minPTM=1,maxPTM=3;
		Digest digesttest1 = new Digest();
		String digpeptstring = digesttest1.cleave(filedirectory,protseqfilename,
				 fixedptmfilename,variableptmfilename,enzname,
				 MissedMax,MinPepLen,MaxPepLen,minPTM,maxPTM);
		System.out.println(digpeptstring);
		System.out.println("RUN ENDS");
	}

}