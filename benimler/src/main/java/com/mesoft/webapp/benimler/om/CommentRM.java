package com.mesoft.webapp.benimler.om;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CommentRM implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {
		Comment c = new Comment();
		c.setId(rs.getInt("id"));
		c.setBenimleId(rs.getInt("benimleId"));
		c.setText(rs.getString("text"));
		c.setUserId(rs.getString("userId"));

		return c;
	}

}