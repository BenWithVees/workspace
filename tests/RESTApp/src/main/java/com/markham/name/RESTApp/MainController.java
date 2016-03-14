package com.markham.name.RESTApp;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.TypedQuery;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MainController {

	@PersistenceContext(type = PersistenceContextType.TRANSACTION)
	private EntityManager em;

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		ModelAndView model = new ModelAndView();

		if (error != null) {
			model.addObject("error", "Invalid username and password");
		}
		model.addObject("msg", "This is a message and stuff");
		return model;
	}

	@RequestMapping(value = "/welcome/{userName}", method = RequestMethod.GET, produces = "application/json")
	public User welcomeRest(@PathVariable String userName, ModelAndView model) {
		User user = new User();
		TypedQuery<User> query = em.createNamedQuery("User.findUserInfo", User.class);
		query.setParameter("username", userName);
		user = query.getSingleResult();
		model.addObject("user", user);
		model.setViewName("redirect:user");
		return user;
	}

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView welcome(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName(); // get logged in username
		ModelAndView view = new ModelAndView();
		List<User> allUsers = new ArrayList<User>();
		User user = new User();

		TypedQuery<User> query = em.createNamedQuery("User.findUserInfo", User.class);
		query.setParameter("username", name);
		user = query.getSingleResult();

		TypedQuery<User> query1 = em.createNamedQuery("User.getAllUsers", User.class);
		allUsers = query1.getResultList();
		model.addAttribute("user", new User());
		view.addObject("user", user);
		view.addObject("allUsers", allUsers);
		return view;
	}

	@RequestMapping(value = "/welcome**", method = RequestMethod.POST)
	public ModelAndView welcomePost(@ModelAttribute("user") User user, BindingResult result, Model model) {
		model.addAttribute("user", user);
		ModelAndView view = new ModelAndView();
		TypedQuery<User> query = em.createNamedQuery("User.findUserInfo", User.class);
		query.setParameter("username", user.getUsername());
		try {
			query.getSingleResult();
			view.setViewName("redirect:/welcome/" + user.getUsername());
		} catch (NoResultException e) {
			view.addObject("err", "No such username");
			view.setViewName("redirect:/welcome");
		}
		return view;

	}

}
