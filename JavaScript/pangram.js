// https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/javascript
// Can I use regex to remove anything except letters?
// What is JS version of a .uniq?

function isPangram(string){
    //removes things that aren't lowercase letters
    let modified = string.toLowerCase().replace(/[^a-z\s]/g,'') 
    //removes whitespace
    modified = modified.replace(/ /g, "");

    modified = modified.split("")
    // Creates a new Set using spread operator
    let unique = [ ... new Set(modified)]
    return unique.length == 26
}

console.log(isPangram("ABC   D45EFGH,IJK,LMNOPQR56STUVW3XYZ"))