<?php
include "./includes/header.php";



if (isset($_GET["page"]) && $_GET["page"] != ""){
    $page = $_GET["page"];
}

else {
    $page = "home";
}

$page = "./includes/" . $page . ".php";

include $page;


include "./includes/footer.php";