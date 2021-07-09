//https://www.codewars.com/kata/513e08acc600c94f01000001/train/javascript

let input = rgb(255, 255, 255) // returns FFFFFF

function rgb(r, b, g){  
   return `${converter(r)}${converter(b)}${converter(g)}`;
}

function converter(num) {
    let output = [];
    if (num >= 255) {
        return 'FF';
    }
    else if (num <= 0) {
        return '00';
    }
    else {
        return num.toString(16).padStart(2, "0").toUpperCase();
    }
}

console.log(rgb(182,13,271));


// from codewars

function rgb(r, g, b){
    return [r,g,b].map(function(x) {
      return ('0'+Math.max(0, Math.min(255, x)).toString(16)).slice(-2);
    }).join('').toUpperCase();
  }