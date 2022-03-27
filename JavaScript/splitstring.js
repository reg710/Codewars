// Figure out if even or odd
// make even, save final character
// loop through input and set pairs

function solution(str){
    let output = [];
    let evenString = str;
    let oddFinal = '';

    if (str.length % 2 != 0) {
        evenString = str.slice(0, -1);
        oddFinal = str.slice(-1) + "_";
    }

    for (let i = 0; i < evenString.length; i++) {
        if (i % 2 != 0 ) {
            output.push(evenString[i - 1] + evenString[i]);
        }
    }

    if (oddFinal !== '') {
        output.push(oddFinal);
    }
    
    return output;
}

console.log(solution("abcdefg"));