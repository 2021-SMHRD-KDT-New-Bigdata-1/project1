
<%@page import="com.DAO.WriteDAO"%>
<%@page import="com.VO.replyVO"%>
<%@page import="java.awt.datatransfer.ClipboardOwner"%>
<%@page import="com.DAO.replyDAO"%>
<%@page import="com.VO.WriteVO"%>
<%@page import="com.VO.MemberVO"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="com.VO.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.VideoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel='stylesheet' href='CSS/movie/movie_detail.css'>
</head>
<body>
<div data-include-path="header.jsp"></div>

	<script>
		function includeHTML() {
			var z, i, elmnt, file, xhttp;
			z = document.getElementsByTagName("*");
			for (i = 0; i < z.length; i++) {
				elmnt = z[1];
				file = elmnt.getAttribute("include-html");
				if (file) {
					xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
						if (this.readyState == 4 && this.status == 200) {
							elmnt.innerHTML = this.responseText;
							elmnt.removeAttribute("include-html");
							includeHTML();
						}
					}
					xhttp.open("GET", file, true);
					xhttp.send();
					return;
				}
			}
		}

		includeHTML();
	</script>

	<%
	VideoVO vo = (VideoVO)session.getAttribute("vvo");
	MemberVO vo1 = (MemberVO)session.getAttribute("vo");
	String year = vo.getUpload_date();
	String content = vo.getVideo_content();
	String content1 = content.replace(".", ".<br>");
	String video_seq = vo.getVideo_filename();
	replyDAO rdao = new replyDAO();
	ArrayList<replyVO> al = rdao.rselect(video_seq);
	
	System.out.print(al.size());
	WriteVO vo2 = (WriteVO)session.getAttribute("vo2");
	%>
	<section class="movie_serch1">
	
		<div id="contents">
			<div class="wrap-movie-detail" id="select_main">
				<div class="tit-heading-wrap">
					<h3>영화상세</h3>
				</div>
			</div>
			<div class="sect-base-movie">
				<div class="box-image">
					<span class="thumb-image"><img src="img/poster/<%out.print(vo.getVideo_filename());%>.jpg" alt=""></span>
				</div>
			</div>
			<div class="box-contents">
				<div class="title">
					<strong><%out.print(vo.getVideo_title());%></strong>
				</div>
			</div>
			<div class="spec">
				<dl>
					<dt>배우 : <%out.print(vo.getActor());%></dt>
					<dt>장르 : <%out.print(vo.getGenre());%></dt>
					<dt>시간 : <%out.print(vo.getRunning_time());%></dt>
					<dt>개봉 : <%out.print(year.substring(2,6)+"년");%></dt>
				</dl>
			<div class="icon">
				<%
				String str = vo.getOtt_platform();
				if (str.contains("N")){
					out.print("<a href='#'><img src='img/icon/netflic.png'></a>");
				}
				if (str.contains("H")){
					out.print("<a href='#'><img src='img/icon/watha.png'></a>");
				}
				if (str.contains("W")){
					out.print("<a href='#'><img src='img/icon/wavve.png'></a>");
				}
					%>
            </div>
			</div>
			<br>
			<div class="box-story-top">
				<h3>줄거리</h3>
			</div>
			<div class="sect-story-movie">
				<br>
				<P>
					<STRONG><EM><SPAN style="FONT-FAMILY: sans-serif">
								<%out.print(content1);%></SPAN></EM></STRONG>
				</P>
				<br>
			</div>
		</div>
			<form action="commentCon">
              <div class="CommentBox">
                <div class="comment_option">
                    <h3 class="comment_title"> 댓글 </h3>
           
                </div>
                <%if(al.size()==0){
                           
                 }else{%>
                <ul class="comment_list">
                    <li class="CommentItem">
                        <div class="comment_area">
                        <%for(replyVO reply:al){ %>
                            <div class="comment_box">
                                <div class="comment_nick_box">
                                    <div class="comment_nick_info">
                                        <a href="#" role="button" class="comment_nickname"> <%=reply.getNickname() %></a>
                                    </div>
                                    <div class="md">
                                        <a href="#" class="modify">수정</a>
                                        <a href="#" class="delete">삭제</a>
                                    </div>
                                 
                                </div>
                                <div class="comment_text_box">
                                    <p class="comment_text_view">
                                        <span class="text_comment" > <%=reply.getReply_comment() %></span>
                                    </p>
                                </div>
                                <div class="comment_info_box">
                                    <span class="comment_info_date"><%=reply.getReg_date() %></span>
                                </div>
                            </div>
                            <%} %>
                        </div>
                    </li>
                </ul>
                     <% } %>
                
                       <%if(vo1==null){
                           
                        }else{%>
                <div class="CommentWriter">
                    <div class="comment_inbox"> 
                        <strong class="blind">댓글을 입력하세요</strong>
                        <em class="comment_inbox_name"></em>
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
        </div>
</form>
	</section>








	<div data-include-path="footer.html"></div>

	<script>
		window.addEventListener('load', function() {
			var allElements = document.getElementsByTagName('*');
			Array.prototype.forEach.call(allElements, function(el) {
				var includePath = el.dataset.includePath;
				if (includePath) {
					var xhttp = new XMLHttpRequest();
					xhttp.onreadystatechange = function() {
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

</body>
</html>