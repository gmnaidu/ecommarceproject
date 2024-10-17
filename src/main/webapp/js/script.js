

function add_to_cart(pId,pName,pPrice){
	
	let cart= localStorage.getItem("cart");
	
	
	if(cart == null){
		
		// no cart yet
		let products =[];
		let product ={productId:pId, productName:pName, productQuantity:1, productPrice:pPrice};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		console.log("first time product added");
		
		
		
	}else{
		
		// cart is already present
		let pcart= JSON.parse(cart);

        let oldProduct = pcart.find((item) => item.productId == pId);
		
		if(oldProduct){
			
			// increase the cart by 1
            oldProduct.productQuantity = oldProduct.productQuantity+1;
			console.log('quantity increased')
           
              pcart.map((item)=>{
              if(item.productId == oldProduct.productId){
                
                 item.productQuantity =oldProduct.productQuantity;
              }
            })
			
			localStorage.setItem("cart",JSON.stringify(pcart));
			
			

			
		}else{
			
			// added to cart
			let product ={productId:pId, productName:pName, productQuantity:1, productPrice:pPrice};
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log('new item added')


			
		}
		
		
	}
	
	updateCart();
	
}

// update cart

function updateCart(){
	
	let cartString= localStorage.getItem("cart");
	let cart = cartString ? JSON.parse(cartString) : [];


     if(cart == null || cart.length == 0){
      
        console.log("cart is empty !!");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>cart does not have any Items</h3>")
		$(".checkout-btn").attr('disabled',true);

     }else{
		// some thing in the cart
		console.log(cart);
		$(".cart-items").html(`( ${cart.length} )`);
		
		let table =`
		    <table class="table">
			<thead class="thread-light">
			
			  <tr>
			  
			    <th>Item Name</th>
				<th>price</th>
				<th>Quantity</th>
				<th>Total Price</th>
				<th>Action</th>
				
			  
			  </tr>
			
			</thead>
		
		
		
		`;
		
		let totalPrice=0;
		
		cart.map((item)=>{
			
			table += `
			
			<tr>
			
			  <td>${item.productName}</td>
              <td>${item.productPrice}</td>
              <td>${item.productQuantity}</td>
              <td>${item.productPrice* item.productQuantity}</td>
			  <td><button  onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
			  
			<tr>
			
			`;	
			
			totalPrice += item.productPrice* item.productQuantity;
			
		});
		  
		table =table + `
		
		<tr><td colspan ='5' class="text-right font-weight-bold m-5"  >Total Price : ${totalPrice}</td><tr>
		
		</table>`;
		
		$(".cart-body").html(table);
		$(".checkout-btn").attr('disabled',false);
		
	 }
	
	
}

function deleteItemFromCart(pId){
	
	let cart= JSON.parse(localStorage.getItem("cart"));
	
	let newCart = cart.filter((item)=> item.productId != pId)
	
	localStorage.setItem("cart",JSON.stringify(newCart));
	
	updateCart();
	
	
	
}

 $(document).ready(function(){
 	updateCart();
})



function checkoutPage(){
	window.location="checkout.jsp";
}


























