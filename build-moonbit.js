const fs = require('fs');
const path = require('path');

const inputPath = path.join(__dirname, 'moonbit', '_build', 'js', 'debug', 'build', 'moonbit.js');
const outputDir = path.join(__dirname, 'src', 'moonbit');
const outputPath = path.join(outputDir, 'index.js');

// Read compiled MoonBit JS
let raw = fs.readFileSync(inputPath, 'utf-8');

// Remove the IIFE at the end (the (() => { ... })(); block)
raw = raw.replace(/\n\(\(\) => \{[\s\S]*?\}\)\(\);\n?/, '\n');

// Remove source map reference
raw = raw.replace(/\/\/# sourceMappingURL=.*\n?/, '');

// Add ES module exports
const exportBlock = `
export const siteConfig = _M0FP28lenitain7moonbit12site__config;
export const configToJson = _M0FP28lenitain7moonbit16config__to__json;
export const searchProjects = _M0FP28lenitain7moonbit12search__projects;
export const skillsByCategory = _M0FP28lenitain7moonbit15skills__by__category;
`;

const output = `// Auto-generated from MoonBit - do not edit manually\n${raw}\n${exportBlock}\n`;

fs.mkdirSync(outputDir, { recursive: true });
fs.writeFileSync(outputPath, output);
console.log(`MoonBit ES module written to ${outputPath}`);
