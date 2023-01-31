window.addEventListener('load', () => {
    console.log("OK");
     // 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
if (!priceInput){ return false;}
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
const addTaxDom = document.getElementById("add-tax-price");
addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1);
const addProfitDom = document.getElementById("profit");
addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1))
})

});
 