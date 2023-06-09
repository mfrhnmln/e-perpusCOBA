<?php
session_start();
include "../../../../config/koneksi.php";

if ($_GET['act'] == "tambah") {
    $judul_buku = $_POST['judulBuku'];
    $kategori_buku = $_POST['kategoriBuku'];
    $penerbit_buku = $_POST['penerbitBuku'];
    $pengarang = $_POST['pengarang'];
    $tahun_terbit = $_POST['tahunTerbit'];
    $isbn = $_POST['iSbn'];
    $j_buku_baik = $_POST['jumlahBukuBaik'];
    $j_buku_rusak = $_POST['jumlahBukuRusak'];

    $stringreplace 		= array ('/','\\',',','.','#',':',';','\'','"','[',']','{','}',')','(','|','`','~','!','@','%','$','^','&','*','=','?','+',' ','_');
	$code		   		= md5(uniqid(rand()));
	$gencode			= substr($code, 0, 5);
	$replace			= strtolower(str_replace($stringreplace,'_',$admin_nama));
	$nama_file 			= $_FILES["image"]["name"];
	$tipe_file 			= $_FILES["image"]["type"];
	$alamat 			= $_FILES["image"]["tmp_name"];
	$nama_baru 			= "buku_".$replace."_".$gencode.".".end((explode(".", $nama_file)));
	$tujuan 			= "../../../../assets/Buku/$nama_baru";

    if(empty($nama_file)){

    // PROCESS INSERT DATA TO DATABASE
        $sql = "INSERT INTO buku(judul_buku,kategori_buku,penerbit_buku,pengarang,tahun_terbit,isbn,j_buku_baik,j_buku_rusak)
            VALUES('" . $judul_buku . "','" . $kategori_buku . "','" . $penerbit_buku . "','" . $pengarang . "','" . $tahun_terbit . "','" . $isbn . "', '" . $j_buku_baik . "', '" . $j_buku_rusak . "')";
        $sql .= mysqli_query($koneksi, $sql);

        if ($sql) {
            $_SESSION['berhasil'] = "Data buku berhasil ditambahkan !";
            header("location: " . $_SERVER['HTTP_REFERER']);
        } else {
            $_SESSION['gagal'] = "Data buku gagal ditambahkan !";
            header("location: " . $_SERVER['HTTP_REFERER']);
        }
    }elseif (!empty($nama_file)){
        if ($tipe_file != "image/gif" AND $tipe_file != "image/jpg" AND $tipe_file != "image/jpeg" AND $tipe_file != "image/png") {
			$_SESSION['gagal'] = "Data buku gagal ditambahkan Format Image Salah !";
            header("location: " . $_SERVER['HTTP_REFERER']);
		}else{
            $gambar_baru = move_uploaded_file($alamat, $tujuan);
            $sql = "INSERT INTO buku(judul_buku,kategori_buku,penerbit_buku,pengarang,tahun_terbit,isbn,j_buku_baik,j_buku_rusak,image)
            VALUES('" . $judul_buku . "','" . $kategori_buku . "','" . $penerbit_buku . "','" . $pengarang . "','" . $tahun_terbit . "','" . $isbn . "', '" . $j_buku_baik . "', '" . $j_buku_rusak . "', '".$nama_baru."')";
            $sql .= mysqli_query($koneksi, $sql);
        }
        if ($sql) {
            $_SESSION['berhasil'] = "Data buku berhasil ditambahkan !";
            header("location: " . $_SERVER['HTTP_REFERER']);
        } else {
            $_SESSION['gagal'] = "Data buku gagal ditambahkan !";
            header("location: " . $_SERVER['HTTP_REFERER']);
        }
    }
} elseif ($_GET['act'] == "edit") {
    $id_buku = $_POST['id_buku'];
    $judul_buku = $_POST['judulBuku'];
    $kategori_buku = $_POST['kategoriBuku'];
    $penerbit_buku = $_POST['penerbitBuku'];
    $pengarang = $_POST['pengarang'];
    $tahun_terbit = $_POST['tahunTerbit'];
    $isbn = $_POST['iSbn'];
    $j_buku_baik = $_POST['jumlahBukuBaik'];
    $j_buku_rusak = $_POST['jumlahBukuRusak'];

    // PROCESS EDIT DATA
    $query = "UPDATE buku SET judul_buku = '$judul_buku', kategori_buku = '$kategori_buku', penerbit_buku = '$penerbit_buku', 
                pengarang = '$pengarang', tahun_terbit = '$tahun_terbit', isbn = '$isbn', j_buku_baik = '$j_buku_baik', j_buku_rusak = '$j_buku_rusak'";

    $query .= "WHERE id_buku = $id_buku";

    $sql = mysqli_query($koneksi, $query);
    if ($sql) {
        $_SESSION['berhasil'] = "Data buku berhasil diedit !";
        header("location: " . $_SERVER['HTTP_REFERER']);
    } else {
        $_SESSION['gagal'] = "Data buku gagal diedit !";
        header("location: " . $_SERVER['HTTP_REFERER']);
    }
} elseif ($_GET['act'] == "hapus") {
    $id_buku = $_GET['id'];

    $sql = mysqli_query($koneksi, "DELETE FROM buku WHERE id_buku = '$id_buku'");

    if ($sql) {
        $_SESSION['berhasil'] = "Data buku berhasil di hapus !";
        header("location: " . $_SERVER['HTTP_REFERER']);
    } else {
        $_SESSION['gagal'] = "Data buku gagal di hapus !";
        header("location: " . $_SERVER['HTTP_REFERER']);
    }
}
