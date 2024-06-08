### Normal Mode

1. `0`- to get to beginning of line, `$` - to get to end of line

2.  1. `e`- to get to right word by word(fast forward),
    2. `b`- to get to left word by word(go back)
3. `gg`- top of file, `shift+G`- bottom of file
4. `p` ⇒ paste
5. `dd` - to delete specific line
6. `m` - to move a file
7. `d` - to delete a file
8. `space + -` : split window horizontally
9. `space + l` or `(shift + \)` : split window vertically
10. `ctrl + h/j/k/l` : navigate windows
    1. `:q!` - to escape this
    2. `ctrl + l` : go to right
    3. `ctrl + h` : go to left
    4. `ctrl + j` : go to down
    5. `ctrl + k` : to go up
11. `gd` : go to definition of function(where it was declared)
12. `shift+k`: preview type definition
13. `leader+CR`: Rename symbol(update function name everywhere)
14. `leader+CF`: code format
15. `leader+CA`: code action
16. `leader+cr`: remove unused import
17. `leader+co`: organise imports
18. `18j` - take 18 lines down relative to cursor

-   `nk` - up a bit by n lines
-   `nj` - down a bit

1. `space+ft` : open terminal ; exit: to exit
2. add a file/folder: go to explore mode

esc then type `:Explore` add a file- %a.txt

add a folder `d` folder name

buffers(code tabs):

`[+b` - goto left

### Visual Mode

-   Press  `v` to enter visual mode,
-   `h` → left, `l` → right , `j` → down, `k` → up,
-   `y` to copy the line , `p` to paste
-   `d` to delete or cut
-   `di "` to delete everything inside “ “
-   `di (` to delete everything inside ()
-   `u` - undo
-   `ctrl + r` - redo
-   `esc` - escape

1. Search
    1. `/ + what_to_search`, next arrow to get to next
    2. `:line_number` - go to line

### Insert Mode

-   Press `i` to enter insert mode, make changes, then press `Esc` and `:wq` to save and exit.
-   press `ctrl+c` :to exit edit mode, enter normal mode
-   `space + ff` - to open file finder(tree structure)
-   `esc+esc` - to close
-   `space+ f`- to find files in folder only
-   `space + e`- to open file manager
-   `space + sg`- live grep, **searches for text and strings defined by users in a given file, search across codebase**
-   `space + fc`- color schemes
    `space + key`
    | b → Buffers | F → Find Files (cwd) | r + Recent |
    | ------------------------------- | ------------------------- | ---------------------- |
    | c → Find Config File | f + Find Files (root dir) | t→Terminal Croot dir） |
    | e → Explorer NeoTree (root dir) | n → New File | T → Terminal (cwd) |
    | E → Explorer NeoTree (cwd) | R → Recent (cwd) | |

1. **Using built-in commands:**

    - To create a new file, you can use the `:edit` command followed by the file name. For example:

        ```
        :edit newfile.txt

        ```

        This will open a new buffer with the specified file name. If the file doesn't exist, it will be created when you save it.

    - Alternatively, you can use the `:new` command to open a new buffer without specifying a file name. For example:

        ```
        :new

        ```

        This will open a new buffer without a file name. You can then save it with `:w <filename>`.

Compile a file within NeoVim, do using the built-in terminal emulator. Here's a step-by-step guide on how to compile a file from within NeoVim:

1. **Open Terminal in Neovim**:
    - Open NeoVim and open the file you want to compile.
    - Enter the command `:term` in normal mode to open the terminal emulator in a split window at the bottom.
2. **Navigate Back to the NeoVim Buffer**:
    - Once you've compiled and/or executed your file, you can switch back to the Neovim buffer by pressing `Ctrl + W` twice in quick succession (`Ctrl + W, Ctrl + W`).
3. **Save and Close**:
    - Save your changes to the file if needed by entering command mode (`Esc`) and typing `:w`.
    - Close NeoVim by entering command mode and typing `:q`.
    - to save and exit file `:wq`

By following these steps, you can compile and execute files directly from within NeoVim using the built-in terminal emulator. This allows for a seamless development workflow without needing to switch between the editor and the terminal.

1. **Using terminal emulator:**
    - You can also create files using the terminal emulator within NeoVim. Press `:` to enter command mode, then type `terminal` to open the terminal emulator. From there, you can use standard shell commands to create files, such as `touch newfile.txt`.

-   `option+shift+arrow :` shift cursor word by word

### Navigate browser using NVim

`d`- down of page

`u` - up of page

`gg` - top of page

`k` - up

`j` - down

`F` to see links (F opens it in a new tab) then simultaneously type the link char

`J`- previous tab

-   `J, gT`: Go one tab left
-   `K, gt`: Go one tab right
-   `g0`: Go to the first tab
-   `ng0`: Go to the n-th tab
-   `g$`: Go to the last tab
-   `^`: Visit the previously-visited tab
-   `t`: Create new tab
-   `x`: Close current tab
-   `H`: Go back in history
-   `L`: Go forward in history
-   `?`: Show the help dialog
-   `j`: Scroll

### NVim Tree

| /→Fuzzily search in current buffer | q→ TroubleToggle | c → +[C]ode    | r→ +[R]ename (to rename) |
| ---------------------------------- | ---------------- | -------------- | ------------------------ |
| <space>                            | z → ZenMode      | d→ +[D]ocument | s→ +[S]earch             |
| e → nvim tree toggle               | [ → +prefix      | f → +prefix    | t→ +prefix               |
| D → LSP: Type [D]efinition         | ] → +prefix      | g → +prefix    | w →workspace             |

**Rename**

file manager in neovim

go to desired file;type r on it to rename the file

find and replace → replace app.get with app.post

```bash
:%s /app.get /app.post /g
```
