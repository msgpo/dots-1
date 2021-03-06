#!/bin/sh
umask 022
ulimit -c 0

# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# ▞▀▖      ▐          ▌ ▌         
# ▚▄ ▌ ▌▞▀▘▜▀ ▞▀▖▛▚▀▖ ▚▗▘▝▀▖▙▀▖▞▀▘
# ▖ ▌▚▄▌▝▀▖▐ ▖▛▀ ▌▐ ▌ ▝▞ ▞▀▌▌  ▝▀▖
# ▝▀ ▗▄▘▀▀  ▀ ▝▀▘▘▝ ▘  ▘ ▝▀▘▘  ▀▀ 
PATH=/bin:/sbin:$PATH
PATH=/usr/bin:/usr/sbin:$PATH
PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH=$(printf '%s:' ${HOME}/bin/*/):${HOME}/bin:$PATH
PATH=${HOME}/.local/bin:$PATH
export PATH

export MANPATH="${HOME}/.local/share/man:$MANPATH"

# ---- bonsai stuff --------
export BONSAI_ROOT="${HOME}/.bonsai"
export PATH="$BONSAI_ROOT/bin:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$BONSAI_ROOT/lib"
export MANPATH="$BONSAI_ROOT/share/man:$MANPATH"
# --------------------------

export CFLAGS='-O2 -pipe -fstack-protector-strong -fexceptions'

export PYTHONOPTIMIZE=2 # disable docstrings, debug info

if command -v nproc >/dev/null ; then
    export NPROC=$(nproc)
else
    while read -r line ; do
        case $line in
            *'cpu cores'*)
                export NPROC="${line#*: }"
        esac
    done </proc/cpuinfo
fi

export LC_CTYPE='en_US.UTF-8'
export LANG="$LC_CTYPE" \
    LANGUAGE="$LC_CTYPE" \
    LC_ALL="$LC_CTYPE" \
    LOCALE="$LC_CTYPE"

# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# ▌ ▌▛▀▖▞▀▖ ▌ ▌         
# ▝▞ ▌ ▌▌▄▖ ▚▗▘▝▀▖▙▀▖▞▀▘
# ▞▝▖▌ ▌▌ ▌ ▝▞ ▞▀▌▌  ▝▀▖
# ▘ ▘▀▀ ▝▀   ▘ ▝▀▘▘  ▀▀ 
export XDG_OPEN=opn
export XDG_CURRENT_DESKTOP=Gnome

export XDG_CONFIG_HOME="${HOME}/.config" \
       XDG_DOWNLOAD_DIR="${HOME}/downloads" \
       XDG_DOCUMENTS_DIR="${HOME}/files" \
       XDG_MUSIC_DIR="${HOME}/music" \
       XDG_PICTURES_DIR="${HOME}/images" \
       XDG_VIDEOS_DIR="${HOME}/videos"

export XDG_DATA_HOME="${HOME}/.local"
export XDG_CACHE_HOME="${HOME}/.cache"

export XDG_DESKTOP_DIR="${HOME}/Desktop" \
       XDG_PUBLICSHARE_DIR="$XDG_CACHE_HOME/Public" \
       XDG_TEMPLATES_DIR="$XDG_CACHE_HOME/Templates"
# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# ▙▗▌    ▛▀▖                    ▌ ▌         
# ▌▘▌▌ ▌ ▙▄▘▙▀▖▞▀▖▞▀▌▙▀▖▝▀▖▛▚▀▖ ▚▗▘▝▀▖▙▀▖▞▀▘
# ▌ ▌▚▄▌ ▌  ▌  ▌ ▌▚▄▌▌  ▞▀▌▌▐ ▌ ▝▞ ▞▀▌▌  ▝▀▖
# ▘ ▘▗▄▘ ▘  ▘  ▝▀ ▗▄▘▘  ▝▀▘▘▝ ▘  ▘ ▝▀▘▘  ▀▀ 

export ENV="${HOME}/src/dots/shell/main.shellrc"

export MENU_PROG=menu \
       TERMINAL_PROG=st \
       PLUMBER=opn \
       SUBS_MENU_PROG="menu -wide -p Subs:" \

export TRASH_DIR="${XDG_DATA_HOME}/Trash" \
       TASKS_FILE="${XDG_DOCUMENTS_DIR}/tasks.txt" \
       SUBS_FILE="${XDG_DOCUMENTS_DIR}/subs.txt" \
       TWITCH_STREAM_FILE="${XDG_DOCUMENTS_DIR}/twitch.txt" \
       RADIO_STATIONS_FILE="${XDG_DOCUMENTS_DIR}/radio.txt" \
       YTDLQ_DIR="${HOME}/.ytdlq"

export YTDL_OPTS='-c -R 50 --geo-bypass --prefer-ffmpeg -o %(title)s.%(ext)s'
export MPV_OPTS="--really-quiet --force-seekable=yes"

export WATSON_TTS_API_KEY="${XDG_DOCUMENTS_DIR}/api_keys/watson_tts_api.key"

# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# ▛▀▖   ▗▀▖      ▜▐   ▛▀▖                      
# ▌ ▌▞▀▖▐  ▝▀▖▌ ▌▐▜▀  ▙▄▘▙▀▖▞▀▖▞▀▌▙▀▖▝▀▖▛▚▀▖▞▀▘
# ▌ ▌▛▀ ▜▀ ▞▀▌▌ ▌▐▐ ▖ ▌  ▌  ▌ ▌▚▄▌▌  ▞▀▌▌▐ ▌▝▀▖
# ▀▀ ▝▀▘▐  ▝▀▘▝▀▘ ▘▀  ▘  ▘  ▝▀ ▗▄▘▘  ▝▀▘▘▝ ▘▀▀ 
#if command -v gnvim >/dev/null && command -v gnvim-launch >/dev/null ; then
#    export EDITOR=gnvim-launch
#else
export EDITOR=nvim
# fi

export BROWSER=firefox
export PAGER=less MANPAGER=less
# opts: quiet/raw/squeeze/ignore-case/short-prompt/show-percentage
export LESS='-QRsim +Gg'
export LESSHISTFILE=/dev/null
# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
# ▛▀▖▜       ▞▀▖ ▛▀▘          ▌ ▌          ▞▀▖            
# ▙▄▘▐ ▝▀▖▛▀▖▚▄▌ ▙▄▙▀▖▞▀▖▛▚▀▖ ▌ ▌▞▀▘▞▀▖▙▀▖ ▚▄ ▛▀▖▝▀▖▞▀▖▞▀▖
# ▌  ▐ ▞▀▌▌ ▌▖ ▌ ▌ ▌  ▌ ▌▌▐ ▌ ▌ ▌▝▀▖▛▀ ▌   ▖ ▌▙▄▘▞▀▌▌ ▖▛▀ 
# ▘   ▘▝▀▘▘ ▘▝▀  ▘ ▘  ▝▀ ▘▝ ▘ ▝▀ ▀▀ ▝▀▘▘   ▝▀ ▌  ▝▀▘▝▀ ▝▀▘
if [ -d "${HOME}/src/plan9" ] ; then
    export PLAN9="${HOME}/src/plan9"
elif [ -d /usr/lib/plan9 ] ; then
    export PLAN9=/usr/lib/plan9
fi
if [ "$PLAN9" ] ; then
    export PATH="$PATH:$PLAN9/bin"
    export font="$PLAN9/lib/font/terminus/ter-u14v.font"
    export lfont="$PLAN9/lib/font/mntcarlo/mntcarlo.font"
    export tabstop=4
fi
# -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
#    ▐  ▌            ▐     ▗▀▖▗▀▖
# ▞▀▖▜▀ ▛▀▖▞▀▖▙▀▖ ▞▀▘▜▀ ▌ ▌▐  ▐  
# ▌ ▌▐ ▖▌ ▌▛▀ ▌   ▝▀▖▐ ▖▌ ▌▜▀ ▜▀ 
# ▝▀  ▀ ▘ ▘▝▀▘▘   ▀▀  ▀ ▝▀▘▐  ▐  
# empty ~/tmp
rm -rf ~/tmp 2>/dev/null ||:
mkdir -p ~/tmp
