// https://www.codewars.com/kata/5d23d89906f92a00267bb83d/train/javascript

function getOrder(input) {
    let menu = [
        "burger",
        "fries",
        "chicken",
        "pizza",
        "sandwich",
        "onionrings",
        "milkshake",
        "coke"
    ];
    let output = [];
    
    for (let i = 0; i < menu.length; i++) {
        let re = new RegExp(menu[i], 'g');
        let order_item = input.match(re);
        if (order_item != null) {
            let capitalized = order_item.map((word) => {
                return word[0].toUpperCase() + word.substring(1)});        
            output.push(capitalized.join(" "));
        }      
    }
    
    return output.join(" ");
  }

let test = "milkshakeburgerdogburgerburger"

console.log(getOrder(test))