<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updnews.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="statics/bots335/css/bootstrap.min.css" type="text/css"></link>
	 <script type="text/javascript" src="statics/js/jquery-2.1.1.js" ></script>
	 <script type="text/javascript" src="statics/bots335/js/bootstrap.min.js" ></script>
	 <style type="text/css">
    	div{
    		margin:10px 0px 10px 0px;
    	}
    </style>
  </head>
  
  <body>
    <div class="container" >
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">更新新闻内容</div>
				<div class="col-sm-4"></div>
			</div>
			<hr />
			<div class="row">
				<div class="col-sm-1">
					新闻编号：
				</div>
				<div class="col-sm-2">
					<input id="id" name="id" type="text" class="form-control" value="${book.id }">
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-sm-1">
					新闻分类：
				</div>
				<div class="col-sm-2">
				<select id="categoryId" name="city" class="form-control">
					<option value="">全部</option>
					<c:forEach items="${list}" var="n">
						<option value="${n.id}" ${book.categoryId==n.id?'selected':''}>${n.name}</option>
					</c:forEach>
				</select>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-sm-1">
					新闻标题：
				</div>
				<div class="col-sm-2">
					<input id="title" name="title" type="text" class="form-control" value="${book.title }">
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-sm-1">
					新闻摘要：
				</div>
				<div class="col-sm-2">
					<textarea rows="5" cols="50" id="summary" name="summary">${book.summary }</textarea>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-sm-1">
					作者：
				</div>
				<div class="col-sm-2">
					<input id="author" name="author" type="text" class="form-control" value="${book.author }">
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-2">
					<input id="btnOk" type="button" value="提交" class="btn btn-primary">
					<input id="btnClo" type="button" value="返回" class="btn btn-primary">
				</div>
			</div>
		</div>

  </body>
</html>
<script type="text/javascript">
			$("document").ready(function(){
			var depar=$("#depar").val();
			$("[id='departureCity'] option[value='"+depar+"']").attr("selected","true");
			var arri=$("#arri").val();
			$("[id='arrivalCity'] option[value='"+arri+"']").attr("selected","true");
			});
</script>
<script type="text/javascript" >
		 $("document").ready(function(){
		 function add(){
				var title=$("#title").val();
				if(title==""){
				
					alert("新闻标题不能为空");
					return false;
				}
				return true;
			}
			$("#btnOk").click(function(){
			  if(add()==true){
			  $.ajax({
				type:"post",
				url:"${pageContext.request.contextPath }/new/updNews",
				data:{
					id:$("#id").val(),
					categoryId:$("#categoryId :selected").val(),
					title:$("#title").val(),
					summary:$("#summary").val(),
					author:$("#author").val(),
				},
				dataType:"json",
				success:function(data){
					if(data>0){
						alert('更改成功');
							history.back(-1).reload();//返回上一页
								      
					}else {
		                alert('更改失败');
							history.back(-1).reload();//返回上一页
		            }
				},
				error:function(){
					layer.msg('ajax执行错误！', {icon: 2,time: 1000});
				}
			});
		}
	});
}
);
	</script>	
