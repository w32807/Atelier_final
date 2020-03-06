package com.test.test;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class DataSourceTest {
	
		@Setter(onMethod_ = {@Autowired})
		private DataSource dataSource;
		
		@Test
		public void testConnection() {
			try (Connection con = dataSource.getConnection()){
				log.info(con);
				log.info("DB 연결 성공!");
			} catch (Exception e) {
				fail(e.getMessage());
			}
		}
		
}//DataSourceTest Class end
