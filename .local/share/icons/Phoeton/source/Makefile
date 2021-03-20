# Makefile for generating a cursor theme.

# Where to install a theme
INSTALL_PREFIX = ~/.icons
# Theme folder name (for make install)
THEME_NAME = Phoeton
# Theme version
THEME_VERSION = 1.0

CURSORS = ../cursors

NAMES = 00000000000000020006000e7e9ffc3f \
00008160000006810000408080010102 \
028006030e0e7ebffc7f7070c0600140 \
03b6e0fcb3499374a867c041f52298f0 \
03b6e0fcb3499374a867d041f52298f0 \
0426c94ea35c87780ff01dc239897213 \
043a9f68147c53184671403ffa811cc5 \
048008013003cff3c00c801001200000 \
0876e1c15ff2fc01f906f1c363074c0f \
08e8e1c95fe2fc01f976f1e063a24ccd \
08ffe1cb5fe6fc01f906f1c063814ccf \
08ffe1e65f80fcfdf9fff11263e74c48 \
1081e37283d90000800003c07f3ef6bf \
14fef782d02440884392942c11205230 \
208530c400c041818281048008011002 \
2870a09082c103050810ffdffffe0204 \
3085a0e285430894940527032f8b26df \
38c5dff7c7b8962045400281044508d2 \
3ecb610c1bf2410f44200f48c40d3599 \
4498f0e0c1937ffe01fd06f973665830 \
50585d75b494802d0151028115016902 \
5aca4d189052212118709018842178c0 \
5c6cd98b3f3ebcb1f9c7f1c204630408 \
6407b0e94181790501fd1e167b474872 \
640fb0e74195791501fd1ed57b41487f \
9081237383d90e509aa00f00170e968f \
9116a3ea924ed2162ecab71ba103b17f \
9d800788f1b08800ae810202380a0822 \
a2a266d0498c3104214a47bd64ab0fc8 \
alias \
all-scroll \
arrow \
b66166c04f8c3109214a4fbd64a50fc8 \
based_arrow_down \
based_arrow_up \
bd_double_arrow \
bottom_left_corner \
bottom_right_corner \
bottom_side \
bottom_tee \
c07385c7190e701020ff7ffffd08103c \
c7088f0f3e6c8088236ef8e1e3e70000 \
cell \
center_ptr \
circle \
clock \
closedhand \
color-picker \
col-resize \
context-menu \
copy \
cross \
crossed_circle \
crosshair \
cross_reverse \
d9ce0ab605698f320427677b458ad60b \
default \
diamond_cross \
dnd-ask \
dnd-copy \
dnd-link \
dnd-move \
dnd-no-drop \
dnd-none \
dot \
dotbox \
double_arrow \
draft_large \
draft_small \
draped_box \
e29285e634086352946a0e7090d73106 \
e-resize \
ew-resize \
f41c0e382c94c0958e07017e42b00462 \
f41c0e382c97c0938e07017e42800402 \
fcf1c3c7cd4491d801f1e1c78f100000 \
fcf21c00b30f7e3f83fe0dfd12e71cff \
fd_double_arrow \
fleur \
forbidden \
grabbing \
half-busy \
hand \
hand1 \
hand2 \
h_double_arrow\
help \
ibeam \
icon \
iron_cross \
left_ptr \
left_ptr_watch \
left_side \
left_tee \
link \
ll_angle \
lr_angle \
move \
ne-resize \
nesw-resize \
no-drop \
not-allowed \
n-resize \
ns-resize \
nw-resize \
nwse-resize \
openhand \
pencil \
pirate \
plus \
pointer \
pointing_hand \
progress \
question_arrow \
right-arrow \
right_ptr \
right_side \
right_tee \
row-resize \
sb_down_arrow \
sb_h_double_arrow \
sb_left_arrow \
sb_right_arrow \
sb_up_arrow \
sb_v_double_arrow \
se-resize \
size_all \
size_bdiag \
size_fdiag \
size_hor \
size_ver \
sizing \
split_h \
split_v \
s-resize \
sw-resize \
tcross \
text \
top_left_arrow \
top_left_corner \
top_right_corner \
top_side \
top_tee \
ul_angle \
up_arrow \
up-arrow \
ur_angle \
v_double_arrow \
vertical-text \
wait \
watch \
whats_this \
w-resize \
X_cursor \
X-cursor \
xterm \
zoom-in \
zoom-out

