document.getElementById("uploadForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);
    const response = await fetch("/upload", {
        method: "POST",
        body: formData,
    });
    const result = await response.json();
    document.getElementById("result").innerHTML = `
        Anomaly Score: ${result.score}<br>
        Is Anomaly: ${result.is_anomaly ? "Yes" : "No"}
    `;
});