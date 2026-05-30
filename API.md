# AI Video Swap & Generator - API Documentation

Base URL: `https://<host>/api/v1`

All authenticated APIs require: `Authorization: Bearer <access_token>`

Response wrapper: `{ "statusCode": 200, "data": <payload> }`

Error: `{ "statusCode": 400, "message": "...", "error": "ER00XXX" }`

---

## Auth

### POST `/auth/login`

**Request:**
```json
{
  "deviceId": "abc123xyz",
  "app": "android",
  "appVersion": "1.0.5",
  "refCode": "ABC123",
  "appType": "ai_video_swap_and_generator"
}
```
- `app`: `"android"` | `"ios"`
- `refCode`: optional

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
      "name": null,
      "email": null,
      "avatarUrl": null,
      "inviteCode": "XYZ789",
      "status": "active",
      "credits": 50,
      "extraCredits": 10,
      "subscribeCredits": 40,
      "isRated": false,
      "isVip": true,
      "activeSubId": "com.vexa.ai.video.weekly",
      "refUsersCount": 0,
      "url": "",
      "createdAt": "2024-01-01T00:00:00.000Z"
    }
  }
}
```
- `credits` = `extraCredits` + `subscribeCredits`
- `extraCredits`: credits vĩnh viễn
- `subscribeCredits`: credits tạm từ subscription
- `activeSubId`: null nếu không phải VIP

---

### POST `/auth/refresh`

**Request:**
```json
{
  "refreshToken": "eyJhbGciOi..."
}
```

**Response:** Giống login response.

---

## User

### GET `/user/me`

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
    "url": "",
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
}
```

---

### PUT `/user/me`

**Request:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "avatarUrl": "https://..."
}
```
Tất cả optional.

**Response:** Giống GET `/user/me`.

---

## Media

### GET `/media/home/tgv`

**Headers:** `app-type: ios`, `app-version: 1.0.5`

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    {
      "id": 1,
      "name": "Trending",
      "description": "Hot themes",
      "themeData": [
        {
          "id": "uuid",
          "name": "Dance Move",
          "description": "Make your photo dance",
          "thumbnailUrl": "https://...",
          "resultUrl": "https://...",
          "sourceUrl": "https://...",
          "sourceUrls": ["https://..."],
          "prompt": "dancing motion",
          "type": "TEMPLATE",
          "orgId": 123
        }
      ]
    }
  ]
}
```

---

### GET `/media/category`

**Headers:** `app-type: ios`, `app-version: 1.0.5`

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    { "id": 1, "name": "Dance" },
    { "id": 2, "name": "Funny" }
  ]
}
```

---

### GET `/media/theme`

**Headers:** `app-type: ios`, `app-version: 1.0.5`

**Query:**
| Param | Type | Required | Default |
|-------|------|----------|---------|
| categoryId | string | ❌ | - |
| page | number | ❌ | 1 |
| take | number | ❌ | 10 |
| isFeatured | boolean | ❌ | - |

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
      "pageCount": 5,
      "hasPreviousPage": false,
      "hasNextPage": true
    }
  }
}
```

---

### POST `/media/tgv`

**Request:**
```json
{
  "imageUrl": "https://...",
  "name": "My Video",
  "prompt": "Make it dance",
  "themeId": "uuid-or-number",
  "isHd": false,
  "isLongTime": false,
  "themeType": "TEMPLATE",
  "themeOrgId": 123,
  "serviceType": "IMAGE_TO_VIDEO",
  "videoUrl": "https://..."
}
```

**serviceType values:**
| Value | Description | imageUrl | videoUrl |
|-------|-------------|----------|----------|
| `IMAGE_TO_VIDEO` | Dùng theme | 1 ảnh | ❌ |
| `ITV_SINGLE_SOURCE` | Image to video, không dùng theme | 1 ảnh | ❌ |
| `ITV_DUAL_SOURCE` | Unified video, không dùng theme | 1-3 ảnh (phân cách bằng `,`) | ❌ |
| `DANCING_IMAGE` | Image to dance, không dùng theme | 1 ảnh | ✅ bắt buộc |
| `TRANSITION_VIDEO` | Transition video, không dùng theme | 2 ảnh (phân cách bằng `,`) | ❌ |

