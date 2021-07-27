// https://www.codewars.com/kata/529b418d533b76924600085d/train/javascript

function toUnderscore(string) {
    string = string.toString();
    let regex = /[A-Z][a-z,\d]+/g;
    let word_array = string.match(regex);
    return (word_array === null ? string : word_array.join("_").toLowerCase());

  }

test = 1;

console.log(toUnderscore(test));