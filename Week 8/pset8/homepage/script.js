const form = document.querySelector("form");

form.addEventListener("submit", (e) => {
    let canAlert = false;

    const formInputs = document.querySelectorAll("form input, textarea");
    formInputs.forEach(element => {
        if (!element.value) {
            canAlert = true;
        }
    });

    if (canAlert) {
        e.preventDefault();
        alert("Fill the fields of the form");
    }
});