FILES = $(NAMES:%=$(CURSORS)/%)

all:	$(FILES)

# Standard arrow
$(CURSORS)/left_ptr: left_ptr.cursor left_ptr.png
	xcursorgen $< $@
$(CURSORS)/arrow $(CURSORS)/default $(CURSORS)/top_left_arrow: $(CURSORS)/left_ptr
	ln -sf left_ptr $@

# Right pointer
$(CURSORS)/right_ptr: right_ptr.cursor right_ptr.png
	xcursorgen $< $@
$(CURSORS)/draft_small $(CURSORS)/draft_large: $(CURSORS)/right_ptr
	ln -sf right_ptr $@

# Center pointer
$(CURSORS)/center_ptr: center_ptr.cursor center_ptr.png
	xcursorgen $< $@

# Action is not allowed
$(CURSORS)/circle: circle.cursor circle.png
	xcursorgen $< $@
$(CURSORS)/crossed_circle $(CURSORS)/03b6e0fcb3499374a867c041f52298f0 $(CURSORS)/03b6e0fcb3499374a867d041f52298f0: $(CURSORS)/circle
	ln -sf circle $@

# Action is not allowed (with arrow)
$(CURSORS)/forbidden: forbidden.cursor forbidden.png
	xcursorgen $< $@
$(CURSORS)/dnd-no-drop $(CURSORS)/not-allowed $(CURSORS)/no-drop: $(CURSORS)/forbidden
	ln -sf forbidden $@

# Text input
$(CURSORS)/ibeam: ibeam.cursor ibeam.png
	xcursorgen $< $@
$(CURSORS)/text $(CURSORS)/xterm: $(CURSORS)/ibeam
	ln -sf ibeam $@

# Vertical text
$(CURSORS)/vertical-text: vertical-text.cursor vertical-text.png
	xcursorgen $< $@
$(CURSORS)/048008013003cff3c00c801001200000: $(CURSORS)/vertical-text
	ln -sf vertical-text $@

# Deep waiting
$(CURSORS)/wait: wait.cursor wait??.png
	xcursorgen $< $@
$(CURSORS)/watch: $(CURSORS)/wait
	ln -sf wait $@

# Waiting (with arrow)
$(CURSORS)/progress: progress.cursor progress??.png
	xcursorgen $< $@
$(CURSORS)/half-busy $(CURSORS)/left_ptr_watch $(CURSORS)/00000000000000020006000e7e9ffc3f $(CURSORS)/08e8e1c95fe2fc01f976f1e063a24ccd $(CURSORS)/3ecb610c1bf2410f44200f48c40d3599 $(CURSORS)/0426c94ea35c87780ff01dc239897213 $(CURSORS)/9116a3ea924ed2162ecab71ba103b17f: $(CURSORS)/progress
	ln -sf progress $@

# Link-over
$(CURSORS)/pointer: pointer.cursor pointer.png
	xcursorgen $< $@
$(CURSORS)/pointing_hand $(CURSORS)/hand $(CURSORS)/hand1 $(CURSORS)/hand2 $(CURSORS)/9d800788f1b08800ae810202380a0822 $(CURSORS)/e29285e634086352946a0e7090d73106: $(CURSORS)/pointer
	ln -sf pointer $@

# Dragging
$(CURSORS)/closedhand: closedhand.cursor closedhand.png
	xcursorgen $< $@
$(CURSORS)/dnd-none $(CURSORS)/move $(CURSORS)/dnd-move $(CURSORS)/grabbing $(CURSORS)/9081237383d90e509aa00f00170e968f $(CURSORS)/4498f0e0c1937ffe01fd06f973665830 $(CURSORS)/fcf21c00b30f7e3f83fe0dfd12e71cff: $(CURSORS)/closedhand
	ln -sf closedhand $@

# Help
$(CURSORS)/help: help.cursor help.png
	xcursorgen $< $@
$(CURSORS)/question_arrow $(CURSORS)/whats_this $(CURSORS)/dnd-ask $(CURSORS)/5c6cd98b3f3ebcb1f9c7f1c204630408 $(CURSORS)/d9ce0ab605698f320427677b458ad60b: $(CURSORS)/help
	ln -sf help $@

# Cross
$(CURSORS)/cross: cross.cursor cross.png
	xcursorgen $< $@
$(CURSORS)/cross_reverse $(CURSORS)/crosshair $(CURSORS)/tcross $(CURSORS)/diamond_cross $(CURSORS)/iron_cross: $(CURSORS)/cross
	ln -sf cross $@

