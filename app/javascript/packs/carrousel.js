let scale = 0;



setTimeout(() => {
const inner = document.querySelector(".inner");
const cards = Array.from(document.getElementsByClassName("card-caroussel"));
console.log(cards)
function slideAndScale() {
  cards.map((card, i) => {
    card.setAttribute("data-scale", i + scale);
    inner.style.transform = "translateX(" + scale * 8.5 + "em)";
  });
}
(function init() {
  slideAndScale();
  cards.map((card, i) => {

    card.addEventListener("click", () => {
      const id = card.getAttribute("data-scale");
      if (id !== 2) {
        scale -= id - 2;
        slideAndScale();
      }
    }, false);
  });

    const nextBtn = document.querySelector(".next");
    const prevBtn = document.querySelector(".prev");
    nextBtn.addEventListener("click", () => {
      if (cards[cards.length -1].getAttribute("data-scale") != 2) {
        scale--;
      }
      slideAndScale();
    }, false);
    prevBtn.addEventListener("click", () => {
      if (cards[0].getAttribute("data-scale") < 2) {
        scale++;
      }
      slideAndScale();
    }, false);
})();
}, 100)

export { init }
