<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> index.jsp - 2017. 3. 27.</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>
<body>
	
</body>
</html>
<!-- DBCP 셋팅 
1. http://commons.apache.org
	Collection - download : commons-collections4-4.1-bin.zip
	DBCP - download : commons-dbcp2-2.1.1-bin.zip
	Pool - download : commons-pool2-2.4.2-bin.zip

2. http://www.oracle.com 에서
	ojdbc6.jar를 다운로드 하여 톰캣 서버의 lib와 이클립스 WEB-INF/lib(왼쪽Explorer)에 복사하고 build path 추가
	commons-collections4-4.1-bin.zip->commons-collections4-4.1.jar-> 톰캣 서버의 lib와 이클립스 WEB-INF/lib에 복사
	commons-dbcp2-2.1.1-bin.zip->commons-dbcp2-2.1.1.jar-> 톰캣 서버의 lib와 이클립스 WEB-INF/lib에 복사
	commons-pool2-2.4.2-bin.zip->commons-pool2-2.4.2.jar-> 톰캣 서버의 lib와 이클립스 WEB-INF/lib에 복사

3. 환경변수 CLASSPATH 를 다음과 같이 설정한다.
	.;C:\Program Files\Java\jdk1.8.0_111\lib\tools.jar;C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib\servlet-api.jar;C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib\ojdbc6.jar;C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib\jsp-api.jar;C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib\commons-collections4-4.1.jar;C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib\commons-dbcp2-2.1.1.jar;C:\Program Files\Apache Software Foundation\Tomcat 8.5\lib\commons-pool2-2.4.2.jar;
	* 이 텍스트는 fileFolder에 보관

4.  ~\tomcat8.5\conf\server.xml의 <GlobalNamingResources>태그 사이에 추가
		<Resource name="jdbc/myoracle"
			  auth="container"
			  type="javax.sql.DataSource"
			  driverClassName="oracle.jdbc.driver.OracleDriver"
			  url="jdbc:oracle:thin:@localhost:1521:orcl"
			  username="scott"
			  password="tiger"
			  maxActive="20"
			  maxIdle="10"
			  maxWait="-1"/>		
-->