# Drag&Drop copy
$(CURSORS)/copy: copy.cursor copy.png
	xcursorgen $< $@
$(CURSORS)/dnd-copy $(CURSORS)/1081e37283d90000800003c07f3ef6bf $(CURSORS)/6407b0e94181790501fd1e167b474872 $(CURSORS)/b66166c04f8c3109214a4fbd64a50fc8 $(CURSORS)/08ffe1cb5fe6fc01f906f1c063814ccf: $(CURSORS)/copy
	ln -sf copy $@

# Drag&Drop link
$(CURSORS)/link: link.cursor link.png
	xcursorgen $< $@
$(CURSORS)/alias $(CURSORS)/dnd-link $(CURSORS)/640fb0e74195791501fd1ed57b41487f $(CURSORS)/3085a0e285430894940527032f8b26df $(CURSORS)/a2a266d0498c3104214a47bd64ab0fc8 $(CURSORS)/0876e1c15ff2fc01f906f1c363074c0f: $(CURSORS)/link
	ln -sf link $@

# Move
$(CURSORS)/fleur: fleur.cursor fleur.png
	xcursorgen $< $@
$(CURSORS)/all-scroll $(CURSORS)/size_all $(CURSORS)/sizing $(CURSORS)/5aca4d189052212118709018842178c0 $(CURSORS)/208530c400c041818281048008011002: $(CURSORS)/fleur
	ln -sf fleur $@

# Vertical resize
$(CURSORS)/size_ver: size_ver.cursor size_ver.png
	xcursorgen $< $@
$(CURSORS)/n-resize $(CURSORS)/s-resize $(CURSORS)/ns-resize $(CURSORS)/sb_v_double_arrow $(CURSORS)/v_double_arrow $(CURSORS)/00008160000006810000408080010102 $(CURSORS)/top_side $(CURSORS)/top_tee $(CURSORS)/bottom_side $(CURSORS)/bottom_tee $(CURSORS)/2870a09082c103050810ffdffffe0204 $(CURSORS)/c07385c7190e701020ff7ffffd08103c $(CURSORS)/based_arrow_up $(CURSORS)/based_arrow_down: $(CURSORS)/size_ver
	ln -sf size_ver $@

# Horizontal resize
$(CURSORS)/size_hor: size_hor.cursor size_hor.png
	xcursorgen $< $@
$(CURSORS)/e-resize $(CURSORS)/w-resize $(CURSORS)/ew-resize $(CURSORS)/sb_h_double_arrow $(CURSORS)/h_double_arrow $(CURSORS)/043a9f68147c53184671403ffa811cc5 $(CURSORS)/14fef782d02440884392942c11205230 $(CURSORS)/028006030e0e7ebffc7f7070c0600140 $(CURSORS)/right_side $(CURSORS)/right_tee $(CURSORS)/left_side $(CURSORS)/left_tee: $(CURSORS)/size_hor
	ln -sf size_hor $@

# FD resize (top-left)
$(CURSORS)/size_fdiag: size_fdiag.cursor size_fdiag.png
	xcursorgen $< $@
$(CURSORS)/top_left_corner $(CURSORS)/bottom_right_corner $(CURSORS)/se-resize $(CURSORS)/nw-resize $(CURSORS)/nwse-resize $(CURSORS)/38c5dff7c7b8962045400281044508d2 $(CURSORS)/fd_double_arrow $(CURSORS)/c7088f0f3e6c8088236ef8e1e3e70000 $(CURSORS)/ul_angle $(CURSORS)/lr_angle: $(CURSORS)/size_fdiag
	ln -sf size_fdiag $@

# BD resize (top-right)
$(CURSORS)/size_bdiag: size_bdiag.cursor size_bdiag.png
	xcursorgen $< $@
$(CURSORS)/top_right_corner $(CURSORS)/bottom_left_corner $(CURSORS)/sw-resize $(CURSORS)/ne-resize $(CURSORS)/nesw-resize $(CURSORS)/50585d75b494802d0151028115016902 $(CURSORS)/fcf1c3c7cd4491d801f1e1c78f100000  $(CURSORS)/bd_double_arrow $(CURSORS)/ur_angle $(CURSORS)/ll_angle: $(CURSORS)/size_bdiag
	ln -sf size_bdiag $@

