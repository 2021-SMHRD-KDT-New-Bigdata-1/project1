<%@page import="com.VO.WriteVO"%>
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
</head>

<body>
	<%
		//vo 가져옴
	MemberVO vo = (MemberVO)session.getAttribute("vo");
	WriteVO vo2 = (WriteVO)session.getAttribute("vo2");
	
	%>
		
<div data-include-path="header.jsp"></div>
 <section class="section1">
        <div class="board_wrap">
            <div class="board_title">
              <strong>글 내용 읽기</strong>
              <p># 목록에서 글을 클릭 했을 때 or 글 등록후 작성된 페이지를 보여줌</p>
            </div>
            <div class="board_view_wrap">
              <div class="board_view">
              
               <div class="titleview">
               
               <%
               out.print("제목  "+vo2.getSubject());
               

               %>
         
               </div>
               <div class="info">
                <dl>
                  <dt>번호</dt>
                  <dd>1</dd>
                </dl>
                <dl>
                  <dt>작성자</dt>
                  <dd>gomdol</dd>
                </dl>
                <dl>
                  <dt>작성일</dt>
                  <dd>2021.09.18</dd>
                </dl>
                <dl>
                  <dt>조회</dt>
                  <dd>33</dd>
                </dl>
               </div>
               <div class="cont">
               
         		<!--  글 내용 -->
         		
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
                                        <a href="#" role="button" class="comment_nickname">gomdol</a>
                                    </div>
                                    <div class="md">
                                        <a href="#" class="modify">수정</a>
                                        <a href="#" class="delete">삭제</a>
                                    </div>
                                 
                                </div>
                                <div class="comment_text_box">
                                    <p class="comment_text_view">
                                        <span class="text_comment">난 곰도리야</span>
                                    </p>
                                </div>
                                <div class="comment_info_box">
                                    <span class="comment_info_date"> 2021.09.23 15:24</span>
                               
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="CommentWriter">
                    <div class="comment_inbox"> 
                        <strong class="blind">댓글을 입력하세요</strong>
                        <em class="comment_inbox_name">gomdori</em>
                        <textarea placeholder="댓글을 남겨보세요" class="comment_inbox_text" rows="1" style="overflow: hidden; overflow-wrap: break-word; height: 17px;"></textarea>
                    </div>
                    <div class="comment_attach">
                        <div class="register_box">
                            <a href="#" role="button" class="button btn_register">등록</a>
                        </div>
                    </div>
                </div>
              <div class="bt_wrap" id="bt_wrap1">
                <a href="reviewB.html" class="on">목록</a>
                 <!-- <a href="edit.html" >수정</a>  -->
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