# AI Video Swap & Generator - API Documentation

Base URL: `https://video-effect-be.apihub.today/api/v1`

---

## 1. Auth

### POST `/auth/login`
Đăng nhập hoặc tạo user mới bằng deviceId.

**Request Body:**
```json
{
  "deviceId": "abc123xyz",
  "app": "android",
  "app-version": "1.0.5",
  "refCode": "ABC123",
  "app-type": "ai_video_swap_and_generator"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "accessToken": "eyJhbGciOi...",
    "tokenExpires": 1717000000000,
    "refreshToken": "eyJhbGciOi...",
    "refreshTokenExpires": 1717000000000,
    "user": {
      "id": "uuid",
      "deviceId": "abc123xyz",
      "name": "John Doe",
      "email": "john@example.com",
      "avatarUrl": "https://...",
      "inviteCode": "XYZ789",
      "status": "active",
      "credits": 50,
      "extraCredits": 10,
      "subscribeCredits": 40,
      "isRated": false,
      "isVip": true,
      "activeSubId": "com.vexa.ai.video.weekly",
      "refUsersCount": 3,
      "createdAt": "2024-01-01T00:00:00.000Z"
    }
  }
}
```

---

### POST `/auth/refresh`
Refresh access token.

**Request Body:**
```json
{
  "refreshToken": "eyJhbGciOi..."
}
```

**Response:** Giống login response.

---

## 2. User

### GET `/user/me`
Lấy thông tin user hiện tại.

**Headers:** `Authorization: Bearer <token>`

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "id": "uuid",
    "deviceId": "abc123xyz",
    "name": "John Doe",
    "email": "john@example.com",
    "avatarUrl": "https://...",
    "inviteCode": "XYZ789",
    "status": "active",
    "credits": 50,
    "extraCredits": 10,
    "subscribeCredits": 40,
    "isRated": false,
    "isVip": true,
    "activeSubId": "com.vexa.ai.video.weekly",
    "refUsersCount": 3,
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
}
```

---

### PUT `/user/me`
Cập nhật thông tin user.

**Headers:** `Authorization: Bearer <token>`

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "avatarUrl": "https://..."
}
```

**Response:** Giống GET `/user/me`.

---

## 3. Media

### GET `/media/home/tgv`
Lấy danh sách home categories.

**Headers:**
| Header | Value |
|--------|-------|
| Authorization | Bearer \<token\> |
| app-type | ios / android |
| app-version | 1.0.5 |

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    {
      "id": 1,
      "name": "Trending",
      "theme" : [
        {
        "id": "uuid",
        "name": "Dance Move",
        "description": "Make your photo dance",
        "resultUrl": "https://...",
        "sourceUrl": "https://...",
        "sourceUrls": ["https://..."],
        "thumbnailUrl": "https://...",
        "prompt": "dancing motion",
        "type": "TEMPLATE",
        "orgId": 123
      }, 

      ]
    },
    {
      "id": 2,
      "name": "Popular"
    }
  ]
}
```

---

### GET `/media/category`
Lấy danh sách category từ theme service.

**Headers:**
| Header | Value |
|--------|-------|
| Authorization | Bearer \<token\> |
| app-type | ios / android |
| app-version | 1.0.5 |

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    {
      "id": 1,
      "name": "Dance"
    },
    {
      "id": 2,
      "name": "Funny"
    }
  ]
}
```

---

### GET `/media/theme`
Lấy danh sách themes theo category.

**Headers:**
| Header | Value |
|--------|-------|
| Authorization | Bearer \<token\> |
| app-type | ios / android |
| app-version | 1.0.5 |

