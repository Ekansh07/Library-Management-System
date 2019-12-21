<?php
include "header.php";
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"/>
<style>

#tt{
	padding: 5px;
	margin: 5px;
	
}
th, td {
	padding: 5px;
  color: white;
  text-align: left;
}
</style>
</head>
<body>
<div id="container1">
<?php
	include('connection.php');
	
	if (isset($_GET['keyword']))
	    $data=$_GET['keyword'];
	else 
		$data='';
	
	//echo $data;
	
	$query= " Select B.Isbn, B.Title, A.Name, B.No_of_copies from book B INNER JOIN book_authors BA ON B.Isbn=BA.Isbn INNER JOIN authors A on BA.Author_id=A.Author_id where B.Isbn LIKE '%" . $data . "%' OR B.Title LIKE '%" . $data ."%' OR A.Name LIKE '%".$data."%'";
	//echo $query;
	$result = mysqli_query($con,$query);
	if (!$result) {
    printf("Error: %s\n", mysqli_error($con));
    exit();
}

	
	?>
<form action="booksearch.php" id="f1">
<input type="text" id="search" name="keyword" value=<?php echo $data?> >
<input type="submit" id="submit" value="SEARCH" name="searchsubmit">
</form>
<table id="tt" border="1">
		<tr>
		<th>ISBN</th>
        <th>Title</th>
        <th>Author Name</th>
		<th>Number of Copies Remaining</th>
		</tr>
       
     <?php
    while($row = mysqli_fetch_array($result))
            {
?>
        <tr>
        <td>
		<?php echo $row['Isbn']?></td>
		<td><?php echo $row['Title']?></td>
		<td><?php echo $row['Name']?></td>
		<td><?php echo $row['No_of_copies']?></td>
		</tr>
		<?php 
			}
			?>
	

    </table>


</div>
</body>
<?php
include 'footer.php'
?>
</html>