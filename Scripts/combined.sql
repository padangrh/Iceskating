# SQL Manager Lite for MySQL 5.5.1.45563
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : iceskatingdb


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `iceskatingdb`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

USE `iceskatingdb`;

#
# Structure for the `bill` table : 
#

CREATE TABLE `bill` (
  `nobukti` CHAR(20) COLLATE utf8_general_ci NOT NULL,
  `kasir` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `tanggal` DATE DEFAULT NULL,
  `jam` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `jumlah` INTEGER(20) DEFAULT NULL,
  `total` INTEGER(20) DEFAULT NULL,
  `bayar` INTEGER(20) DEFAULT NULL,
  `cash` TINYINT(2) DEFAULT NULL,
  `diskon` INTEGER(20) DEFAULT 0,
  PRIMARY KEY (`nobukti`) USING BTREE
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

#
# Structure for the `bill_beli` table : 
#

CREATE TABLE `bill_beli` (
  `nobukti` CHAR(20) COLLATE utf8_general_ci NOT NULL,
  `staff` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `tanggal` DATE DEFAULT NULL,
  `jam` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `total` INTEGER(11) DEFAULT NULL,
  `kode_supplier` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `pembayaran` TINYINT(4) DEFAULT NULL,
  `lunas` TINYINT(2) DEFAULT NULL,
  `settled` TINYINT(2) DEFAULT NULL,
  `tanggal_lunas` DATE DEFAULT NULL,
  PRIMARY KEY (`nobukti`) USING BTREE
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

#
# Structure for the `tbbarang` table : 
#

CREATE TABLE `tbbarang` (
  `kode` CHAR(20) COLLATE utf8mb3_general_ci NOT NULL,
  `nama` VARCHAR(50) COLLATE utf8mb3_general_ci NOT NULL,
  `kategori` VARCHAR(20) COLLATE utf8mb3_general_ci NOT NULL,
  `harga_jual` DOUBLE(15,5) NOT NULL,
  `kdsuplier` CHAR(20) COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`kode`, `kategori`, `kdsuplier`) USING BTREE,
  UNIQUE KEY `kode_test` (`kode`) USING BTREE
) ENGINE=MyISAM
CHARACTER SET 'utf8mb3' COLLATE 'utf8mb3_general_ci'
;

#
# Structure for the `tbbeli` table : 
#

CREATE TABLE `tbbeli` (
  `nobukti` CHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `tglbukti` DATE DEFAULT NULL,
  `kode` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` CHAR(70) COLLATE latin1_swedish_ci DEFAULT '',
  `harga` DOUBLE(15,2) DEFAULT 0.00,
  `jumlah` INTEGER(5) DEFAULT 0,
  `return` INTEGER(11) DEFAULT 0,
  KEY `nobukti` (`nobukti`, `tglbukti`, `kode`) USING BTREE
) ENGINE=MyISAM
ROW_FORMAT=FIXED CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

#
# Structure for the `tbdiskon` table : 
#

CREATE TABLE `tbdiskon` (
  `nobukti` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `status` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `customer` CHAR(20) COLLATE utf8_general_ci DEFAULT NULL,
  `nilai` INTEGER(11) DEFAULT NULL
) ENGINE=InnoDB
CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'
;

#
# Structure for the `tbjual` table : 
#

CREATE TABLE `tbjual` (
  `nobukti` CHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `tglbukti` DATE DEFAULT '0000-00-00',
  `kode` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` CHAR(50) COLLATE latin1_swedish_ci DEFAULT '',
  `harga_jual` DOUBLE(15,2) DEFAULT 0.00,
  `jumlah_jual` INTEGER(11) DEFAULT 0,
  `kdsuplier` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  KEY `NOBUKTI` (`nobukti`, `tglbukti`, `kode`) USING BTREE,
  KEY `nobukti_2` (`nobukti`) USING BTREE
) ENGINE=MyISAM
ROW_FORMAT=FIXED CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

#
# Structure for the `tbkategori` table : 
#

CREATE TABLE `tbkategori` (
  `kode` VARCHAR(20) COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE=MyISAM
CHARACTER SET 'utf8mb3' COLLATE 'utf8mb3_general_ci'
;

#
# Structure for the `tblogin` table : 
#

CREATE TABLE `tblogin` (
  `userid` VARCHAR(25) COLLATE utf8mb3_general_ci NOT NULL,
  `pass` VARCHAR(25) COLLATE utf8mb3_general_ci NOT NULL,
  `posisi` VARCHAR(30) COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hak1` VARCHAR(1) COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hak2` VARCHAR(1) COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hak3` VARCHAR(1) COLLATE utf8mb3_general_ci DEFAULT NULL,
  `hak4` VARCHAR(1) COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=MyISAM
CHARACTER SET 'utf8mb3' COLLATE 'utf8mb3_general_ci'
;

#
# Structure for the `tbsuplier` table : 
#

CREATE TABLE `tbsuplier` (
  `kdsuplier` CHAR(20) COLLATE latin1_swedish_ci NOT NULL,
  `nmsuplier` VARCHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat` VARCHAR(250) COLLATE latin1_swedish_ci DEFAULT NULL,
  `telp` VARCHAR(40) COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_gabung` DATE NOT NULL,
  `nama_rek` CHAR(50) COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_rek` CHAR(30) COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`kdsuplier`) USING BTREE
) ENGINE=MyISAM
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

#
# Structure for the `temp_table1` table : 
#

CREATE TABLE `temp_table1` (
  `nobukti` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `tglbukti` DATE DEFAULT NULL,
  `userid` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

#
# Structure for the `temp_table2` table : 
#

CREATE TABLE `temp_table2` (
  `nofaktur` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `jam` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

#
# Structure for the `temp_table3` table : 
#

CREATE TABLE `temp_table3` (
  `nobukti` CHAR(20) COLLATE latin1_swedish_ci DEFAULT NULL,
  `cash` TINYINT(4) DEFAULT NULL
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

CREATE ALGORITHM=UNDEFINED DEFINER='root'@'localhost' SQL SECURITY DEFINER VIEW `v_barang`
AS
select
  `b`.`kode` AS `kode`,
  `b`.`nama` AS `nama`,
  `b`.`kategori` AS `kategori`,
  `b`.`harga_jual` AS `harga_jual`,
  `s`.`nmsuplier` AS `nmsuplier`
from
  (`tbbarang` `b`
  join `tbsuplier` `s`)
where
  (`b`.`kdsuplier` = convert (`s`.`kdsuplier` using utf8mb3))
group by
  `b`.`kode`;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

insert into iceskatingdb.tbjual

select
  `x`.`nofaktur` AS `nofaktur`,
  `x`.`tanggal` AS `tanggal`,
  `y`.`kode` AS `kode`,
  `x`.`nama` AS `nama`,
  `x`.`harga_jual` AS `harga_jual`,
  `x`.`jumlah_beli` AS `jumlah_beli`,
  '1' AS `kdsuplier`
from
  (iceskating.bill `x`
  join iceskating.tbjual `y`)
where
  ((`x`.`nofaktur` = `y`.`nobukti`) and
  (`x`.`harga_jual` = `y`.`harga_jual`) and
  (`x`.`jumlah_beli` = `y`.`jumlah_jual`) and
  (`x`.`nomor` = `y`.`nomor`));

insert into iceskatingdb.temp_table1
select
  `a`.`nobukti` AS `nobukti`,
  `a`.`tglbukti` AS `tglbukti`,
  `a`.`nm_kasir` AS `nm_kasir`
from
  `iceskating`.`tbjual` `a`
group by
  `a`.`nobukti`

insert into iceskatingdb.temp_table2
select
  `iceskating`.`bill`.`nofaktur` AS `nofaktur`,
  `iceskating`.`bill`.`jam` AS `jam`
from
  `iceskating`.`bill`
group by
  `iceskating`.`bill`.`nofaktur`;

insert into iceskatingdb.temp_table3
select
  `iceskating`.`tbjual`.`nobukti` AS `nobukti`,
  `iceskating`.`tbjual`.`cash` AS `cash`
from
  `iceskating`.`tbjual`
group by
  `iceskating`.`tbjual`.`nobukti`;

insert into iceskatingdb.bill

select
  `a`.`nobukti` AS `nobukti`,
  `a`.`userid` AS `kasir`,
  `a`.`tglbukti` AS `tglbukti`,
  `c`.`jam` AS `jam`,
  `b`.`jml_bayar` AS `total`,
  `b`.`jml_uang` AS `bayar`,
  `d`.`cash` AS `cash`,
  '0'  AS `diskon`
from
  (((`iceskatingdb`.temp_table1 `a`
  join `iceskating`.`tbbantu1` `b`)
  join `iceskatingdb`.temp_table2 `c`)
  join `iceskatingdb`.temp_table3 `d`)
where
  ((convert (`a`.`nobukti` using utf8) = `b`.`nobukti`) and
  (`a`.`nobukti` = `c`.`nofaktur`) and
  (`a`.`nobukti` = `d`.`nobukti`));

update iceskatingdb.bill a
set a.bayar = '0'
where cash = '0';

insert into iceskatingdb.tbbarang
select
b.kode,
b.nama,
b.kategori,
b.harga_jual,
b.kdsuplier
from iceskating.tbbarang b;

insert into iceskatingdb.tbkategori
select * from iceskating.tbkategori;

insert into iceskatingdb.tblogin
select
a.userid,
a.pass,
a.posisi,
a.hak1,
a.hak2,
a.hak3,
a.hak4
from iceskating.tblogin a;

insert into iceskatingdb.tbsuplier
select
a.kdsuplier,
a.nmsuplier,
a.alamat,
a.telp,
a.tgl_gabung,
'',
'',
''
 from iceskating.tbsuplier a;


