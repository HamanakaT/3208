<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="beans.Article" %>
<%@ page import="java.sql.Timestamp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article list page</title>
<style>
    /* 簡単なスタイル */
    .article-card {
        border: 1px solid #ccc;
        padding: 16px;
        margin-bottom: 16px;
        border-radius: 8px;
        box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.1);
    }
    .article-card h3 {
        margin: 0 0 8px;
    }
    .like-button {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 8px 12px;
        border-radius: 4px;
        cursor: pointer;
    }
    .like-button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <h1>記事一覧</h1>
    <a href="./UpdateUserPageServletAns">ユーザ情報更新</a><br><br>
    <a href="./EntryArticlePageServlet">新規記事登録</a><br><br>

    <% List<Article> aList = (List<Article>) (request.getAttribute("articleList")); %>

    <% if (aList != null && !aList.isEmpty()) { %>
        <% for (Article a : aList) { %>
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
