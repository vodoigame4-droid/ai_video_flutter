import os
import re
import sys

# Directory to scan
WIDGET_DIR = "lib/features"

# Exceptions allowed in widget code
ALLOWED_COLORS = ["Colors.transparent"]

# Regex patterns for styling rules
PATTERN_WITH_OPACITY = re.compile(r"\.withOpacity\(")
PATTERN_COPY_WITH = re.compile(r"AppTextStyles\.[a-zA-Z0-9_]+\.copyWith\(")
PATTERN_TEXT_COPY_WITH = re.compile(r"TextStyle\([^)]*\)\.copyWith\(")
PATTERN_HEX_COLOR = re.compile(r"Color\(0xFF[0-9a-fA-F]{6}\)")
PATTERN_MATERIAL_COLOR = re.compile(r"\bColors\.[a-zA-Z]+")
PATTERN_INLINE_TEXTSTYLE = re.compile(r"\bTextStyle\(")
PATTERN_HARDCODED_TEXT = re.compile(r"\bText\(\s*['\"][^'\"]+['\"]")

violations = []

def scan_file(filepath):
    # Skip generated files
    if filepath.endswith(".g.dart") or filepath.endswith(".freezed.dart"):
        return
        
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()
        
    for i, line in enumerate(lines):
        line_num = i + 1
        stripped = line.strip()
        
        # Skip comment lines
        if stripped.startswith("//") or stripped.startswith("/*") or stripped.startswith("*"):
            continue
            
        # 1. Check withOpacity
        if PATTERN_WITH_OPACITY.search(stripped):
            violations.append((filepath, line_num, stripped, "Found '.withOpacity'. Use '.withValues(alpha: ...)' instead."))
            
        # 2. Check copyWith on AppTextStyles
        if PATTERN_COPY_WITH.search(stripped) or PATTERN_TEXT_COPY_WITH.search(stripped):
            violations.append((filepath, line_num, stripped, "Found '.copyWith' on TextStyle. All text styles must be predefined in AppTextStyles."))
            
        # 3. Check hardcoded hex colors
        if PATTERN_HEX_COLOR.search(stripped):
            violations.append((filepath, line_num, stripped, "Found hardcoded hex Color(0xFF...). Use AppColors instead."))
            
        # 4. Check Material Colors
        m_colors = PATTERN_MATERIAL_COLOR.findall(stripped)
        for col in m_colors:
            if col not in ALLOWED_COLORS:
                violations.append((filepath, line_num, stripped, f"Found hardcoded Material color '{col}'. Use AppColors instead."))
                
        # 5. Check inline TextStyle definitions
        if "lib/core/theme/" not in filepath and "app_text_styles.dart" not in filepath:
            if PATTERN_INLINE_TEXTSTYLE.search(stripped):
                violations.append((filepath, line_num, stripped, "Found inline TextStyle. All styles must be defined in AppTextStyles."))
                
        # 6. Check hardcoded text widgets
        if PATTERN_HARDCODED_TEXT.search(stripped):
            violations.append((filepath, line_num, stripped, "Found hardcoded text string inside Text widget. Put strings in en.i18n.json and use slang translation."))

def run_scan():
    print("Starting automated check for theme & style violations...")
    
    # Traverse project
    for root, _, files in os.walk(WIDGET_DIR):
        for file in files:
            if file.endswith(".dart"):
                scan_file(os.path.join(root, file))
                
    if violations:
        print(f"\n[ERROR] Found {len(violations)} violations of coding principles:\n")
        for filepath, line_num, line_content, msg in violations:
            print(f" File: {filepath}:{line_num}")
            print(f" Code: {line_content}")
            print(f" Error: {msg}")
            print("-" * 50)
        sys.exit(1)
    else:
        print("\n[SUCCESS] No violations found! The codebase complies with styling guidelines.\n")
        sys.exit(0)

if __name__ == "__main__":
    run_scan()
