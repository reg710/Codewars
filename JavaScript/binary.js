var countBits = function (n) {
  // convert number to binary
  let binaryString = n.toString(2);
  let count = 0;

  for (let i = 0; i < binaryString.length; i++) {
    if (binaryString.charAt(i) == 1) {
      count++;
    }
  }
  return count;
};

console.log(countBits(1234));

// from codewars
countBits = n => n.toString(2).split('0').join('').length;
