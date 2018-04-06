<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%	
	
	int totalRecordCount;		// 전체 글수
	int pageNumber;				// 현재 페이지 번호
	int pageCountPerScreen;		// 스크린당 페이지수 	
	int recordCountPerPage;		// 페이지당 글수
		
	
	String st1 = request.getParameter("totalRecordCount");
	if(st1 == null)	totalRecordCount = 0;
	else			totalRecordCount = Integer.parseInt(st1);
	
	String st2 = request.getParameter("pageNumber");
	if(st2 == null)	pageNumber = 0;
	else			pageNumber = Integer.parseInt(st2);
	
	String st3 = request.getParameter("pageCountPerScreen");
	if(st3 == null)	pageCountPerScreen = 0;
	else			pageCountPerScreen = Integer.parseInt(st3);
	
	String st4 = request.getParameter("recordCountPerPage");
	if(st4 == null)	recordCountPerPage = 0;
	else			recordCountPerPage = Integer.parseInt(st4);
		
	int totalPageCount = totalRecordCount / recordCountPerPage;	// 총페이지
	//		1		=		12					10
	
	if ((totalRecordCount % recordCountPerPage) != 0) {
		//	12					10	
		totalPageCount++;		// 1 -> 2
	}
	
	int screenStartPageIndex = ((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen;	
	//			0 =				0 + 1			10						10						
	int screenEndPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;	
	//			20 = 			0 + 1			10						10						10								
	if (screenEndPageIndex > totalPageCount) screenEndPageIndex = totalPageCount;		// 페이지 블록을 10까지만 표시하려고 하는 처리
	//		10					2				2					2
			
	/* System.out.println("totalRecordCount:" + totalRecordCount);
	System.out.println("pageNumber:" + pageNumber);
	System.out.println("pageCountPerScreen:" + pageCountPerScreen);
	System.out.println("recordCountPerPage:" + recordCountPerPage);
	System.out.println("totalPageCount:" + totalPageCount);
	System.out.println("screenStartPageIndex:" + screenStartPageIndex);
	System.out.println("screenEndPageIndex:" + screenEndPageIndex); */

	/* 
	totalRecordCount:12
	pageNumber:0
	pageCountPerScreen:10
	recordCountPerPage:10
	totalPageCount:2
	screenStartPageIndex:0
	screenEndPageIndex:2
	 */
	
	
	if (((pageNumber+1) % pageCountPerScreen) == 0)
	{
	    screenStartPageIndex = (((pageNumber+1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
	    screenEndPageIndex = pageNumber+1;
	}
%>
<div style="float:left; width:96%; text-align:center;"> 
	<a href="#none" title="처음페이지" onclick="goPage('0');"><img src="image/arrow_first.gif" alt="처음페이지" style="width:9px; height:9px;"/></a>&nbsp;		
		<%
		if (screenStartPageIndex > 1){
			%>
			<a href="#none" title="이전페이지" onclick="goPage('<%=screenStartPageIndex-1%>');"><img src="image/arrow_prev.gif" alt="이전페이지" style="width:9px; height:9px;"/></a>&nbsp;	
			<%
		}
		    	
		for (int i=screenStartPageIndex; i<screenEndPageIndex ;i++){
			if (i==pageNumber){
		    	%>	
				<span style="font-size:9pt; color:#000000; font-weight:bold;"><%=i+1%></span>&nbsp;
		    	<% 
			} else { 
		    	%>	
				<a href="#none" title="<%=i+1%>페이지" onclick="goPage(<%=i%>);" style="font-size:7.5pt; color:#000000; font-weight:normal;"><%=i+1%></a>&nbsp;
		    	<%		
		    }
		}
		    	
		if (screenEndPageIndex < totalPageCount){
		    %>	
			<a href="#none" title="다음페이지" onclick="goPage(<%=screenEndPageIndex %>);"><img src="image/arrow_next.gif" alt="다음페이지" style="width:9px; height:9px;"/></a>&nbsp;
		    <%
		} // end if
		    
		int end_page = 0;
		if (totalPageCount > 0){
			end_page = totalPageCount - 1;
		}
		%>
		        	
	<a href="#none" title="마지막페이지" onclick="goPage(<%=end_page %>);" ><img src="image/arrow_end.gif" alt="마지막페이지" style="width:9px; height:9px;" /></a>
</div>		
			
<div style="float:left; width:4%; text-align:center;">		
	<span style="font-size:1em; color:#000000;"><%=pageNumber+1%>/<%=totalPageCount%></span>		
</div>
	 	