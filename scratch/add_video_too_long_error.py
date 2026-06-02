import json
import os

locales_data = {
    "en": "Video must be under 10 seconds.",
    "vi": "Video phải ngắn hơn 10 giây.",
    "fr": "La vidéo doit durer moins de 10 secondes.",
    "de": "Das Video muss unter 10 Sekunden lang sein.",
    "es": "El video debe durar menos de 10 segundos.",
    "pt": "O vídeo deve ter menos de 10 segundos.",
    "ar": "يجب أن يكون الفيديو أقل من 10 ثوانٍ.",
    "hi": "वीडियो 10 सेकंड से कम का होना चाहिए।",
    "id": "Video harus di bawah 10 detik.",
    "ja": "動画は10秒未満である必要があります。",
    "ko": "동영상은 10초 미만이어야 합니다.",
    "zh": "视频长度必须在10秒以内。"
}

i18n_dir = "lib/i18n"

for locale, translation in locales_data.items():
    file_path = os.path.join(i18n_dir, f"{locale}.i18n.json")
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        continue
    
    with open(file_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    
    if "errors" in data:
        data["errors"]["video_too_long"] = translation
            
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"Successfully updated {locale}.i18n.json with video_too_long error")
