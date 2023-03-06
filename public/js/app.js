const searchForm = document.querySelector('#search-form');
const searchInput = document.querySelector('#search-input');

searchForm.addEventListener('submit', (event) => {
  event.preventDefault();

  const query = searchInput.value.trim();

  if (query) {
    window.location.href = `/search?query=${query}`;
  }
});

const favoriteButtons = document.querySelectorAll('.favorite-button');

favoriteButtons.forEach((button) => {
  button.addEventListener('click', (event) => {
    const recipeId = event.target.dataset.recipeId;

    fetch(`/favorites/${recipeId}`, { method: 'POST' })
      .then((response) => {
        if (response.ok) {
          button.disabled = true;
          button.textContent = 'Added to Favorites';
        }
      });
  });
});
