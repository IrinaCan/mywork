<?php

$servername = "localhost";
$username = "root";
$password = "";
$databasename = "selling";

	$conn = new mysqli($servername, $username,
		$password, $databasename);
		mysqli_set_charset($conn, 'utf8');
	
$data = $_POST['data'];
$productName = 'Левый носок';

$sql = "SELECT products.name, arrivals.amount, arrivals.price, arrivals.data 
	FROM arrivals JOIN products ON 
	products.id=arrivals.name_id 
	WHERE products.name = '$productName' 
	AND DATE(arrivals.data) <= '$data'
	ORDER BY arrivals.data DESC LIMIT 1";

$result = mysqli_query($conn, $sql);
$row= $result->fetch_array();
$name = $row[0];
$amount = $row[1];
$price = ceil($row[2]/$amount);
$lastData = $row[3];

$procent = ($price /100) * 30;
$nowPrice = $price + $procent;

$sql = "SELECT SUM(arrivals.amount) FROM arrivals 
	JOIN products ON products.id=arrivals.name_id 
	WHERE DATE(data) <= '$data' AND products.name = 
	'$productName'";

$result = mysqli_query($conn, $sql);
$row= $result->fetch_array();
$count = $row[0];

$firstData = date_create('2021-01-13');
$lastData = date_create($data);

$days = date_diff($firstData, $lastData);
$days = ($days->d)+1;

$beforeBefore = 0;
$before = 1;

$arr = array($beforeBefore, $before);

for ($i = 0; $i < $days-2; $i++) {
	$next = $before + $beforeBefore;
	array_push($arr, $next);
	$tmp = $before;
	$before = $next;
	$beforeBefore = $tmp;
}

if ( $days == 1) {
	$zakazy = 0;
} else {
	$zakazy = array_sum($arr);
}

if ($count > $zakazy) {
	$ostatok = $count - $zakazy;
} else {
	$ostatok = "Нет в наличии";
}
?>

<html>
<meta charset='UTF-8'>
<form method="POST">
	<label>
		<input type=date min= "2021-01-13" max = "2021-02-05" 
			name="data"></input>
	</label>
	<button>Применить</button>
</form>

<section>
 Товар:  <?php echo $name ?><br>
 Остаток на складе: <?php echo $ostatok ?><br>
 Текущая цена: <?php echo $nowPrice ?><br>
</sectiom>
</html>