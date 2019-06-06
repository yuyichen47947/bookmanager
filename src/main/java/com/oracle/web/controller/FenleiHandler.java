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

import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {
	@Autowired
	private FenleiService fenleiService;

	@RequestMapping(value = "/monsters", method = RequestMethod.GET)
	public String list(Integer pageNow, HttpServletRequest request) {

		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}

		PageBean<Fenlei> pb = fenleiService.selectAllPage(pageNow);

		request.setAttribute("pb", pb);

		System.out.println(pb);

		return "showFenlei";
	}

	@RequestMapping(value = "/addfenlei", method = RequestMethod.POST)
	public String add(Fenlei fenlei) {

		fenleiService.insert(fenlei);

		System.out.println(fenlei);

		return "redirect:/monsters";
	}

	@RequestMapping(value = "/monster/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {

		Fenlei fenlei = fenleiService.queryOneMonster(id);

		session.setAttribute("m", fenlei);

		return "redirect:/updateFenlei.jsp";
	}

	@RequestMapping(value = "/monster", method = RequestMethod.PUT)
	public String update(Fenlei fenlei) {

		fenleiService.update(fenlei);

		System.out.println(fenlei);

		return "redirect:/monsters";

	}

	@RequestMapping(value = "/monster/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") Integer id1) {

		Fenlei fenlei = new Fenlei();

		fenlei.setfId(id1);

		fenleiService.delete(fenlei);

		return "redirect:/monsters";
	}

}
