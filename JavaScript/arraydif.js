// https://www.codewars.com/kata/523f5d21c841566fde000009/train/javascript


function arrayDiff(a, b) {
    return a.filter(num => !b.includes(num));
}

function arrayDiffLoop(a, b) {
    let output = [];
    for (let i = 0; i < a.length; i++){
        if (!b.includes(a[i])) {
            output.push(a[i]);
        }            
    }
    return output;
}

let test = [1,2,2,2,3];
let test2 = [2];
console.log(arrayDiffLoop(test, test2));