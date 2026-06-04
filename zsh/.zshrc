# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnosterzak"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#pokemon-colorscripts --no-title -s -r #without fastfetch
#pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# fastfetch. Will be disabled if above colorscript was chosen to install
fastfetch -c $HOME/.config/fastfetch/config-v2.jsonc

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias n='nvim'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias yy='yazi .'
alias lg="lazygit"

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"

# --- Tmux Auto-Start and Session Selector ---

# Function to handle tmux logic
tmux_startup() {
  
  # 1. Check if we are already inside a tmux session
  if [ -z "$TMUX" ]; then
    
    # 2. Get existing session names into a Zsh array
    # This is more robust in Zsh than a simple string.
    local sessions_array=($(tmux ls 2>/dev/null | cut -d: -f1))
    
    # 3. Set the prompt for the 'select' menu
    PS3="Select a tmux option: "
    
    # 4. Show the select menu
    # Options are: existing sessions (if any), "Create new", "Do nothing"
    echo "Choose a tmux session:"
    select choice in "${sessions_array[@]}" "Create new session" "Do nothing (standard Zsh)"; do
      
      case "$choice" in
        "Create new session")
          # --- Requirement 2b ---
          # Prompt for a session name
          local SESSION_NAME
          read "SESSION_NAME?Enter new session name (default: 'main'): "
          
          # Set default 'main' if no name is given
          : "${SESSION_NAME:=main}" 
          
          echo "Creating and attaching to '$SESSION_NAME'..."
          # Create and attach
          tmux new-session -s "$SESSION_NAME"
          break # Exit loop
          ;;
        "Do nothing (standard Zsh)")
          echo "Continuing in standard Zsh."
          break # Exit loop
          ;;
        "") 
          # Handle invalid number input (e.g., user types '99')
          echo "Invalid choice. Please select a number from the list."
          # Loop repeats
          ;;
        *)
          # --- Requirement 2a ---
          # This case handles selecting an existing session from the list
          # We double-check it still exists (good practice)
          if tmux has-session -t "$choice" 2>/dev/null; then
            echo "Attaching to '$choice'..."
            tmux attach -t "$choice"
          else
            echo "Error: Session '$choice' no longer exists. Please try again."
            # Don't break, let the user re-select from the (now updated) menu
          fi
          break # Exit loop
          ;;
      esac
    done
    
    # Clean up the prompt variable
    unset PS3
    
  fi
}


# Run the function
tmux_startup

# Clean up the function from the environment after it has run
unset -f tmux_startup

# --- End of Tmux ---

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


eval "$(zoxide init zsh)"
