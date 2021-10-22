// https://www.codewars.com/kata/53697be005f803751e0015aa/train/javascript



function encode(string) {
    const secret_code = new Map();
    secret_code.set("a", 1);
    secret_code.set("e", 2);
    secret_code.set("i", 3);
    secret_code.set("o", 4);
    secret_code.set("u", 5);
    let output = [];
    for (let i = 0; i < string.length; i++){
        if (secret_code.has(string[i])){
            output.push(secret_code.get(string[i]));
        }
        else{
            output.push(string[i]);
        }       
    }
    return output.join("");
}
  
function decode(string) {
    const secret_decode = new Map();
    secret_decode.set("1", "a");
    secret_decode.set("2", "e");
    secret_decode.set("3", "i");
    secret_decode.set("4", "o");
    secret_decode.set("5", "u");
    let output = [];
    for (let i = 0; i < string.length; i++){
        if (secret_decode.has(string[i])){
            output.push(secret_decode.get(string[i]));
        }
        else{
            output.push(string[i]);
        }       
    }
    return output.join("");
}



let test = "babe and me";
let test2 = "3t5b"
console.log(decode(test2));