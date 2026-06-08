import os
import json

translations = {
    "ar": {
        "iap_purchase_cancelled": "تم إلغاء عملية الشراء.",
        "iap_purchase_in_progress": "عملية الشراء قيد التنفيذ بالفعل.",
        "iap_purchase_failed": "فشلت عملية الشراء."
    },
    "de": {
        "iap_purchase_cancelled": "Kauf abgebrochen.",
        "iap_purchase_in_progress": "Kauf wird bereits verarbeitet.",
        "iap_purchase_failed": "Kauf fehlgeschlagen."
    },
    "es": {
        "iap_purchase_cancelled": "Compra cancelada.",
        "iap_purchase_in_progress": "La compra ya está en progreso.",
        "iap_purchase_failed": "Compra fallida."
    },
    "fr": {
        "iap_purchase_cancelled": "Achat annulé.",
        "iap_purchase_in_progress": "Achat déjà en cours.",
        "iap_purchase_failed": "Échec de l'achat."
    },
    "hi": {
        "iap_purchase_cancelled": "खरीद रद्द कर दी गई।",
        "iap_purchase_in_progress": "खरीद पहले से ही प्रगति पर है।",
        "iap_purchase_failed": "खरीद विफल।"
    },
    "id": {
        "iap_purchase_cancelled": "Pembelian dibatalkan.",
        "iap_purchase_in_progress": "Pembelian sedang diproses.",
        "iap_purchase_failed": "Pembelian gagal."
    },
    "ja": {
        "iap_purchase_cancelled": "購入がキャンセルされました。",
        "iap_purchase_in_progress": "購入処理は既に実行中です。",
        "iap_purchase_failed": "購入に失敗しました。"
    },
    "ko": {
        "iap_purchase_cancelled": "구매가 취소되었습니다.",
        "iap_purchase_in_progress": "구매가 이미 진행 중입니다.",
        "iap_purchase_failed": "구매 실패."
    },
    "pt": {
        "iap_purchase_cancelled": "Compra cancelada.",
        "iap_purchase_in_progress": "Compra já em andamento.",
        "iap_purchase_failed": "Falha na compra."
    },
    "zh": {
        "iap_purchase_cancelled": "购买已取消。",
        "iap_purchase_in_progress": "购买已在进行中。",
        "iap_purchase_failed": "购买失败。"
    }
}

i18n_dir = "/Users/linhpham/Documents/project-flutter/ai_video_flutter/lib/i18n"

for lang, keys in translations.items():
    file_path = os.path.join(i18n_dir, f"{lang}.i18n.json")
    if os.path.exists(file_path):
        with open(file_path, "r", encoding="utf-8") as f:
            data = json.load(f)
        
        if "errors" in data:
            for k, v in keys.items():
                data["errors"][k] = v
                
        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
            f.write("\n")
        print(f"Updated {lang}.i18n.json")
