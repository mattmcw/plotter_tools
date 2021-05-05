const hershey = require('hersheytext');
const fs = require('fs');

const options = {
  font: 'ems_nixish',
  scale: 0.05,
  pos : { x: 0, y: 0 },
  lineHeight: 1000
};

const header = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="305mm" width="229mm" version="1.1">';
const data = hershey.renderTextSVG('Take a Look, if you Will.\nNew line', options);
const footer = '</svg>';

fs.writeFileSync('test.svg', `${header}\n${data}\n${footer}`);