import json
import os

locales_data = {
    "en": {
        "generate_title": "Generate",
        "upload_first_photo": "Upload first photo.",
        "upload_last_photo": "Upload last photo.",
        "upload_video_slot": "Upload Video.",
        "upload_photo_slot": "Upload photo.",
        "photo_slot_num": "Photo {num}",
        "required_label": "Required",
        "optional_label": "Optional",
        "inspire_me_count": "Inspire me ({count})",
        "character_count": "{current}/1000",
        "generating_video": "Generating your video...",
        "select_mock_media": "Select Mock Media",
        "select_media_desc": "Select a mock file to simulate upload"
    },
    "vi": {
        "generate_title": "Tạo video",
        "upload_first_photo": "Tải lên ảnh đầu tiên.",
        "upload_last_photo": "Tải lên ảnh cuối cùng.",
        "upload_video_slot": "Tải lên Video.",
        "upload_photo_slot": "Tải lên ảnh.",
        "photo_slot_num": "Ảnh {num}",
        "required_label": "Bắt buộc",
        "optional_label": "Tùy chọn",
        "inspire_me_count": "Gợi ý prompt ({count})",
        "character_count": "{current}/1000",
        "generating_video": "Đang tạo video của bạn...",
        "select_mock_media": "Chọn file mẫu",
        "select_media_desc": "Chọn một file mẫu để mô phỏng tải lên"
    },
    "fr": {
        "generate_title": "Générer",
        "upload_first_photo": "Télécharger la première photo.",
        "upload_last_photo": "Télécharger la dernière photo.",
        "upload_video_slot": "Télécharger la vidéo.",
        "upload_photo_slot": "Télécharger la photo.",
        "photo_slot_num": "Photo {num}",
        "required_label": "Obligatoire",
        "optional_label": "Optionnel",
        "inspire_me_count": "Inspirez-moi ({count})",
        "character_count": "{current}/1000",
        "generating_video": "Génération de votre vidéo...",
        "select_mock_media": "Sélectionner un média fictif",
        "select_media_desc": "Sélectionnez un fichier fictif pour simuler le téléchargement"
    },
    "de": {
        "generate_title": "Generieren",
        "upload_first_photo": "Erstes Foto hochladen.",
        "upload_last_photo": "Letztes Foto hochladen.",
        "upload_video_slot": "Video hochladen.",
        "upload_photo_slot": "Foto hochladen.",
        "photo_slot_num": "Foto {num}",
        "required_label": "Erforderlich",
        "optional_label": "Optional",
        "inspire_me_count": "Inspiriere mich ({count})",
        "character_count": "{current}/1000",
        "generating_video": "Video wird generiert...",
        "select_mock_media": "Mock-Medien auswählen",
        "select_media_desc": "Wählen Sie eine Mock-Datei aus, um den Upload zu simulieren"
    },
    "es": {
        "generate_title": "Generar",
        "upload_first_photo": "Subir primera foto.",
        "upload_last_photo": "Subir última foto.",
        "upload_video_slot": "Subir video.",
        "upload_photo_slot": "Subir foto.",
        "photo_slot_num": "Foto {num}",
        "required_label": "Requerido",
        "optional_label": "Opcional",
        "inspire_me_count": "Inspirarme ({count})",
        "character_count": "{current}/1000",
        "generating_video": "Generando tu video...",
        "select_mock_media": "Seleccionar medio simulado",
        "select_media_desc": "Seleccione un archivo simulado para simular la carga"
    },
    "pt": {
        "generate_title": "Gerar",
        "upload_first_photo": "Carregar primeira foto.",
        "upload_last_photo": "Carregar última foto.",
        "upload_video_slot": "Carregar vídeo.",
        "upload_photo_slot": "Carregar foto.",
        "photo_slot_num": "Foto {num}",
        "required_label": "Obrigatório",
        "optional_label": "Opcional",
        "inspire_me_count": "Inspirar-me ({count})",
        "character_count": "{current}/1000",
        "generating_video": "Gerando seu vídeo...",
        "select_mock_media": "Selecionar mídia simulada",
        "select_media_desc": "Selecione um arquivo simulado para simular o upload"
    },
    "ar": {
        "generate_title": "إنشاء",
        "upload_first_photo": "تحميل الصورة الأولى.",
        "upload_last_photo": "تحميل الصورة الأخيرة.",
        "upload_video_slot": "تحميل الفيديو.",
        "upload_photo_slot": "تحميل الصورة.",
        "photo_slot_num": "صورة {num}",
        "required_label": "مطلوب",
        "optional_label": "اختياري",
        "inspire_me_count": "ألهمني ({count})",
        "character_count": "{current}/1000",
        "generating_video": "جاري إنشاء الفيديو الخاص بك...",
        "select_mock_media": "حدد وسائط وهمية",
        "select_media_desc": "حدد ملفًا وهميًا لمحاكاة التحميل"
    },
    "hi": {
        "generate_title": "बनाएं",
        "upload_first_photo": "पहला फोटो अपलोड करें।",
        "upload_last_photo": "अंतिम फोटो अपलोड करें।",
        "upload_video_slot": "वीडियो अपलोड करें।",
        "upload_photo_slot": "फोटो अपलोड करें।",
        "photo_slot_num": "फोटो {num}",
        "required_label": "आवश्यक",
        "optional_label": "वैकल्पिक",
        "inspire_me_count": "मुझे प्रेरित करें ({count})",
        "character_count": "{current}/1000",
        "generating_video": "आपका वीडियो बनाया जा रहा है...",
        "select_mock_media": "नकली मीडिया चुनें",
        "select_media_desc": "अपलोड अनुकरण करने के लिए एक नकली फ़ाइल चुनें"
    },
    "id": {
        "generate_title": "Hasilkan",
        "upload_first_photo": "Unggah foto pertama.",
        "upload_last_photo": "Unggah foto terakhir.",
        "upload_video_slot": "Unggah Video.",
        "upload_photo_slot": "Unggah foto.",
        "photo_slot_num": "Foto {num}",
        "required_label": "Wajib",
        "optional_label": "Opsional",
        "inspire_me_count": "Inspirasi saya ({count})",
        "character_count": "{current}/1000",
        "generating_video": "Sedang menghasilkan video Anda...",
        "select_mock_media": "Pilih Media Simulasi",
        "select_media_desc": "Pilih file simulasi untuk mensimulasikan unggahan"
    },
    "ja": {
        "generate_title": "生成する",
        "upload_first_photo": "最初の写真をアップロード。",
        "upload_last_photo": "最後の写真をアップロード。",
        "upload_video_slot": "動画をアップロード。",
        "upload_photo_slot": "写真をアップロード。",
        "photo_slot_num": "写真 {num}",
        "required_label": "必須",
        "optional_label": "任意",
        "inspire_me_count": "インスピレーションを得る ({count})",
        "character_count": "{current}/1000",
        "generating_video": "動画を生成中...",
        "select_mock_media": "モックメディアを選択",
        "select_media_desc": "アップロードをシミュレートするモックファイルを選択"
    },
    "ko": {
        "generate_title": "생성하기",
        "upload_first_photo": "첫 번째 사진 업로드.",
        "upload_last_photo": "마지막 사진 업로드.",
        "upload_video_slot": "동영상 업로드.",
        "upload_photo_slot": "사진 업로드.",
        "photo_slot_num": "사진 {num}",
        "required_label": "필수",
        "optional_label": "선택",
        "inspire_me_count": "영감 주기 ({count})",
        "character_count": "{current}/1000",
        "generating_video": "동영상 생성 중...",
        "select_mock_media": "모크 미디어 선택",
        "select_media_desc": "업로드를 시뮬레이션할 모크 파일 선택"
    },
    "zh": {
        "generate_title": "生成",
        "upload_first_photo": "上传第一张照片。",
        "upload_last_photo": "上传最后一张照片。",
        "upload_video_slot": "上传视频。",
        "upload_photo_slot": "上传照片。",
        "photo_slot_num": "照片 {num}",
        "required_label": "必填",
        "optional_label": "选填",
        "inspire_me_count": "灵感推荐 ({count})",
        "character_count": "{current}/1000",
        "generating_video": "正在生成您的视频...",
        "select_mock_media": "选择模拟媒体",
        "select_media_desc": "选择一个模拟文件以模拟上传"
    }
}

i18n_dir = "lib/i18n"

for locale, new_keys in locales_data.items():
    file_path = os.path.join(i18n_dir, f"{locale}.i18n.json")
    if not os.path.exists(file_path):
        print(f"File not found: {file_path}")
        continue
    
    with open(file_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    
    if "create" in data:
        for k, v in new_keys.items():
            data["create"][k] = v
            
    with open(file_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"Successfully updated {locale}.i18n.json")