- `imageUrl`: required. Với multi-source dùng comma-separated: `"https://img1.jpg,https://img2.jpg"`
- `videoUrl`: chỉ dùng khi `serviceType = DANCING_IMAGE`, upload qua `POST /file/upload/video`
- `serviceType`: required
- Còn lại optional

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
- `status`: `"pending"` | `"completed"` | `"failed"`

---

### GET `/media/detail/:id`

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

**Query:**
| Param | Type | Required |
|-------|------|----------|
| page | number | ❌ |
| take | number | ❌ |

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
      "pageCount": 3,
      "hasPreviousPage": false,
      "hasNextPage": true
    }
  }
}
```

---

### GET `/media/status`

**Query:**
| Param | Type | Required | Description |
|-------|------|----------|-------------|
| ids | string | ✅ | Comma-separated UUIDs: `uuid1,uuid2` |

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    {
      "id": "uuid-1",
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
  ]
}
```

---

### DELETE `/media/:id`

**Response:**
```json
{
  "statusCode": 200,
  "data": null
}
```

---

### GET `/media/prices`

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    {
      "id": "uuid",
      "name": "Image to Video",
      "description": "Generate video from image",
      "useByVip": false,
      "defaultCredits": 1,
      "type": "IMAGE_TO_VIDEO",
      "servicePrices": [
        {
          "id": "uuid",
          "tierCode": "HD",
          "extraType": "HD",
          "costCredits": 2,
          "isActive": true
        }
      ]
    }
  ]
}
```

---

## IAP

### POST `/iap/verify/product` (Android)

**Request:**
```json
{
  "productId": "com.vexa.ai.video.50credits",
  "purchaseToken": "<google_purchase_token>"
}
```

**Response:**
```json
{ "statusCode": 200, "data": null }
```

---

### POST `/iap/verify/subscription` (Android)

**Request:**
```json
{
  "productId": "com.vexa.ai.video.weekly",
  "purchaseToken": "<google_purchase_token>"
}
```

**Response:**
```json
{ "statusCode": 200, "data": null }
```

---

### POST `/iap/restore/subscription` (Android)

**Request:**
```json
{
  "productId": "com.vexa.ai.video.weekly",
  "purchaseToken": "<google_purchase_token>"
}
```

**Response:**
```json
{ "statusCode": 200, "data": null }
```

---

### POST `/iap/verify/product/ios`

**Request:**
```json
{
  "productId": "com.vexa.ai.video.50credits",
  "transactionId": "<apple_transaction_id>"
}
```

**Response:**
```json
{ "statusCode": 200, "data": null }
```

---

### POST `/iap/verify/subscription/ios`

**Request:**
```json
{
  "productId": "com.vexa.ai.video.weekly",
  "transactionId": "<apple_transaction_id>"
}
```

**Response:**
```json
{ "statusCode": 200, "data": null }
```

---

### POST `/iap/restore/subscription/ios`

**Request:**
```json
{
  "productId": "com.vexa.ai.video.weekly",
  "transactionId": "<apple_transaction_id>"
}
```

**Response:**
```json
{ "statusCode": 200, "data": null }
```

---

## File

### POST `/file/upload/video`

**Content-Type:** `multipart/form-data`

**Form field:** `file` (mp4/webm/mov, max 20MB)

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "url": "https://cdn.example.com/video.mp4"
  }
}
```

---

### POST `/file/upload/image`

**Content-Type:** `multipart/form-data`

**Form field:** `file` (jpeg/png/webp, max 20MB)

**Response:**
```json
{
  "statusCode": 200,
  "data": {
    "url": "https://cdn.example.com/image.webp"
  }
}
```

---

### POST `/file/upload/images`

**Content-Type:** `multipart/form-data`

**Form field:** `files` (jpeg/png/webp, max 20MB each, max 10 files)

**Response:**
```json
{
  "statusCode": 200,
  "data": [
    { "url": "https://cdn.example.com/image-1.webp" },
    { "url": "https://cdn.example.com/image-2.webp" }
  ]
}
```
