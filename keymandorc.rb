# Start Keymando at login
# -----------------------------------------------------------
 start_at_login

# Disable Keymando when using these applications
# -----------------------------------------------------------
# disable "Remote Desktop Connection"
# disable /VirtualBox/


# Basic mapping
# -----------------------------------------------------------
# map "<Ctrl-[>", "<Escape>"
# map "<Ctrl-m>", "<Ctrl-F2>"

# TEMP FOR TESTING
# map "<Cmd-o>" { Spotify.play }

#LOCK SCREEN
map '<Cmd-Ctrl-l>' do
    if confirm('Lock screen?')
        say 'Goodbye for now!'
        lock_screen
    end
end


# -----------------------------------------------------------
# Visit http://keymando.com to see what Keymando can do!
# -----------------------------------------------------------
#
# VIM Mapping

nmap '<Ctrl-;>', '<Escape>'
except /iTerm/, /MacVim/, /Chrome/, /Firefox/, /Sublime Text 2/, /Term/ do
    map '<Ctrl-j>', '<Down>'
    map '<Ctrl-k>', '<Up>'
    map '<Ctrl-h>', '<Left>'
    map '<Ctrl-l>', '<Right>'

    map '<Ctrl-f>', '<PageUp>'
    map '<Ctrl-b>', '<PageDown>'
    map '<Ctrl-Shift-j>', '<Shift-Down>'
    map '<Ctrl-Shift-k>', '<Shift-Up>'
    map '<Ctrl-Shift-h>', '<Shift-Left>'
    map '<Ctrl-Shift-l>', '<Shift-Right>'

    #map 'jj', "<Escape>"
    map '<Ctrl-m>', '<Ctrl-F2>'
    map "<Cmd-p>", Commands.press_button_on_ui

end

except /iTerm/, /MacVim/, /Term/ do

    # Right mouse click
    map "<Ctrl-r>" do
        left_click
    end
  map ";uic", Commands.ui_controls
  map ";lc", Commands.left_click_element
  map ";rc", Commands.right_click_element
  map ";dc", Commands.double_click_element
  map ";mi", Commands.show_current_app_menu_items

end

# Disable quiting for iTerm.  Should only exit via command line
#only /MacVim/ do
    #map "<Cmd-q>", nil
#end
#only /iTerm/ do
    #map "<Cmd-q>", nil
#end
#only /PyCharm/ do
    #map "<Cmd-q>", nil
#end

except /PyCharm/ do
    map "<Cmd-k>" do
        input(
              "wfd" => lambda {
                    activate("Firefox")
                    activate("Charles")
                    },
              "c" => lambda {
                        activate("Google Chrome")
                    },
            "f" => lambda {
                activate("Firefox")
            },
            "t" => lambda {
                activate("ITerm")
            },
            "m" => lambda {
                activate("Sparrow")
            },
            "r" => lambda {
                activate("Remember the Milk")
            },
            "d" => lambda {
                activate("MacVim")
            },
            "s" => lambda {
                activate("Skype")
            },
            "n" => lambda {
                activate("nvALT")
            },
            "h" => lambda {
                activate("EZOX Hipchat")
            },
            "g" => lambda {
                activate("SourceTree")
            },
            "mu" => lambda {
                activate("Spotify")
            },
            "cn" => lambda {
                activate("Google Chrome Canary")
            },
            "ch" => lambda {
                activate("Charles")
            },
            "su" => lambda {
                activate("Sublime Text 2")
            },
            "me" => lambda {
                activate("Messages")
            },
            "hc" => lambda {
                activate("HipChat")
            }
        )
    end
end
