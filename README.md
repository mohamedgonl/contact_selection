# Contact Selection API Project

Dự án này là hệ thống Backend cung cấp API cho chức năng **Chọn bên liên hệ (Contact Selection)** dựa trên yêu cầu thiết kế của Nhật Bản.

## 🚀 Công nghệ sử dụng

- **Java 17**
- **Spring Boot 3.2.4**
- **Spring Data JPA** (Hibernat)
- **MySQL 8.0**
- **Lombok**
- **Maven**
- **Docker & Docker Compose**

## 📂 Cấu trúc dự án

Dự án tuân thủ kiến trúc Clean Architecture:
- `controller`: Tiếp nhận các yêu cầu HTTP.
- `service`: Chứa logic nghiệp vụ xử lý dữ liệu.
- `repository`: Giao diện tương tác với Database (JPA).
- `entity`: Định nghĩa cấu trúc bảng trong MySQL.
- `dto`: Các đối tượng truyền tải dữ liệu giữa Client và Server.

## ⚙️ Hướng dẫn cài đặt và chạy dự án

### Cách 1: Chạy bằng Docker (Khuyên dùng)

Đây là cách nhanh nhất vì bạn không cần cài đặt Java hoặc MySQL trên máy cá nhân.

1. Đảm bảo bạn đã cài đặt **Docker** và **Docker Compose**.
2. Mở terminal tại thư mục gốc của dự án.
3. Chạy lệnh:
   ```bash
   docker-compose up --build
   ```
4. Ứng dụng sẽ khả dụng tại địa chỉ: `http://localhost:8080`

### Cách 2: Chạy trực tiếp bằng Maven

1. Cài đặt **Java 17** và **Maven**.
2. Cài đặt một instance của **MySQL** và tạo database tên là `refselect`.
3. Cập nhật thông tin kết nối database (username/password) trong file `src/main/resources/application.yml`.
4. Chạy lệnh:
   ```bash
   mvn spring-boot:run
   ```

## 📡 API Endpoints 

### 1. API Khởi tạo màn hình (Initial Display)
- **URL:** `POST /purchase/event_entry/event_info/ajax/ref_select_load`
- **Body yêu cầu:**
  ```json
  {
    "kindRef": 1
  }
  ```
- **Chức năng:** Lấy danh sách các khu vực (Region) từ bảng `RGON_M` để hiển thị trên giao diện.

### 2. API Tìm kiếm (Search)
- **URL:** `POST /purchase/event_entry/event_info/ajax/ref_select_search`
- **Body yêu cầu:**
  ```json
  {
    "txtRefNm": "tên",
    "txtRefKn": "kana",
    "telno": "090",
    "urlAheadSearch": "google",
    "rgonCheck": [1, 2]
  }
  ```
- **Chức năng:** Tìm kiếm nâng cao với phân trang logic (giới hạn 80 bản ghi) và tự động nối URL.

### 3. API Xác nhận lựa chọn (Confirm)
- **URL:** `POST /purchase/event_entry/event_info/ajax/ref_select_confirm`
- **Body yêu cầu:**
  ```json
  {
    "kindRef": 0,
    "contactCds": ["CD001", "CD002"]
  }
  ```
- **Chức năng:** Kiểm tra tính hợp lệ của việc lựa chọn. Trả về lỗi `SE4102_00166` nếu chọn nhiều bản ghi trong chế độ không cho phép.

## 🛠️ Trạng thái phát triển (TASK.md)

- [x] **Task 1: Cài đặt API hiển thị ban đầu** (Hoàn thành)
- [x] **Task 2: Cài đặt API tìm kiếm** (Hoàn thành)
- [x] **Task 3: Cài đặt API lựa chọn** (Hoàn thành)

## 📝 Nhật ký ghi chú (AI Rules)

- Tuân thủ nghiêm ngặt các tài liệu thiết kế tiếng Nhật.
- Sử dụng **Lombok** để giảm mã thừa (Boilerplate code).
- Sử dụng **Constructor Injection** cho Dependency Injection.
- Cấu hình Docker để chạy nhanh trên mọi môi trường.
