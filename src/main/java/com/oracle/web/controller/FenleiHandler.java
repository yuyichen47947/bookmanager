package com.oracle.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {

	private FenleiService fenleiService;

	@RequestMapping(value = "/monsters", method = RequestMethod.GET)
	public String Monsters(HttpServletRequest request) {

		List<Fenlei> list = fenleiService.selectAll();

		request.setAttribute("mList", list);

		return "showFenlei";

	}

	@RequestMapping(value = "/addfenlei", method = RequestMethod.POST)
	public String add(Fenlei fenlei) {

		fenleiService.insert(fenlei);

		System.out.println("ok");
		return "redirect:/monsters";
	}

	@RequestMapping(value = "/monster/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {

		Fenlei fenlei = fenleiService.selectByPrimaryKey(id);

		session.setAttribute("fenlei", fenlei);

		return "redirect:/UpdateFenlei.jsp";
	}

	// @RequestMapping(value = "/monster", method = RequestMethod.PUT)
	// public String update(Monster monster) {
	//
	// monsterService.update(monster);
	//
	// //System.out.println(monster);
	//
	// return "redirect:/monsters/1";
	// }

	@RequestMapping(value = "/monster/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id1) {

		Fenlei fenlei = new Fenlei();

		fenlei.setfId(id1);

		fenleiService.delete(fenlei);

		return "redirect:/monsters";
	}

}
