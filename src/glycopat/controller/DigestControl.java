package glycopat.controller;

import glycopat.model.Digest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class DigestWebControl
 */
@WebServlet(description = "Control User Input for Protein Digestion", urlPatterns = {"/DigestWebControl" })
public class DigestControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DigestControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String filedirectory= getServletContext().getRealPath("/tmp") ;
		    
		    HttpSession session = request.getSession(false);
		    String protseqfilename=(String) session.getAttribute("protseqfilename");
			String fixedptmfilename=(String) session.getAttribute("fixedptmfilename");
			String variableptmfilename=(String) session.getAttribute("variableptmfilename");
			String enzname=request.getParameter("enz");
			System.out.println("Protein FASTA File: " + protseqfilename);
			System.out.println("Fixed Protein Modification File: "+ fixedptmfilename);
			System.out.println("Variable Protein Modification File: "+ variableptmfilename);
			System.out.println(enzname);
			int missedMax=Integer.parseInt(request.getParameter("missedMax"));
			int minPepLen=Integer.parseInt(request.getParameter("minPepLen"));
			int maxPepLen=Integer.parseInt(request.getParameter("maxPepLen"));
			int minPTM=Integer.parseInt(request.getParameter("minPTM"));
			int maxPTM=Integer.parseInt(request.getParameter("maxPTM"));
			System.out.println(missedMax);
			System.out.println(minPepLen);
			System.out.println(maxPepLen);
			System.out.println(minPTM);
			System.out.println(maxPTM);
			Digest digesttest1=null;
			String digpepstring="";
			RequestDispatcher view = null;
			try {
				digesttest1 = new Digest();
				digpepstring = digesttest1.cleave(filedirectory,protseqfilename,
						 fixedptmfilename,variableptmfilename,enzname,
						 missedMax,minPepLen,maxPepLen,minPTM,maxPTM);
				request.setAttribute("digest", digpepstring);
				view = request.getRequestDispatcher("index.jsp");
				view.forward(request, response);
			} catch (Exception e){
				// TODO Auto-generated catch block
				e.printStackTrace();
				view = request.getRequestDispatcher("error.jsp");
				view.forward(request, response);
			}
	}
}
