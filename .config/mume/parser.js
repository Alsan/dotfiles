module.exports = {
  onWillParseMarkdown: function(markdown) {
    return new Promise((resolve, reject)=> {
      // img 增加设置大小语法, ![title](src) {width,height}
      markdown = markdown.replace(/^!\[([^\]]*)\]\(([^\)]*)\)\W*{([^}]*)}$/gm, (all,title,src,attr) => `<img src="${src}" alt="${title}" ${attr}>`);
      return resolve(markdown)
    })
  },
  onDidParseMarkdown: function(html, {cheerio}) {
    return new Promise((resolve, reject)=> {
      return resolve(html)
    })
  },
  onWillTransformMarkdown: function (markdown) {
        return new Promise((resolve, reject) => {
            return resolve(markdown);
        });
    },
  onDidTransformMarkdown: function (markdown) {
      return new Promise((resolve, reject) => {
          return resolve(markdown);
      });
  }
}