**Query Params:**
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| categoryId | string | ❌ | Filter theo category |
| page | number | ❌ | Trang (default 1) |
| take | number | ❌ | Số item/trang (default 10) |
| isFeatured | boolean | ❌ | Chỉ lấy featured |

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "data": [
      {
        "id": "uuid",
        "name": "Dance Move",
        "description": "Make your photo dance",
        "resultUrl": "https://...",
        "sourceUrl": "https://...",
        "sourceUrls": ["https://..."],
        "thumbnailUrl": "https://...",
        "prompt": "dancing motion",
        "type": "TEMPLATE",
        "orgId": 123
      }
    ],
    "meta": {
      "page": 1,
      "take": 10,
      "total": 50,
      "pageCount": 5
    }
  }
}
```

---

### POST `/media/tgv`
Tạo media TGV (text-guided video).

**Headers:** `Authorization: Bearer <token>`

**Request Body:**
```json
{
  "imageUrl": "https://...",
  "name": "My Video",
  "prompt": "Make it dance",
  "themeId": "uuid-or-number",
  "isHd": false,
  "isLongTime": false,
  "themeType": "TEMPLATE",
  "themeOrgId": 123
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "id": "uuid",
    "name": "My Video",
    "imageUrl": "https://...",
    "imageUrls": ["https://..."],
    "imageQuantity": 1,
    "requestId": "req-123",
    "resultUrl": null,
    "finishedTime": null,
    "prompt": "Make it dance",
    "isHd": false,
    "isLongTime": false,
    "themeId": "uuid",
    "thumbnailUrl": null,
    "status": "pending",
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
}
```

---

### GET `/media/detail/:id`
Lấy chi tiết 1 media.

**Headers:** `Authorization: Bearer <token>`

**Path Params:** `id` - UUID của media

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "id": "uuid",
    "name": "My Video",
    "imageUrl": "https://...",
    "imageUrls": ["https://..."],
    "imageQuantity": 1,
    "requestId": "req-123",
    "resultUrl": "https://...",
    "finishedTime": "2024-01-01T00:01:00.000Z",
    "prompt": "Make it dance",
    "isHd": false,
    "isLongTime": false,
    "themeId": "uuid",
    "thumbnailUrl": "https://...",
    "status": "completed",
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
}
```

---

### GET `/media/history`
Lịch sử media của user (paginated).

**Headers:** `Authorization: Bearer <token>`

**Query Params:**
| Param | Type | Required |
|-------|------|----------|
| take | number | ❌ |
| page | number | ❌ |

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "data": [
      {
        "id": "uuid",
        "name": "My Video",
        "imageUrl": "https://...",
        "imageUrls": ["https://..."],
        "imageQuantity": 1,
        "requestId": "req-123",
        "resultUrl": "https://...",
        "finishedTime": "2024-01-01T00:01:00.000Z",
        "prompt": "Make it dance",
        "isHd": false,
        "isLongTime": false,
        "themeId": "uuid",
        "thumbnailUrl": "https://...",
        "status": "completed",
        "createdAt": "2024-01-01T00:00:00.000Z"
      }
    ],
    "meta": {
      "page": 1,
      "take": 10,
      "total": 25,
      "pageCount": 3
    }
  }
}
```

---

### GET `/media/status`
Check status nhiều media cùng lúc.

**Headers:** `Authorization: Bearer <token>`

**Query Params:**
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| ids | string | ✅ | Comma-separated UUIDs |

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    {
      "id": "uuid-1",
      "status": "completed",
      "resultUrl": "https://...",
      "finishedTime": "2024-01-01T00:01:00.000Z"
    },
    {
      "id": "uuid-2",
      "status": "pending",
      "resultUrl": null,
      "finishedTime": null
    }
  ]
}
```

---

### DELETE `/media/:id`
Xóa media.

**Headers:** `Authorization: Bearer <token>`

**Path Params:** `id` - UUID của media

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

## 4. IAP (In-App Purchase)

### POST `/iap/verify/product`
Verify mua product lẻ (Android).

**Headers:** `Authorization: Bearer <token>`

