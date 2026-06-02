import os
import json

translations = {
    "en": "AI is thinking...",
    "vi": "AI đang suy nghĩ...",
    "fr": "L'IA réfléchit...",
    "de": "KI denkt nach...",
    "es": "La IA está pensando...",
    "pt": "A IA está pensando...",
    "ar": "الذكاء الاصطناعي يفكر...",
    "hi": "एआई सोच रहा है...",
    "id": "AI sedang berpikir...",
    "ja": "AIが考えています...",
    "ko": "AI가 생각 중...",
    "zh": "AI 正在思考..."
}

i18n_dir = "/Users/linhpham/Documents/project-flutter/ai_video_flutter/lib/i18n"

for filename in os.listdir(i18n_dir):
    if filename.endswith(".i18n.json"):
        lang = filename.split(".")[0]
        filepath = os.path.join(i18n_dir, filename)
        
        value = translations.get(lang, "AI is thinking...")
        
        with open(filepath, "r", encoding="utf-8") as f:
            try:
                data = json.load(f)
            except Exception as e:
                print(f"Error reading {filename}: {e}")
                continue
        
        if "create" in data:
            data["create"]["inspiring"] = value
            
            with open(filepath, "w", encoding="utf-8") as f:
                json.dump(data, f, ensure_ascii=False, indent=2)
            print(f"Added 'inspiring' to {filename}")
        else:
            print(f"No 'create' namespace in {filename}")
