const fullName = 'Đoàn Minh Giang';

var firstName = fullName.split(' ').slice(0, -1).join(' ');
var lastName = fullName.split(' ').slice(-1).join(' ');

console.log(firstName);
console.log(lastName);