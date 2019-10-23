<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addnews.jsp' starting page</title>
    
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
						<div class="col-sm-4 col-sm-offset-3">
						  <h2>新闻添加页面</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 col-sm-offset-2">
							新闻分类编号：
						</div>
						<div class="col-sm-2">
							<select id="categoryId">
							  <option value ="0" selected>请选择新闻分类</option>
							   <c:forEach items="${list}" var="list">
  								 <c:if test="${list!=null}">
							  <option value ="${list.id}">${list.name}</option>
							 	 </c:if>
  							 	</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 col-sm-offset-2" >
							新闻标题:
						</div>
						<div class="col-sm-2">
							<input name="title" id="title" type="text" class="form-control">
						</div>
						<div class="col-sm-2" id="aa" style="color: red">
						
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 ">
							新闻摘要：
						</div>
						<div class="col-sm-2">
							<textarea rows="5" cols="50" id="summary" name="summary"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 col-sm-offset-2">
							作者：
						</div>
						<div class="col-sm-2">
							<input name="author" id="author" type="text" class="form-control">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-2 col-sm-offset-2">
						<input type="button" id="addOk" value="添加">
						</div>
			</div>
			</div>
	<script type="text/javascript" >
		 $("document").ready(function(){
			 $("#categoryId").blur(function(){
			   var no=$("#categoryId").val();
			   $.ajax({
					       type:"post",
					       url:"${pageContext.request.contextPath }/new/findid",
					       data:{
					           fightNo:no
					       },
					       dataType:"json",
					       success:function(data){
					          if(data>0){
								  $("#aa").html("新闻标题已存在，请重新输入");
								      
								}else {
		                             $("#aa").html("新闻标题可用");
		                        }
					       },
					       error:function(){
					       layer.msg('ajax执行错误！', {icon: 2,time: 1000});
					       }
					  });
			 }); 
		 });
	</script>	
	<script type="text/javascript" >
		 $("document").ready(function(){
		 function add(){
				var categoryId=$("#categoryId :selected").val();
				var title=$("#title").val();
				var author=$("#author").val();
				if(categoryId==0){
				
				alert("请选择新闻分类编号");
				return false;
				}
				if(title==0){
				alert("新闻标题不能为空");
				return false;
				}
				if(author==0){
				alert("作者不能为空");
				return false;
				}
				return true;
			}
			$("#addOk").click(function(){
			  if(add()==true){
			  $.ajax({
					       type:"post",
					       url:"${pageContext.request.contextPath }/new/addNews",
					       data:{
					         categoryId:$("#categoryId :selected").val(),
					          title:$("#title").val(),
							 summary:$("#summary").val(),
							 author:$("#author").val(),
					       },
					       dataType:"json",
					       success:function(data){
					          if(data>0){
								 alert('添加成功');
								      
								        history.back(-1).reload();//返回上一页
								      
								}else {
		                            alert('添加失败');
								      
								        history.back(-1).reload();//返回上一页
		                        }
					       },
					       error:function(){
					       layer.msg('ajax执行错误！', {icon: 2,time: 1000});
					       }
					  });
			  }
			});
		 }); 
	</script>		 	 
  </body>
</html>
