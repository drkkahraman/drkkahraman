

LINKS=(
    "https://dorukk.dev/"
    "https://ollama.com/TCYZ"
    "https://huggingface.co/drkkahraman"
)

# Renk kodları
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}${BOLD}║                Linkleri aç!              ║${RESET}"
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════╝${RESET}"
echo ""

# Tarayıcıyı tespit et
if command -v xdg-open &> /dev/null; then
    BROWSER_CMD="xdg-open"
elif command -v firefox &> /dev/null; then
    BROWSER_CMD="firefox"
elif command -v google-chrome &> /dev/null; then
    BROWSER_CMD="google-chrome"
elif command -v chromium-browser &> /dev/null; then
    BROWSER_CMD="chromium-browser"
else
    echo -e "${YELLOW}⚠️ Tarayıcı bulunamadı! Lütfen bir tarayıcı yükleyin. ⚠️${RESET}"
    exit 1
fi

echo -e "${YELLOW}Açılacak linkler:${RESET}"
echo ""

for i in "${!LINKS[@]}"; do
    echo -e "  ${GREEN}[$((i+1))]${RESET} ${LINKS[$i]}"
done

echo ""
echo -e "${CYAN} Linkler açılıyor...${RESET}"
echo ""

for LINK in "${LINKS[@]}"; do
    echo -e "  ${GREEN}✔${RESET}  Açılıyor: ${BOLD}$LINK${RESET}"
    $BROWSER_CMD "$LINK" &> /dev/null &
    sleep 0.5 
done

echo ""
echo -e "${GREEN}${BOLD}✅ Tüm linkler başarıyla açıldı!${RESET}"
echo ""
