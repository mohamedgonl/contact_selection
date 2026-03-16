# 📞 Contact Selection API Project

Dự án này là hệ thống Backend cung cấp API cho chức năng **Chọn bên liên hệ (Contact Selection)** dựa trên yêu cầu thiết kế hệ thống.

---

## Prerequisites

| Tool | Minimum version |
|------|----------------|
| Java SDK | 17 |
| Maven | 3.8+ |
| Docker Desktop | 4.x |
| VS Code / IntelliJ | Latest |

### VS Code Extensions (recommended)

- **Extension Pack for Java** — `vscjava.vscode-java-pack`
- **Spring Boot Extension Pack** — `vmware.vscode-spring-boot-pack`
- **REST Client** — `humao.rest-client` (để chạy file `test_requests.http`)

---

## 1 — Start the Database & Application (Docker)

Cách nhanh nhất để chạy dự án mà không cần cài đặt Java hay MySQL:

```bash
# Từ thư mục gốc chứa docker-compose.yml
docker-compose up -d --build
```

Ứng dụng sẽ khả dụng tại: `http://localhost:8080`.
Hệ thống tự động khởi tạo database `refselect` và nạp dữ liệu mẫu từ `src/main/resources/init.sql`.

**Dừng hệ thống:**

```bash
docker-compose down
```

**Đặt lại dữ liệu (Reset):**

```bash
docker-compose down -v && docker-compose up -d --build
```

---

## 2 — Run Locally (Maven)

Nếu bạn muốn chạy trực tiếp bằng Maven:

1. Đảm bảo đã có một instance **MySQL 8.0** đang chạy.
2. Tạo database tên là `refselect`.
3. Cập nhật thông tin kết nối trong `src/main/resources/application.yml`.
4. Chạy lệnh:

```bash
mvn spring-boot:run
```

---

## 3 — API Endpoints & Testing

### API Endpoints Overview

Hệ thống cung cấp các Endpoint sau để phục vụ màn hình chọn bên liên hệ:

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/ajax/ref_select_load` | `POST` | Khởi tạo màn hình, lấy danh sách khu vực (Region). |
| `/ajax/ref_select_search` | `POST` | Tìm kiếm bên liên hệ với các tiêu chí lọc (Tên, Kana, Tel, URL, Khu vực). |
| `/ajax/ref_select_confirm` | `POST` | Xác nhận lựa chọn, kiểm tra tính hợp lệ của việc chọn (đơn/đa). |

### Kiểm tra hệ thống với REST Client

Bạn có thể test trực tiếp các API bằng file `test_requests.http` trong dự án:

1.  Cài đặt Extension **REST Client** (`humao.rest-client`) trên VS Code.
2.  Mở file `test_requests.http`.
3.  Nhấn vào dòng chữ **Send Request** phía trên mỗi yêu cầu để xem kết quả phản hồi.

---

## 4 — Project Structure

Dự án tuân thủ kiến trúc Clean Architecture:

```
contact_selection/
│
├── src/main/java/com/example/refselect/
│   ├── controller/      ← Tiếp nhận HTTP requests
│   ├── service/         ← Xử lý Logic nghiệp vụ
│   ├── repository/      ← Tương tác Database (JPA)
│   ├── entity/          ← Định nghĩa cấu trúc bảng
│   └── dto/             ← Đối tượng truyền tải dữ liệu (Data Transfer Object)
│
├── src/main/resources/
│   ├── application.yml  ← Cấu hình hệ thống
│   └── init.sql         ← Scripts tạo bảng và nạp dữ liệu mẫu
│
├── Dockerfile           ← Cấu hình Build ảnh Docker
├── docker-compose.yml   ← Cấu hình Orchestration cho App & DB
├── pom.xml              ← Quản lý dependencies Maven
└── test_requests.http   ← File test API trực tiếp (REST Client)
```

---

## 5 — Assumptions & Rules

1. **Phân trang logic**: Kết quả tìm kiếm được giới hạn tối đa 80 bản ghi theo yêu cầu.
2. **Kiểm tra hợp lệ**: API xác nhận sẽ trả về lỗi `SE4102_00166` nếu chọn nhiều bản ghi trong chế độ chọn đơn lẻ (`kindRef = 0`).
3. **Mã hóa dữ liệu**: Sử dụng UTF-8 cho tất cả các dữ liệu chuỗi để hỗ trợ đa ngôn ngữ.
4. **Lombok**: Dự án sử dụng Lombok để tối ưu mã nguồn (Getter/Setter/Constructor).

---

## 6 — Troubleshooting

| Issue | Solution |
|-------|---------|
| `Connection refused` | Kiểm tra Docker container `mysql-db` đã ở trạng thái `healthy` chưa bằng lệnh `docker ps`. |
| `Duplicate entry` | Xảy ra khi chạy lại scripts nạp dữ liệu. Hãy chạy `docker-compose down -v` để xóa Volume cũ trước khi khởi động lại. |
| DB không có dữ liệu | Kiểm tra log của container ứng dụng: `docker logs refselect-app`. |
| Lỗi chính tả bảng | Lưu ý MySQL trên Linux (Docker) phân biệt chữ hoa chữ thường. Luôn sử dụng chữ thường cho tên bảng. |
| Hiển thị dấu hỏi (`?`) | Lỗi mã hóa font. Đảm bảo file SQL lưu ở định dạng `UTF-8` và URL JDBC có tham số `useUnicode=true&characterEncoding=UTF-8`. |
