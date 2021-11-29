// https://www.codewars.com/kata/5266876b8f4bf2da9b000362/train/javascript

function likes(names) {
    let response = "";
    switch(names.length) {
        case 0:
            response = "no one likes this";
            break;
        case 1:
            response =`${names[0]} likes this`;
            break;
        case 2:
            response = `${names[0]} and ${names[1]} like this`;
            break;
        case 3:
            response = `${names[0]}, ${names[1]} and ${names[2]} like this`;
            break;
        default:
            response = `${names[0]}, ${names[1]} and ${names.length - 2} others like this`
    }
    return response;
}

  test = [];
  console.log(likes(test));