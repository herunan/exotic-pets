const animateToggler = () => {
  document.addEventListener("DOMContentLoaded", () => {
    $('.hamburger').on('click', () => {
      $('.animated-toggler').toggleClass('open');
    });
  });
}

export { animateToggler };
