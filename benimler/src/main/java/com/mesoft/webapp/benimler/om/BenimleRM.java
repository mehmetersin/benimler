package com.mesoft.webapp.benimler.om;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BenimleRM implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {
		Benimle ms = new Benimle();
		ms.setCategoryId(rs.getInt("categoryId"));
		ms.setDescription(rs.getString("description"));
		ms.setId(rs.getInt("id"));
		ms.setTitle(rs.getString("title"));
		ms.setUrl(rs.getString("url"));
		ms.setUserId(rs.getString("userId"));
		ms.setTimestamp(rs.getTimestamp("timestamp"));
		return ms;
	}

}