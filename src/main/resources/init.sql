SET NAMES utf8mb4;

-- Create tables if not exists (Optional if using hibernate ddl-auto: update/create)
CREATE TABLE IF NOT EXISTS rgon_m (
    rgon_cd INT PRIMARY KEY,
    rgon_nm VARCHAR(40),
    delete_flg VARCHAR(1),
    rgon_use_typ VARCHAR(1),
    disp_order INT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS pref_m (
    pref_cd INT PRIMARY KEY,
    pref_nm VARCHAR(40),
    delete_flg VARCHAR(1)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS contact_m (
    contact_cd VARCHAR(20) PRIMARY KEY,
    contact_nm VARCHAR(100),
    contact_kn VARCHAR(200),
    tel_no VARCHAR(13),
    pref_cd INT,
    rgon_cd INT,
    delete_flg VARCHAR(1)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS url_m (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    contact_cd VARCHAR(20),
    url_addr VARCHAR(256),
    delete_flg VARCHAR(1)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Sample Data
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES
(1, 'Kanto', '0', '1', 1),
(2, 'Kansai', '0', '1', 2);

INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES
(13, 'Tokyo', '0'),
(27, 'Osaka', '0');

INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES
('CD001', 'Cong ty A', 'コンパニーA', '09011112222', 13, 1, '0'),
('CD002', 'Cong ty B', 'コンパニーB', '09033334444', 27, 2, '0');

INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES
('CD001', 'https://companyA.jp', '0'),
('CD001', 'https://support.companyA.jp', '0');
