# import dracula.draw
# import catppuccin
config.load_autoconfig()
# Setting dark mode
# config.set("colors.webpage.darkmode.enabled", True)
#
# dracula.draw.blood(c,{
#     'spacing':{
#         'vertical':6,
#         'horizontal':8
#     }
# })
#
#
# catppuccin.setup(c,'mocha',True)

# config.bind(";", 'open')
config.bind(",u", 'spawn --userscript ~/.config/qutebrowser/userscripts/qute_1pass login')
config.bind(',b','hint links spawn mpv {hint-url}')
config.bind(',B','spawn mpv {url}')
config.bind(',g','tab-give')
config.bind("<Ctrl-=>", 'zoom-in')
config.bind("<Ctrl-->", 'zoom-out')
config.bind(",p", 'cmd-set-text :open -p ')
config.bind(',ko', 'jseval (function () { '+
'  var i, elements = document.querySelectorAll("body *");'+
''+
'  for (i = 0; i < elements.length; i++) {'+
'    var pos = getComputedStyle(elements[i]).position;'+
'    if (pos === "fixed" || pos == "sticky") {'+
'      elements[i].parentNode.removeChild(elements[i]);'+
'    }'+
'  }'+
'})();');

c.url.searchengines['yt'] = 'https://www.youtube.com/results?search_query={}'
c.url.searchengines['DEFAULT'] = 'https://duckduckgo.com/?q={}'
c.url.searchengines['a'] = 'https://wiki.archlinux.org/?search={}'
c.url.searchengines['g'] = 'http://www.google.com/search?hl=en&source=hp&ie=ISO-8859-l&q={}'
c.url.searchengines['w'] = 'https://en.wikipedia.org/w/index.php?search={}'
c.url.searchengines['gh'] = 'https://github.com/search?q={}&type=Code'
c.url.searchengines['ap'] = 'https://www.archlinux.org/packages/?sort=&q={}'
c.url.searchengines['ab'] = 'https://bugs.archlinux.org/?project=5&string={}'

c.aliases['ge'] = 'open -t https://wiki.archlinux.org/index.php/Forum_Etiquette'
c.aliases['gp'] = 'open -t http://127.0.0.1:4000'
c.aliases['gu'] = 'open -t https://github.com/dantearaujo1'

# if c.colors.webpage.darkmode.enabled:
    # c.colors.webpage.preferred_color_scheme = "dark"

c.colors.tabs.selected.even.bg = "#AA00aa"
c.colors.tabs.selected.even.fg = "white"
c.tabs.background = True
# c.content.pdfjs = True

c.hints.selectors["code"] = [
    # Selects all code tags whose direct parent is not a pre tag
    ":not(pre) > code",
    "pre"
]

# c.content.javascript.clipboard = "access"
with config.pattern('*://github.com/') as p:
    p.content.javascript.clipboard = "access-paste"
with config.pattern('*://youtube.com/') as p:
    p.content.javascript.clipboard = "access"
with config.pattern('*://reddit.com/') as p:
    p.content.javascript.clipboard = "access"
with config.pattern('*://medium.com/') as p:
    p.content.javascript.clipboard = "access"
with config.pattern('*://dev.to/') as p:
    p.content.javascript.clipboard = "access"


config.bind(",cc", 'hint code userscript code_select.py')
## ,ya is my shortcut to “yank asciidoc-formatted link”
config.bind(',ya', 'yank inline {url:pretty}[{title}]')
## ,ym is my shortcut to “yank markdown-formatted link”
## ym (without a leading comma) also works because it is built-in
config.bind(',ym', 'yank inline [{title}]({url:pretty})')
config.bind(';t', 'hint userscript link translate')
config.bind(';T', 'hint userscript all translate --text')
config.bind(';', 'cmd-set-text :')
config.bind('<Ctrl+T>', 'spawn --userscript translate')
config.bind('<Ctrl+Shift+T>', 'spawn --userscript translate --text')
config.source('themes/qute-city-lights/city-lights-theme.py')
