function madLib(verb, adjective, noun) {
  console.log('We shall ' + verb.toUpperCase() + ' the ' + adjective.toUpperCase() + ' ' + noun.toUpperCase() + '.')
}

madLib('make', 'best', 'chili')

function isSubstring(searchString, subString) {
  console.log(searchString.includes(subString));
}


isSubstring("time to program", "time")

function fizzBuzz(array) {
  var newArray = []
  for (var i = 0; i < array.length; i++ ) {
    if ((array[i] % 3 !== 0 && array[i] % 5 === 0) || (array[i] % 3 === 0 && array[i] % 5 !== 0)) {
          newArray.push(array[i]);
    }
  }
  console.log(newArray);
}

arr1 = [3, 5, 15, 6, 7, 21, 24, 10, 2]
fizzBuzz(arr1)

function isPrime(number) {
  for (var i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true
}

console.log(isPrime(7))

function sumPrimes(number) {
  var sum = 0
  for (var i = 1; i < number; i++) {
    if (isPrime(i) === true) {
      sum += i 
    }
  }
  return sum
}

console.log(sumPrimes(20))


