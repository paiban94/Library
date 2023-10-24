package com.lib.fin.db;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;

import javax.activation.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class DBConnectTest {

	@Autowired
	private DataSource dataSource;
	
	@Test
	void dbTest()throws Exception {
		
//		Connection connection = dataSource.
//		assertNotNull(connection);
		
		
	}

}
