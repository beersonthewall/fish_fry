function buttonToggle(btn) {
    if(btn.getAttribute("class") == ".menu-button") {
        btn.setAttribute("class", ".menu-button-selected");
        return;
    }

    btn.setAttribute("class", ".menu-button");
}
