<!DOCTYPE HTML>
<html>
<head>
<title>Ecommerce Project</title>
<?php include 'header.php';
?>
<style>
*, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}
body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
}
form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}
h1 {
  text-align: center;
  padding: 0 0 20px 0;
}
input[type="text"],
input[type="tel"],
input[type="email"],
input[type="password"],
textarea,
select{
  background: rgba(255,255,255,0.1);
  background-color: #e8eeef;
  border-radius: 3px;
  font-size: 16px;
  height: auto;
  width: 100%;
  padding: 5px;
  margin: 0;
  margin-bottom: 30px;
  outline: 0;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0, .03) inset;
  /* - border transition around a text field on focus - */
  border: 2px solid;
  border-color: #ccc;
  transition: border-color, .6s;  
}
input[type="text"]:focus,
input[type="tel"]:focus,
input[type="email"]:focus,
input[type="password"]:focus,
textarea:focus,
select:focus {
  border-color: #5fcf80;  
}
label {
  display: block;
  margin-bottom: 8px; 
}
input[type="radio"],
input[type="checkbox"] {
  margin: 0 4px 8px 0;  
}
select {
  height: 32px;
  padding: 6px;
}
label.light {
  display: inline;
  font-weight: 300;
}
button {
  width: 100%;
  background-color: #18C9D2;
  color: #fff;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border: 1px solid #18C9D2;
  border-radius: 5px;
  border-width: 1px 1px 3px;
  padding: 19px 39px 18px 39px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}
fieldset {
  border: none;
  margin-bottom: 30px;
}
.number {
  display: inline-block;
  height: 30px;
  width: 30px;
  color: #fff;
  font-size: .8em;
  text-align: center;
  line-height: 30px;
  margin-right: 4px;
  border-radius: 100%;
  background-color: #18C9D2;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
}
legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}
@media screen and (min-width: 480px) {
  form {
    max-width: 480px;
  }
}
</style>
<!--start-content-->
<!--products-->
	<div class="products">
<form action="acct_created1.php" method="post">
  <h1>Sign Up</h1>  
  <fieldset>
    <label for="name">Username:</label>
    <input type="text" id="name" pattern="[a-zA-Z]+" name="user_name" placeholder="Your name" require title="Only alphabets allowed">
    <label for="mail">E-mail:</label>
    <input type="email" id="mail" name="user_email" placeholder="example@email.com" required>
    <label for="passw">Password:</label>
    <input type="password" id="passw" name="user_password" placeholder="*********" pattern=".{5,10}" require title="Password: 6 to 9 chars">	
	<label for="passw">Mobile:</label>
    <input type="tel" pattern="[\+]\d{12}" id="mobile" name="user_mobile" value="+91">    
	<label for="name">Address:</label>
    <input type="text" id="address" pattern="[a-zA-Z]+" name="user_address" placeholder="Local address">
    <button type="submit">Sign Up</button>
</form>
	</div>
<!-- //products -->
<?php include 'footer.php';
?>
</body>
</html>