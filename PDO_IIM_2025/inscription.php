<?php

require_once("connection.php");

if($_POST){

    $email = $_POST["email"];
    $password = $_POST["password"];

    $sql = "INSERT INTO user (email, password) VALUES(:email, :password)";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'email' => $email,
        'password' => password_hash($password, PASSWORD_DEFAULT)
    ]);

    echo "Votre user a été cocrrectement inséré en BDD";

}

?>


<form method="POST">

    <label for="email">Email</label>
    <input type="text" name="email" id="email" placeholder="Email">


    <label for="password">Password</label>
    <input type="password" name="password" id="password" placeholder="Password">

    <input type="submit" value="Sign up">

</form>