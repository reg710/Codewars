// https://www.codewars.com/kata/55f8a9c06c018a0d6e000132/

function validatePIN (pin) {
    if(pin.length === 4) {
        return /\d{4}/g.test(pin);
    }   
    else if(pin.length === 6){
        return /\d{6}/g.test(pin)
    }
    else {
        return false
    }
  }

function validatePIN (pin) {
    if(pin.length === 4 || pin.length === 6) {
        return /^[0-9]*$/g.test(pin);
    }   
    else {
        return false;
    }
  }

//   from codewars
function validatePIN(pin) {
    return /^(\d{4}|\d{6})$/.test(pin)
  }


