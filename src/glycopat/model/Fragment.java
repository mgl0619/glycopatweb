package glycopat.model;

import java.util.ArrayList;
import java.util.List;
import multiSGPFrag.Fragmentation;
import com.mathworks.toolbox.javabuilder.*;
import com.mathworks.toolbox.javabuilder.internal.MCRConfiguration;

public class Fragment {
	private Fragmentation frag;
		
	public Fragment() throws Exception{
         this.frag = new Fragmentation();		
	}

		
	public List<Ion> fragpeptide(String pepsgp,
	 int nmFrag,int npFrag,int ngFrag,int z){
		Object[] fragIons = null;
		MWStructArray fragIonArrayMW =null;
		List<Ion> fragIonArrays = new ArrayList<Ion>();
		try {
			MWCharArray pepsgpMW = new MWCharArray(pepsgp);		
			MWNumericArray nmFragMW= new MWNumericArray(Double.valueOf(nmFrag),MWClassID.DOUBLE);
			MWNumericArray npFragMW= new MWNumericArray(Double.valueOf(npFrag),MWClassID.DOUBLE);
			MWNumericArray ngFragMW= new MWNumericArray(Double.valueOf(ngFrag),MWClassID.DOUBLE);
			MWNumericArray zMW= new MWNumericArray(Double.valueOf(z),MWClassID.DOUBLE);
			fragIons = frag.multiSGPFrag(1,pepsgpMW,nmFragMW,npFragMW,ngFragMW,zMW);
			fragIonArrayMW = (MWStructArray) fragIons[0];
			System.out.println(fragIonArrayMW.fieldNames());
			System.out.println(fragIonArrayMW.toString());			
			int[] fragIonSize = fragIonArrayMW.getDimensions();
			int numIons = fragIonSize[0]*fragIonSize[1];			
			int numFields = fragIonArrayMW.numberOfFields();
			System.out.println("the number of fields is "+numFields);		
			
			int eleIndex;
			  double mz = 0; 
			    int charge = 0;
			    String original = null,sgp = null,type = null;
			
			
//			for(int i = 0;i<numIons;i++){
//				MWArray originalArray = (MWArray) fragIonArray.getField("sgp",i+1);
//				System.out.println(originalArray.toString());
//			}
			
			for(int i = 0;i<numIons;i++){					
				for(int j=0;j<numFields;j++){
					eleIndex = i*numFields+j;
					System.out.println(fragIonArrayMW.getField(eleIndex+1));
					if(j==0){
						MWArray elevalue = (MWArray) fragIonArrayMW.getField(eleIndex+1);
						original = elevalue.toString();
					} else if(j==1){
						MWArray elevalue = (MWArray) fragIonArrayMW.getField(eleIndex+1);
						sgp =  elevalue.toString();
					} else if(j==2){
						MWNumericArray elenumvalue = (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
						nmFrag = elenumvalue.getInt();
					} else if(j==3){
						MWNumericArray elenumvalue = (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
						npFrag = elenumvalue.getInt();
					} else if(j==4){
						MWNumericArray elenumvalue = (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
						ngFrag = elenumvalue.getInt();
					} else if(j==5){
						MWNumericArray elenumvalue = new MWNumericArray(1,MWClassID.DOUBLE);
						elenumvalue= (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
						mz = elenumvalue.getDouble();
					} else if(j==6){
						MWArray elevalue = (MWArray) fragIonArrayMW.getField(eleIndex+1);
						type = elevalue.toString();
					} else if(j==7){
						MWNumericArray elenumvalue = (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
						charge = elenumvalue.getInt();
					}
				}
				Ion newIons = new Ion(original, sgp, nmFrag, ngFrag, npFrag,
		    			mz, type, charge);
				System.out.println(newIons.toString());
				fragIonArrays.add(newIons);
			}
	    } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		finally
		{
	       if(frag!=null){
	    	   frag.dispose();	    	   
	       }
	    }
		
		return fragIonArrays;
	}
	
	public List<Ion> fragpeptide(String pepsgp,
			 int nmFrag,int npFrag,int ngFrag,int z,int chargeopt){
		Object[] fragIons = null;
		List<Ion> fragIonArrays = new ArrayList<Ion>();
		try {
			MWCharArray pepsgpMW = new MWCharArray(pepsgp);		
			MWNumericArray nmFragMW= new MWNumericArray(Double.valueOf(nmFrag),MWClassID.DOUBLE);
			MWNumericArray npFragMW= new MWNumericArray(Double.valueOf(npFrag),MWClassID.DOUBLE);
			MWNumericArray ngFragMW= new MWNumericArray(Double.valueOf(ngFrag),MWClassID.DOUBLE);
			MWNumericArray zMW= new MWNumericArray(Double.valueOf(z),MWClassID.DOUBLE);
			
			if(chargeopt==1){
			   for(int i=1;i<=z;i++){
				  MWNumericArray iMW= new MWNumericArray(Double.valueOf(i),MWClassID.DOUBLE); 
			      fragIons = frag.multiSGPFrag(1,pepsgpMW,nmFragMW,npFragMW,ngFragMW,iMW);
			      List<Ion> tempfragIonArrays=convertMWIonToJavaIons(fragIons);
			      fragIonArrays.addAll(tempfragIonArrays);
			   }
			} else if(chargeopt==0){
			    fragIons = frag.multiSGPFrag(1,pepsgpMW,nmFragMW,npFragMW,ngFragMW,zMW);	
			    List<Ion> tempfragIonArrays=convertMWIonToJavaIons(fragIons);
			    fragIonArrays.addAll(tempfragIonArrays);
			}
	    } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		finally
		{
	       if(frag!=null){
	    	   frag.dispose();	    	   
	       }
	    }
		
		return fragIonArrays;
	}
		
  private List<Ion> convertMWIonToJavaIons(Object[] fragIons){
	List<Ion> fragIonArrays = new ArrayList<Ion>();
	MWStructArray fragIonArrayMW = (MWStructArray) fragIons[0];
	System.out.println(fragIonArrayMW.fieldNames());
	System.out.println(fragIonArrayMW.toString());			
	int[] fragIonSize = fragIonArrayMW.getDimensions();
	int numIons = fragIonSize[0]*fragIonSize[1];			
	int numFields = fragIonArrayMW.numberOfFields();
	System.out.println("the number of fields is "+numFields);		
	
	int eleIndex;
	double mz = 0; 
	int charge = 0;
	String original = null,sgp = null,type = null;
//	for(int i = 0;i<numIons;i++){
//		MWArray originalArray = (MWArray) fragIonArray.getField("sgp",i+1);
//		System.out.println(originalArray.toString());
//	}
	
	int nmFrag=0,npFrag=0,ngFrag=0;
	for(int i = 0;i<numIons;i++){					
		for(int j=0;j<numFields;j++){
			eleIndex = i*numFields+j;
			System.out.println(fragIonArrayMW.getField(eleIndex+1));
			if(j==0){
				MWArray elevalue = (MWArray) fragIonArrayMW.getField(eleIndex+1);
				original = elevalue.toString();
			} else if(j==1){
				MWArray elevalue = (MWArray) fragIonArrayMW.getField(eleIndex+1);
				sgp =  elevalue.toString();
			} else if(j==2){
				MWNumericArray elenumvalue = (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
				nmFrag = elenumvalue.getInt();
			} else if(j==3){
				MWNumericArray elenumvalue = (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
				npFrag = elenumvalue.getInt();
			} else if(j==4){
				MWNumericArray elenumvalue = (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
				ngFrag = elenumvalue.getInt();
			} else if(j==5){
				MWNumericArray elenumvalue = new MWNumericArray(1,MWClassID.DOUBLE);
				elenumvalue= (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
				mz = elenumvalue.getDouble();
			} else if(j==6){
				MWArray elevalue = (MWArray) fragIonArrayMW.getField(eleIndex+1);
				type = elevalue.toString();
			} else if(j==7){
				MWNumericArray elenumvalue = (MWNumericArray) fragIonArrayMW.getField(eleIndex+1);
				charge = elenumvalue.getInt();
			}
		}
		Ion newIons = new Ion(original, sgp, nmFrag, ngFrag, npFrag,
    			mz, type, charge);
		System.out.println(newIons.toString());
		fragIonArrays.add(newIons);	
	}
	return fragIonArrays;
  }
		

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		
        System.out.println("MCRROOT: " + System.getenv("MCRROOT"));
	    System.out.println("PATH: " + System.getenv("PATH"));
	    System.out.println("JAVA.LIBRARY.PATH: "+ System.getProperty("java.library.path"));
	    System.out.println("MCR is installed "+ MCRConfiguration.isInstalledMCR());
	    String glysgp="{n{n{h{h{h{h}}{h{h{h}{h{h}}}}}}}}";
		int nmFrag=0,npFrag=0,ngFrag=1,z=2;
		Fragment testFragment = new Fragment();
		List<Ion> fragIonArrays = null;
		fragIonArrays=testFragment.fragpeptide(glysgp,nmFrag,npFrag,ngFrag,z,1);
		System.out.println("the number of ions is:"+fragIonArrays.size()+"\nRUN ENDS");
	}
}
