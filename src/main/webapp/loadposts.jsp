<%@page import="java.util.*"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.dao.LikeDao"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.entities.User"%>
<%

	User user = (User)session.getAttribute("currentUser");
	if(user==null){
		response.sendRedirect("loginpage.jsp");
	}

%>
<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	PostDao pd = new PostDao(ConnectionProvider.getConnection());
	List<Post> posts = new ArrayList<Post>();
	if(cid==0){
		posts = pd.getAllPosts();
	}
	else{
		posts = pd.getPostsByCatId(cid);
	}
	if(posts.size()==0){
		out.println("<h4 class='display-4 text-center'>No posts made in this category yet</h4>");
	}
	for(Post p:posts){
%>
	<div class="col-md-5 mt-2">
	
		<div class="card">
		
			<img class="card-img-top" src="postpics/<%= p.getpPic()%>" alt="Card image app">
			<div class="card-body">
				<b><%= p.getpTitle() %></b>
				<p><%= p.getpContent() %></p>
			</div>
			<div class="card-footer primary-background text-center">
				<%
					LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());	
					String outline = "dark";
					if(ldao.isLikedByUser(p.getPid(), user.getId())){
						outline = "light";
					}
				%>
				<a href="#!" onclick="doLike(<%= p.getPid() %>, <%= user.getId() %>)" class="btn btn-outline-<%= outline %> text-white btn-sm" id="likebtn<%=p.getPid() %>"><i class="fa fa-thumbs-o-up"><span class="likecounter<%= p.getPid()%>"><%= ldao.countLikesOnPost(p.getPid()) %></span></i></a>
				<a href="showblogpost.jsp?postId=<%= p.getPid() %>" class="btn btn-outline-dark text-white btn-sm">Read more</a>
				<a href="#!" class="btn btn-outline-dark text-white btn-sm"><i class="fa fa-comments"><span>10</span></i></a>
			</div>
		</div>
	
	</div>
	
<%		
	}

%>