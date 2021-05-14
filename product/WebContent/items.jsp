<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	//Initialize.............
	session.setAttribute("statusMsg", "");
	System.out.println("Trying to process..");

	//Save---------------------------------
	if (request.getParameter("itemCode") != null) {
		Item itemObj = new Item();
		
		String stsMsg = "";
		//Insert--------------------------
		if (request.getParameter("hidItemIDSave") == "") {
			stsMsg = itemObj.insertItem(request.getParameter("itemCode"), request.getParameter("itemName"),
					request.getParameter("itemPrice"), request.getParameter("itemDesc"));
		} else//Update----------------------
		{
			stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"), request.getParameter("itemCode"),
					request.getParameter("itemName"), request.getParameter("itemPrice"),
					request.getParameter("itemDesc"));
		}
		session.setAttribute("statusMsg", stsMsg);
	}
	//Delete-----------------------------
	if (request.getParameter("hidItemIDDelete") != null) {
		Item itemObj = new Item();
		String stsMsg = itemObj.deleteItem(request.getParameter("hidItemIDDelete"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/items.js"></script>
</head>
<body>
	<div class="container">
		<div class="raw">
			<div class="col-6">

				<h1>Product Management</h1>

				<form id="formItem" name="formItem" method="post" action="items.jsp">
					Item code: <input id="itemCode" name="itemCode" type="text"
						class="form-control form-control-sm"> <br> Item name:
					<input id="itemName" name="itemName" type="text"
						class="form-control form-control-sm"> <br> Item
					price: <input id="itemPrice" name="itemPrice" type="text"
						class="form-control form-control-sm"> <br> Item
					description: <input id="itemDesc" name="itemDesc" type="text"
						class="form-control form-control-sm"> <br> <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidItemIDSave" name="hidItemIDSave" value="">
				</form>
				
				<div id="alertSuccess" class="alert alert-success">
				  <%
				       out.print(session.getAttribute("statusMgs"));
				  %>
				  </div>
				  <div id="alertError" class="alert alert-danger"></div>div>
				  
				  <br>
				  <%
				     Item itemObj = new Item();
				     out.print(itemObj.readItems());
				  %> 
				  
				  
				  </div>
				  
				</div>
				
			</div>
				 
</body>
</html>