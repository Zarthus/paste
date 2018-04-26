(function() {
  if (localStorage.getItem('style') === 'dark') {
    document.getElementById('submit_button').setAttribute('data-theme', 'dark');
  }
})();
