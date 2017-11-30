const compensation_logos = document.querySelectorAll('.logo-project-modal')

compensation_logos.forEach((compensation_logo) => {
  compensation_logo.addEventListener('click', () => {
    compensation_logos.forEach((compensation) => {
      compensation.classList.remove('active');
    });
    compensation_logo.classList.add('active');
  })
});
