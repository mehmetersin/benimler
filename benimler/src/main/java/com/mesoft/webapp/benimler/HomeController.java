/*
 * Copyright 2011 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.mesoft.webapp.benimler;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mesoft.webapp.benimler.om.Benimle;
import com.mesoft.webapp.benimler.om.Comment;
import com.mesoft.webapp.benimler.view.BenimleForm;
import com.mesoft.webapp.benimler.view.BenimleView;

/**
 * Simple little @Controller that invokes Facebook and renders the result. The
 * injected {@link Facebook} reference is configured with the required
 * authorization credentials for the current user behind the scenes.
 * 
 * @author Keith Donald
 */
@Controller
public class HomeController {

	private final Facebook facebook;

	@Inject
	public HomeController(Facebook facebook) {
		this.facebook = facebook;
	}

	private DbOperations dbOperations;

	public DbOperations getDbOperations() {
		return dbOperations;
	}

	public void setDbOperations(DbOperations dbOperations) {
		this.dbOperations = dbOperations;
	}

	@RequestMapping(value = "/", method = {RequestMethod.GET,RequestMethod.POST})
	public String home(Model model,
			@ModelAttribute("searchText") BenimleForm searchForm) {

		createFavoriteBenimler(model, searchForm);

		return "home";
	}

	private void createFavoriteBenimler(Model model, BenimleForm searchForm) {
		List<Benimle> list = getDbOperations().qetFavoriteBenimler();
		
		List<Comment> favComments = new ArrayList<Comment>();
		List<Benimle> favBenimle = new ArrayList<Benimle>();
		
		for (Benimle benimle : list) {
			FacebookProfile prof = facebook.userOperations().getUserProfile(
					benimle.getUserId());
			benimle.setUser(prof);
			benimle.setCategory(dbOperations.getCategoryById(benimle
					.getCategoryId()));
			List<Comment> comments = dbOperations.qetCommentsByBenimleId(benimle
					.getId());
			
			for (Iterator iterator = comments.iterator(); iterator.hasNext();) {
				Comment comment = (Comment) iterator.next();
				comment.setUsername(DbOperations.getFacebookProfile(facebook, comment.getUserId()).getName());
				if (favComments.size()<6){
					favComments.add(comment);
				}
			}
			
			benimle.setComments(comments);
			
			if (favBenimle.size()<6){
				favBenimle.add(benimle);
			}
			
			
		}

		model.addAttribute("benims", list);
		
		model.addAttribute("favCategoryList",dbOperations.getFavCategoryList());
		
		model.addAttribute("favCommentList",favComments);
		model.addAttribute("favBenimle",favBenimle);
		
		
		searchForm = new BenimleForm();
		searchForm.setText("Ara birşeyler");
		model.addAttribute(searchForm);

	}

	@RequestMapping(value = "/postbenimle", method = RequestMethod.GET)
	public ModelAndView postbenimle() {
		return new ModelAndView("postbenimle", "command", new BenimleView());
	}

	@RequestMapping(value = "/searchbenimle", method = RequestMethod.POST)
	public String searchbenimle(Model model,
			@ModelAttribute("searchText") BenimleForm searchForm) {

		List<Benimle> list = dbOperations.queryBenimler(searchForm.getText());
		
		model.addAttribute("benims", list);

		searchForm = new BenimleForm();
		searchForm.setText("Ara birşeyler");
		model.addAttribute(searchForm);
		
		return "home";
	}
	
	@RequestMapping(value = "/commentbenimle", method = RequestMethod.POST)
	public String commentbenimle(Model model,
			@ModelAttribute("searchText") BenimleForm searchForm) {

		Comment c = new Comment();
		c.setText(searchForm.getText());
		c.setUserId(facebook.userOperations().getUserProfile().getId());
		c.setBenimleId(searchForm.getId());
		
		dbOperations.insertComment(c);
		
		searchForm = new BenimleForm();
		
		createFavoriteBenimler(model, searchForm);
		
		
		
		return "home";
	}

	@RequestMapping(value = "/postingbenimle", method = RequestMethod.POST)
	public String postingbenimle(Model model,
			@ModelAttribute("postbenimle") BenimleView bw,
			@ModelAttribute("searchText") BenimleForm searchForm) {

		Benimle b = new Benimle();
		// b.setCategoryId( bw.getCategory())
		b.setDescription(bw.getDescription());
		b.setTitle(bw.getTitle());
		b.setTimestamp(new Date());
		b.setUrl(bw.getUrl());
		b.setCategoryId(dbOperations.getCategoryByDisplayname(bw.getCategory())
				.getDetailCategoryId());

		b.setUserId(facebook.userOperations().getUserProfile().getId());

		int a = dbOperations.insertBenimle(b);

		MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
		map.set("link", b.getUrl());
		map.set("name", b.getTitle());
		// map.set("caption", b.get);
		// map.set("description", b.getDescription());
		map.set("message", b.getDescription());

		// THE BELOW LINES ARE THE CRITICAL PART I WAS LOOKING AT!
		map.set("picture",
				"http://icons.iconarchive.com/icons/petalart/christmas-cookie/icons-390.jpg");
		// map.set("actions",
		// "{'name':'myAction', 'link':'http://www.bla.com/action'}");

		String c = facebook.publish(facebook.userOperations().getUserProfile()
				.getId(), "feed", map);

		System.out.println("Action id" + c);

		createFavoriteBenimler(model, searchForm);

		return "home";
	}

	@RequestMapping(value = "/get_category_list.html", method = RequestMethod.GET, headers = "Accept=*/*")
	public @ResponseBody
	List<String> getCountryList(@RequestParam("term") String query,
			HttpServletRequest request, HttpServletResponse response) {

		return dbOperations.queryCategory(query);

	}

}