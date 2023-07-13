<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: gwanii
  Date: 2023/07/13
  Time: 10:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        table, td, th {
            border : 1px solid black;
            border-collapse: collapse;
            margin: 20px auto;
        }
        td {
            width: 150px;
            height: 50px;
            padding: 5px;
            font-size: 20px;
            /* text-align: center; */
        }

        input , select {
            font-size: 20px;
        }
        .data_ui {
            /* width: 250px; */
            height: 50px;
        }

        button {
            font-size: 15px;
            margin: 5px;
        }


        #sending {
            text-align: center;
        }

        input.poster :disabled {
            background: gray;
        }

        #form {
            font-size: 30px;
        }

        #title {
            height: 80px;
            font-size: 50px;
        }
    </style>
</head>
<body>

<div id="container">
    <h1>BookList Page</h1>

    <table>
        <tr><th colspan="5" id="title">도서리스트</th></tr>
        <tr><td>순번</td><td>타이틀</td><td>저자</td><td>출판일</td><td></td></tr>
        <c:forEach var="book" items="${list}">
            <tr>
                <td>${book.bookSeq}</td>
                <td><a href="/books/${book.bookSeq}">${book.bookTitle}</a></td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookPublishedDate}</td>
                <td><button type="button" onclick="deleteBook(${book.bookSeq})">삭제</button></td>
            </tr>
        </c:forEach>
        <tr><td colspan="5"><a href="/books/register"><button>도서등록</button></a></td></tr>
    </table>
</div>

<script>
    async function deleteBook(bookSeq) {
        await fetch("/books/".concat(bookSeq), {
            method: "delete"
        }).then(response => {
            if(response.status === 200){
                location.href = "/books";
            } else {
                alert("삭제 실패");
            }
        })

    }
</script>

</body>
</html>
