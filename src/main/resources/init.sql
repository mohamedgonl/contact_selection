SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS url_m;
DROP TABLE IF EXISTS contact_m;
DROP TABLE IF EXISTS pref_m;
DROP TABLE IF EXISTS rgon_m;
SET FOREIGN_KEY_CHECKS = 1;

-- Create Tables
CREATE TABLE rgon_m (
    rgon_cd INT PRIMARY KEY,
    rgon_nm VARCHAR(40),
    delete_flg VARCHAR(1),
    rgon_use_typ VARCHAR(1),
    disp_order INT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE pref_m (
    pref_cd INT PRIMARY KEY,
    pref_nm VARCHAR(40),
    delete_flg VARCHAR(1)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE contact_m (
    contact_cd VARCHAR(20) PRIMARY KEY,
    contact_nm VARCHAR(100),
    contact_kn VARCHAR(200),
    tel_no VARCHAR(13),
    pref_cd INT,
    rgon_cd INT,
    delete_flg VARCHAR(1),
    CONSTRAINT FK_contact_pref FOREIGN KEY (pref_cd) REFERENCES pref_m (pref_cd),
    CONSTRAINT FK_contact_rgon FOREIGN KEY (rgon_cd) REFERENCES rgon_m (rgon_cd)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE url_m (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    contact_cd VARCHAR(20),
    url_addr VARCHAR(256),
    delete_flg VARCHAR(1),
    CONSTRAINT FK_url_contact FOREIGN KEY (contact_cd) REFERENCES contact_m (contact_cd)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Sample Data - Regions
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES (1, 'Hokkaido', '0', '1', 1);
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES (2, 'Tohoku', '0', '1', 2);
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES (3, 'Kanto', '0', '1', 3);
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES (4, 'Chubu', '0', '1', 4);
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES (5, 'Kansai', '0', '1', 5);
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES (6, 'Chugoku', '0', '1', 6);
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES (7, 'Shikoku', '0', '1', 7);
INSERT INTO rgon_m (rgon_cd, rgon_nm, delete_flg, rgon_use_typ, disp_order) VALUES (8, 'Kyushu', '0', '1', 8);

-- Insert Sample Data - Prefectures
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (1, 'Prefecture 1', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (2, 'Prefecture 2', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (3, 'Prefecture 3', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (4, 'Prefecture 4', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (5, 'Prefecture 5', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (6, 'Prefecture 6', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (7, 'Prefecture 7', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (8, 'Prefecture 8', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (9, 'Prefecture 9', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (10, 'Prefecture 10', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (11, 'Prefecture 11', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (12, 'Prefecture 12', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (13, 'Prefecture 13', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (14, 'Prefecture 14', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (15, 'Prefecture 15', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (16, 'Prefecture 16', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (17, 'Prefecture 17', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (18, 'Prefecture 18', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (19, 'Prefecture 19', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (20, 'Prefecture 20', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (21, 'Prefecture 21', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (22, 'Prefecture 22', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (23, 'Prefecture 23', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (24, 'Prefecture 24', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (25, 'Prefecture 25', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (26, 'Prefecture 26', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (27, 'Prefecture 27', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (28, 'Prefecture 28', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (29, 'Prefecture 29', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (30, 'Prefecture 30', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (31, 'Prefecture 31', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (32, 'Prefecture 32', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (33, 'Prefecture 33', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (34, 'Prefecture 34', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (35, 'Prefecture 35', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (36, 'Prefecture 36', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (37, 'Prefecture 37', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (38, 'Prefecture 38', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (39, 'Prefecture 39', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (40, 'Prefecture 40', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (41, 'Prefecture 41', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (42, 'Prefecture 42', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (43, 'Prefecture 43', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (44, 'Prefecture 44', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (45, 'Prefecture 45', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (46, 'Prefecture 46', '0');
INSERT INTO pref_m (pref_cd, pref_nm, delete_flg) VALUES (47, 'Prefecture 47', '0');

-- Insert Sample Data - Contacts & URLs
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD001', 'Company 1', 'コンパニー1', '09000000001', 2, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD001', 'https://site1.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD002', 'Company 2', 'コンパニー2', '09000000002', 3, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD002', 'https://site2.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD003', 'Company 3', 'コンパニー3', '09000000003', 4, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD003', 'https://site3.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD004', 'Company 4', 'コンパニー4', '09000000004', 5, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD004', 'https://site4.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD005', 'Company 5', 'コンパニー5', '09000000005', 6, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD005', 'https://site5.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD005', 'https://support.site5.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD006', 'Company 6', 'コンパニー6', '09000000006', 7, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD006', 'https://site6.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD007', 'Company 7', 'コンパニー7', '09000000007', 8, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD007', 'https://site7.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD008', 'Company 8', 'コンパニー8', '09000000008', 9, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD008', 'https://site8.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD009', 'Company 9', 'コンパニー9', '09000000009', 10, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD009', 'https://site9.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD010', 'Company 10', 'コンパニー10', '09000000010', 11, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD010', 'https://site10.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD010', 'https://support.site10.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD011', 'Company 11', 'コンパニー11', '09000000011', 12, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD011', 'https://site11.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD012', 'Company 12', 'コンパニー12', '09000000012', 13, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD012', 'https://site12.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD013', 'Company 13', 'コンパニー13', '09000000013', 14, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD013', 'https://site13.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD014', 'Company 14', 'コンパニー14', '09000000014', 15, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD014', 'https://site14.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD015', 'Company 15', 'コンパニー15', '09000000015', 16, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD015', 'https://site15.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD015', 'https://support.site15.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD016', 'Company 16', 'コンパニー16', '09000000016', 17, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD016', 'https://site16.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD017', 'Company 17', 'コンパニー17', '09000000017', 18, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD017', 'https://site17.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD018', 'Company 18', 'コンパニー18', '09000000018', 19, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD018', 'https://site18.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD019', 'Company 19', 'コンパニー19', '09000000019', 20, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD019', 'https://site19.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD020', 'Company 20', 'コンパニー20', '09000000020', 21, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD020', 'https://site20.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD020', 'https://support.site20.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD021', 'Company 21', 'コンパニー21', '09000000021', 22, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD021', 'https://site21.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD022', 'Company 22', 'コンパニー22', '09000000022', 23, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD022', 'https://site22.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD023', 'Company 23', 'コンパニー23', '09000000023', 24, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD023', 'https://site23.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD024', 'Company 24', 'コンパニー24', '09000000024', 25, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD024', 'https://site24.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD025', 'Company 25', 'コンパニー25', '09000000025', 26, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD025', 'https://site25.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD025', 'https://support.site25.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD026', 'Company 26', 'コンパニー26', '09000000026', 27, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD026', 'https://site26.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD027', 'Company 27', 'コンパニー27', '09000000027', 28, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD027', 'https://site27.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD028', 'Company 28', 'コンパニー28', '09000000028', 29, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD028', 'https://site28.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD029', 'Company 29', 'コンパニー29', '09000000029', 30, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD029', 'https://site29.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD030', 'Company 30', 'コンパニー30', '09000000030', 31, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD030', 'https://site30.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD030', 'https://support.site30.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD031', 'Company 31', 'コンパニー31', '09000000031', 32, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD031', 'https://site31.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD032', 'Company 32', 'コンパニー32', '09000000032', 33, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD032', 'https://site32.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD033', 'Company 33', 'コンパニー33', '09000000033', 34, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD033', 'https://site33.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD034', 'Company 34', 'コンパニー34', '09000000034', 35, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD034', 'https://site34.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD035', 'Company 35', 'コンパニー35', '09000000035', 36, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD035', 'https://site35.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD035', 'https://support.site35.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD036', 'Company 36', 'コンパニー36', '09000000036', 37, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD036', 'https://site36.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD037', 'Company 37', 'コンパニー37', '09000000037', 38, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD037', 'https://site37.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD038', 'Company 38', 'コンパニー38', '09000000038', 39, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD038', 'https://site38.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD039', 'Company 39', 'コンパニー39', '09000000039', 40, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD039', 'https://site39.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD040', 'Company 40', 'コンパニー40', '09000000040', 41, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD040', 'https://site40.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD040', 'https://support.site40.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD041', 'Company 41', 'コンパニー41', '09000000041', 42, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD041', 'https://site41.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD042', 'Company 42', 'コンパニー42', '09000000042', 43, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD042', 'https://site42.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD043', 'Company 43', 'コンパニー43', '09000000043', 44, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD043', 'https://site43.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD044', 'Company 44', 'コンパニー44', '09000000044', 45, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD044', 'https://site44.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD045', 'Company 45', 'コンパニー45', '09000000045', 46, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD045', 'https://site45.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD045', 'https://support.site45.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD046', 'Company 46', 'コンパニー46', '09000000046', 47, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD046', 'https://site46.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD047', 'Company 47', 'コンパニー47', '09000000047', 1, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD047', 'https://site47.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD048', 'Company 48', 'コンパニー48', '09000000048', 2, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD048', 'https://site48.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD049', 'Company 49', 'コンパニー49', '09000000049', 3, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD049', 'https://site49.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD050', 'Company 50', 'コンパニー50', '09000000050', 4, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD050', 'https://site50.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD050', 'https://support.site50.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD051', 'Company 51', 'コンパニー51', '09000000051', 5, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD051', 'https://site51.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD052', 'Company 52', 'コンパニー52', '09000000052', 6, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD052', 'https://site52.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD053', 'Company 53', 'コンパニー53', '09000000053', 7, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD053', 'https://site53.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD054', 'Company 54', 'コンパニー54', '09000000054', 8, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD054', 'https://site54.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD055', 'Company 55', 'コンパニー55', '09000000055', 9, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD055', 'https://site55.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD055', 'https://support.site55.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD056', 'Company 56', 'コンパニー56', '09000000056', 10, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD056', 'https://site56.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD057', 'Company 57', 'コンパニー57', '09000000057', 11, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD057', 'https://site57.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD058', 'Company 58', 'コンパニー58', '09000000058', 12, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD058', 'https://site58.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD059', 'Company 59', 'コンパニー59', '09000000059', 13, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD059', 'https://site59.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD060', 'Company 60', 'コンパニー60', '09000000060', 14, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD060', 'https://site60.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD060', 'https://support.site60.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD061', 'Company 61', 'コンパニー61', '09000000061', 15, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD061', 'https://site61.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD062', 'Company 62', 'コンパニー62', '09000000062', 16, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD062', 'https://site62.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD063', 'Company 63', 'コンパニー63', '09000000063', 17, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD063', 'https://site63.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD064', 'Company 64', 'コンパニー64', '09000000064', 18, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD064', 'https://site64.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD065', 'Company 65', 'コンパニー65', '09000000065', 19, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD065', 'https://site65.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD065', 'https://support.site65.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD066', 'Company 66', 'コンパニー66', '09000000066', 20, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD066', 'https://site66.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD067', 'Company 67', 'コンパニー67', '09000000067', 21, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD067', 'https://site67.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD068', 'Company 68', 'コンパニー68', '09000000068', 22, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD068', 'https://site68.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD069', 'Company 69', 'コンパニー69', '09000000069', 23, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD069', 'https://site69.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD070', 'Company 70', 'コンパニー70', '09000000070', 24, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD070', 'https://site70.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD070', 'https://support.site70.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD071', 'Company 71', 'コンパニー71', '09000000071', 25, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD071', 'https://site71.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD072', 'Company 72', 'コンパニー72', '09000000072', 26, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD072', 'https://site72.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD073', 'Company 73', 'コンパニー73', '09000000073', 27, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD073', 'https://site73.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD074', 'Company 74', 'コンパニー74', '09000000074', 28, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD074', 'https://site74.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD075', 'Company 75', 'コンパニー75', '09000000075', 29, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD075', 'https://site75.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD075', 'https://support.site75.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD076', 'Company 76', 'コンパニー76', '09000000076', 30, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD076', 'https://site76.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD077', 'Company 77', 'コンパニー77', '09000000077', 31, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD077', 'https://site77.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD078', 'Company 78', 'コンパニー78', '09000000078', 32, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD078', 'https://site78.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD079', 'Company 79', 'コンパニー79', '09000000079', 33, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD079', 'https://site79.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD080', 'Company 80', 'コンパニー80', '09000000080', 34, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD080', 'https://site80.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD080', 'https://support.site80.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD081', 'Company 81', 'コンパニー81', '09000000081', 35, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD081', 'https://site81.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD082', 'Company 82', 'コンパニー82', '09000000082', 36, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD082', 'https://site82.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD083', 'Company 83', 'コンパニー83', '09000000083', 37, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD083', 'https://site83.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD084', 'Company 84', 'コンパニー84', '09000000084', 38, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD084', 'https://site84.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD085', 'Company 85', 'コンパニー85', '09000000085', 39, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD085', 'https://site85.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD085', 'https://support.site85.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD086', 'Company 86', 'コンパニー86', '09000000086', 40, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD086', 'https://site86.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD087', 'Company 87', 'コンパニー87', '09000000087', 41, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD087', 'https://site87.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD088', 'Company 88', 'コンパニー88', '09000000088', 42, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD088', 'https://site88.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD089', 'Company 89', 'コンパニー89', '09000000089', 43, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD089', 'https://site89.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD090', 'Company 90', 'コンパニー90', '09000000090', 44, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD090', 'https://site90.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD090', 'https://support.site90.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD091', 'Company 91', 'コンパニー91', '09000000091', 45, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD091', 'https://site91.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD092', 'Company 92', 'コンパニー92', '09000000092', 46, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD092', 'https://site92.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD093', 'Company 93', 'コンパニー93', '09000000093', 47, 6, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD093', 'https://site93.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD094', 'Company 94', 'コンパニー94', '09000000094', 1, 7, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD094', 'https://site94.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD095', 'Company 95', 'コンパニー95', '09000000095', 2, 8, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD095', 'https://site95.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD095', 'https://support.site95.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD096', 'Company 96', 'コンパニー96', '09000000096', 3, 1, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD096', 'https://site96.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD097', 'Company 97', 'コンパニー97', '09000000097', 4, 2, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD097', 'https://site97.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD098', 'Company 98', 'コンパニー98', '09000000098', 5, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD098', 'https://site98.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD099', 'Company 99', 'コンパニー99', '09000000099', 6, 4, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD099', 'https://site99.com', '0');
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD100', 'Company 100', 'コンパニー100', '09000000100', 7, 5, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD100', 'https://site100.com', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD100', 'https://support.site100.com', '0');

-- Special case (Many URLs)
INSERT INTO contact_m (contact_cd, contact_nm, contact_kn, tel_no, pref_cd, rgon_cd, delete_flg) VALUES ('CD999', 'Special Corp', 'スペシャル', '0123456789', 13, 3, '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD999', 'https://corp1.jp', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD999', 'https://corp2.jp', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD999', 'https://corp3.jp', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD999', 'https://corp4.jp', '0');
INSERT INTO url_m (contact_cd, url_addr, delete_flg) VALUES ('CD999', 'https://corp5.jp', '0');