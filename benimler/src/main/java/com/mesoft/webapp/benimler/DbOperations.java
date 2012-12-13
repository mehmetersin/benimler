package com.mesoft.webapp.benimler;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class DbOperations {

	private List
	
	private JdbcTemplate selectTemplate;

	public void setBenimlerDs(DataSource benimlerDs) {
		selectTemplate = new JdbcTemplate(benimlerDs);
	}
	
	
	
	
	
}
