<%--
  Created by IntelliJ IDEA.
  User: gwanii
  Date: 2023/07/13
  Time: 11:05 AM
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

        button {
            font-size: 15px;
            margin: 5px;
        }


        #sending {
            text-align: center;
        }


        #form {
            font-size: 30px;
        }
    </style>
</head>
<body>
<form action="/books/register" method="post">
    <table>
        <tr><th colspan="4" id="form">도서등록</th></tr>
        <tr><th>구분</th><th class="data_ui" colspan="2">데이터입력</th><th>비고</th></tr>
        <tr>
            <td>도서번호</td>
            <td colspan="2">
                <input type="text" id="book_seq" name="bookSeq" disabled="disabled">
            </td>
            <td id="message">자동생성</td></tr>

        <tr>
            <td>ISBN</td>
            <td colspan="2">
                <input type="text" id="isbn" name="bookIsbn">
            </td>
            <td>
                <input type="hidden" id="flag" value="false">
            </td>
        </tr>
        <tr>
            <td>도서명</td>
            <td colspan="2">
                <input type="text" id="book_title" name="bookTitle">
            </td><td></td>
        </tr>
        <tr>
            <td>저자/역자</td>
            <td colspan="2">
                <input type="text" id="author" name="bookAuthor">
            </td><td></td>
        </tr>

        <tr>
            <td>출판일</td>
            <td colspan="2">
                <input type="text" id="publish_date" size="35" name="bookPublishDate">
            </td>
            <td></td>
        <tr>
        <tr>
            <td>도서위치</td>
            <td colspan="2">
                <select name="bookPosition"
                        style='background-color:#ababab'
                        onFocus='this.initialSelect = this.selectedIndex;'
                        onChange='this.selectedIndex = this.initialSelect;'>
                    <option value='BS'>--도서 위치--
                    <option value='BS-0001' selected>일반서가
                    <option value='BS-0002'>예약서가
                    <option value='BS-'>회원
                </select>
            </td>
            <td>기본값삽입</td>
        <tr>
        <tr>
            <td>도서상태</td>
            <td colspan="2">
                <select name="bookStatus"
                        style='background-color:#ababab'
                        onFocus='this.initialSelect = this.selectedIndex;'
                        onChange='this.selectedIndex = this.initialSelect;'>
                    <option value='BM'>--도서 상태--
                    <option value='BM-0001' selected >도서대출서비스
                    <option value='BM-0002'>도서수선
                    <option value='BM-0003'>도서저장고
                </select>
            </td>
            <td>기본값삽입</td>
        <tr>
        <tr>
            <td colspan="4" id="sending">
                <input type="submit" value="도서등록">
                <a href="/books">도서 리스트</a>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
