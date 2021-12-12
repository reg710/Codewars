// https://www.codewars.com/kata/526dbd6c8c0eb53254000110/train/javascript

// at least one characters
// only letters or numbers
// no whitespaces/underscores

function alphanumeric(string){
    if(string === ""){
        return "false";
    }
    let invalid_characters = /[^a-zA-Z0-9]/gm;
    return !string.match(invalid_characters);
    
}