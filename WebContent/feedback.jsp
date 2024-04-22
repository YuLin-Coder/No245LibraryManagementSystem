<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page
	import="com.rain.bean.AdminBean,com.rain.bean.HistoryBean,com.rain.dao.BookDao,com.rain.dao.AdminDao"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN" class="ax-vertical-centered">
<head>
<meta charset="UTF-8">
<title>图书馆管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="static/css/bootstrap.min.css">
<link rel="stylesheet" href="static/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<link rel="stylesheet" href="static/css/bootstrap-admin-theme.css">
<script src="static/js/bootstrap.min.js"></script>
<script src="static/jQuery/jquery-3.1.1.min.js"></script>
<script src="static/js/bootstrap-dropdown.min.js"></script>
<script src="static/js/reader.js"></script>
<script src="static/js/readerUpdateInfo.js"></script>
<script src="static/js/readerUpdatePwd.js"></script>
<style>
body {
	background-image: url("04.jpg");
}
</style>
</head>

<script src="static/js/jquery.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>

<body class="bootstrap-admin-with-small-navbar">
	<%
		AdminBean admin = new AdminBean();
		String aid = (String) session.getAttribute("aid");
		AdminDao admindao = new AdminDao();
		admin = admindao.get_AidInfo2(aid);
	%>
	<nav
		class="navbar navbar-inverse navbar-fixed-top bootstrap-admin-navbar bootstrap-admin-navbar-under-small"
		role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="collapse navbar-collapse main-navbar-collapse">
						<a class="navbar-brand" href="index.jsp"><strong>欢迎使用图书馆管理系统</strong></a>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" role="button"
								class="dropdown-toggle" data-hover="dropdown"> <i
									class="glyphicon glyphicon-user"></i> 欢迎您，<%out.write(admin.getName());%>
										(<%=session.getAttribute("aid")%>)
									<i class="caret"></i></a>
								<ul class="dropdown-menu">
									<li><a href="#updateinfo" data-toggle="modal">个人资料</a></li>
									<li role="presentation" class="divider"></li>
									<li><a href="#updatepwd" data-toggle="modal">修改密码</a></li>
									<li role="presentation" class="divider"></li>
									<li><a href="/books/login.jsp">退出</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">
		<!-- left, vertical navbar & content -->
		<div class="row">
			<!-- left, vertical navbar -->
			<div class="col-md-2 bootstrap-admin-col-left">
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/books/select.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 图书查询</a></li>
					<li><a href="/books/borrow.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 借阅信息</a></li>
					<li><a href="/books/history.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 借阅历史</a></li>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/books/bdtimes.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 热门推荐</a></li>
					<li><a href="/books/brtimes.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 最佳读者</a></li>
				</ul><br><br>
				<ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
					<li><a href="/books/feedback.jsp"><i
							class="glyphicon glyphicon-chevron-right"></i> 问题反馈</a></li>
				</ul>
			</div>

			<!-- content -->
			<div class="col-md-10">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default bootstrap-admin-no-table-panel">
							<div class="panel-heading">
								<div class="text-muted bootstrap-admin-box-title">问题反馈</div>
							</div>
							<div
								class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
								<form class="form-horizontal" action="/books/AddProblemServlet"
									method="post">
									<div class="col-lg-8 form-group">
										<label class="col-lg-4" for="query_bname">标题</label>
										<div class="col-lg-12">
											<input class="form-control" id="bookName" name="name"
												type="text" value="" required="required" placeholder="请勿超过30个字符">
											<label for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-8 form-group">
										<label class="col-lg-4" for="query_bname">问题页面</label>
										<div class="col-lg-12">
											<input class="form-control" id="bookName" name="page"
												type="text" value="" required="required" placeholder="books/XXX.jsp(仅填写XXX处)">
											<label for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-8 form-group">
										<label class="col-lg-4" for="query_bname">问题描述</label>
										<div class="col-lg-12">
											<textarea name="body" required="required" class="form-control" placeholder="请勿超过255个字符"
												style="height: 150px;resize: none;"></textarea>
											<label for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-8 form-group">
										<label class="col-lg-4" for="query_bname">联系方式</label>
										<div class="col-lg-12">
											<input class="form-control" id="bookName" name="phone"
												type="text" value="" required="required" placeholder="电话/邮箱">
											<label for="query_bname" style="display: none;"></label>
										</div>
									</div>
									<div class="col-lg-8 form-group">
										<label class="control-label" for="query_bname"></label>
										<button type="submit" class="btn btn-primary" id="btn_query">提 交</button>
										<label for="query_bname" style="display: none;"></label>&nbsp;
										<a href="/books/myproblem.jsp"><i
											class="glyphicon glyphicon-chevron-right"></i> 我的反馈</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-------------------------------------------------------------->

	<!-------------------------个人资料模糊框------------------------------------->

	<form class="form-horizontal" method="post"
		action="/books/AdminServlet">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updatepwd" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改密码</h4>
					</div>
					<div class="modal-body">

						<!--正文-->
						<input type="hidden" name="tip" value="1"> <input
							type="hidden" name="url" value="feedback">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">原密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="password"
									id="oldPwd" placeholder="请输入原密码"> <label
									class="control-label" for="oldPwd" style="display: none"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">新密码</label>
							<div class="col-sm-7">
								<input type="password" class="form-control" name="password2"
									id="newPwd" placeholder="请输入新密码"> <label
									class="control-label" for="newPwd" style="display: none"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="submit" class="btn btn-primary">修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</form>
	<!-------------------------------------------------------------->

	<!-------------------------个人资料模糊框------------------------------------->

	<form class="form-horizontal" method="post"
		action="/books/AdminServlet">
		<!--保证样式水平不混乱-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="updateinfo" tabindex="-1" role="dialog"
			aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="ModalLabel">个人资料</h4>
					</div>
					<div class="modal-body">

						<!--正文-->
						<input type="hidden" name="tip" value="2"> <input
							type="hidden" name="url" value="feedback">
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">真实姓名</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请输入您的真实姓名"
									value='<%out.write(admin.getName());%>'> <label
									class="control-label" for="name" style="display: none"></label>
							</div>
						</div>

						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">手机号</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="请输入您的手机号"
									value='<%out.write(admin.getPhone());%>'> <label
									class="control-label" for="phone" style="display: none"></label>
							</div>
						</div>
						
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">邮箱</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="请输入您的邮箱" value='<%out.write(admin.getEmail());%>'>
								<label class="control-label" for="email" style="display: none"></label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="submit" class="btn btn-primary">修改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</form>
</body>
</html>