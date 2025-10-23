<?php
$mysqli = new mysqli('data', 'monuser', 'password', 'mabase');

if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

if ($mysqli->query("INSERT INTO matable (compteur) SELECT count(*)+1 FROM matable;") === TRUE) {
    echo "Count updated<br />";
} else {
    echo "Error during insert: " . $mysqli->error . "<br />";
}

$result = $mysqli->query("SELECT * FROM matable");

if ($result) {
    printf("Count : %d<br />", $result->num_rows);
    $result->close();
} else {
    echo "Error during select: " . $mysqli->error . "<br />";
}

$mysqli->close();
?>