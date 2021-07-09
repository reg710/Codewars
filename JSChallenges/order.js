// https://www.codewars.com/kata/55c45be3b2079eccff00010f

let input = ""; 

function order(words){
    let arr = words.split(' ');
    let answer = [];
    let count = 1;
    
    if (words == ""){
        return "";
    }
        
    else { 
        while (answer.length < arr.length){
            var pattern = new RegExp(count);
            for (let i = 0; i < arr.length; i++){
                if (pattern.test(arr[i])) {
                    answer[count - 1] = arr[i]
                }
            }
            count += 1;
        }
        return answer.join(' ')
    }
  
  }

  console.log(order(input));