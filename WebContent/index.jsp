<!DOCTYPE html>
<head>
	<script type = "text/javascript"  src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script>
	function saveProduct() {
		var formData = {
				"productName" : document.getElementById('productName').value,
				"price" : document.getElementById('price').value,
				"category" : document.getElementById('category').value
		}
		
		$.ajax({
		      type: 'POST',
		      url: "http://localhost:8084/ProductCatalog/product/saveProductDetails",
		      contentType : "application/json",
		      data : JSON.stringify(formData),
		      success: function(resultData) {
		    	  alert("Save Complete") 
			  }
		});
	}
	
	function loadProductPage() {
		window.location.href = 'http://localhost:8084/ProductCatalog/homeController/getProductListPage'
	} 
	</script>
</head>
<html lang="en">
	<body>
	    <a href="#" onclick="loadProductPage()">Load Product List</a></br> 
		
			Product Name : <input type = "text" id="productName"></br>
			Price : <input type="number" id="price"></br>
			Category : <input type="text" id="category"></br>
			<button id="saveProduct" onclick="saveProduct()">Submit</button>
		
		
	</body>
</html>