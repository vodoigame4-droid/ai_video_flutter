import json
import os

translations = {
    "en": {
        "no_internet_title": "No Connection",
        "no_internet_desc": "Please check your internet connection to continue using the app.",
        "retry_button": "Retry Connection"
    },
    "vi": {
        "no_internet_title": "Mất kết nối",
        "no_internet_desc": "Vui lòng kiểm tra lại kết nối mạng để tiếp tục sử dụng ứng dụng.",
        "retry_button": "Thử lại kết nối"
    },
    "ar": {
        "no_internet_title": "لا يوجد اتصال",
        "no_internet_desc": "يرجى التحقق من اتصالك بالإنترنت لمتابعة استخدام التطبيق.",
        "retry_button": "إعادة محاولة الاتصال"
    },
    "de": {
        "no_internet_title": "Keine Verbindung",
        "no_internet_desc": "Bitte überprüfen Sie Ihre Internetverbindung, um die App weiterhin zu nutzen.",
        "retry_button": "Verbindung erneut versuchen"
    },
    "es": {
        "no_internet_title": "Sin conexión",
        "no_internet_desc": "Por favor, comprueba tu conexão a Internet para seguir usando la aplicación.",
        "retry_button": "Reintentar conexión"
    },
    "fr": {
        "no_internet_title": "Pas de connexion",
        "no_internet_desc": "Veuillez vérifier votre connexion Internet pour continuer à utiliser l'application.",
        "retry_button": "Réessayer la connexion"
    },
    "hi": {
        "no_internet_title": "कोई कनेक्शन नहीं",
        "no_internet_desc": "कृपया ऐप का उपयोग जारी रखने के लिए अपने इंटरनेट कनेक्शन की जांच करें।",
        "retry_button": "पुनः प्रयास करें"
    },
    "id": {
        "no_internet_title": "Tidak Ada Koneksi",
        "no_internet_desc": "Silakan periksa koneksi internet Anda untuk terus menggunakan aplikasi.",
        "retry_button": "Coba Lagi Koneksi"
    },
    "ja": {
        "no_internet_title": "接続がありません",
        "no_internet_desc": "アプリを引き続き使用するには、インターネット接続を確認してください。",
        "retry_button": "接続を再試行"
    },
    "ko": {
        "no_internet_title": "연결 없음",
        "no_internet_desc": "앱을 계속 사용하려면 인터넷 연결을 확인해 주세요.",
        "retry_button": "연결 재시도"
    },
    "pt": {
        "no_internet_title": "Sem conexão",
        "no_internet_desc": "Por favor, verifique sua conexão com a internet para continuar usando o aplicativo.",
        "retry_button": "Tentar novamente a conexão"
    },
    "zh": {
        "no_internet_title": "无网络连接",
        "no_internet_desc": "请检查您的网络连接以继续使用该应用程序。",
        "retry_button": "重试连接"
    }
}

i18n_dir = "/Users/linhpham/Documents/project-flutter/ai_video_flutter/lib/i18n"

for lang, trans in translations.items():
    file_path = os.path.join(i18n_dir, f"{lang}.i18n.json")
    if os.path.exists(file_path):
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)
        
        data["connectivity"] = trans
        
        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
        print(f"Updated {lang}.i18n.json")
    else:
        print(f"File not found: {file_path}")
