# Feature Mason Template

Template untuk membuat feature baru dengan struktur:
- providers/
- views/
- **Otomatis menambahkan route ke app_routes.dart dan app_pages.dart**

## Instalasi

1. Install mason_cli jika belum:
```bash
dart pub global activate mason_cli
```

2. Install brick dari local:
```bash
mason add feature --path bricks/feature
```

## Cara Menggunakan

Generate feature baru:
```bash
mason make feature --feature_name product
```

atau dengan interactive mode:
```bash
mason make feature
```

## Fitur Otomatis

Mason template ini akan **otomatis**:
1. ✓ Membuat file feature (providers & views)
2. ✓ Menambahkan route constant ke `app_routes.dart`
3. ✓ Menambahkan import dan GoRoute ke `app_pages.dart`

## Struktur yang akan dibuat

```
lib/features/{feature_name}/
├── providers/
│   └── {feature_name}_providers.dart
└── views/
    └── {feature_name}_page.dart
```

## Contoh

Jika menggunakan `mason make feature --feature_name product`, akan dibuat:

**Files:**
- `lib/features/product/providers/product_providers.dart`
- `lib/features/product/views/product_page.dart`

**Otomatis ditambahkan ke app_routes.dart:**
```dart
static const product = '/product';
```

**Otomatis ditambahkan ke app_pages.dart:**
```dart
import 'package:expense/features/product/views/product_page.dart';

GoRoute(
  name: AppRoutes.product,
  path: AppRoutes.product,
  builder: (_, __) => const ProductPage(),
),
```

## Setelah Generate

Jangan lupa untuk menjalankan:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

untuk generate file `.g.dart` dari providers.
