window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
  price.addEventListener("input", () =>{
    const tax = document.getElementById("add-tax-price");
    const taxMath = Math.round(price.value * 0.1);
    const profit = document.getElementById("profit");
    tax.innerHTML = taxMath;
    profit.innerHTML = Math.round(price.value - taxMath);
  })
});