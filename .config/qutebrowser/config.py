config.load_autoconfig()

#===============================================================================
#                              Youtube Adblock
#===============================================================================

from qutebrowser.api import interceptor
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()
interceptor.register(filter_yt)

#===============================================================================
#                              Config
#===============================================================================

#---------------------------------------
#               Misc Settings
#---------------------------------------
c.hints.chars = "fjdksla;rueiwoqptyghbnvmc,"

# c.input.insert_mode.auto_leave = True
# c.input.insert_mode.auto_load = True

c.tabs.background = True
c.content.autoplay = False
c.content.cookies.accept = 'all'
# c.content.notifications.enabled = False
c.downloads.location.prompt = False
c.downloads.position = 'bottom'
c.downloads.remove_finished = 3

c.downloads.location.directory = '/mnt/internal/downloads'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'always'

# c.colors.webpage.prefers_color_scheme_dark=False
# c.colors.webpage.darkmode.enabled=False

#---------------------------------------
#               Font
#---------------------------------------
c.fonts.default_family = 'sans-serif'
c.fonts.hints = 'bold 15px sans-serif'
c.fonts.default_size = '15pt'

#---------------------------------------
#               Search Engines
#---------------------------------------

c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'a': 'https://wiki.archlinux.org/?search={}',
    'b': 'http://gen.lib.rus.ec/search.php?req={}',
    'f': 'http://ftpbd.net/?s={}',
    's': 'https://www.startpage.com/search/?q={}',
    't': 'https://1337x.to/search/{}/1/',
    'y': 'https://www.youtube.com/results?search_query={}',
}

c.url.start_pages = "https://google.com/"
# c.url.start_pages = "https://www.startpage.com/do/mypage.pl?prfh=disable_family_filterEEE1N1Ndisable_open_in_new_windowEEE0N1Ndisable_video_family_filterEEE1N1Nenable_post_methodEEE1N1Nenable_proxy_safety_suggestEEE1N1Nenable_stay_controlEEE0N1Ngeo_mapEEE1N1Nlang_homepageEEEs%2Fblak%2Fen%2FN1NlanguageEEEenglishN1Nlanguage_uiEEEenglishN1Nnum_of_resultsEEE10N1Nother_iaEEE1N1Nsearch_results_regionEEEallN1NsuggestionsEEE1N1Nwikipedia_iaEEE1N1Nwt_unitEEEcelsius"

c.auto_save.session = True

# Behavior when the last tab is closed.
# Valid values:
#   - ignore: Don't do anything.
#   - blank: Load a blank page.
#   - startpage: Load the start page.
#   - default-page: Load the default page.
#   - close: Close the window.
c.tabs.last_close = "close"

# Which tab to select when the focused tab is removed.
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = "next"

c.statusbar.show = "in-mode"

c.scrolling.smooth = True

#===============================================================================
#                              Bindings
#===============================================================================

# prompts for new tab yrl launching
config.bind('o', 'set-cmd-text -s :open -t')
# prompts for current tab yrl launching
config.bind('O', 'set-cmd-text -s :open')

#---------------------------------------
#               Tabs
#---------------------------------------
config.bind('l', 'tab-next')
config.bind('h', 'tab-prev')

config.bind('.', 'tab-move +')
config.bind(',', 'tab-move -')

#---------------------------------------
#               Navigation
#---------------------------------------
# Launch selected link on new background tab
config.bind('a', 'hint all tab-bg')
# Launch selected link on the current tab
config.bind('f', 'hint all normal')
# config.bind('F', 'fullscreen')

config.bind('D', 'hint links download')

# Go to specific tabs
config.bind('t', 'set-cmd-text -s :tab-focus')

config.bind('w', 'forward')
config.bind('b', 'back')

# config.bind(';', 'search')

#---------------------------------------
#               Scrolling
#---------------------------------------
config.bind('j', 'run-with-count 5 scroll down')
config.bind('k', 'run-with-count 5 scroll up')
config.bind('J', 'run-with-count 15 scroll down')
config.bind('K', 'run-with-count 15 scroll up')

#---------------------------------------
#               Bookmarks
#---------------------------------------
config.bind ('gf', 'open -t facebook.com')
config.bind ('gy', 'open -t youtube.com/feed/subscriptions')
config.bind ('gt', 'open -t https://www.1377x.to/home/')
config.bind ('gh', 'open -t https://github.com')
config.bind ('gp', 'open -t file:///mnt/internal/git/work/one-page-web/index.html')

config.bind('m', 'hint links spawn mpv {hint-url}')

config.bind('cd', 'download-cancel')

#===============================================================================
#                              Aliases
#===============================================================================

# c.aliases = {'git': 'open -t github.com'}

#===============================================================================
#                              Performance Boosts
#===============================================================================

c.content.headers.accept_language = 'en-US,en;q=0.5'
c.content.canvas_reading = False
c.content.webgl =  False
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0'

#===============================================================================
#                              Colors
#===============================================================================

# # Background color of unselected tabs.
# c.colors.tabs.even.bg = "silver"
# c.colors.tabs.odd.bg = "gainsboro"
# # Foreground color of unselected tabs.
# c.colors.tabs.even.fg = "#666666"
# c.colors.tabs.odd.fg = c.colors.tabs.even.fg

#===============================================================================
#                              Misc
#===============================================================================

# The format to use for the window title. The following placeholders are
# defined:
#   * `{perc}`: The percentage as a string like `[10%]`.
#   * `{perc_raw}`: The raw percentage, e.g. `10`
#   * `{title}`: The title of the current web page
#   * `{title_sep}`: The string ` - ` if a title is set, empty otherwise.
#   * `{id}`: The internal window ID of this window.
#   * `{scroll_pos}`: The page scroll position.
#   * `{host}`: The host of the current web page.
#   * `{backend}`: Either ''webkit'' or ''webengine''
#   * `{private}` : Indicates when private mode is enabled.
# c.window.title_format = "{private}{perc}{title}{title_sep}qutebrowser"
# c.window.title_format = "{id}qutebrowser"

config.bind("i", "devtools")

config.bind("=", "zoom-in")

config.bind("e", "set-cmd-text :open {url:pretty}")

#===============================================================================
#                              Exp
#===============================================================================

c.content.blocking.adblock.lists = ['https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt', 'https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt','/home/hexdsl/.config/qutebrowser/lol.txt']
# c.content.blocking.method = 'both'
c.tabs.width = 54
c.tabs.indicator.width = 0
c.tabs.indicator.padding = {"top": 0, "right": 0, "bottom": 0, "left": 0}
c.tabs.favicons.scale = 1
c.editor.command = ["st", "-e", "nvim", "{}"]

# c.tabs.position = "left"
# config.set('content.headers.custom', '{"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}')

