let primes = [];
let time = 0;
const N = 10000;

const isPrime = (n) => {
  // Corner case
  if (n <= 1) {
    return false;
  }
  // Check from 2 to n-1
  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
};

let j = 0;
let res = [];
let t0 = Date.now();
for (let i = 0; i < N; i++) {
  let foundPrime = false;
  while (!foundPrime) {
    j++;
    if (isPrime(j)) {
      res.push(j);
      foundPrime = true;
    }
  }
}
time = Date.now() - t0;
primes = res;

const p = document.getElementById("result");
p.innerHTML += `Calculated ${N} Primes in ${time} milliseconds`;
