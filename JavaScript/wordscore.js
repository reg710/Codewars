// https://www.codewars.com/kata/57eb8fcdf670e99d9b000272/train/javascript

function high(x){
    let winner = "";
    let winning_score = 0;
    let sentence = x.split(' ');

    // Check the score of each word in the array 
    // If it higher than previous high score, reset score and winning word
    for (let word of sentence) {
        let score = scoring(word)
        if (score > winning_score) {
            winning_score = score;
            winner = word;
        }
    }
    return winner;
}

function scoring(word) {
    let alphabet = "abcdefghijklmnopqrstuvwxyz";
    let letters = word.split('');
    
    // Creates an array of letter values
    let values = letters.map(x => alphabet.indexOf(x) + 1);
    
    // Reduce function allows you to find the sum of the array
    let sum = values.reduce(function (accumulator, current) {
        return accumulator + current;
    });
    return sum;
}

test = "man i need a taxi up to ubud";
console.log(high(test));