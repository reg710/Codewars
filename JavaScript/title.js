// https://www.codewars.com/kata/5202ef17a402dd033c000009/train/javascript

// standardize title so all lower case
// return with first letter of all words in capitalized
// then deal with minorWords

// input = '';
// check = '';

let input = 'a clash of KINGS';
let check = 'a an the of';

function titleCase(title, minorWords) {
    let titleArr = standardize(title);

    if (minorWords !== undefined){
        let minorArr = standardize(minorWords);
    
        // start the loop at 1 because first word should remain capitalized
        for (var i = 1; i < titleArr.length; i++){
            if (minorArr.includes(titleArr[i])){
                titleArr[i] = titleArr[i].charAt(0).toLowerCase() + titleArr[i].slice(1);
            }
        }
    }
    return titleArr.join(' ');
}

function standardize(words) {
    return words.toLowerCase()
        .split(' ')
        .map(x => x.charAt(0).toUpperCase() + x.slice(1));
}

console.log(titleCase(input, check));