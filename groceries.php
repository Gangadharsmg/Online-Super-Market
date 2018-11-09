<!DOCTYPE HTML>
<html>
<head>
<title>Online Super Market</title>
<?php include 'header.php';
?>
 <!--start-content-->
<!--products-->
	<div class="products">
		<div class="container">
			<div class="products-grids">
				<div class="col-md-8 products-grid-left">
					<div class="products-grid-lft">
					<?php					
					include 'connection.php';					
					if(isset($_GET['filter_price']))
					{
						$price = $_GET['filter_price'];					
						if($price == 0)
						$sql = " SELECT * FROM products WHERE p_type LIKE 'Headphone'";					
						if($price == 1)
						$sql = " SELECT * FROM products WHERE p_price < 500 AND p_type LIKE 'Headphone'";
						if($price == 2)
						$sql = " SELECT * FROM products WHERE p_price BETWEEN 500 AND 1000 AND p_type LIKE 'Headphone'";
						if($price == 3)
						$sql = " SELECT * FROM products WHERE p_price BETWEEN 1000 AND 2000 AND p_type LIKE 'Headphone'";
						if($price == 4)
						$sql = " SELECT * FROM products WHERE p_price > 2000 AND p_type LIKE 'Headphone'";				
						if (!$conn) {
						die("Connection failed: " . mysqli_connect_error());
						}
						$result = mysqli_query($conn, $sql);
						if (mysqli_num_rows($result) > 0) 
						{
							while($row = mysqli_fetch_assoc($result)) 
							{
							echo '					
							<div class="products-grd">
								<div class="p-one simpleCart_shelfItem prd">
									<a href="single.php">
											<img src="'.$row["p_image"].'" alt="" class="img-responsive" />
									</a>
									<h4>'.$row["p_name"].'</h4>							
									<p><a class="item_add" href="addcart.php?mycart='.$row['p_id'].'&userid='.$id.'"><span class=" item_price valsa">Rs. '.$row["p_price"].' .</span><img src="images/cartadd.png"></img> </a></p>
									<div class="pro-grd">
										<a href="single.php?p='.$row['p_id'].'">Quick View</a>
									</div>
								</div>	
							</div>';
							}
						} 
						else{
							echo "Sorry No Products fits your Budget...";
						}						
					}					
					else
					{
						$sql = " SELECT * FROM products WHERE p_type LIKE 'Headphone'";
						if (!$conn) {
						die("Connection failed: " . mysqli_connect_error());
						}
						$result = mysqli_query($conn, $sql);
						if (mysqli_num_rows($result) > 0) 
						{
							while($row = mysqli_fetch_assoc($result)) 
							{
								echo '							
								<div class="products-grd">
									<div class="p-one simpleCart_shelfItem prd">
										<a href="single.php">
												<img src="'.$row["p_image"].'" alt="" class="img-responsive" />
										</a>
										<h4>'.$row["p_name"].'</h4>
										<p><a class="item_add" href="addcart.php?mycart='.$row['p_id'].'&userid='.$id.'"><span class=" item_price valsa">Rs. '.$row["p_price"].' .</span><img src="images/cartadd.png"></img> </a></p>
										<div class="pro-grd">
											<a href="single.php?p='.$row['p_id'].'">Quick View</a>
										</div>
									</div>	
								</div>';
							}
						} 
					}					
					?>	
					<div class="clearfix"> </div>
					</div>
				</div>
				<div class="col-md-4 products-grid-right">
					<div class="w_sidebar">
						<div class="w_nav1">
							<h4><a href="index.php">All</a></h4>
							<ul>
								<li><a href="headphone.php">Groceries</a></li>
								<li><a href="personalcare.php">Personal Care</a></li>
								<li><a href="brandeditems.php">Branded items</a></li>
							</ul>	
						</div>
									
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<!-- //products -->
<?php include 'footer.php';
?>
</body>
</html>