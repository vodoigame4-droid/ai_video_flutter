# API Documentation

## Get Suggestion Prompt

Gợi ý prompt mô tả video dựa trên ảnh đầu vào.

**Endpoint:** `POST /v1/media/suggestion`

**Auth:** Bearer Token (required)

---

### Request

**Headers:**
| Key | Value |
|-----|-------|
| Authorization | `Bearer <token>` |
| Content-Type | `application/json` |

**Body:**
| Field | Type | Required | Description |
|-------|------|----------|-------------|
| imageUrl | string | ✅ | URL của ảnh cần gợi ý prompt |

```json
{
  "imageUrl": "https://example.com/image.jpg"
}
```

---

### Response

**200 OK**
```json
{
  "status": 200,
  "message": "success",
  "data": {
    "prompt": "A close-up shot of a desk with a keyboard, a black wireless earbud case, a pen, and handwritten notes on paper..."
  }
}
```

| Field | Type | Description |
|-------|------|-------------|
| data.prompt | string | Prompt mô tả nội dung video được gợi ý từ ảnh |
