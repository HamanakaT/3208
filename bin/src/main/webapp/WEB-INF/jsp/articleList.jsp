<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="beans.Article" %>
<%@ page import="java.sql.Timestamp" %>

<%
    String loggedInUserId = (String) session.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article list page</title>
...
</head>
<body>
    <h1>記事一覧</h1>
    <a href="./UpdateUserPageServletAns">ユーザ情報更新</a><br><br>
    <a href="./EntryArticlePageServlet">新規記事登録</a><br><br>

    <% List<Article> aList = (List<Article>) (request.getAttribute("articleList")); %>

            <div class="article-card">
                <h3>タイトル: <%= a.getTitle() %></h3>
                <p><strong>本文:</strong><br><%= a.getBody() %></p>
                <p><strong>登録者:</strong><br><%= a.getEditorId() %></p>
                <% SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
                <p><strong>登録日時:</strong><br><%= sdf.format(a.getEntryDatetime()) %></p>
                
                <!-- いいねボタン -->
                <form action="./LikeArticleServlet" method="GET" style="margin-top: 8px;">
                    <input type="hidden" name="articleId" value="<%= a.getId() %>">
                    <button type="submit" class="like-button">いいね</button>
                </form>
            </div>
        <% } %>
    <% } else { %>
        <p>記事が存在しません。</p>
    <% } %>
</body>
</html>
