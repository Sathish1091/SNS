<!DOCTYPE html>
<head>
	<script type = "text/javascript"  src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
	
	function loadProductPage() {
		window.location.href = 'http://localhost:8084/ProductCatalog/homeController/getProductListPage'
	} 
	
	function updateProduct() {
		var formData = {
				"productName" : document.getElementById('productName').value,
				"price" : document.getElementById('price').value,
				"category" : document.getElementById('category').value,
				"id" : document.getElementById('productId').innerHTML
		}
		
		$.ajax({
		      type: 'POST',
		      url: "http://localhost:8084/ProductCatalog/product/updateProductDetails",
		      contentType : "application/json",
		      data : JSON.stringify(formData),
		      success: function(resultData) {
		    	  alert("Update Complete") 
			  }
		});
	} 
	
	function deleteProduct() {
		var formData = {
				"id" : document.getElementById('productId').innerHTML
		}
		
		$.ajax({
		      type: 'POST',
		      url: "http://localhost:8084/ProductCatalog/product/deleteProductDetails",
		      contentType : "application/json",
		      data : JSON.stringify(formData),
		      success: function(resultData) {
		    	  alert("Update Complete") 
			  }
		});
	} 
	
	</script>
</head>
<html lang="en">
	<body>
	    <a href="#" onclick="loadProductPage()">Load Product List</a></br> 
	        Product Id : <span id="productId">${productId}</span></br>
			Product Name : <input type = "text" id="productName" value="${productname}"></br>
			Price : <input type="number" id="price" value="${price}"></br>
			Category : <input type="text" id="category" value="${category}"></br>
			<button id="updateProduct" onClick="updateProduct()">Update</button>
			<button id="deleteProduct" onClick="deleteProduct()">Delete</button>
	</body>
</html>