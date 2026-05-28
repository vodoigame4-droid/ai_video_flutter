import os
import json

i18n_dir = "/Users/linhpham/Documents/project-flutter/ai_video_flutter/lib/i18n"

translations = {
    "en": {
        "privacy_dialog": {
            "title": "Data Privacy",
            "desc": "Your photos are processed securely by our internal AI systems. We do not share, sell, or disclose your information to any third parties.",
            "cancel": "Cancel",
            "confirm": "Confirm"
        },
        "report_dialog": {
            "title": "Report",
            "desc": "Are you sure you want to submit the report?",
            "cancel": "Cancel",
            "submit": "Submit",
            "success": "Video reported successfully"
        },
        "tips_sheet": {
            "title": "Tips for best results",
            "button_got_it": "I got it!",
            "use_photos": "Use photos like these",
            "avoid_photos": "Avoid photos like these",
            "one_person": "One person",
            "clear_face": "Clear face",
            "half_body": "Half body",
            "hidden_face": "Hidden face",
            "multiple_people": "Multiple people",
            "blurry_photo": "Blurry photo"
        }
    },
    "vi": {
        "privacy_dialog": {
            "title": "Quyền riêng tư dữ liệu",
            "desc": "Ảnh của bạn được xử lý an toàn bởi hệ thống AI nội bộ của chúng tôi. Chúng tôi không chia sẻ, bán hoặc tiết lộ thông tin của bạn cho bất kỳ bên thứ ba nào.",
            "cancel": "Hủy bỏ",
            "confirm": "Xác nhận"
        },
        "report_dialog": {
            "title": "Báo cáo",
            "desc": "Bạn có chắc chắn muốn gửi báo cáo không?",
            "cancel": "Hủy bỏ",
            "submit": "Gửi",
            "success": "Báo cáo video thành công"
        },
        "tips_sheet": {
            "title": "Mẹo để có kết quả tốt nhất",
            "button_got_it": "Tôi đã hiểu!",
            "use_photos": "Nên dùng ảnh như thế này",
            "avoid_photos": "Tránh dùng ảnh như thế này",
            "one_person": "Một người",
            "clear_face": "Rõ khuôn mặt",
            "half_body": "Nửa người",
            "hidden_face": "Bị che khuôn mặt",
            "multiple_people": "Nhiều người",
            "blurry_photo": "Ảnh bị mờ"
        }
    },
    "ar": {
        "privacy_dialog": {
            "title": "خصوصية البيانات",
            "desc": "يتم معالجة صورك بأمان بواسطة أنظمة الذكاء الاصطناعي الداخلية لدينا. نحن لا نشارك أو نبيع أو نكشف عن معلوماتك لأي طرف ثالث.",
            "cancel": "إلغاء",
            "confirm": "تأكيد"
        },
        "report_dialog": {
            "title": "إبلاغ",
            "desc": "هل أنت متأكد أنك تريد إرسال الإبلاغ؟",
            "cancel": "إلغاء",
            "submit": "إرسال",
            "success": "تم الإبلاغ عن الفيديو بنجاح"
        },
        "tips_sheet": {
            "title": "نصائح لأفضل النتائج",
            "button_got_it": "فهمت ذلك!",
            "use_photos": "استخدم صوراً مثل هذه",
            "avoid_photos": "تجنب صوراً مثل هذه",
            "one_person": "شخص واحد",
            "clear_face": "وجه واضح",
            "half_body": "نصف الجسم",
            "hidden_face": "وجه مخفي",
            "multiple_people": "عدة أشخاص",
            "blurry_photo": "صورة ضبابية"
        }
    },
    "de": {
        "privacy_dialog": {
            "title": "Datenschutz",
            "desc": "Ihre Fotos werden von unseren internen KI-Systemen sicher verarbeitet. Wir teilen, verkaufen oder geben Ihre Informationen nicht an Dritte weiter.",
            "cancel": "Abbrechen",
            "confirm": "Bestätigen"
        },
        "report_dialog": {
            "title": "Melden",
            "desc": "Sind Sie sicher, dass Sie den Bericht senden möchten?",
            "cancel": "Abbrechen",
            "submit": "Senden",
            "success": "Video erfolgreich gemeldet"
        },
        "tips_sheet": {
            "title": "Tipps für beste Ergebnisse",
            "button_got_it": "Verstanden!",
            "use_photos": "Verwenden Sie solche Fotos",
            "avoid_photos": "Vermeiden Sie solche Fotos",
            "one_person": "Eine Person",
            "clear_face": "Klares Gesicht",
            "half_body": "Halbkörper",
            "hidden_face": "Verdecktes Gesicht",
            "multiple_people": "Mehrere Personen",
            "blurry_photo": "Unscharfes Foto"
        }
    },
    "es": {
        "privacy_dialog": {
            "title": "Privacidad de datos",
            "desc": "Sus fotos se procesan de forma segura mediante nuestros sistemas internos de IA. No compartimos, vendemos ni divulgamos su información a terceros.",
            "cancel": "Cancelar",
            "confirm": "Confirmar"
        },
        "report_dialog": {
            "title": "Reportar",
            "desc": "¿Está seguro de que desea enviar el reporte?",
            "cancel": "Cancelar",
            "submit": "Enviar",
            "success": "Video reportado con éxito"
        },
        "tips_sheet": {
            "title": "Consejos para mejores resultados",
            "button_got_it": "¡Entendido!",
            "use_photos": "Use fotos como estas",
            "avoid_photos": "Evite fotos como estas",
            "one_person": "Una persona",
            "clear_face": "Cara despejada",
            "half_body": "Medio cuerpo",
            "hidden_face": "Cara oculta",
            "multiple_people": "Varias personas",
            "blurry_photo": "Foto borrosa"
        }
    },
    "fr": {
        "privacy_dialog": {
            "title": "Confidentialité des données",
            "desc": "Vos photos sont traitées en toute sécurité par nos systèmes d'IA internes. Nous ne partageons, ne vendons ni ne divulguons vos informations à des tiers.",
            "cancel": "Annuler",
            "confirm": "Confirmer"
        },
        "report_dialog": {
            "title": "Signaler",
            "desc": "Êtes-vous sûr de vouloir envoyer le signalement ?",
            "cancel": "Annuler",
            "submit": "Signaler",
            "success": "Vidéo signalée avec succès"
        },
        "tips_sheet": {
            "title": "Conseils pour de meilleurs résultats",
            "button_got_it": "J'ai compris !",
            "use_photos": "Utilisez des photos comme celles-ci",
            "avoid_photos": "Évitez les photos comme celles-ci",
            "one_person": "Une personne",
            "clear_face": "Visage clair",
            "half_body": "Demi-corps",
            "hidden_face": "Visage masqué",
            "multiple_people": "Plusieurs personnes",
            "blurry_photo": "Photo floue"
        }
    },
    "hi": {
        "privacy_dialog": {
            "title": "डेटा गोपनीयता",
            "desc": "आपकी तस्वीरों को हमारे आंतरिक एआई सिस्टम द्वारा सुरक्षित रूप से संसाधित किया जाता है। हम आपकी जानकारी किसी भी तीसरे पक्ष के साथ साझा, बेच या प्रकट नहीं करते हैं।",
            "cancel": "रद्द करें",
            "confirm": "पुष्टि करें"
        },
        "report_dialog": {
            "title": "रिपोर्ट करें",
            "desc": "क्या आप वाकई रिपोर्ट सबमिट करना चाहते हैं?",
            "cancel": "रद्द करें",
            "submit": "सबमिट करें",
            "success": "वीडियो की सफलतापूर्वक रिपोर्ट की गई"
          },
          "tips_sheet": {
            "title": "सर्वोत्तम परिणामों के लिए सुझाव",
            "button_got_it": "समझ गया!",
            "use_photos": "इस तरह की तस्वीरों का उपयोग करें",
            "avoid_photos": "इस तरह की तस्वीरों से बचें",
            "one_person": "एक व्यक्ति",
            "clear_face": "स्पष्ट चेहरा",
            "half_body": "आधा शरीर",
            "hidden_face": "छिपा हुआ चेहरा",
            "multiple_people": "कई लोग",
            "blurry_photo": "धुंधली तस्वीर"
        }
    },
    "id": {
        "privacy_dialog": {
            "title": "Privasi Data",
            "desc": "Foto Anda diproses dengan aman oleh sistem AI internal kami. Kami tidak membagikan, menjual, atau mengungkapkan informasi Anda kepada pihak ketiga mana pun.",
            "cancel": "Batal",
            "confirm": "Konfirmasi"
        },
        "report_dialog": {
            "title": "Laporkan",
            "desc": "Apakah Anda yakin ingin mengirimkan laporan?",
            "cancel": "Batal",
            "submit": "Kirim",
            "success": "Video berhasil dilaporkan"
        },
        "tips_sheet": {
            "title": "Tips untuk hasil terbaik",
            "button_got_it": "Saya mengerti!",
            "use_photos": "Gunakan foto seperti ini",
            "avoid_photos": "Hindari foto seperti ini",
            "one_person": "Satu orang",
            "clear_face": "Wajah jelas",
            "half_body": "Setengah badan",
            "hidden_face": "Wajah tersembunyi",
            "multiple_people": "Banyak orang",
            "blurry_photo": "Foto buram"
        }
    },
    "ja": {
        "privacy_dialog": {
            "title": "データプライバシー",
            "desc": "あなたの写真は当社の内部AIシステムによって安全に処理されます。お客様の情報を第三者に共有、販売、または開示することはありません。",
            "cancel": "キャンセル",
            "confirm": "確認"
        },
        "report_dialog": {
            "title": "報告",
            "desc": "報告を送信してもよろしいですか？",
            "cancel": "キャンセル",
            "submit": "送信",
            "success": "動画が正常に報告されました"
        },
        "tips_sheet": {
            "title": "最良の結果を得るためのヒント",
            "button_got_it": "了解しました！",
            "use_photos": "このような写真を使用してください",
            "avoid_photos": "このような写真は避けてください",
            "one_person": "一人",
            "clear_face": "はっきりした顔",
            "half_body": "上半身",
            "hidden_face": "隠れた顔",
            "multiple_people": "複数人",
            "blurry_photo": "ぼやけた写真"
        }
    },
    "ko": {
        "privacy_dialog": {
            "title": "데이터 개인정보 보호",
            "desc": "사진은 당사의 내부 AI 시스템에 의해 안전하게 처리됩니다. 당사는 귀하의 정보를 제3자에게 공유, 판매 또는 공개하지 않습니다.",
            "cancel": "취소",
            "confirm": "확인"
        },
        "report_dialog": {
            "title": "신고",
            "desc": "신고를 제출하시겠습니까?",
            "cancel": "취소",
            "submit": "제출",
            "success": "동영상이 성공적으로 신고되었습니다"
        },
        "tips_sheet": {
            "title": "최상의 결과를 위한 팁",
            "button_got_it": "알겠습니다!",
            "use_photos": "이런 사진을 사용하세요",
            "avoid_photos": "이런 사진은 피하세요",
            "one_person": "한 사람",
            "clear_face": "선명한 얼굴",
            "half_body": "반신",
            "hidden_face": "가려진 얼굴",
            "multiple_people": "여러 사람",
            "blurry_photo": "흐린 사진"
        }
    },
    "pt": {
        "privacy_dialog": {
            "title": "Privacidade de Dados",
            "desc": "Suas fotos são processadas com segurança por nossos sistemas internos de IA. Não compartilhamos, vendemos ou divulgamos suas informações a terceiros.",
            "cancel": "Cancelar",
            "confirm": "Confirmar"
        },
        "report_dialog": {
            "title": "Denunciar",
            "desc": "Tem certeza de que deseja enviar a denúncia?",
            "cancel": "Cancelar",
            "submit": "Enviar",
            "success": "Vídeo denunciado com sucesso"
        },
        "tips_sheet": {
            "title": "Dicas para melhores resultados",
            "button_got_it": "Entendi!",
            "use_photos": "Use fotos como estas",
            "avoid_photos": "Evite fotos como estas",
            "one_person": "Uma pessoa",
            "clear_face": "Rosto nítido",
            "half_body": "Meio corpo",
            "hidden_face": "Rosto coberto",
            "multiple_people": "Várias pessoas",
            "blurry_photo": "Foto embaçada"
        }
    },
    "zh": {
        "privacy_dialog": {
            "title": "数据隐私",
            "desc": "您的照片将通过我们的内部AI系统进行安全处理。我们不会与任何第三方分享、出售或披露您的信息。",
            "cancel": "取消",
            "confirm": "确认"
        },
        "report_dialog": {
            "title": "举报",
            "desc": "您确定要提交举报吗？",
            "cancel": "取消",
            "submit": "提交",
            "success": "视频举报成功"
        },
        "tips_sheet": {
            "title": "获得最佳效果的建议",
            "button_got_it": "我知道了！",
            "use_photos": "使用类似这样的照片",
            "avoid_photos": "避免类似这样的照片",
            "one_person": "单人",
            "clear_face": "脸部清晰",
            "half_body": "半身照",
            "hidden_face": "脸部遮挡",
            "multiple_people": "多人",
            "blurry_photo": "照片模糊"
        }
    }
}

for lang, data in translations.items():
    file_path = os.path.join(i18n_dir, f"{lang}.i18n.json")
    if os.path.exists(file_path):
        with open(file_path, "r", encoding="utf-8") as f:
            content = json.load(f)
        
        # Inject keys
        content["privacy_dialog"] = data["privacy_dialog"]
        content["report_dialog"] = data["report_dialog"]
        content["tips_sheet"] = data["tips_sheet"]
        
        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(content, f, ensure_ascii=False, indent=2)
        print(f"Updated {lang}.i18n.json successfully")
    else:
        print(f"Error: {file_path} not found")
