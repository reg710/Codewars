// https://www.codewars.com/kata/550554fd08b86f84fe000a58

// can't use includes because it only checks for case sensitive/exact matches
// index of can check for smaller words in bigger words (althought it is still case-sensitive)
// it returns index where substring begins
// https://careerkarma.com/blog/javascript-string-contains/

//input = ["arp", "live", "strong"]
input = ["arp", "gal", "el"];
larger_input = ["gallup", "lively", "alive", "harp", "duck", "larp"];

function inArray(array1, array2) {
    let output = [];
    for (var i = 0; i < array1.length; i++) {
        for (var j = 0; j < array2.length; j++) {
            if (array2[j].indexOf(array1[i]) >= 0) {
                output.push(array1[i]);
                break;
            }           
        }
    }
    return output.sort();
}

console.log(inArray(input, larger_input));


// from codewars
function inArray(a1, a2) {
    var str = a2.join(' ');
    return a1.filter(s => str.indexOf(s) !== -1).sort();
  }