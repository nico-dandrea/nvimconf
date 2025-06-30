# Neovim Custom Key Mappings Cheat Sheet

| Mode    | Key Combination         | Description                                                        |
|---------|-------------------------|--------------------------------------------------------------------|
| Normal  | `<leader>pv`            | Open the Ex mode (file explorer)                                   |
| Visual  | `J`                     | Move selected lines down                                           |
| Visual  | `K`                     | Move selected lines up                                             |
| Normal  | `J`                     | Join lines without moving the cursor                               |
| Normal  | `<C-d>`                 | Scroll down half a screen and center the cursor                    |
| Normal  | `<C-u>`                 | Scroll up half a screen and center the cursor                      |
| Normal  | `n`                     | Move to the next search result and center the cursor               |
| Normal  | `N`                     | Move to the previous search result and center the cursor           |
| Normal  | `<leader>zig`           | Restart the LSP server                                             |
| Normal  | `<leader>vwm`           | Start a collaborative session with vim-with-me                     |
| Normal  | `<leader>svwm`          | Stop the collaborative session with vim-with-me                    |
| Visual  | `<leader>p`             | Paste over currently selected text without yanking it              |
| Normal  | `<leader>y`             | Copy to system clipboard                                           |
| Visual  | `<leader>y`             | Copy to system clipboard                                           |
| Normal  | `<leader>Y`             | Copy line to system clipboard                                      |
| Normal  | `<leader>d`             | Delete text without yanking it                                     |
| Visual  | `<leader>d`             | Delete text without yanking it                                     |
| Insert  | `<C-c>`                 | Map <C-c> to <Esc>                                                 |
| Normal  | `Q`                     | Disable the Q key                                                  |
| Normal  | `<leader>f`             | Format the current buffer with LSP                                 |
| Normal  | `<C-k>`                 | Next item in quickfix list and center the cursor                   |
| Normal  | `<C-j>`                 | Previous item in quickfix list and center the cursor               |
| Normal  | `<leader>k`             | Next item in location list and center the cursor                   |
| Normal  | `<leader>j`             | Previous item in location list and center the cursor               |
| Normal  | `<leader>s`             | Substitute current word under cursor globally                      |
| Normal  | `<leader>x`             | Make current file executable                                       |
| Normal  | `<leader>ee`            | Insert Go error handling snippet                                   |
| Normal  | `<leader>vpp`           | Open the Neovim configuration file for theprimeagen's packer setup |
| Normal  | `<leader>mr`            | Run CellularAutomaton make_it_rain                                 |
| Normal  | `<leader><leader>`      | Source the current file                                            |
| Normal  | `<leader>a`             | Select all text in the file                                        |

# LSP and Diagnostic Mappings

| Mode    | Key Combination         | Description                                                        |
|---------|-------------------------|--------------------------------------------------------------------|
| Normal  | `gd`                    | Go to definition                                                   |
| Normal  | `K`                     | Show hover information                                             |
| Normal  | `<leader>vws`           | Search workspace symbols                                           |
| Normal  | `<leader>vd`            | Open diagnostics in a floating window                              |
| Normal  | `[d`                    | Go to the next diagnostic                                          |
| Normal  | `]d`                    | Go to the previous diagnostic                                      |
| Normal  | `<leader>vca`           | Show code actions                                                  |
| Normal  | `<leader>vrr`           | Show references                                                    |
| Normal  | `<leader>vrn`           | Rename symbol                                                      |
| Insert  | `<C-h>`                 | Show signature help                                                |

