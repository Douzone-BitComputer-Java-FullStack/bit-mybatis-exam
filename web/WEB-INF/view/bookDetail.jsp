<%--
  Created by IntelliJ IDEA.
  User: gwanii
  Date: 2023/07/13
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<h1>도서 상세</h1>
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
          <p>${book.bookIsbn}</p>
        </td>
        <td>
        </td>
      </tr>`

      <tr>
        <td>도서명</td>
        <td colspan="2">
          <p>${book.bookTitle}</p>
        </td><td></td>
      </tr>

      <tr>
        <td>저자/역자</td>
        <td colspan="2">
          <p>${book.bookAuthor}</p>
        </td><td></td>
      </tr>

      <tr>
        <td>출판일</td>
        <td colspan="2">
          <p>${book.bookPublishedDate}</p>
        </td>
        <td></td>
      </tr>

      <tr>
        <td>도서위치</td>
        <td colspan="2">
          ${book.bookPosition.equals("BS-0001")?"일반서가":""}
          ${book.bookPosition.equals("BS-0002")?"예약서가":""}
          ${book.bookPosition.substring(0,3).equals("BB-")?"회원":""}
        </td>
        <td></td>
      <tr>


      <tr>
        <td>도서상태</td>
        <td colspan="2">
          ${book.bookStatus.equals("BM-0001")?"도서대출서비스":""}
          ${book.bookStatus.equals("BM-0002")?"도서수선":""}
          ${book.bookStatus.equals("BM-0003")?"도서보관":""}
        </td>
        <td></td>
      <tr>
    </tbody>
  </table>
  <div style="display: flex; align-items: center; justify-content: center">
    <a href="/books/${bookSeq}/modify" style="margin-right: 10px">수정화면으로</a>
    <a href="/books">도서리스트</a>
  </div>
</body>
</html>
