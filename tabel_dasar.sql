-- Create Tabel Dasar
CREATE TABLE tabel_dasar AS(SELECT
						   	pjl.id_invoice ||''|| pjl.id_barang AS id_penjualan,
						   	pjl.id_invoice,
						   	pjl.tanggal,
						   	pjl.id_customer,
						   	pjl.id_barang,
						   	pjl.jumlah_barang,
						   	pjl.unit,
						   	pjl.harga,
						   	pjl.mata_uang,
						   	plg.level,
						   	plg.nama,
						   	plg.id_cabang_sales,
						   	plg.cabang_sales,
						   	plg.id_distributor,
						   	plg.grup,
						   	brg.kode_barang,
						   	brg.nama_barang,
						   	brg.kemasan,
						   	brg.nama_tipe,
						   	brg.kode_brand,
						   	brg.brand
						   FROM penjualan AS pjl
						   LEFT JOIN pelanggan AS plg ON plg.id_customer = pjl.id_customer
						   LEFT JOIN barang AS brg ON brg.kode_barang = pjl.id_barang
						   );
						   
-- Determine Primary Key
ALTER TABLE tabel_dasar ADD PRIMARY KEY(id_penjualan);\

-- Export Queries to CSV
COPY(SELECT *
	 FROM tabel_dasar
	) TO 'C:\Users\rahma\OneDrive\Documents\Kimia Farma\tabel_dasar.csv' DELIMITER ',' CSV HEADER;
