package com.mesoft.webapp.benimler.om;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CategoryRM implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {
		Category c = new Category();
		c.setDetailCategoryId(rs.getInt("detailCatId"));
		c.setDetailCategoryName(rs.getString("detailCatName"));
		c.setMainCategoryId(rs.getInt("mainCatId"));
		c.setMainCategoryName(rs.getString("mainCatName"));
		return c;
	}

}