**Request Body:**
```json
{
  "productId": "com.vexa.ai.video.50credits",
  "purchaseToken": "<google_purchase_token>"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

### POST `/iap/verify/subscription`
Verify mua subscription mới (Android).

**Headers:** `Authorization: Bearer <token>`

**Request Body:**
```json
{
  "productId": "com.vexa.ai.video.weekly",
  "purchaseToken": "<google_purchase_token>"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

### POST `/iap/restore/subscription`
Restore subscription (Android).

**Headers:** `Authorization: Bearer <token>`

**Request Body:**
```json
{
  "productId": "com.vexa.ai.video.weekly",
  "purchaseToken": "<google_purchase_token>"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

### POST `/iap/verify/product/ios`
Verify mua product lẻ (iOS).

**Headers:** `Authorization: Bearer <token>`

**Request Body:**
```json
{
  "productId": "com.vexa.ai.video.50credits",
  "transactionId": "<apple_transaction_id>"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

### POST `/iap/verify/subscription/ios`
Verify mua subscription mới (iOS).

**Headers:** `Authorization: Bearer <token>`

**Request Body:**
```json
{
  "productId": "com.vexa.ai.video.weekly",
  "transactionId": "<apple_transaction_id>"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

### POST `/iap/restore/subscription/ios`
Restore subscription (iOS).

**Headers:** `Authorization: Bearer <token>`

**Request Body:**
```json
{
  "productId": "com.vexa.ai.video.weekly",
  "transactionId": "<apple_transaction_id>"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

### POST `/iap/google`
Google Play Pub/Sub webhook. **Public API.**

**Request Body:**
```json
{
  "message": {
    "data": "<base64_encoded_payload>",
    "messageId": "msg-123",
    "publishTime": "2024-01-01T00:00:00Z"
  },
  "subscription": "projects/xxx/subscriptions/yyy"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

### POST `/iap/apple`
Apple Server Notification webhook. **Public API.**

**Request Body:**
```json
{
  "signedPayload": "<JWS_signed_payload>"
}
```

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```


**Transaction titleType enum:**
| titleType | Description |
|-----------|-------------|
| `SUBSCRIBED_PLAN` | Mua subscription |
| `IN_APP_PURCHASE` | Mua credits lẻ |
| `SUBSCRIPTION_RENEWED` | Subscription renew (cấp credits mới) |
| `CREDITS_USED` | Tiêu credits |
| `REFUND_FAILED_SERVICE` | Hoàn credits do service lỗi |
| `SUBSCRIPTION_CANCELLED` | Thu hồi credits khi sub hết hạn/refund |
| `PURCHASE_REVERSED` | Purchase bị reversed |
| `LOGIN_REWARD_STREAK` | Thưởng login liên tiếp |
| `TASK_REWARD` | Thưởng hoàn thành task |
| `CREDITS_EARNED` | Kiếm credits |
| `WELCOME_BONUS` | Bonus đăng nhập lần đầu |

---

## 5. File

### POST `/file/upload/image`
Upload 1 ảnh.

**Headers:** `Authorization: Bearer <token>`

**Content-Type:** `multipart/form-data`

**Form Data:**
| Field | Type | Constraint |
|-------|------|-----------|
| file | File | jpeg/png/webp, max 20MB |

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "url": "https://cdn.example.com/uploads/image-uuid.webp"
  }
}
```

---

### POST `/file/upload/images`
Upload nhiều ảnh.

**Headers:** `Authorization: Bearer <token>`

**Content-Type:** `multipart/form-data`

**Form Data:**
| Field | Type | Constraint |
|-------|------|-----------|
| files | File[] | jpeg/png/webp, max 20MB each, max 10 files |

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    { "url": "https://cdn.example.com/uploads/image-1.webp" },
    { "url": "https://cdn.example.com/uploads/image-2.webp" }
  ]
}
```

---

## Notes

- Tất cả API có Auth cần header: `Authorization: Bearer <access_token>`
- Response format chung: `{ "statusCode": 200, "data": {...} }`
- Error format: `{ "statusCode": 400, "message": "...", "error": "ER00XXX" }`
- Sandbox detection tự động đánh dấu `user.is_reviewer = true`:
  - iOS: `environment === 'Sandbox' || 'ProductionSandbox'`
  - Android Product: `purchaseType === 0`
  - Android Subscription: `testPurchase !== undefined`
- Credits hiển thị cho user: `credits = extraCredits + subscribeCredits`
  - `extraCredits`: credits vĩnh viễn (mua lẻ, earn, bonus)
  - `subscribeCredits`: credits tạm từ subscription (expire theo chu kỳ sub)
