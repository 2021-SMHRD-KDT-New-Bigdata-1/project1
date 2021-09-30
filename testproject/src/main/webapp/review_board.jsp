<%@page import="java.util.Vector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.WriteDAO"%>
<%@page import="com.VO.WriteVO"%>
<%@page import="com.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<script src="https://kit.fontawesome.com/19aa9ed23d.js" crossorigin="anonymous"></script>
<head>
<meta charset="EUC-KR">
<title>리뷰게시판</title>
 <link rel="stylesheet" href="CSS/Board/css.css">
</head>
<body>

<div data-include-path="header.jsp"></div>
	<%
		//vo 가져옴
	MemberVO vo = (MemberVO)session.getAttribute("vo");
	WriteVO vo2 = (WriteVO)session.getAttribute("vo2");

	%>

<section class="section1">
        <div class="board_wrap">
            <div class="board_title">
              <strong>리뷰게시판</strong>
              <p>게시판 용도에 맞지 않는 글은 운영자에 의해 삭제될 수 있습니다.</p>
            </div>
	<div id="kakaoHead">
			<div class="wrap_head">
				<nav id="kakaoGnb">
					<ul class="list_gnb">
						<li><a href="#" class="link_gnb">전체글</a></li>
						<li><a href="shareAccont_index.jsp" class="link_gnb">베스트글</a></li>
					</ul>
				</nav>
			</div>
		</div>
            <div class="board_list_wrap">
              <div class="board_list">
                <div class="top">
                      <div class="num">번호</div>
                  <div class="title">제목</div>
                  <div class="writer">글쓴이</div>
                  <div class="date">작성일</div>
                  <div class="good">추천수</div>
                  <div class="count">조회수</div>
                    </div>
           
            	
             <%
             WriteDAO dao = new WriteDAO();
             int count = dao.selectCnt();
             String tempStart = request.getParameter("page");
             int startPage = 1;
             int onePageCnt = 10;

             
             count = (int)Math.ceil((double)count/(double)onePageCnt);
             
      
             
             if(tempStart!=null){
            	 startPage = (Integer.parseInt(tempStart)-1)*onePageCnt+1;
            	 onePageCnt = (Integer.parseInt(tempStart)-1)*onePageCnt+onePageCnt;
       
             }
             ArrayList<WriteVO> v = dao.selectPage((startPage),onePageCnt);
             

             
             
             %>
                 
            		<%for(WriteVO list:v){ %>
      			
                <div>
                  <div class="num" ><%=list.getArticles_seq() %></div>
                  <div class="title"><a href="detail_view.jsp?id=<%=list.getArticles_seq() %>"><%=list.getSubject()%></a></div>
                  <div class="writer"><%=list.getMemberId()%></div>
                  <div class="date" ><%=list.getReg_date() %></div>
                  <div class="good" ><%=list.getRec_cnt() %></div>
                  <div class="count" ><%=list.getCnt()%></div>
					
                </div>
                   <%} %>
          
              </div>
              
              	
              <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><<</a>
                
            
		           <%for(int j=1; j<=count; j++){%>
                   <a href="review_board.jsp?page=<%=j%>" class="num on" ><%=j %></a>
                  
             <%}%>
     
                <a href="#" class="bt">></a>
                <a href="#" class="bt">>></a>
              </div>
              <div class="inputTypeText">
                <div class="search"> <select class= "search" >
               
                   <option value="제목">제목</option>
                   <option value="글내용">글내용</option>
                   <option value="작성자">작성자</option>
                </select>
                </div>
                <div class="search1">
                 <input  type="text" placeholder="Search">
                
                 <i class="fas fa-search" ><input type="submit" style= "opacity: 0%  color = white"></i>
               </div>
             </div>
              <div class="bt_wrap">
           
              <%if(vo==null){
					
					//out.print("<a href='review_board.jsp' class='on'>목록</a>");
				
				}else{
					out.print("<a href='write_board.html' class='on'>글작성</a>");
				}

				%>
              <!--  <a href="write_board.html" class="on">글 작성</a>-->
                 
            </div> 
            </div> 
            
        </div>
    
    </section>

    <script>

        window.addEventListener('load', function() {
            var allElements = document.getElementsByTagName('*');
            Array.prototype.forEach.call(allElements, function(el) {
                var includePath = el.dataset.includePath;
                if (includePath) {
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            el.outerHTML = this.responseText;
                        }
                    };
                    xhttp.open('GET', includePath, true);
                    xhttp.send();
                }
            });
        });
    
    </script>
	  <div data-include-path="footer.html"></div>
</body>
</html>