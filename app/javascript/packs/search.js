// select buttons
const allBtn = document.getElementById("btn-all")
const applyBtn = document.getElementById("btn-apply")

// add active class event listener on click on filters
document.querySelectorAll('.search-category p').forEach((p) => {
  p.addEventListener('click', (e) => {
    e.target.classList.toggle('category-active')
  })
})

// add event listeners
applyBtn.addEventListener("click", () => {
  const locationUrl = document.getElementById('search-location').value
  let categoriesUrl = ''
  document.querySelectorAll('.category-active').forEach((category, index) => {
    if (index === 0) {
      categoriesUrl += `${category.innerText}`
    } else {
      categoriesUrl += `+${category.innerText}`
    }
  })

  const capacityUrl = document.getElementById('search-capacity').value
  const maxPriceUrl = document.getElementById('search-price').value

  window.location.assign('http://localhost:3000/boats?location=' + locationUrl + '&categories=' + categoriesUrl + '&capacity=' + capacityUrl + '&max_price=' + maxPriceUrl)
})

allBtn.addEventListener("click", () => {
  const locationUrl = document.getElementById('search-location').value

  window.location.assign('http://localhost:3000/boats?location=' + locationUrl)
})


