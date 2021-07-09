var data = [1,1,1,1,1,1,10,10,10,1,1,1,1];

var sorted = Array.from(data
        .reduce((m, v) => m.set(v, [...(m.get(v) || []), v]), new Map)
        .values()
    );

var filtered = sorted.filter(num => num.length % 2 != 0);
var answer = filtered[0][0];
console.log(answer);

// console.log(result);
// var answer = 0;
// for (var i = 0; i < result.length; i++){
//     if (result[i].length % 2 != 0){
//         answer = result[i][0];
//     };
// }
// console.log(answer);

// var answer = result
//     .filter(function(number){
//     return number.length % 2 != 0;
// })

// var value = answer[0][0];

// console.log(value);

