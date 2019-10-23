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
    
    <title>My JSP 'findnews.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/bots335/css/bootstrap.min.css" type="text/css"></link>    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/bots335/css/bootstrap-theme.min.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/bots335/js/bootstrap.min.js"></script>
    <style type="text/css">
    	label span{
    		color:red;
    	}
    	label{
    		font-weight:normal;
    	}
    </style>
  </head>
  
  <body>
    <div class="container"> 
    	<div class="row" style="background-color:yellow">
    	<div class="col-sm-1" style="padding-top:10px">新闻分类:</div>
            <div class="col-sm-2">
                <select id="categoryId" name="newsb" class="form-control">
                    <option value="0">全部</option>
                    <c:forEach items="${list}" var="newsb">
						<option value="${newsb.id}">${newsb.name}</option>
					</c:forEach>
                </select>
            </div>
    	<div class="col-sm-1" style="padding-top:10px">新闻标题:</div>
            <div class="col-sm-2">
   		 		<input type="text" class="form-control" id="title" name="title" placeholder="请输入新闻标题">
   		    </div>
   		<div class="col-sm-2">
            <button type="button" class="btn btn-primary" id="btnOk">查询</button>
                <a href="${pageContext.request.contextPath }/new/showaddNews" class="btn btn-primary">添加</a>
        </div>
   	</div>
   	<div class="row" id="b">
            <div class="col-sm-12">
                <table class="table table-hover table-bordered table-condensed" id="table">
					  <caption><h1 style="text-align:center">新闻列表</h1></caption>
					  <thead>
					    <tr class="success">
					      <th>新闻编号</th>
					      <th>新闻标题</th>
					      <th>新闻摘要</th>
					      <th>作者</th>
					      <th>创建时间</th>
					      <th>操作</th>
					    </tr>
					  </thead>
					  <tbody id="a" style="text-align: center;">
						   
					  </tbody>
					</table>
            </div>
        </div>
  </body>
</html>
<script type="text/javascript">
    $("document").ready(function(){
        $("#btnOk").click(function(){  
            $.ajax({ 
                type:"post",
                url:"${pageContext.request.contextPath }/new/findNews",
                data:{
                   categoryId:$("#categoryId").val(),
                   title:$("#title").val()
                },
                dataType:"JSON",
                success:function(data){

                        var h="";
                        $.each(data,function(a,b){
                            h=h+"<tr>";
				              
					          h=h+"<td>"+b.categoryId+"</td>";
					          h=h+"<td>"+b.title+"</td>";
					          h=h+"<td>"+b.summary+"</td>";
					          h=h+"<td>"+b.author+"</td>";
					          h=h+"<td>"+b.createDate+"</td>";
					           h=h+"<td><a href='${pageContext.request.contextPath }/new/showupdNews?id="+b.id+"' class=\"btn btn-warning\">修改</a>&nbsp;&nbsp;<a href=javascript:del("+b.id+") onclick=\"if(confirm('确认要删除吗？')==false)return false;\" class=\"btn btn-danger\">删除</a></td>";
					        h=h+"</tr>";
                        });
                        $("#a").html(h);
                },
                error:function(){
                    alert("ajax错误");
                }
            });
        });
    });
    //删除
		function del(id){
			$.ajax({
				type:"post",//提交方式
				url:"${pageContext.request.contextPath }/new/delNews",//提交数据的路径
				data:{
					id:id
				},//提交的数据
				dataType:"json",//返回数据的格式
				success:function(data){
					if(data>0){
						alert("删除成功！");
						window.location.href="${pageContext.request.contextPath }/new/showfindNews";
					}else{
						alert("删除失败！");
					}
				},
				error:function(){
					alert("ajax错误！");
				}
			});
		}
</script>
