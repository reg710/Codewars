// https://www.codewars.com/kata/58e8cad9fd89ea0c6c000258/train/javascript

var kookaCounter = function(laughing) {
    let singers = laughing.replace(/a/g, '');
    let previous_birdsong = ""; 
    let counter = 0;
  
    for (let position = 0; position < singers.length; position++) 
    {
        if (previous_birdsong != singers[position])
        {
            previous_birdsong = singers[position];
            counter += 1;
        }
    }
    return counter;
}

let test = "Hahahahaha";

console.log(kookaCounter(test));