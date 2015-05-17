package glycopat.model;

public class Ion {
	public String original;
	public String sgp;
	public int nmFrag;
	public int ngFrag;
	public int npFrag;
	public double mz;
	public String type;
	public int charge;
	
	public String getOriginal() {
		return original;
	}

	public void setOriginal(String original) {
		this.original = original;
	}

	public String getSgp() {
		return sgp;
	}

	public void setSgp(String sgp) {
		this.sgp = sgp;
	}

	public int getNmFrag() {
		return nmFrag;
	}

	public void setNmFrag(int nmFrag) {
		this.nmFrag = nmFrag;
	}

	public int getNgFrag() {
		return ngFrag;
	}

	public void setNgFrag(int ngFrag) {
		this.ngFrag = ngFrag;
	}

	public int getNpFrag() {
		return npFrag;
	}

	public void setNpFrag(int npFrag) {
		this.npFrag = npFrag;
	}

	public double getMz() {
		return mz;
	}

	public void setMz(double mz) {
		this.mz = mz;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
	}

	public Ion(String original, String sgp, int nmFrag, int ngFrag, int npFrag,
			double mz, String type, int charge) {
		super();
		this.original = original;
		this.sgp = sgp;
		this.nmFrag = nmFrag;
		this.ngFrag = ngFrag;
		this.npFrag = npFrag;
		this.mz = mz;
		this.type = type;
		this.charge = charge;
	}
	
	public String toString(){
		String IonString="Original: "+ original+"  Fragment: "+sgp
				+" nmFrag: "+Integer.toString(nmFrag)+" ngFrag: "+
				Integer.toString(ngFrag)+" npFrag: "+
				Integer.toString(npFrag)+" mz: "+Double.toString(mz)
				+" type: "+type+" Charge: "+Integer.toString(charge);
		return IonString;
	}

	

}
