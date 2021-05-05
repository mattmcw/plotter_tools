'use strict';

const { ArgumentParser } = require('argparse');
const { version, description } = require('./package.json');
const hershey = require('hersheytext');
const { writeFile } = require('fs-extra');
const { basename } = require('path');

const header = `<svg xmlns="http://www.w3.org/2000/svg" 
xmlns:xlink="http://www.w3.org/1999/xlink"
height="150mm"
width="150mm" 
version="1.1">`;
const footer = '</svg>';
const W = 7.0;
const H = 10.0;
const UNIT = (600.0 * 8.0) / 75.0;

let options = {
	font : 'ems_nixish',
	scale : 0.05
};

/*
async function loadFont (fontPath) {
	let str;
	let fileName;
	let fontName;

	try {
		hershey.addSVGFont(fontPath);
	} catch (err) {
		console.error(err);
		process.exit(1);
	}

	fileName = basename(fontPath);
	fontName = fileName.split('.').slice(0, -1).join('.');
	options = { font : fontName };
}
*/

async function main () {
	const fontPath = args.font;
	const text = args.text.replace('\\n', '\n');
	const size = args.size || '8.5x11';
	const output = args.output || 'sticky.svg';
	let data;

	//console.log(fontPath)
	console.log(text)

	try {
		//await loadFont(fontPath);
	} catch (err) {
		console.error(err);
	}

	options.pos = { x: 500, y: 10 };
	//options.pos = textPos(text);
	data = hershey.renderTextSVG(text, options);
	//console.log(`${header}\n${data}\n${footer}`)

	try {
		await writeFile(output, `${header}\n${data}\n${footer}`);
	} catch (err) {
		console.error(err);
	}
}

const parser = new ArgumentParser({
	description
});

parser.add_argument('-v', '--version', { action: 'version', version });
parser.add_argument('-f', '--font', { help: 'Path to font' });
parser.add_argument('-t', '--text', { help: 'Text to render' });
parser.add_argument('-o', '--output', { help: 'Output svg' });

const args = parser.parse_args();

main();
