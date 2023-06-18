const mume = require('/home/alsan/Templates/projects/markdown/extensions/shd101wyy.markdown-preview-enhanced-0.6.8/node_modules/@shd101wyy/mume');

const config = {
  path: '/tmp',
  previewTheme: 'github-dark.css',
  codeBlockTheme: 'default.css',
  enableWikiLinkSyntax: true,
  enableExtendedTableSyntax: true,
  enableCriticMarkupSyntax: true,
  enableExtendedImageSyntax: true,
  enableGraphviz: true,
  enableMermaid: true,
  enablePlantUML: true,
  enableChromePDF: true,
  enableTypographer: true,
  enableFrontMatter: true
};

var filePath = (process.argv.slice(2) || ['index.md'])[0];
mume.init()
    .then(async () => {
      new mume.MarkdownEngine({filePath, config})
              .htmlExport({offline: true, runAllCodeChunks: false})
              .then(() => engine.openInBrowser({runAllCodeChunks: false}))
    })
    .catch(e => console.error(`${e.name}: ${e.message}`));
