import json
import os

locales_data = {
    "en": {"generating_page": "Generating Page Preview"},
    "vi": {"generating_page": "Xem trước trang Generating"},
    "fr": {"generating_page": "Aperçu de la page de génération"},
    "de": {"generating_page": "Vorschau der Generierungsseite"},
    "es": {"generating_page": "Vista previa de la página de generación"},
    "pt": {"generating_page": "Visualização da página de geração"},
    "ar": {"generating_page": "معاينة صفحة الإنشاء"},
    "hi": {"generating_page": "जेनरेटिंग पेज पूर्वावलोकन"},
    "id": {"generating_page": "Pratinjau Halaman Pembuatan"},
    "ja": {"generating_page": "生成プロセスページのプレビュー"},
    "ko": {"generating_page": "생성 중 페이지 미리보기"},
    "zh": {"generating_page": "生成页面预览"}
}

i18n_dir = "lib/i18n"

for locale, new_keys in locales_data.items():
    file_path = os.path.join(i18n_dir, f"{locale}.i18n.json")
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        continue
    
    with open(file_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    
    if "debug" in data:
        for k, v in new_keys.items():
            data["debug"][k] = v
            
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"Successfully updated {locale}.i18n.json")
