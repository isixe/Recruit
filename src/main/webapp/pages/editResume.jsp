<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<style>
			.container {
				width: 100%;
				height: 100%;
				display: flex;
				flex-direction: column;
				justify-content: space-around;
				align-items: center;
			}

			.form-container {
				width: 35%;
				height: 100%;
				border: 10px solid #A2A2A2;
			}

			.title {
				width: 100%;
				height: 30px;
				font-weight: 800;
				font-size: 20px;
				background-color: #009774;
				color: white;
				line-height: 30px;
				padding-left: 5px;
				box-sizing: border-box;
			}

			form {
				width: 100%;
				height: 100%;
			}

			form>div {
				margin: 20px;
				background-color: #F9F9F9;
				padding: 8px;
			}

			.btn {
				width: 30%;
				height: 50px;
				background-color: #009774;
				color: #F9F9F9;
				border-radius: 30px;
				border: 0px;
			}

			.btn:hover {
				background-color: green;
				cursor: pointer;
			}
			.btn_container{
				width: 100%;
				display: flex;
				flex-direction: row;
				justify-content: center;
				margin-bottom: 10px;
			}
		</style>
	</head>

	<body>
		<div class="container">
			<div class="form-container">
				<div class="title">我的简历修改</div>
				<form action="editResumeServlet">
					<input hidden name="uid" value="${resume.userid}">
					<div>
						<label for="name">名字：</label>
						<input type="text" name="name" id="name" value="${resume.name}">
					</div>
					<div>
						<label>性别：</label>
						<c:choose>
							<c:when test="${resume.sex == '男'}">
								<input type="radio" name="sex" value="男" checked>男
								<input type="radio" name="sex" value="女">女
							</c:when>
							<c:when test="${resume.sex == '女'}">
								<input type="radio" name="sex" value="男">男
								<input type="radio" name="sex" value="女" checked>女
							</c:when>
						</c:choose>
					</div>
					<div>
						<label for="education">学历：</label>
						<input type="text" name="education" id="education" value="${resume.education}">
					</div>
					<div>
						<label for="graduated_school">毕业学校：</label>
						<input type="text" name="school" id="graduated_school" value="${resume.school}">
					</div>
					<div>
						<label for="job_exp">工作经验：</label>
						<input type="text" name="workexp" id="job_exp" value="${resume.workexp}">
					</div>
					<div>
						<label for="email">电子邮箱：</label>
						<input type="text" name="email" id="email" value="${resume.email}">
					</div>
					<div>
						<label for="tel">电话：</label>
						<input type="text" name="phone" id="tel" value="${resume.phone}">
					</div>
					<div>
						<label for="expect_salary">期望工作：</label>
						<input type="text" name="hope" id="expect_salary" value="${resume.hope}">
					</div>
					<div>
						<label for="projectexp">项目经验：</label>
						<textarea name="projectexp" id="projectexp" cols="35" rows="5">${resume.projectexp}</textarea>
					</div>
					<div class="btn_container">
						<button class="btn">修改</button>
					</div>
				</form>
			</div>
		</div>

	</body>

</html>