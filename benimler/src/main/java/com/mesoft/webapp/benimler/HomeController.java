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

import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.FacebookProfile;
import org.springframework.social.facebook.api.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mesoft.webapp.benimler.om.Benimle;
import com.mesoft.webapp.benimler.om.BenimleRM;

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

	private JdbcTemplate selectTemplate;

	public void setBenimlerDs(DataSource benimlerDs) {
		selectTemplate = new JdbcTemplate(benimlerDs);
	}

	public java.util.List queryBenimler() {
		return (java.util.List) selectTemplate.query("select * from benims",
				new Object[] {}, new BenimleRM());
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		List<Benimle> list = queryBenimler();
		for (Benimle benimle : list) {
			FacebookProfile prof = facebook.userOperations().getUserProfile(
					benimle.getUserId());
			benimle.setUser(prof);
		}

		model.addAttribute("benims", list);

		
		return "home";
	}
}