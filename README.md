# 🛍️ AeroXpress E-Commerce

A full-featured multi-role (Customer/Vendor/Admin) E-Commerce application built as a **5th Semester Project** using modern technologies such as **Flutter**, **Node.js**, **BLoC**, **Shorebird**, and a well-structured modular architecture.

---

## 📦 Tech Stack

### 💻 Frontend (Mobile App)
- **Flutter** (Framework)
- **BLoC** (State Management)
- **GoRouter** (Routing)
- **Shorebird** (Flutter Code Push)
- **Solid Principles** (Clean Architecture)

### 🔧 Backend
- **Node.js** with **Express**
- **MySql**

---

## 🧱 Folder Structure (Frontend)




Each feature folder (e.g., `auth`, `customers`, `shared`, `vendor`) contains:
- `bloc/` or `controller/`
- `model/`
- `view/`
- `repository/`
- `widgets/`

---

## 📚 Key Features

- 🔑 **Authentication**
  - Email/password login
  - Role-based login (Vendor/Customer)
  - Secure user data via `flutter_secure_storage`

- 🛍️ **Customer Features**
  - Product browsing
  - Add to cart
  - Checkout with **Khalti** payment integration
  - Order tracking

- 🧑‍💼 **Vendor Features**
  - Add/edit/delete products
  - Order management

- 📦 **Order System**
  - Order placement
  - Status updates
  - Delivery workflow

- 💬 **Toast Notifications & UI Feedback**
  - `toastification`, `fluttertoast`, `shimmer` loading effects

- 🚀 **Performance & Monitoring**
  - `firebase_crashlytics`, `firebase_performance`
  - `logger`, `pretty_dio_logger`

- 🌐 **Responsive UI**
  - Works on both mobile and tablet views via `responsive_builder`

- 📸 **Image Handling**
  - Product image selection via `image_picker` and `cached_network_image`

---

## 🛠️ Important Packages Used

| Purpose                   | Package Name                  |
|--------------------------|-------------------------------|
| State Management         | `flutter_bloc`, `provider`    |
| API Requests             | `dio`, `pretty_dio_logger`    |
| Persistence              | `shared_preferences`, `flutter_secure_storage` |
| Routing                  | `go_router`                   |
| Animation & Effects      | `flutter_animate`, `shimmer`, `toastification` |
| Image Handling           | `image_picker`, `cached_network_image` |
| Payments                 | `khalti_checkout_flutter`     |
| Crash Reporting          | `firebase_crashlytics`        |
| Design & UI              | `google_fonts`, `phosphor_flutter`, `gap`, `shadcn_ui` |
| Other Utilities          | `url_launcher`, `freezed_annotation`, `equatable`, `dartz`, `get_it`, `device_preview` |

---

## 🔄 Recent Major Commits

| Folder      | Commit Message                      | Date       |
|-------------|--------------------------------------|------------|
| `core`      | completed order process              | Yesterday  |
| `features`  | completed order process              | Yesterday  |
| `routes`    | completed order process              | Yesterday  |
| `customers` | shift the products files             | Yesterday  |
| `auth`      | update profile UI                    | Last Week  |
| `common`    | completed the register implementation| Last Month |
| `utils`     | khalti payment                       | Yesterday  |

---

## 👨‍🎓 Contributors

- 👨‍💻 [Nishan-Pradhan06](https://github.com/Nishan-Pradhan06)

---

## 🎓 Academic Info

- 🎓 **Semester**: 5th Semester
- 🏫 **Institution**: *(You can add your college name here)*
- 📘 **Course**: Mobile Application Development / Project Work

---

## 🚀 Running the App

```bash
# Clone the repo
git clone https://github.com/Nishan-Pradhan06/AeroXpress_e-commerce.git

# Install dependencies
flutter pub get

# Run the app
flutter run
