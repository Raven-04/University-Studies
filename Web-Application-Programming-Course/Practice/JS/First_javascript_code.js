console.log("Hello JavaScript World!");

let f = "John";
let l = "Doe";
console.log(f + " " + l);

/*
x = 10;
x = "String";
var x = 6;   //not recommeded
let y = 5;   //value can change.
const z = 4; //value cannot change.
console.log(z, "\n")
*/

/*
let x = "hello; CMP; 257";
let y = x.split(";")
console.log(y.join());
*/

/*
let x = ["apples", "zebras", "bananas"];
let y = new Array("a", 7, 9);
let z = new Array();
z[0] = "fun";
console.log(z.length);
x[3] = "potatoes";
console.log(x.length);
x[8] = "potatoes";
console.log(x.length);
delete x[1];
console.log(x);
x.splice(0, 1);     // Deletes the actual element and index
console.log(x);
*/

/*
console.log(x[0]);
console.log(typeof x[0]);
console.log(x[2]);
console.log(typeof x[2]);
console.log(typeof x)
let z = null;
console.log(typeof w);
console.log(x.sort());
console.log(x.reverse());
*/

const arr = ["apples", "bananas", "mangos"];
console.log(arr.push("strawberrys"));
console.log(arr);
console.log(arr.unshift("beginning"));
console.log(arr.shift());
console.log();