<?php

$name = $_GET['name'];
if ($name == null) {
	$name='Manager';
}
$message='Greetings from the DevOps Squadron!';
echo "$name says: $message";
