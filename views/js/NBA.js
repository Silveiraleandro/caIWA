function mvpDisplay(idTable, bShowMvp) {
    // if bShowMvp is true, then we're highlighting mvp
    //	players, otherwise we're unhighlighting them.
    var i = 0;
    var oTable = document.getElementById(idTable);
    var oTBODY = oTable.getElementsByTagName('tbody')[0];
    var aTRs = oTBODY.getElementsByTagName('tr');
    // walk through each of the table rows and see if it has a 
    // "mvp" attribute on it.
    for (i = 0; i < aTRs.length; i++) {
        if (aTRs[i].getAttribute('mvp') == "true") {
            if (bShowMvp) {
                aTRs[i].style.backgroundColor = "grey";
            } else {
                aTRs[i].style.backgroundColor = "";
            };
        };
    };
};
