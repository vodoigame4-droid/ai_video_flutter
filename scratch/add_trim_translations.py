import json
import os

locales_data = {
    "en": {
        "trim_title": "Trim Video",
        "trim_save": "Save",
        "trimming_loading": "Trimming video..."
    },
    "vi": {
        "trim_title": "Cắt video",
        "trim_save": "Lưu",
        "trimming_loading": "Đang cắt video..."
    },
    "fr": {
        "trim_title": "Découper la vidéo",
        "trim_save": "Enregistrer",
        "trimming_loading": "Découpage de la vidéo..."
    },
    "de": {
        "trim_title": "Video schneiden",
        "trim_save": "Speichern",
        "trimming_loading": "Video wird geschnitten..."
    },
    "es": {
        "trim_title": "Cortar video",
        "trim_save": "Guardar",
        "trimming_loading": "Cortando video..."
    },
    "pt": {
        "trim_title": "Cortar vídeo",
        "trim_save": "Salvar",
        "trimming_loading": "Cortando vídeo..."
    },
    "ar": {
        "trim_title": "قص الفيديو",
        "trim_save": "حفظ",
        "trimming_loading": "جاري قص الفيديو..."
    },
    "hi": {
        "trim_title": "वीडियो काटें",
        "trim_save": "सहेजें",
        "trimming_loading": "वीडियो काटा जा रहा है..."
    },
    "id": {
        "trim_title": "Potong Video",
        "trim_save": "Simpan",
        "trimming_loading": "Memotong video..."
    },
    "ja": {
        "trim_title": "動画をカット",
        "trim_save": "保存",
        "trimming_loading": "動画をカット中..."
    },
    "ko": {
        "trim_title": "동영상 자르기",
        "trim_save": "저장",
        "trimming_loading": "동영상 자르는 중..."
    },
    "zh": {
        "trim_title": "剪辑视频",
        "trim_save": "保存",
        "trimming_loading": "正在剪辑视频..."
    }
}

i18n_dir = "lib/i18n"

for locale, translation_keys in locales_data.items():
    file_path = os.path.join(i18n_dir, f"{locale}.i18n.json")
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        continue
    
    with open(file_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    
    if "create" in data:
        for k, v in translation_keys.items():
            data["create"][k] = v
            
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"Successfully updated {locale}.i18n.json with trimmer UI keys")
