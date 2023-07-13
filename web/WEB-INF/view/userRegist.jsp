<%--
  Created by IntelliJ IDEA.
  User: gwanii
  Date: 2023/07/12
  Time: 10:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>

    <style>
        table {
            collapse: none;
        }

        .warning {
            color: red;
        }
    </style>
</head>
<body>
<div id="container">
    <form action="/users/reigst" method="post">
    <div>
        <table border="1">
            <thead>
                <th>구분</th>
                <th>데이터 입력</th>
                <th>유효성 검사</th>
                <th>비고</th>
            </thead>

            <tbody>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="userId" placeholder="Input Your Id">
                        <button type="button" id="idDuplicationCheck">아이디 확인</button>
                    </td>
                    <td>5자리이상, 첫글자 영문소문자</td>
                    <td>
                        <p class="warning" id="message1"></p>
                    </td>
                </tr>

                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="userPass" id="password">
                    </td>
                    <td>비밀번호 일치</td>
                    <td>
                        <p class="warning" id="message2"></p>
                    </td>
                </tr>

                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" id="passwordCheck">
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td>
                        <span>남</span>
                        <input type="radio" name="isMan" value="1">
                        <span>여</span>
                        <input type="radio" name="isMan" value="0">
                    </td>
                </tr>

                <tr>
                    <td>관심분야</td>
                    <td>
                        <spa>문학</spa>
                        <input type="checkbox" name="interesting" value="문학">
                        <span>어학</span>
                        <input type="checkbox" name="interesting" value="어학">
                        <span>IT</span>
                        <input type="checkbox" name="interesting" value="IT" checked>
                        <span>과학</span>
                        <input type="checkbox" name="interesting" value="과학">
                        <span>수학</span>
                        <input type="checkbox" name="interesting" value="수학">
                        <span>예술</span>
                        <input type="checkbox" name="interesting" value="예술">
                    </td>
                    <td>2~3개 사이 선택</td>
                    <td>
                        <p class="warning" id="message4"></p>
                    </td>
                </tr>

                <tr>
                    <td>자기소개</td>
                    <td>
                        <textarea name="userIntroduce"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div>
        <input type="hidden" id="flag" value="false">
        <button type="submit" id="submit">가입</button>
    </div>
    </form>


</div>

<script>


    document.querySelector("#idDuplicationCheck").addEventListener("click", () => {
        let userId = document.querySelector("input[name=userId]").value;
        console.log(userId);
        let alpha = 'abcdefghijklmnopqrstuvwxyz';
        let message = "";
        if(userId.length >= 5 && alpha.includes(userId.charAt(0))){

            const url = "/users/checkId?userId=";
            fetch(url.concat(userId))
                .then(response => {
                    console.log(response.status)
                    if (response.status !== 200) {
                        message += '중복된 아이디가 존재합니다.';
                        document.querySelector("#message1").innerHTML = message;
                    } else {
                        message += '사용할 수 있는 아이디 입니다.';
                        document.querySelector("#message1").innerHTML = message;
                        document.querySelector("#flag").value = true;
                    }
                });

        } else {
            message += 'id가 비어있거나 형식에 맞지 않습니다.';
            document.querySelector("#message1").innerHTML = message;
        }
    })


    let checkId = function(){
        return document.querySelector("#flag").value;
    }

    let validateData = function(){
        let flag = false;
        if(checkId() == 'true'){
            flag = true;
        } else {
            document.querySelector("#message1").innerHTML = 'id가 비어있거나 형식에 맞지 않습니다.';
        }
        return flag;
    };

    let confirm = () => {
        let result = false;

        let pwd = document.querySelector("#password").value;
        let pwd2 = document.querySelector("#passwordCheck").value;
        const messageTag = document.querySelector("#message2");
        let message = '';

        if (pwd === null || pwd === '') {
            message += "비번이 비었습니다.";
            messageTag.innerHTML = message;
            return result
        }

        if (pwd2 !== pwd) {
            message += "비밀번호가 일치하지 않습니다";
            messageTag.innerHTML = message;
        } else {
            messageTag.innerHTML = '';
            result = true;
        }

        return result;
    };

    let count = function(){
        let result = false;
        const checkedBoxList = document.querySelectorAll("input[name=interesting][type=checkbox]:checked");

        console.log("checkedBoxList" + checkedBoxList);
        if (checkedBoxList.length === 2 || checkedBoxList.length === 3) {
            result = true;
        } else {
            document.querySelector("#message4").innerHTML = "2~3개 선택해야 합니다.";
        }
        return result;
    };

    document.querySelector("#submit").addEventListener("click", (e)=> {
        let result = validateData();
        result = confirm() && result;
        result = count() && result;
        if(!result){
            e.preventDefault();
        }

        // $('#sending').on('click',function(e){
        //     let result = validateData();
        //     result = confirm() && result;
        //     result = count() && result;
        //     if(!result){
        //         console.log("prevent");
        //         e.preventDefault();
        //     }
        // });
    });
</script>

</body>
</html>
