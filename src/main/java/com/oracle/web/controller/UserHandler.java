package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.service.UserService;

import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;


@Controller
@Scope(value="prototype")
public class UserHandler {
	@Autowired
	private UserService userService;
      //1.添加用户
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String add(User user){
		
		userService.save(user);
		
		return "redirect:/monsters";
		
	}
	

	
	/* @RequestMapping(value="/monsters",method=RequestMethod.GET)
	 public String monster(HttpServletRequest request){
		 List<User> list=userService.list();
		 request.setAttribute("mlist", list);
		 System.out.println(list);
		 return "showUser";
	 }
	*/
	//2.删除用户
	 @RequestMapping(value="/monster/{id}",method=RequestMethod.DELETE)
	   	public String  delete(@PathVariable("id") Integer id1){
	   		
	         User m=new User();
	         
	         m.setId(id1);
	         
	         userService.delete(m);
	      
	       	return "redirect:/monsters";
	       	
	   	}
	 //3.查看用户
	 @RequestMapping(value = "/monsters", method = RequestMethod.GET)
	   	public String list(Integer pageNow ,HttpServletRequest request) {
	       	
	   		if(pageNow==null||pageNow<1){
	   			
	   			pageNow=1;
	   			
	   		}
	   		
	   		
	   		PageBean<User> pb =userService.selectAllPage(pageNow);

	   		//System.out.println(pb);

	   		request.setAttribute("pb", pb);

	   		return "showUser";

	 }
	 //4.单查用户
	 @RequestMapping(value="/monster/{id}",method=RequestMethod.GET)
   	public String  updateUI(@PathVariable("id") Integer id,HttpSession session){
   		
         User user=userService.queryOneUser(id);
         
         session.setAttribute("m", user);
         
        
       
       	return "redirect:/showoneUser.jsp";
       	
   	}
	 //5.修改用户
    @RequestMapping(value="/monster",method=RequestMethod.PUT)
   	public String  update(User user){
   		
        userService.update(user);
         
         System.out.println(user);
      
       	return "redirect:/monsters";
       	
   	}
	
}
