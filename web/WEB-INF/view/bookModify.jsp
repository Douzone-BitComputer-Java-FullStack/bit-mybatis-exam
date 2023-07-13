<%--
  Created by IntelliJ IDEA.
  User: gwanii
  Date: 2023/07/13
  Time: 1:02 PM
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
            width: 350px;
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

        #message {
            color: red;
        }
    </style>
</head>
<body>

<h1>도서 수정</h1>
<form action="/books/${book.bookSeq}/modify" method="post" id='frm'>

    <table>
        <thead>
        <th>구분</th>
        <th colspan="2">내용</th>
        <th>비고</th>
        </thead>
        <tbody>
        <tr>
            <td>도서번호</td>
            <td colspan="2">
                <p>${book.bookSeq}</p>
                <input type="hidden" name="bookSeq" value="${book.bookSeq}">
            </td>
            <td></td>
        </tr>

        <tr>
            <td>ISBN</td>
            <td colspan="2">
                <input type="text" value="${book.bookIsbn}" name="bookIsbn" readonly>
            </td>
            <td>
            </td>
        </tr>`

        <tr>
            <td>도서명</td>
            <td colspan="2">
                <input type="text" value="${book.bookTitle}" name="bookTitle">
            </td>
            <td></td>
        </tr>

        <tr>
            <td>저자/역자</td>
            <td colspan="2">
                <input type="text" value="${book.bookAuthor}" name="bookAuthor">
            </td>
            <td></td>
        </tr>

        <tr>
            <td>출판일</td>
            <td colspan="2">
                <input type="text" value="${book.bookPublishedDate}" name="bookPublishedDate">
            </td>
            <td></td>
        </tr>

        <tr>
            <td>도서위치</td>
            <td colspan="2">
                <select name="bookPosition">
                    <option value='BS'>--도서 위치--
                    <option value='BS-0001' ${book.bookPosition.equals("BS-0001")?"selected":""}>일반서가
                    <option value='BS-0002' ${book.bookPosition.equals("BS-0002")?"selected":""}>예약서가
                    <option value='BB-' ${book.bookPosition.substring(0,3).equals("BB-")?"selected":""}>회원
                </select>
            </td>
            <td>
            </td>
        <tr>

        <tr>
            <td>도서상태</td>
            <td colspan="2">
                <select name="bookStatus">
                    <option value='BM'>--도서 상태--
                    <option value='BM-0001' ${book.bookStatus.equals("BM-0001")?"selected":""}>도서대출서비스
                    <option value='BM-0002' ${book.bookStatus.equals("BM-0002")?"selected":""}>도서수선
                    <option value='BM-0003' ${book.bookStatus.equals("BM-0003")?"selected":""}>도서저장고
                </select>
            </td>
            <td></td>
        <tr>
        </tbody>
    </table>

    <div style="display: flex; align-items: center; justify-content: center">
        <button type="submit">수정</button>
        <a href="/books">도서리스트</a>
    </div>
</form>


</body>
</html>
