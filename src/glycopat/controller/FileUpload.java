package glycopat.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/FileUpload" })
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String UPLOAD_DIRECTORY ;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpload() {
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
		UPLOAD_DIRECTORY = getServletContext().getRealPath("/tmp") ;
		System.out.println(getServletContext().getContextPath());
		System.out.println("the directory to store the file is: "+UPLOAD_DIRECTORY);
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String fieldname = null ; 
        String filename  = null;
   
        // process only if its multipart content
        if (isMultipart) {
                // Create a factory for disk-based file items
                FileItemFactory factory = new DiskFileItemFactory();

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);
                RequestDispatcher view = null;
                try {
                        // Parse the request
                        List<FileItem> multiparts = upload.parseRequest(request);

                        for (FileItem item : multiparts) {
                          if (!item.isFormField()) {
                        	 fieldname = item.getFieldName(); 
                             filename = new File(item.getName()).getName();
                             item.write(new File(UPLOAD_DIRECTORY + File.separator + filename));
                          }
                        }
                  System.out.println("File Upload Successfully");
                  request.setAttribute("message", "File Upload Successfully"); 
//                  view = request.getRequestDispatcher("protdigest.jsp");
//  				  view.forward(request, response);
                  
                } catch (Exception e) 
                {
                  System.out.println("File upload failed due to "+e);
                }
        }
        
        HttpSession session = request.getSession(true);
        if(fieldname!=null){
           session.setAttribute(fieldname, filename);
        }
        
        /*String protseqfilename=request.getParameter("protseqfilename");
		String fixedptmfilename=request.getParameter("fixedptmfilename");
		String variableptmfilename=request.getParameter("variableptmfilename");
		String enzname=request.getParameter("enz");
		System.out.println("Protein FASTA File: " + protseqfilename);
		System.out.println("Fixed Protein Modification File: "+ fixedptmfilename);
		System.out.println("Variable Protein Modification File: "+ variableptmfilename);
		System.out.println(enzname);*/
   }
}



   