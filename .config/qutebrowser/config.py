config.load_autoconfig()
config.source('themes/qute-city-lights/city-lights-theme.py')

# Utils
def bind_chained(key, *commands):
    config.bind(key, ' ;; '.join(commands))


## ,ym is my shortcut to “yank markdown-formatted link”
## ym (without a leading comma) also works because it is built-in
config.bind('<Ctrl+T>', 'spawn --userscript translate')
config.bind('<Ctrl+Shift+T>', 'spawn --userscript translate --text')
config.bind("<Ctrl+w>", 'cmd-set-text :open -w ')
config.bind("<Ctrl+Alt+1>", 'tab-focus 1')
config.bind("<Ctrl+Alt+2>", 'tab-focus 2')
config.bind("<Ctrl+Alt+3>", 'tab-focus 3')
config.bind("<Ctrl+Alt+4>", 'tab-focus 4')
config.bind("<Ctrl+Alt+5>", 'tab-focus 5')
config.bind("<Ctrl+Alt+6>", 'tab-focus 6')
config.bind("<Ctrl+Alt+7>", 'tab-focus 7')
config.bind("<Ctrl+Alt+8>", 'tab-focus 8')
config.bind("<Ctrl+Alt+9>", 'tab-focus 9')
config.bind("<Ctrl+Alt+0>", 'tab-focus 10')
config.bind("1", 'tab-focus 1')
config.bind("2", 'tab-focus 2')
config.bind("3", 'tab-focus 3')
config.bind("4", 'tab-focus 4')
config.bind("5", 'tab-focus 5')
config.bind("6", 'tab-focus 6')
config.bind("7", 'tab-focus 7')
config.bind("8", 'tab-focus 8')
config.bind("9", 'tab-focus 9')
config.bind("0", 'tab-focus 10')
config.bind("<Ctrl-=>", 'zoom-in')
config.bind("<Ctrl-->", 'zoom-out')
config.bind("<Ctrl+r>", 'config-source')
config.bind(',t', 'hint userscript link translate')
config.bind(',T', 'hint userscript all translate --text')
config.bind(",l", 'spawn --userscript qute-bitwarden')
config.bind(",L", 'spawn --userscript qute-pass --password-only')
config.bind(',v','hint links spawn mpv {hint-url}')
config.bind(',b','hint links spawn mpv --wayland-app-id=pip {hint-url}')
config.bind(',B','spawn mpv {url}')
config.bind(',g','tab-give')
config.bind(',r','open -t https://freedium.cfd/{url}')
config.bind(',R','open -t https://12ft.io/{url}')
config.bind(",p", 'cmd-set-text :open -p ')
config.bind(",w", 'cmd-set-text :open -w ')
config.bind(",cc", 'hint code userscript code_select.py')
config.bind(',ym', 'yank inline [{title}]({url:pretty})')
config.bind(',ya', 'yank inline {url:pretty}[{title}]')
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
c.url.searchengines['gp'] = 'http://127.0.0.1:{}'
c.url.searchengines['rd'] = 'https://www.reddit.com/search/?q={}&type=link&cId=50c89248-b25c-4b48-abdf-543304d94b16&iId=dc230979-a2a8-49a0-914c-87634f929a79'
c.url.searchengines['rdn'] = 'https://www.reddit.com/r/neovim/search/?q={}&type=link&cId=50c89248-b25c-4b48-abdf-543304d94b16&iId=dc230979-a2a8-49a0-914c-87634f929a79'
c.url.searchengines['rdq'] = 'https://www.reddit.com/r/qutebrowser/search/?q={}&type=link&cId=50c89248-b25c-4b48-abdf-543304d94b16&iId=dc230979-a2a8-49a0-914c-87634f929a79'
c.url.searchengines['rda'] = 'https://www.reddit.com/r/arch-linux/search/?q={}&type=link&cId=50c89248-b25c-4b48-abdf-543304d94b16&iId=dc230979-a2a8-49a0-914c-87634f929a79'

c.aliases['ge'] = 'open -t https://wiki.archlinux.org/index.php/Forum_Etiquette'
c.aliases['gu'] = 'open -t https://github.com/dantearaujo1'
c.aliases['gyt'] = 'open -t https://www.youtube.com/'
c.aliases['grd'] = 'open -t https://www.reddit.com/'

# if c.colors.webpage.darkmode.enabled:
    # c.colors.webpage.preferred_color_scheme = "dark"

c.colors.tabs.selected.even.bg = "#4f0078"
c.colors.tabs.selected.odd.bg = "#4f0078"
c.colors.tabs.selected.odd.fg = "white"
c.colors.tabs.selected.even.fg = "white"
c.tabs.background = True
c.content.pdfjs = False
c.content.fullscreen.window = True

c.hints.selectors["code"] = [
    # Selects all code tags whose direct parent is not a pre tag
    ":not(pre) > code",
    "pre"
]

# Clipboard access
# c.content.javascript.clipboard = "access"
bind_chained("ya", 'set -t -p content.javascript.clipboard access','cmd-later 10s set -p content.javascript.clipboard none') # Enable clipboard access
c.content.local_content_can_access_remote_urls = True
with config.pattern('*://github.com/') as p:
    p.content.javascript.clipboard = "access-paste"
with config.pattern('*://gitlab.com/') as p:
    p.content.javascript.clipboard = "access-paste"
with config.pattern('*://chatgpt.com/') as p:
    p.content.javascript.clipboard = "access-paste"
with config.pattern('*://chat.openai.com/') as p:
    p.content.javascript.clipboard = "access-paste"
with config.pattern('*://youtube.com/') as p:
    p.content.javascript.clipboard = "access"
with config.pattern('*://reddit.com/') as p:
    p.content.javascript.clipboard = "access"
with config.pattern('*://medium.com/') as p:
    p.content.javascript.clipboard = "access"
with config.pattern('*://dev.to/') as p:
    p.content.javascript.clipboard = "access"
with config.pattern('*://dashboard.ngrok.com/') as p:
    p.content.javascript.clipboard = "access"

# Passthrough Mode
# config.bind('<Ctrl-V>', 'mode-leave', mode='passthrough')
# config.bind('<Ctrl-J>', 'back', mode='passthrough')
# config.bind('<Ctrl-K>', 'forward', mode='passthrough')
with config.pattern('*.figma.com') as p:
    p.input.mode_override = 'passthrough'
with config.pattern('*.chatgpt.com') as p:
    p.input.mode_override = 'passthrough'

# Set VIFM as file picker.
# config.set("fileselect.handler", "external")
# config.set("fileselect.single_file.command", ['alacritty', '--class', 'vifm,vifm', '-e', 'vifm', '--choose-files', '{}'])
# config.set("fileselect.multiple_files.command", ['alacritty', '--class', 'vifm,vifm', '-e', 'vifm', '--choose-files', '{}'])
# config.set("fileselect.folder.command", ['alacritty', '--class', 'vifm,vifm', '-e', 'vifm', '--choose-dir', '{}'])

# Use ctrl-f to select save location using external file picker.
# config.unbind("<Ctrl-f>", mode="prompt")
# config.bind('<Ctrl-f>', 'prompt-fileselect-external', mode='prompt')
