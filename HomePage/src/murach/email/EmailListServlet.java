package murach.email;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
import murach.business.User;
import murach.data.UserDB;

@SuppressWarnings("serial")
public class EmailListServlet extends HttpServlet {
        
    @Override
    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException {

        String url = "/index_el.html";

        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";  // default action
        }
            
        // perform action and set URL to appropriate page
        if (action.equals("join")) {
            url = "/index_el.html";    // the "join" page
        }
        else if (action.equals("add")) {                
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // store data in User object and save User object in database
            User user = new User(firstName, lastName, email);
            UserDB.insert(user);
            
            // set User object in request object and set URL
            request.setAttribute("user", user);
            url = "/thanks.jsp";   // the "thanks" page
        }
        
        // forward request and response objects to specified URL
        getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response);
    }    
    
    @Override
    protected void doGet(HttpServletRequest request, 
                          HttpServletResponse response) 
                          throws ServletException, IOException {
        doPost(request, response);
    }    
}