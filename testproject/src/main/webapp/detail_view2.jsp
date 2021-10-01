<%@page import="com.DAO.write2DAO"%>
<%@page import="com.VO.Write2VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.VO.MemberVO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<script src="https://kit.fontawesome.com/19aa9ed23d.js" crossorigin="anonymous"></script>
<head>
<meta charset="EUC-KR">
<title>CONTENT</title>
 <link rel="stylesheet" href="CSS/Board/css.css">
<script src="js/jquery-3.6.0.min.js"></script>
</head>

<body>
<%
MemberVO vo = (MemberVO) session.getAttribute("vo");
Write2VO vo2 = (Write2VO)session.getAttribute("vo2");
%>


<div data-include-path="header.jsp"></div>
 <section class="section1">
        <div class="board_wrap">
            <div class="board_title">
              <strong>리뷰 게시판</strong>
            </div>
            <div class="board_view_wrap">
              <div class="board_view">
              <%
            	  int id = Integer.parseInt(request.getParameter("id"));
              	write2DAO dao = new write2DAO();
				Write2VO writevo = dao.subjectList(id);
				int count = dao.cnt_subject(writevo.getArticles_seq(), writevo.getCnt());
				
				%>
			
               <div class="titleview">
               제목  <%=writevo.getSubject() %>
         		
               </div>
               <div class="info">
                <dl>
                  <dt>번호</dt>
                  <dd id="seq"><%=writevo.getArticles_seq() %></dd>
                </dl>
                <dl>
                  <dt>작성자</dt>
                  <dd><%=writevo.getMemberId()%></dd>
                </dl>
                <dl>
                  <dt>작성일</dt>
                  <dd><%=writevo.getReg_date() %></dd>
                </dl>
                <dl>
                  <dt>조회</dt>
                  <dd><%=count %></dd>
                </dl>
               <dl>
                  <dt>추천수</dt>
                  <dd id="like"><%=writevo.getRec_cnt() %></dd>
                </dl>
               </div>
               <div class="cont">
               <%=writevo.getContent() %>

               </div>
              <div class="feeling_div">
			<div class="like">
			    <button class="feeling_a" type="button" onclick="like()">
			      <i class="fa fa-heart-o"> Like</i>    
			 	</button>
			 	<!-- <button type="button" onclick="pwFind()" >추천</button> -->
			  </div>
			  
		</div>
        
              <div class="CommentBox">
                <div class="comment_option">
                    <h3 class="comment_title"> 댓글 </h3>
           
                </div>
                <ul class="comment_list">
                    <li class="CommentItem">
                        <div class="comment_area">
                            <div class="comment_box">
                                <div class="comment_nick_box">
                                    <div class="comment_nick_info">
                                        <a href="#" role="button" class="comment_nickname"> #댓글 작성자 id가 들어감</a>
                                    </div>
                                    <div class="md">
                                        <a href="#" class="modify">수정</a>
                                        <a href="#" class="delete">삭제</a>
                                    </div>
                                 
                                </div>
                                <div class="comment_text_box">
                                    <p class="comment_text_view">
                                        <span class="text_comment" > #댓글내용이 들어감</span>
                                    </p>
                                </div>
                                <div class="comment_info_box">
                                    <span class="comment_info_date">#날짜가 들어감</span>
                               
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
        
                             <%if(vo==null){
                           
                        }else{%>
                        		
                        	
                    
                    <div class="CommentWriter">
                    <div class="comment_inbox"> 
                        <strong class="blind">댓글을 입력하세요</strong>
                        <em class="comment_inbox_name"><%=vo.getNickname() %> </em>
                        <textarea name="reply" placeholder="댓글을 남겨보세요" class="comment_inbox_text" rows="1" style="overflow: hidden; overflow-wrap: break-word; height: 17px;"></textarea>
                    </div>
                    <div class="comment_attach">
                        <div class="register_box">
                            <input type ="submit" style="display: inline-block;
    min-width: 46px;
    height: 32px;
    font-size: 13px;
    color: black;
    vertical-align: top;
    margin-top: -24px;
    margin-left: auto";>
                        </div>
                    </div>
                </div>
               <% } %>
              <div class="bt_wrap" id="bt_wrap1">
     
              <%if(vo==null){
					
					out.print("<a href='review_board.jsp' class='on'>목록</a>");
				
				}else{
					if(vo.getMemberId().equals(writevo.getMemberId())){
					out.print("<a href='edit.jsp' >수정</a>");

					out.print("<a href='review_board.jsp' class='on'>목록</a>");
					}else{
						out.print("<a href='review_board.jsp' class='on'>목록</a>");
					}
				}

				%>
                 <!--<a href="review_board.jsp" class="on">목록</a> -->

                <!-- a href="edit.html" >수정</a>  -->
                
            </div> 
        </div>
    
    </section>
</form>
	 
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
 <script>
 function like(){
		
		var article = <%=writevo.getArticles_seq() %>
		var like = <%=writevo.getRec_cnt() %>
	<%-- 	alert(like)
		alert(article)
		
		alert(<%=writevo.getArticles_seq() %>); --%>
		
		/* 이메일 */
		$.ajax({
			// type : 데이터 전송 방식
			// data : 서버에 보낼 데이터{키:값}
			// url : 데이터를 보낼 서버페이지
			// dataType : 응답받을 데이터 타입
			type : "post", 
			data : {like:like,article:article},
			url : "likeService",
			dataType : "text",
			success : function(data){
				var sp = document.getElementById("like");
				
				if (data!=null) {
					sp.innerHTML = data
				}else{
					sp.innerHTML = "오류"
				}
			},
			error : function(){
				alert("통신실패");
			}
		})
	}
 </script>
</html>