-- Tabel Nasabah
CREATE TABLE Nasabah (
    id BIGSERIAL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT,
    telepon VARCHAR(20),
    email VARCHAR(100)
);

-- Tabel Akun
CREATE TABLE Akun (
    id BIGSERIAL PRIMARY KEY,
    nasabah_id BIGINT,
    nomor_rekening VARCHAR(50) NOT NULL UNIQUE,
    jenis_akun VARCHAR(50),
    saldo DECIMAL(15, 2) DEFAULT 0,
    FOREIGN KEY (nasabah_id) REFERENCES Nasabah(id)
);

-- Tabel Transaksi
CREATE TABLE Transaksi (
    id BIGSERIAL PRIMARY KEY,
    akun_id BIGINT,
    tanggal TIMESTAMP NOT NULL,
    jenis_transaksi VARCHAR(6) NOT NULL CHECK (jenis_transaksi IN ('debit', 'kredit')),
    jumlah DECIMAL(15, 2) NOT NULL,
    deskripsi TEXT,
    FOREIGN KEY (akun_id) REFERENCES Akun(id)
);


-- Create (INSERT)
INSERT INTO Nasabah (nama, alamat, telepon, email) VALUES
('John Doe', 'Jl. Merdeka No. 123', '081234567890', 'john@example.com'),
('Jane Smith', 'Jl. Sudirman No. 456', '081234567891', 'jane@example.com'),
('Alice Johnson', 'Jl. Thamrin No. 789', '081234567892', 'alice@example.com'),
('Bob Brown', 'Jl. Rasuna Said No. 101', '081234567893', 'bob@example.com'),
('Charlie Davis', 'Jl. Gatot Subroto No. 202', '081234567894', 'charlie@example.com'),
('Diana Evans', 'Jl. Senayan No. 303', '081234567895', 'diana@example.com'),
('Eve Foster', 'Jl. Kuningan No. 404', '081234567896', 'eve@example.com'),
('Frank Green', 'Jl. Tebet No. 505', '081234567897', 'frank@example.com'),
('Grace Hall', 'Jl. Cilandak No. 606', '081234567898', 'grace@example.com'),
('Hank Irving', 'Jl. Kemang No. 707', '081234567899', 'hank@example.com'),
('Ivy James', 'Jl. Menteng No. 808', '081234567800', 'ivy@example.com');

-- Read (SELECT)
SELECT * FROM Nasabah;

-- Update
UPDATE Nasabah 
SET nama = 'John Smith', alamat = 'Jl. Sudirman No. 456', telepon = '081234567891', email = 'johnsmith@example.com' 
WHERE id = 1;

-- Delete
DELETE FROM Nasabah WHERE id = 1;


-- Create (INSERT)
INSERT INTO Akun (nasabah_id, nomor_rekening, jenis_akun, saldo) VALUES
(2, '2345678901', 'giro', 10000000),
(3, '3456789012', 'deposito', 15000000),
(4, '4567890123', 'tabungan', 2000000),
(5, '5678901234', 'giro', 3000000),
(6, '6789012345', 'deposito', 4000000),
(7, '7890123456', 'tabungan', 5000000),
(8, '8901234567', 'giro', 6000000),
(9, '9012345678', 'deposito', 7000000),
(10, '0123456789', 'tabungan', 8000000),
(11, '1023456789', 'giro', 9000000);

-- Read (SELECT)
SELECT * FROM Akun;

-- Update
UPDATE Akun 
SET nomor_rekening = '0987654321', jenis_akun = 'giro', saldo = 10000000 
WHERE id = 2;

-- Delete
DELETE FROM Akun WHERE id = 11;




-- Create (INSERT)
INSERT INTO Transaksi (akun_id, tanggal, jenis_transaksi, jumlah, deskripsi) VALUES
(12, NOW(), 'kredit', 2000000, 'Setoran tunai'),
(13, NOW(), 'debit', 1500000, 'Pembayaran tagihan'),
(14, NOW(), 'kredit', 500000, 'Transfer masuk'),
(15, NOW(), 'debit', 2500000, 'Pembelian barang'),
(16, NOW(), 'kredit', 3000000, 'Transfer masuk'),
(17, NOW(), 'debit', 3500000, 'Penarikan tunai'),
(18, NOW(), 'kredit', 4000000, 'Setoran tunai'),
(19, NOW(), 'debit', 4500000, 'Pembayaran tagihan'),
(20, NOW(), 'kredit', 5000000, 'Transfer masuk'),
(21, NOW(), 'debit', 5500000, 'Pembelian barang');

-- Read (SELECT)
SELECT * FROM Transaksi;

-- Update
UPDATE Transaksi 
SET tanggal = NOW(), jenis_transaksi = 'kredit', jumlah = 2000000, deskripsi = 'Setoran tunai' 
WHERE id = 19;

-- Delete
DELETE FROM Transaksi WHERE id = 21;



