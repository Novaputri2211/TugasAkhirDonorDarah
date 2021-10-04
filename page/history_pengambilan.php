<?php
    include_once 'class/database.php';

    $database = new Database();
    $conn = $database->dbConnection();

    $query = "SELECT u.*, p.*, h.* FROM tb_history h 
    LEFT JOIN tb_user u ON h.id_user = u.id_user
    LEFT JOIN tb_pendonor p ON h.id_pendonor = p.id_pendonor ORDER by tgl_ambil DESC
    ";
    $statement = $conn->prepare($query);
    $statement->execute();
?>

<div class="container">
    <div class="row justify-content-center">

    <div class="col-lg-5">
        <div class="card" >
            <div class="card-body">
                    <p class="h4 mb-4" style="text-align: center;">Pencarian Nama Penerima Donor</p>
                    <input type="text" id="myInput" class="form-control mb-4" onkeyup="myFunction()" placeholder="Cari nama penerima..." title="Type in a name">
                    </div>
        </div>
        <h2 class="text-center mt-5">List Pendonor Darah </h2>
    </div>
            
            <table class="table" style="width: 1000px;" id="myTable">
                <thead class="btn-danger ligthen-1 white-text text-center">
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">Nama Penerima</th>
                    <th scope="col">Nama Pendonor</th>
                    <th scope="col">Golongan Darah</th>
                    <th scope="col">Tanggal Diambil</th>
                    <th scope="col">Jumlah Kantong Diambil</th>
                    
                  </tr>
                </thead>
                
                <tbody class="text-center">
<?php
if ($statement->rowCount() > 0) {
$count = 0;
while($row = $statement->fetch(PDO::FETCH_ASSOC)){
?>
                <tr>
                 
                <th scope = "row"> <?php $count++; echo $count; ?> </th>
                    
                    <td> <?php echo  $row['nama']?> </td>
                    <td> <?php echo  $row['nama_pendonor']?> </td>
                    <td> <?php echo $row['gol_darah']?> </td>
                    <td> <?php echo $row['tgl_ambil']?> </td>
                    <td> <?php echo $row['kantong_diambil']?> </td>
                    
                </tr> 
<?php } }else {?>

                </tbody>
            </table>
            <h1>Ksong</h1>
            
<?php } ?>
    </div>
</div>

<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>



