package com.oracle.web.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

@Controller
@Scope(value = "prototype")
public class AdminHandler {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/admin")
	public String register(String name, String phone, String username, String password,
			@RequestParam("touxiang") MultipartFile filetx) throws IllegalStateException, IOException {

		File file = new File("D:\\book" + filetx.getOriginalFilename());
		
		filetx.transferTo(file);

		String touxiang = "D:\\book" + filetx.getOriginalFilename();

		System.out.println(touxiang);

		Admin admin = new Admin(null, touxiang, name, phone, username, password);

		adminService.save(admin);

		return "login";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username,Admin admin,HttpSession session) {

		// System.out.println(admin.getUsername());

		session.setAttribute("username", username);	
		
		Admin a = adminService.login(admin.getUsername());

		if (a == null) {

			return "login";

		} else if (!a.getPassword().equals(admin.getPassword())) {

			return "login";

		} else {

			return "index";

		}

	}

	@RequestMapping(value = "/yanzheng", method = RequestMethod.GET)
	public void queryByUsername(@RequestParam("username") String username, HttpServletResponse response)throws IOException {

	    System.out.println(username);
	    
		Admin a = adminService.login(username);

		response.setContentType("text/html;charset=UTF-8");

		if (a != null) {

			response.getWriter().write("{\"valid\":\"false\"}");

		} else {

			response.getWriter().write("{\"valid\":\"true\"}");

		}

	}
	
	@RequestMapping(value = "/showAdmin", method = RequestMethod.GET)
	public String showAdmin(HttpServletResponse response,HttpServletRequest request,HttpSession session){

		response.setContentType("text/html;charset=UTF-8");
		
		String uname=(String)session.getAttribute("username");
		
		System.out.println(uname);
		
    	Admin a=adminService.showAdmin(uname);
    	
    	session.setAttribute("admin", a);

    	return "showAdmin";
	}


	@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
	public String updatePassword(HttpServletResponse response,HttpServletRequest request){

		HttpSession session=request.getSession();
    	
		String uname=(String)session.getAttribute("username");
         
         String newpassword=request.getParameter("newpassword");
         
         int i=adminService.updatePassword(uname,newpassword);
         
         return "updatePassword";

	}
}
