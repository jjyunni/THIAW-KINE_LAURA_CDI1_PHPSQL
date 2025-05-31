<?php

require_once("connection.php"); // me permet de récupérer ma connexion


/// Create Read Update Delete


//echo '<pre>'; 
//var_dump($stmt->fetchAll(PDO::FETCH_ASSOC));
// la méthode fetchALL me renvoit un tableau multi dimentionnel avec tous mes enregistrements en base
// le PDO FETCH_ASS est une constante qui me permet d'avoir en index de mes tableaux, le nom des colonnes
//echo'</pre>';


///// 
///// EXEC
/////

// $sql = "INSERT INTO book (title, author, date_publication, category_idcategory) 
// VALUES( 'Le petit prince', 'Sacha Lacombe', '1997-03-28', 1 )";

// $pdo->exec($sql);

///// 
///// PREPARE & EXECUTE
/////


// try{
//     $stmt = $pdo->prepare("INSERT INTO book (title, author, date_publication, category_idcategory) 
//     VALUES( :title, :author, :date_publication, :category )");

//     $stmt->execute([
//         "title" => "Le rouge et le noir",
//         "author" => "Standall",
//         "date_publication" => "1945-01-01",
//         "category" => 1,
//     ]);

//     $stmt->execute([
//         "title" => "One piece",
//         "author" => "Oda",
//         "date_publication" => "1975-01-01",
//         "category" => 1,
//     ]);
// } catch(PDOException $e) {
//     echo $e->getMessage();
// }

if ($_POST) {

    // var_dump($_POST);
    $title = $_POST["title"];
    $author = $_POST["author"];
    $publishedDate = $_POST["publishedDate"];

    try {
        $stmt = $pdo->prepare("INSERT INTO book (title, author, publishedDate, category_idcategory) 
    VALUES( :title, :author, :publishedDate, :category )");

        $stmt->execute([
            "title" => $title,
            "author" => $author,
            "publishedDate" => $publishedDate,
            "category" => 1,
        ]);

    } catch (PDOException $e) {
        echo $e->getMessage();
    }

}

if(isset($_GET['action']) && $_GET['action'] == 'delete') {

    $idbook = $_GET['idbook'];

    try {
        $stmt = $pdo->prepare("DELETE FROM book WHERE idbook = :idbook");

        $stmt->execute([
            "idbook" => $idbook,
        ]);

        echo "Le livre a bien été supprimé !";

    } catch (PDOException $e) {
        echo $e->getMessage();
    }

}

if(isset($_GET['action']) && $_GET['action'] == 'modify') {

    $title = $_POST["name"];
    $author = $_POST["author"];
    $publishedDate = $_POST["publishedDate"];

    try {
      $stmt = $pdo->prepare("UPDATE book SET title = :title, author = :author, publishedDate = :publishedDate, WHERE idbook = :idook"); 
      $stmt->execute([
        "title" => $title,
        "author" => $author,
        "publishedDate" => $publishedDate,
        "idrecipe" => $idrecipe
      ]);
      header("Location: index.php"); 
      exit();
    } catch (PDOException $e) { 
      echo $e->getMessage();
    }
}


///// 
///// SELECT
/////

if (isset($_GET['filter']) && $_GET['filter'] == 'exofil') {
    // Filter: only books after year 2000 and sort alphabetically
    $stmt = $pdo->query("SELECT * FROM book WHERE YEAR(publishedDate) > 2000 ORDER BY title ASC");
} else {
    // Default: show all books
    $stmt = $pdo->query("SELECT * FROM book");
}

$books = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <h1>Mes livres en BDD</h1>

    <table border="1">
        <thead>
            <th>Titre</th>
            <th>Auteur</th>
            <th>Date</th>
            <th>Catégorie</th>
            <th>Supprimer</th>
            <th>Modifier</th>
        </thead>

        <tbody>

            <?php

            foreach ($books as $key => $book) {
                echo "<tr>";
                echo "<td>" . $book["title"] . "</td>";
                echo "<td>" . $book["author"] . "</td>";
                echo "<td>" . $book["publishedDate"] . "</td>";
                echo "<td>" . $book["category_idcategory"] . "</td>";
                echo "<td> <a href='?idbook=". $book["idbook"] . "&action=delete'> Supprimer </a> </td>";
                echo "<td> <a href='?idbook=". $book["idbook"] . "&action=modify'> Modifier </a> </td>";
                echo "</tr>";
            }

            ?>

        </tbody>
    </table>

    <form method="GET">
        <button type="submit" name="filter" value="exofil">
            Filter and Sort (after 2000)
        </button>
    </form>


    <br>
    <br>
    <form method="POST">

        <label for="title">Titre:</label>
        <input type="text" name="title" id="title" placeholder="Titre">


        <label for="author">Auteur:</label>
        <input type="text" name="author" id="author" placeholder="Auteur">


        <label for="publishedDate">Titre:</label>
        <input type="date" name="publishedDate" id="publishedDate">

        <input type="submit" value="Créer livre">

    </form>

</body>

</html>