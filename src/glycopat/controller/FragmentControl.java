package glycopat.controller;

import glycopat.model.Digest;
import glycopat.model.Fragment;
import glycopat.model.Ion;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FragmentControl
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/FragmentControl" })
public class FragmentControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FragmentControl() {
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
		// TODO Auto-generated method stub
		    String filedirectory= getServletContext().getRealPath("/tmp") ;	
		    
		    
		    HttpSession session = request.getSession(false);
		   // String glysgp = (String) session.getAttribute("glysgp");
			String glysgp=request.getParameter("glysgp");
			int nmFrag=Integer.parseInt(request.getParameter("nmFrag"));
			int npFrag=Integer.parseInt(request.getParameter("npFrag"));
			int ngFrag=Integer.parseInt(request.getParameter("ngFrag"));
			int z=Integer.parseInt(request.getParameter("z"));
			int chargoption=Integer.parseInt(request.getParameter("chargeopt"));
			
			session.setAttribute("nmFrag", nmFrag);
			session.setAttribute("npFrag", npFrag);
			session.setAttribute("ngFrag", ngFrag);
			session.setAttribute("glysgp", glysgp);
			session.setAttribute("z", z);
			
			System.out.println("Peptide/Glycopeptide: " + glysgp);	
			System.out.println("nmFrag: "+nmFrag);
			System.out.println("npFrag: "+npFrag);
			System.out.println("ngFrag: "+ngFrag);
			System.out.println("z: "+z);
			
			Fragment fragment_request=null;
			RequestDispatcher view = null;
			List<Ion> fragIonArrays = null;
			try {
				fragment_request = new Fragment();
				fragIonArrays = fragment_request.fragpeptide(glysgp,nmFrag,npFrag,ngFrag,z,chargoption);
				request.setAttribute("fragIons", fragIonArrays);
				view = request.getRequestDispatcher("fragment.jsp");
				view.forward(request,response);
			} catch (Exception e){
				e.printStackTrace();
				view = request.getRequestDispatcher("error.jsp");
				view.forward(request, response);
			}
	}
}
