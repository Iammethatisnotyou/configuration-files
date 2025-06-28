/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>
/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const float	  gappx     = 7.5;
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char col_gray1[]       = "#1d1d1d";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const unsigned int baralpha    = 0xd0;
static const unsigned int borderalpha = 0xd0;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border*/
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/* tagging */
static const char *tags[] = { "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX" };

/* Lockfile */
static char lockfile[] = "/tmp/dwm.lock";

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int attachbelow = 1;

#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "|=",       tile },    /* first entry is default */
	{ "O",        NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[D]",      dwindle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define SUPER Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} }, 

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */

/*static const char *ModkeyCtrl = {.v = (tag).ui = ~0, (view).ui = ~0 }; */
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *firefox[] = { "firefox", NULL };
static const char *sys_monitor[] = { "alacritty", "-e", "btop", NULL};

/* Audio Controls */
static const char *mutecmd[] = { "pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle", NULL };
static const char *volupcmd[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%", NULL };
static const char *voldowncmd[] = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%", NULL };

static const char *brightness_up[] = { "xbacklight", "-inc", "10", NULL };
static const char *brightness_down[] = { "xbacklight", "-dec", "10", NULL };
static const char *togglelayoutcmd[] = { "/home/LiamUSR/programs/scripts/toggle_layout.sh", NULL };
static const char *wallpaper[] = { "/home/LiamUSR/programs/scripts/wallpaper.sh", NULL };
static const char *screenshot[] = { "flameshot", "gui", NULL };
static const char *view_layouts[] = { "feh", "/home/LiamUSR/Documents/keyboard/layout_pictures/", NULL };
static const char *logout[] = { "/home/LiamUSR/programs/scripts/logout.sh", NULL };
static const char *lock_screen[] = { "slock", NULL };

static const char *layout_keybind[] = { "./programs/c-cpp/layout/comp_layout", "1", NULL};
static const char *layout_keybind_two[] = { "./programs/c-cpp/layout/comp_layout", "2", NULL};
static const char *layout_keybind_three[] = { "./programs/c-cpp/layout/comp_layout", "3", NULL};
static const char *layout_keybind_four[] = { "./programs/c-cpp/layout/comp_layout", "4", NULL};


#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ 0,				XF86XK_MonBrightnessUp,	   spawn,    {.v = brightness_up} },
	{ 0,				XF86XK_MonBrightnessDown,  spawn,    {.v = brightness_down} },
	{ 0, 				XF86XK_AudioMute,    	   spawn,    {.v = mutecmd} },
	{ 0, 				XF86XK_AudioLowerVolume,   spawn,    {.v = voldowncmd} },
	{ 0, 				XF86XK_AudioRaiseVolume,   spawn,    {.v = volupcmd} },
	{ MODKEY,			XK_Home,   spawn,	   {.v = lock_screen } },
	{ MODKEY,			XK_Delete, spawn,	   {.v = logout } },
	
	{ SUPER,			XK_1,	   spawn,	   {.v = layout_keybind} },
	{ SUPER,			XK_2,  	   spawn,	   {.v = layout_keybind_two } },
	{ SUPER,			XK_3,  	   spawn,	   {.v = layout_keybind_three } },
	{ SUPER,			XK_4,  	   spawn,	   {.v = layout_keybind_four } },
	{ SUPER,			XK_space,  spawn,	   {.v = togglelayoutcmd } },

	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,			XK_g,	   spawn,	   {.v = firefox } },
	{ MODKEY,             		XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,			XK_w,	   spawn,	   {.v = wallpaper} },
	{ MODKEY,			XK_v,  	   spawn,	   {.v = screenshot} },
	{ MODKEY,			XK_l,	   spawn,	   {.v = sys_monitor} },
	{ MODKEY,			XK_x,	   spawn,	   {.v = view_layouts} },
	{ MODKEY|ShiftMask,		XK_t,	   movestack,	   {.i = -1} },
	{ MODKEY|ShiftMask,		XK_n,  	   movestack,	   {.i = +1} },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_t,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_n,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_a,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_s,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,             XK_d,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },

	// Keybinding to move a window to tag 1 and view it
	{ MODKEY|ControlMask|ShiftMask, XK_0,      tag_and_view,    {.ui = 1 << 0} },

	/*{ MODKEY|ShiftMask|ControlMask, XK_0,	   spawn,	   {.v = ModkeyCtrl} }, */
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
