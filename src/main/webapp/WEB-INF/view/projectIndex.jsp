<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix='form' uri='http://www.springframework.org/tags/form'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<style>
body {
	margin: 2em;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Project Management</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<div style="margin-left: 30px; margin-right: 30px; margin-top: 30px;">
		<h3>PROJECTS</h3>
		<security:authorize access="hasAnyRole('ROLE_ADMIN')">
			<a class="btn btn-primary" href="/project/createProject"> <i
				class="fa fa-plus"></i> <span>ADD PROJECT</span>
			</a>
			<br />
		</security:authorize>
		<div class="box-item">
			<table id="example" class="table table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Title</th>
						<th>Description</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Creator</th>
						<th>Leader</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="project" items="${projects}">
						<tr>
							<td>${project.title}</td>
							<td>${project.description}</td>
							<td>${project.startDate}</td>
							<td>${project.endDate}</td>
							<td>${project.creator.firstName}</td>
							<td>${project.leader.firstName}</td>
							<td><a class="btn btn-sm btn-primary"
								href="/project/editProject/${project.projectId}"
								id="+ 'project_id_' + ${project.projectId} + '_edit'"> <i
									class="fa fa-edit"></i>
							</a> <a class="btn btn-sm btn-primary"
								href="/project/viewProject/${project.projectId}"
								id="+ 'project_id_' + ${project.projectId} + '_view'"> <i
									class="fa fa-eye"></i>
							</a> <form:form action="/project/deleteProject" method="POST"
									name="someForm" modelAttribute="project">
									<input type="hidden" class="form-control " name="projectId"
										value="${project.projectId}" />
									<button type="submit" class="btn btn-sm btn-primary">
										<i class="fa fa-trash"></i>
									</button>
								</form:form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var element = document.getElementById("projectManagementHeader");
		element.classList.add("active");
	});
</script>
</html>
