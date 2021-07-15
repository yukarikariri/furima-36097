function input (){
 
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const feeRate = 0.1;

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxPriceValue = Math.floor(inputValue*feeRate)
    taxPrice.innerHTML = taxPriceValue.toLocaleString('ja-JP')
    profit.innerHTML = (inputValue - taxPriceValue).toLocaleString('ja-JP')
  });
};

window.addEventListener('load', input);
