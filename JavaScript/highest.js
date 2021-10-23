// https://www.codewars.com/kata/5420fc9bb5b2c7fd57000004/train/javascript

// Go through array and create an object with the number and the count of the number
// Return highest count from object

function highestRank(arr){
    let count = {};

    for (let i = 0; i < arr.length; i++){
        if (arr[i] in count) {
            count[arr[i]]++;
        }
        else{
            count[arr[i]] = 1;
        }
    }
    
    let most_counted = 0;
    let output = 0;
    
    for (let prop in count){
        if((count[prop] >= most_counted) && (Number(prop) > output)){
            most_counted = count[prop];
            output = prop;
        }
    }
    return output;
}

let test = [12, 1, 4, 12, 4];
console.log(highestRank(test));