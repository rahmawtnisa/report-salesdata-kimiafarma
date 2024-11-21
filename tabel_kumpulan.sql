-- Create Tabel Kumpulan

CREATE TABLE tabel_kumpulan AS(SELECT
							   	id_penjualan,
							   	id_invoice,
							   	tanggal,
							   	id_customer,
						   		id_barang,
						   		jumlah_barang,
						   		harga,
							   	nama AS customer,
							   	id_cabang_sales,
						   		cabang_sales,
						   		id_distributor,
						   		grup,
						   		nama_barang AS barang,
						   		kemasan,
						   		nama_tipe,
						   		kode_brand,
						   		brand,
							   	SUM(jumlah_barang * harga) AS total_sales
							   FROM tabel_dasar
							   GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17
							  );

-- Export Queries to CSV

COPY(SELECT *
	 FROM tabel_kumpulan
	) TO 'C:\Users\rahma\OneDrive\Documents\Kimia Farma\tabel_kumpulan.csv' DELIMITER ',' CSV HEADER;


