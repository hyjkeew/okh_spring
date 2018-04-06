<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
<title>layouts-tiles</title>

<tiles:insertAttribute name="header"/>

<link rel="stylesheet" type="text/css"  
	href="<%=request.getContextPath() %>/css/style.css"/>

</head>
<body>

<div id="body_wrap">
	<div id="main_wrap">
		<div id="left_menu_wrap">
			<tiles:insertAttribute name="left_menu"/>
		</div>
		
		<div id="bbs_wrap">
			<tiles:insertAttribute name="main"/>		
		</div>
	
	</div>
</div>
     
</body>
</html>
