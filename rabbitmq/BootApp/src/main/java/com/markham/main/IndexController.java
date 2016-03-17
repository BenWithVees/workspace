package com.markham.main;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.TypedQuery;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class IndexController {

	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager em;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(Model model) {
		ModelAndView view = new ModelAndView("index");
		List<User> users = new ArrayList<User>();
		TypedQuery<User> query1 = em.createNamedQuery("User.getAllUsers", User.class);
		users = query1.getResultList();
		model.addAttribute("user", new User());
		view.addObject("users", users);
		return view;
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView indexPost(@ModelAttribute("user") User user, Model model, BindingResult result) {
		model.addAttribute("user", user);
		ModelAndView view = new ModelAndView();
		TypedQuery<User> query = em.createNamedQuery("User.findUserInfo", User.class);
		query.setParameter("username", user.getUsername());
		try {
			query.getSingleResult();
			view.setViewName("redirect:/" + user.getUsername());
		} catch (Exception e) {
			System.out.println(e);
			view.setViewName("redirect:/");
		}

		return view;

	}

	@RequestMapping(value = "/{username}", method = RequestMethod.GET, produces = "application/json")
	public User restUser(@PathVariable("username") String username) {
		TypedQuery<User> query = em.createNamedQuery("User.findUserInfo", User.class);
		query.setParameter("username", username);
		User user = query.getSingleResult();
		return user;
	}
}