# Column resize
$(CURSORS)/col-resize: col-resize.cursor col-resize.png
	xcursorgen $< $@
$(CURSORS)/split_h: $(CURSORS)/col-resize
	ln -sf col-resize $@

# Row resize
$(CURSORS)/row-resize: row-resize.cursor row-resize.png
	xcursorgen $< $@
$(CURSORS)/split_v: $(CURSORS)/row-resize
	ln -sf row-resize $@
# Plus...
$(CURSORS)/plus: plus.cursor plus.png
	xcursorgen $< $@
$(CURSORS)/cell: $(CURSORS)/plus
	ln -sf plus $@

# Opened hand...
$(CURSORS)/openhand: openhand.cursor openhand.png
	xcursorgen $< $@

# Pencil...
$(CURSORS)/pencil: pencil.cursor pencil.png
	xcursorgen $< $@

# Color picker...
$(CURSORS)/color-picker: color-picker.cursor color-picker.png
	xcursorgen $< $@

# Up arrow...
$(CURSORS)/up-arrow: up-arrow.cursor up-arrow.png
	xcursorgen $< $@
$(CURSORS)/up_arrow $(CURSORS)/sb_up_arrow: $(CURSORS)/up-arrow
	ln -sf up-arrow $@

# Right arrow...
$(CURSORS)/right-arrow: right-arrow.cursor right-arrow.png
	xcursorgen $< $@
$(CURSORS)/sb_right_arrow: $(CURSORS)/right-arrow
	ln -sf right-arrow $@

# Double arrow...
$(CURSORS)/double_arrow: double_arrow.cursor double_arrow.png
	xcursorgen $< $@

# Left arrow...
$(CURSORS)/sb_left_arrow: left-arrow.cursor left-arrow.png
	xcursorgen $< $@

# Down arrow...
$(CURSORS)/sb_down_arrow: down-arrow.cursor down-arrow.png
	xcursorgen $< $@

# Pirate...
$(CURSORS)/pirate: pirate.cursor pirate.png
	xcursorgen $< $@

# X
$(CURSORS)/X_cursor: X_cursor.cursor X_cursor.png
	xcursorgen $< $@
$(CURSORS)/X-cursor: $(CURSORS)/X_cursor
	ln -sf X_cursor $@

# Zoom-in
$(CURSORS)/zoom-in: zoom-in.cursor zoom-in.png
	xcursorgen $< $@
$(CURSORS)/f41c0e382c94c0958e07017e42b00462: $(CURSORS)/zoom-in
	ln -sf zoom-in $@

# Zoom-out
$(CURSORS)/zoom-out: zoom-out.cursor zoom-out.png
	xcursorgen $< $@
$(CURSORS)/f41c0e382c97c0938e07017e42800402: $(CURSORS)/zoom-out
	ln -sf zoom-out $@

# Context menu
$(CURSORS)/context-menu: context-menu.cursor context-menu.png
	xcursorgen $< $@
$(CURSORS)/08ffe1e65f80fcfdf9fff11263e74c48: $(CURSORS)/context-menu
	ln -sf context-menu $@

# Dot...
$(CURSORS)/dot: dot.cursor dot.png
	xcursorgen $< $@

# Box with a dot
$(CURSORS)/dotbox: dotbox.cursor dotbox.png
	xcursorgen $< $@
# TODO: make unique cursors for drapped_box and icon
$(CURSORS)/draped_box $(CURSORS)/icon: $(CURSORS)/dotbox
	ln -sf dotbox $@

# Clock
$(CURSORS)/clock: clock.cursor clock.png
	xcursorgen $< $@


# Target directory
$(CURSORS):
	mkdir -p $@

default: all

clean:
	rm $(FILES)

install:
	cp -R ../../$(THEME_NAME) $(INSTALL_PREFIX)

# Use it only if actual theme's directory is equal to $(THEME_NAME) variable
theme: all
	tar -czf ../../$(THEME_NAME)-$(THEME_VERSION).tar.gz ../../$(THEME_NAME)

# TODO:
#boat
#bogosity
#box_spiral
#drapped_box (temporary at dotbox)
#icon (temporary at dotbox)
#coffee_mug
#exchange
#gobbler
#gumby
#heart
#iron_cross (temporary at cross)
#leftbutton
#man
#middlebutton
#mouse
#rightbutton
#rtl_logo
#sailboat
#shuttle
#spider
#spraycan
#star
#target
#trek
#umbrella
