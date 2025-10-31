// 조회수 증가 방지
function reloadWithoutViewCount() {
    let currentUrl = window.location.href;

    if (!currentUrl.includes("skipViewCount=true")) {
        if (currentUrl.includes("?")) {
            currentUrl += "&skipViewCount=true";
        } else {
            currentUrl += "?skipViewCount=true";
        }
    }

    window.location.href = currentUrl;
}