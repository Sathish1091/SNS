<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type = "text/javascript"  src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
	function loadProductDetails(id) {
		window.location.href = 'http://localhost:8084/ProductCatalog/homeController/fetchProduct/'+id
	}
	
	
	function fetchProductList() {
		$.ajax({
		      type: 'GET',
		      url: "http://localhost:8084/ProductCatalog/product/fetchProductList",
		      success: function(resultData) {
		    	  var content = "<table>"
		    		  content += '<tr><th>Product Id</th><th>Product Name</th><th>Product Price</th><th>Product Category</th></tr>';
		    		  for(i=0; i<resultData.length; i++){
		    		      content += '<tr><td> <a href="#" onclick="loadProductDetails('+resultData[i].id+')">' +resultData[i].id + '<a> </td><td>' + resultData[i].productName + '</td><td>' + resultData[i].price + '</td><td>' + resultData[i].category + '</td></tr>';
		    		  }
		    		  content += "</table>"
		    		  $('#here_table').append(content);
			  }
		});
	}
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onLoad="fetchProductList()">
<div id="here_table"></div>
</body>
</html>