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

// Resolve mangled MoonBit symbol names dynamically
function resolveMangledName(moonbitName) {
  // MoonBit mangling: _M0FP<mangled-package><length><function_name>
  // Single underscores in MoonBit names become double underscores in JS
  const mangled = moonbitName.replace(/-/g, '_').replace(/_/g, '__');
  const pattern = new RegExp(`(_M0FP\\d+lenitain7moonbit\\d+${mangled})\\b`);
  const match = raw.match(pattern);
  if (!match) {
    console.warn(`Warning: could not find compiled symbol for ${moonbitName}`);
    return `_MISSING_${moonbitName}`;
  }
  return match[1];
}

const siteConfig = resolveMangledName('site_config');
const configToJson = resolveMangledName('config_to_json');
const searchProjects = resolveMangledName('search_projects');
const skillsByCategory = resolveMangledName('skills_by_category');

// Add ES module exports
const exportBlock = `
export const siteConfig = ${siteConfig};
export const configToJson = ${configToJson};
export const searchProjects = ${searchProjects};
export const skillsByCategory = ${skillsByCategory};
`;

const output = `// Auto-generated from MoonBit - do not edit manually\n${raw}\n${exportBlock}\n`;

fs.mkdirSync(outputDir, { recursive: true });
fs.writeFileSync(outputPath, output);
console.log(`MoonBit ES module written to ${outputPath}`);
