<h1>Inscription</h1>
<?php



if (isset($_POST["frmRegistration"])) {
   // Syntaxe classique
/*    if (isset($_POST["nom"])) {
    $nom = $_POST["nom"];
}

else {
    $nom = "" ;
}
*/



//Opérateur ternaire
//$nom = isset($_POST["nom"]) ? $_POST["nom"] : "";

// Opérateur Null coalescent PHP 7
$nom = $_POST["nom"] ?? "";
$prenom = $_POST["prenom"] ?? "";
$mail = $_POST["mail"] ?? "";
$mdp = $_POST["mdp"] ?? "";
 

$erreurs = array();


if ($nom == "") array_push($erreurs, "Veuillez saisir votre nom");
if ($prenom == "") array_push($erreurs, "Veuillez saisir votre prenom");
if ($mail == "") array_push($erreurs, "Veuillez saisir votre mail");
if ($mdp == "") array_push($erreurs, "Veuillez saisir votre mot de passe");


    if (count($erreurs) > 0){
        $message = "<ul>";
        for ($i = 0; $i < count($erreurs); $i++) {
            $message .= "<li>"; 
            $message .= $erreurs[$i];
            $message .= "</li>";
            
        }

/* deuxiéme methode 

foreach($erreurs as $ligneMessage){
    $message .= "<li>" ;
    $message .= $ligneMessage;
    $message .= "</li>";
}
  */    

        $message .= "</ul>";
        echo $message;
    }

    else {
        echo "Pas d'erreurs";
    }



}

else {
    echo "Je ne viens pas du formulaire";
    include "frmRegistration.php";
}

?>
