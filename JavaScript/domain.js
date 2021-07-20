// https://www.codewars.com/kata/514a024011ea4fb54200004b/train/javascript

// first try to remove beginning of url
// then search for first period and return string of things before that?

function domainName(url){
    //your code here
    let shorterUrl = url.replace(/(https?:\/\/)/g, '');
    let evenShorterUrl = shorterUrl.replace(/(www\.)/g, '');
    let firstDot = evenShorterUrl.indexOf(".");
    return evenShorterUrl.slice(0, firstDot);
  }


let testA = "http://github.com/carbonfive/raygun"; 
let testB = "http://www.zombie-bites.com";
let testC = "https://www.cnet.com";

console.log(domainName(testA));
console.log(domainName(testB));
console.log(domainName(testC));
