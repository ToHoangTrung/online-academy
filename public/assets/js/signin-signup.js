const signInButton = document.querySelector("#sign-in-btn");
const signUpButton = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

signUpButton.addEventListener('click', () => {
  container.classList.add("sign-up-mode");
});

signInButton.addEventListener('click', () => {
  container.classList.remove("sign-up-mode");
});