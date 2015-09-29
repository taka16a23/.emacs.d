;;; 06_loaddefs_start.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "../mylisp/annotation" "../mylisp/annotation.el"
;;;;;;  (22026 35731 79049 998000))
;;; Generated autoloads from ../mylisp/annotation.el

(autoload 'annotation "../mylisp/annotation" "\
Insert Annotation tag from `annotation-list'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/anything-info-python" "../mylisp/anything-info-python.el"
;;;;;;  (22026 35731 80049 998000))
;;; Generated autoloads from ../mylisp/anything-info-python.el

(autoload 'anything-info-python-at-point "../mylisp/anything-info-python" "\
Preconfigured `anything' for search info at point.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/auto-recover" "../mylisp/auto-recover.el"
;;;;;;  (22026 35731 80049 998000))
;;; Generated autoloads from ../mylisp/auto-recover.el

(defvar auto-recover-exclude-re "\\.junk\\.")

(autoload 'auto-recover-startup "../mylisp/auto-recover" "\
Auto recover from auto save.
If auto save file is old, then will delete it.

\(fn)" nil nil)

(autoload 'cleanup-autosave "../mylisp/auto-recover" "\
Clean up auto save file.
If auto save file is old, then will delete it.

\(fn &optional FORCE)" t nil)

(autoload 'force-cleanup-autosave "../mylisp/auto-recover" "\
ARGS

\(fn)" t nil)

(autoload 'before-kill-emacs-cleanup-autosave "../mylisp/auto-recover" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "../mylisp/auto-svn" "../mylisp/auto-svn.el"
;;;;;;  (22026 35731 80049 998000))
;;; Generated autoloads from ../mylisp/auto-svn.el

(autoload 'svn-status-pylib "../mylisp/auto-svn" "\


\(fn)" t nil)

(autoload 'svn-status-emacsd "../mylisp/auto-svn" "\


\(fn)" t nil)

(autoload 'svn-status-zsh "../mylisp/auto-svn" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/auto-yasnippet-extension" "../mylisp/auto-yasnippet-extension.el"
;;;;;;  (22026 35731 80049 998000))
;;; Generated autoloads from ../mylisp/auto-yasnippet-extension.el

(autoload 'auto-yasnippet-ext "../mylisp/auto-yasnippet-extension" "\
Compact command with `create-auto-yasnippet', `expand-auto-yasnippet'.
Do `create-auto-yasnippet' if mark is active.
Else do `expand-auto-yasnippet'.
ARGS: prefix

\(fn START END)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/balle-python-shift" "../mylisp/balle-python-shift.el"
;;;;;;  (22026 35731 80049 998000))
;;; Generated autoloads from ../mylisp/balle-python-shift.el

(autoload 'balle-python-shift-left "../mylisp/balle-python-shift" "\


\(fn)" t nil)

(autoload 'balle-python-shift-right "../mylisp/balle-python-shift" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/check-misspell" "../mylisp/check-misspell.el"
;;;;;;  (22026 35731 80049 998000))
;;; Generated autoloads from ../mylisp/check-misspell.el

(defvar no-check-type-miss nil)

(defvar typemiss-list 'nil)

(make-variable-buffer-local 'typemiss-list)

(autoload 'check-misspell "../mylisp/check-misspell" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/clean-backup" "../mylisp/clean-backup.el"
;;;;;;  (22026 35731 80049 998000))
;;; Generated autoloads from ../mylisp/clean-backup.el

(autoload 'clean-backup-files "../mylisp/clean-backup" "\
Delete backup-files if not exists sources.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/constraction-loaddefs" "../mylisp/constraction-loaddefs.el"
;;;;;;  (22026 35731 81049 998000))
;;; Generated autoloads from ../mylisp/constraction-loaddefs.el

(autoload 'constraction-loaddefs "../mylisp/constraction-loaddefs" "\
Make 06_loaddefs_start.el file that parsed autoload.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/delete-file-if-no-contents" "../mylisp/delete-file-if-no-contents.el"
;;;;;;  (22026 35731 81049 998000))
;;; Generated autoloads from ../mylisp/delete-file-if-no-contents.el

(autoload 'delete-file-if-no-contents "../mylisp/delete-file-if-no-contents" "\
Delete buffer if no contents.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "../mylisp/hotstring" "../mylisp/hotstring.el"
;;;;;;  (22026 35731 81049 998000))
;;; Generated autoloads from ../mylisp/hotstring.el

(autoload 'hotstring-mode "../mylisp/hotstring" "\
Hotstring mode

\(fn &optional ARG)" t nil)

(defvar hotstring-global-mode nil "\
Non-nil if Hotstring-Global mode is enabled.
See the command `hotstring-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `hotstring-global-mode'.")

(custom-autoload 'hotstring-global-mode "../mylisp/hotstring" nil)

(autoload 'hotstring-global-mode "../mylisp/hotstring" "\
Toggle Hotstring mode in all buffers.
With prefix ARG, enable Hotstring-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Hotstring mode is enabled in all buffers where
`(lambda nil (hotstring-mode 1))' would do it.
See `hotstring-mode' for more information on Hotstring mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/join-one-start" "../mylisp/join-one-start.el"
;;;;;;  (22026 35731 84049 998000))
;;; Generated autoloads from ../mylisp/join-one-start.el

(autoload 'joinone-start-files "../mylisp/join-one-start" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/maintain" "../mylisp/maintain.el"
;;;;;;  (22026 35731 84049 998000))
;;; Generated autoloads from ../mylisp/maintain.el

(autoload 'do-directory-files "../mylisp/maintain" "\
Do function each file in directory.

\(fn DIR FUNC &optional REGEXP)" nil nil)

;;;***

;;;### (autoloads nil "../mylisp/mini" "../mylisp/mini.el" (22026
;;;;;;  35731 84049 998000))
;;; Generated autoloads from ../mylisp/mini.el

(autoload 't1-mini-toggle "../mylisp/mini" "\
mini toggle

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/nosetests" "../mylisp/nosetests.el"
;;;;;;  (22026 35731 84049 998000))
;;; Generated autoloads from ../mylisp/nosetests.el

(autoload 'nosetests-run-buffer "../mylisp/nosetests" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-all "../mylisp/nosetests" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-dir "../mylisp/nosetests" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-it "../mylisp/nosetests" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-buffer-cover-package "../mylisp/nosetests" "\
ARGS 

\(fn ARGS)" t nil)

(autoload 'nosetests-run-all-cover-package "../mylisp/nosetests" "\
ARGS

\(fn ARGS)" t nil)

(autoload 'nosetests-run-dir-cover-package "../mylisp/nosetests" "\
ARGS

\(fn ARGS)" t nil)

(autoload 'nosetests-run-it-cover-package "../mylisp/nosetests" "\
ARGS

\(fn ARGS)" t nil)

(autoload 'nosetests-turn-on-pdb "../mylisp/nosetests" "\


\(fn)" t nil)

(autoload 'nosetests-turn-off-pdb "../mylisp/nosetests" "\


\(fn)" t nil)

(autoload 'nosetests-turn-on-coverage "../mylisp/nosetests" "\
ARGS

\(fn)" t nil)

(autoload 'nosetests-turn-off-coverage "../mylisp/nosetests" "\
ARGS

\(fn)" t nil)

(autoload 'nosetests-turn-on-profile "../mylisp/nosetests" "\
ARGS

\(fn)" t nil)

(autoload 'nosetests-turn-off-profile "../mylisp/nosetests" "\
ARGS

\(fn)" t nil)

(autoload 'nosetests-turn-on-doctest "../mylisp/nosetests" "\


\(fn)" t nil)

(autoload 'nosetests-turn-off-doctest "../mylisp/nosetests" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/purge-package" "../mylisp/purge-package.el"
;;;;;;  (22026 35731 84049 998000))
;;; Generated autoloads from ../mylisp/purge-package.el

(defvar purge-package-list nil)

(defvar purge-package-flag t)

(autoload 'purge-package "../mylisp/purge-package" "\
Purge package functions.

\(fn &optional FORCE)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/python-extensions" "../mylisp/python-extensions.el"
;;;;;;  (22026 35731 84049 998000))
;;; Generated autoloads from ../mylisp/python-extensions.el

(autoload 'py-make-__all__-from-buffer "../mylisp/python-extensions" "\
Create __all__ statements from buffer.

\(fn)" t nil)

(autoload 'py-add-to-__all__ "../mylisp/python-extensions" "\
add-to-__all__

\(fn)" t nil)

(autoload 'py--insert-imports "../mylisp/python-extensions" "\

MODULENAME: strings of module name like 'os', 'sys'
STR: will insert strings
TAIL: if non-nill then insert string tail of imports block.

\(fn MODULENAME STR &optional TAIL)" nil nil)

(autoload 'py--insert-imports-regexp "../mylisp/python-extensions" "\
py-insert-imports
REGEXP: search by regexp
STR: will insert strings
TAIL: if non-nill then insert string tail of imports block.

\(fn REGEXP STR &optional TAIL)" nil nil)

(autoload 'py-indirect-import "../mylisp/python-extensions" "\
Indirect import region.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/recover-last-killed-file" "../mylisp/recover-last-killed-file.el"
;;;;;;  (22026 35731 84049 998000))
;;; Generated autoloads from ../mylisp/recover-last-killed-file.el

(defvar last-killed-file nil)

(autoload 'set-last-killed-file "../mylisp/recover-last-killed-file" "\


\(fn)" nil nil)

(autoload 'get-last-killed-file "../mylisp/recover-last-killed-file" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/recover-version" "../mylisp/recover-version.el"
;;;;;;  (22026 35731 85049 998000))
;;; Generated autoloads from ../mylisp/recover-version.el

(autoload 'recover-version "../mylisp/recover-version" "\
Recover from backup versions.

\(fn)" t nil)

(defalias 'back-to-revision 'recover-version)

;;;***

;;;### (autoloads nil "../mylisp/remark" "../mylisp/remark.el" (22026
;;;;;;  35731 85049 998000))
;;; Generated autoloads from ../mylisp/remark.el

(autoload 'remark "../mylisp/remark" "\
Revive marked region.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/rename-old-del" "../mylisp/rename-old-del.el"
;;;;;;  (22026 35731 85049 998000))
;;; Generated autoloads from ../mylisp/rename-old-del.el

(autoload 'rename-old-del "../mylisp/rename-old-del" "\
Write current buffer into file FILENAME.
This makes the buffer visit that file, and marks it as not modified.

If you specify just a directory name as FILENAME, that means to use
the default file name but in that directory.  You can also yank
the default file name into the minibuffer to edit it, using \\<minibuffer-local-map>\\[next-history-element].

If the buffer is not already visiting a file, the default file name
for the output file is the buffer name.

If optional second arg CONFIRM is non-nil, this function
asks for confirmation before overwriting an existing file.
Interactively, confirmation is required unless you supply a prefix argument.

If rename, prompt delete old file.

\(fn FILENAME &optional CONFIRM)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/rest-room" "../mylisp/rest-room.el"
;;;;;;  (22026 35731 85049 998000))
;;; Generated autoloads from ../mylisp/rest-room.el

(defvar rest-room-hook nil)

(autoload 'rest-room "../mylisp/rest-room" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/rotate-text" "../mylisp/rotate-text.el"
;;;;;;  (22026 35731 85049 998000))
;;; Generated autoloads from ../mylisp/rotate-text.el

(defvar rotate-text-rotations 'nil "\
List of text rotation sets.")

(make-variable-buffer-local 'rotate-text-rotations)

(autoload 'rotate-region "../mylisp/rotate-text" "\
Rotate all matches in `rotate-text-rotations' between point and mark.

\(fn BEG END)" t nil)

(autoload 'rotate-string "../mylisp/rotate-text" "\
Rotate all matches in STRING using associations in ROTATIONS.
If ROTATIONS are not given it defaults to `rotate-text-rotations'.

\(fn STRING &optional ROTATIONS)" nil nil)

(autoload 'rotate-next "../mylisp/rotate-text" "\
Return the next element after STRING in ROTATIONS.

\(fn STRING &optional ROTATIONS)" nil nil)

(autoload 'rotate-get-rotations-for "../mylisp/rotate-text" "\
Return the string rotations for STRING in ROTATIONS.

\(fn STRING &optional ROTATIONS)" nil nil)

(autoload 'rotate-convert-rotations-to-regexp "../mylisp/rotate-text" "\


\(fn ROTATIONS)" nil nil)

(autoload 'rotate-flatten-list "../mylisp/rotate-text" "\
Flatten LIST-OF-LISTS to a single list.
Example:
  (rotate-flatten-list '((a b c) (1 ((2 3)))))
    => (a b c 1 2 3)

\(fn LIST-OF-LISTS)" nil nil)

(autoload 'rotate-word-at-point "../mylisp/rotate-text" "\
Rotate word at point based on sets in `rotate-text-rotations'.

\(fn)" t nil)

(autoload 'indent-or-rotate "../mylisp/rotate-text" "\
If point is at end of a word, then else indent the line.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/scrap-code" "../mylisp/scrap-code.el"
;;;;;;  (22026 35731 85049 998000))
;;; Generated autoloads from ../mylisp/scrap-code.el

(autoload 'scrap-code "../mylisp/scrap-code" "\
Scraping current buffer to scrap directory.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/switch-buffer" "../mylisp/switch-buffer.el"
;;;;;;  (22026 35731 85049 998000))
;;; Generated autoloads from ../mylisp/switch-buffer.el

(autoload 'switch-message "../mylisp/switch-buffer" "\
Switch *Messages* buffer.

\(fn)" t nil)

(autoload 't1-switch-04_bindings_start "../mylisp/switch-buffer" "\
Switch 04_bindings_start or find file.

\(fn)" t nil)

(autoload 'switch-test_start "../mylisp/switch-buffer" "\
Switch test_start.el or find file.

\(fn)" t nil)

(autoload 'switch-hotstring "../mylisp/switch-buffer" "\
Switch to 30_hotstring_plugin_start.el

\(fn)" t nil)

(autoload 'switch-allinone "../mylisp/switch-buffer" "\
Switch allinone.org or find file.

\(fn)" t nil)

(autoload 'switch-scratch "../mylisp/switch-buffer" "\
Switch *scratch*.

\(fn)" t nil)

(autoload 'switch-start-dir "../mylisp/switch-buffer" "\


\(fn)" t nil)

(autoload 'switch-dired "../mylisp/switch-buffer" "\
Switch Dired.

\(fn)" t nil)

(autoload 'switch-junk "../mylisp/switch-buffer" "\
Switch funk file.

\(fn)" t nil)

(autoload 'switch-snippets "../mylisp/switch-buffer" "\
switch snippets directory as dired.

\(fn)" t nil)

(autoload 'switch-ipython "../mylisp/switch-buffer" "\
Switch Ipythn.

\(fn)" t nil)

(autoload 'find-file-conf "../mylisp/switch-buffer" "\
Find file startup config.

\(fn)" t nil)

(autoload 'match-dir-file "../mylisp/switch-buffer" "\
Return first matched file name by STRING in DIRECTORY.
EXCUDE is exclude regexp to match file name

\(fn STRING DIRECTORY &optional EXCLUDE)" nil nil)

(autoload 'register-buffer "../mylisp/switch-buffer" "\


\(fn &optional ARG)" t nil)

(autoload 'launch-or-switch-term "../mylisp/switch-buffer" "\
If exists term buffer then switch it.
If not exists term buffer then create term buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/timestamp-insert" "../mylisp/timestamp-insert.el"
;;;;;;  (22026 35731 86049 998000))
;;; Generated autoloads from ../mylisp/timestamp-insert.el

(autoload 'timestamp-insert "../mylisp/timestamp-insert" "\
timestamp insert from popup menu

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../mylisp/windmove-or-split" "../mylisp/windmove-or-split.el"
;;;;;;  (22026 35731 86049 998000))
;;; Generated autoloads from ../mylisp/windmove-or-split.el

(autoload 'windmove-or-splitmove "../mylisp/windmove-or-split" "\
Try window move. If not exist window then split it.
もし前回呼ばれた時間の差が`windmove-max-elapse-time'よりも短ければ
`windmove-wrap-around' をnil にする。
MVCMD set `windmove-right', `windmove-left', `windmove-up', `windmove-down'
NOSPLIT non-nil is no split.

\(fn MVCMD SPLITCMD &optional NOSPLIT)" nil nil)

(autoload 'windmove-down-or-splitmove "../mylisp/windmove-or-split" "\
Try window move down. If not exist window then split it vertically

\(fn &optional ARGS)" t nil)

(autoload 'windmove-up-or-splitmove "../mylisp/windmove-or-split" "\
Try window move up. If not exist window then split it vertically

\(fn &optional ARGS)" t nil)

(autoload 'windmove-left-or-splitmove "../mylisp/windmove-or-split" "\
Try window move left. If not exist window then split it horizontally

\(fn &optional ARGS)" t nil)

(autoload 'windmove-right-or-splitmove "../mylisp/windmove-or-split" "\
Try window move right. If not exist window then split it horizontally

\(fn &optional ARGS)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ahk-mode" "../plugin/ahk-mode.el"
;;;;;;  (22026 35731 86049 998000))
;;; Generated autoloads from ../plugin/ahk-mode.el

(add-to-list 'auto-mode-alist '("\\.ahk$" . ahk-mode))

(autoload 'ahk-mode "../plugin/ahk-mode" "\
Major mode for editing AutoHotKey Scripts.

The hook functions in `ahk-mode-hook' are run after mode initialization.

Key bindings:
\\{ahk-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/align-let" "../plugin/align-let.el"
;;;;;;  (22026 35731 87049 998000))
;;; Generated autoloads from ../plugin/align-let.el

(let ((loads (get 'align-let 'custom-loads))) (if (member '"../plugin/align-let" loads) nil (put 'align-let 'custom-loads (cons '"../plugin/align-let" loads))))

(put 'align-let-spaces 'safe-local-variable 'integerp)

(autoload 'align-let "../plugin/align-let" "\
Align the value expressions in a Lisp `let' or `setq' form.
Point should be within or immediately in front of the let form.
For example `align-let' changes

    (let ((x 1)
          (foo   2)
          (zz (blah)))
      ...)
to
    (let ((x   1)
          (foo 2)
          (zz  (blah)))
      ...)

Or

    (setq x 1
          foo 2)
to
    (setq x   1
          foo 2)

When point is somewhere in the middle of the form, possibly
nested in an expression, the beginning of a let is found by
looking for a double-paren pattern like

    (sym ... ((...

This means `align-let' works with various kinds of `let', `let*',
etc in various Lisp dialects.  But possible `setq' functions are
hard-coded, currently `setq', `setq-default' and `psetq'.

See `align-let-spaces' to have more than one space after the
longest variable.

----------------------------------------------------------------
Scheme `and-let*' is recognised too,

    (and-let* (...

Its \"(var value)\" forms can be bare symbols so may not start
with a \"((\" like above.  You can have `align-let' recognise
other such forms by setting an `align-let' property on the symbol
in Emacs,

    (put 'my-and-let* 'align-let 1)

The property value is the argument number of the bindings part.
So for example if you made

    (my-xandlet foo bar (abc
                         (def 123)
                         (ghi 456))
      ...

then the bindings are the 3rd argument and you set

    (put 'my-xandlet 'align-let 3)

----------------------------------------------------------------
The align-let.el home page is
URL `http://user42.tuxfamily.org/align-let/index.html'

\(fn)" t nil)

(autoload 'align-let-keybinding "../plugin/align-let" "\
Bind C-c C-a to `align-let' in the current mode keymap.
This is designed for use from the mode hook of any lisp-like
language, eg. `emacs-lisp-mode-hook' or `scheme-mode-hook'.

In the current implementation, if you `unload-feature' to remove
`align-let' the key bindings made here are not removed.  If you
use the `autoload' recommended in the align-let.el Install
\(manually or generated) then Emacs automatically re-loads on a
later `C-c C-a'.

\(fn)" nil nil)

(custom-add-option 'emacs-lisp-mode-hook 'align-let-keybinding)

(custom-add-option 'scheme-mode-hook 'align-let-keybinding)

(autoload 'align-let-region "../plugin/align-let" "\
`align-let' all forms between START and END.
Interactively, align forms in the region between point and mark.

If a `let' form starts within the region but extends beyond END
then all its binding forms are aligned, even those past END.

One possibility for this command would be to combine it with
`indent-sexp' or `indent-pp-sexp' (\\[indent-pp-sexp]), or some sort
of \"indent defun\", for a one-key cleanup.  There's nothing
offered for that yet but it should be easy to make a combination
command according to personal preference.  It doesn't matter
whether you indent or align-let first, because align-let only
cares about variable name widths, not any indenting, and
indenting doesn't care about how much space there is after
variables!  Remember to use markers for the operative region, as
indent and align-let will both insert or delete characters.

\(fn START END)" t nil)

;;;***

;;;### (autoloads nil "../plugin/anything" "../plugin/anything.el"
;;;;;;  (22026 35731 102049 997000))
;;; Generated autoloads from ../plugin/anything.el

(autoload 'anything "../plugin/anything" "\
Main function to execute anything sources.

Keywords supported:
:sources :input :prompt :resume :preselect :buffer :keymap :default :history
Extra keywords are supported and can be added, see below.

When call interactively with no arguments deprecated `anything-sources'
will be used if non--nil.

PLIST is a list like (:key1 val1 :key2 val2 ...) or
\(&optional sources input prompt resume preselect buffer keymap default history).

Basic keywords are the following:

:sources

Temporary value of `anything-sources'.  It also accepts a
symbol, interpreted as a variable of an anything source.  It
also accepts an alist representing an anything source, which is
detected by (assq 'name ANY-SOURCES)

:input

Temporary value of `anything-pattern', ie. initial input of minibuffer.

:prompt

Prompt other than \"pattern: \".

:resume

If t, Resurrect previously instance of `anything'.  Skip the initialization.
If 'noresume, this instance of `anything' cannot be resumed.

:preselect

Initially selected candidate.  Specified by exact candidate or a regexp.

:buffer

`anything-buffer' instead of *anything*.

:keymap

`anything-map' for current `anything' session.

:default

A default argument that will be inserted in minibuffer with \\<minibuffer-local-map>\\[next-history-element].
When nil of not present `thing-at-point' will be used instead.

:history

By default all minibuffer input is pushed to `minibuffer-history',
if an argument HISTORY is provided, input will be pushed to HISTORY.
History element should be a symbol.

Of course, conventional arguments are supported, the two are same.

\(anything :sources sources :input input :prompt prompt :resume resume
           :preselect preselect :buffer buffer :keymap keymap :default default
           :history history)
\(anything sources input prompt resume preselect buffer keymap default history)

Other keywords are interpreted as local variables of this anything session.
The `anything-' prefix can be omitted.  For example,

\(anything :sources 'anything-c-source-buffers
           :buffer \"*buffers*\" :candidate-number-limit 10)

means starting anything session with `anything-c-source-buffers'
source in *buffers* buffer and set variable `anything-candidate-number-limit'
to 10 as session local variable.

\(fn &rest PLIST)" t nil)

(autoload 'anything-at-point "../plugin/anything" "\
Call anything with symbol at point as initial input.
ANY-SOURCES ANY-INPUT ANY-PROMPT ANY-RESUME ANY-PRESELECT and ANY-BUFFER
are same args as in `anything'.

\(fn &optional ANY-SOURCES ANY-INPUT ANY-PROMPT ANY-RESUME ANY-PRESELECT ANY-BUFFER)" t nil)

(autoload 'anything-other-buffer "../plugin/anything" "\
Simplified interface of `anything' with other `anything-buffer'.
Call `anything' with only ANY-SOURCES and ANY-BUFFER as args.

\(fn ANY-SOURCES ANY-BUFFER)" nil nil)

;;;***

;;;### (autoloads nil "../plugin/anything-config" "../plugin/anything-config.el"
;;;;;;  (22026 35731 97049 998000))
;;; Generated autoloads from ../plugin/anything-config.el

(autoload 'anything-configuration "../plugin/anything-config" "\
Customize `anything'.

\(fn)" t nil)

(defvar anything-command-map)

(autoload 'anything-c-buffer-help "../plugin/anything-config" "\
Help command for anything buffers.

\(fn)" t nil)

(autoload 'anything-ff-help "../plugin/anything-config" "\
Help command for `anything-find-files'.

\(fn)" t nil)

(autoload 'anything-read-file-name-help "../plugin/anything-config" "\


\(fn)" t nil)

(autoload 'anything-generic-file-help "../plugin/anything-config" "\


\(fn)" t nil)

(autoload 'anything-grep-help "../plugin/anything-config" "\


\(fn)" t nil)

(autoload 'anything-pdfgrep-help "../plugin/anything-config" "\


\(fn)" t nil)

(autoload 'anything-etags-help "../plugin/anything-config" "\
The help function for etags.

\(fn)" t nil)

(autoload 'anything-test-sources "../plugin/anything-config" "\
List all anything sources for test.
The output is sexps which are evaluated by \\[eval-last-sexp].

\(fn)" t nil)

(autoload 'anything-insert-buffer-name "../plugin/anything-config" "\
Insert buffer name.

\(fn)" t nil)

(autoload 'anything-mark-all "../plugin/anything-config" "\
Mark all visible unmarked candidates in current source.

\(fn)" t nil)

(autoload 'anything-unmark-all "../plugin/anything-config" "\
Unmark all candidates in all sources of current anything session.

\(fn)" t nil)

(autoload 'anything-toggle-all-marks "../plugin/anything-config" "\
Toggle all marks.
Mark all visible candidates of current source or unmark all candidates
visible or invisible in all sources of current anything session

\(fn)" t nil)

(autoload 'anything-buffer-diff-persistent "../plugin/anything-config" "\
Toggle diff buffer without quitting anything.

\(fn)" t nil)

(autoload 'anything-buffer-revert-persistent "../plugin/anything-config" "\
Revert buffer without quitting anything.

\(fn)" t nil)

(autoload 'anything-buffer-save-persistent "../plugin/anything-config" "\
Save buffer without quitting anything.

\(fn)" t nil)

(autoload 'anything-buffer-run-kill-buffers "../plugin/anything-config" "\
Run kill buffer action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-grep "../plugin/anything-config" "\
Run Grep action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-zgrep "../plugin/anything-config" "\
Run Grep action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-query-replace-regexp "../plugin/anything-config" "\
Run Query replace regexp action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-query-replace "../plugin/anything-config" "\
Run Query replace action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-switch-other-window "../plugin/anything-config" "\
Run switch to other window action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-switch-other-frame "../plugin/anything-config" "\
Run switch to other frame action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-switch-to-elscreen "../plugin/anything-config" "\
Run switch to elscreen  action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-buffer-run-ediff "../plugin/anything-config" "\
Run ediff action from `anything-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'anything-ff-run-toggle-auto-update "../plugin/anything-config" "\


\(fn)" t nil)

(autoload 'anything-ff-run-switch-to-history "../plugin/anything-config" "\
Run Switch to history action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-grep "../plugin/anything-config" "\
Run Grep action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-pdfgrep "../plugin/anything-config" "\
Run Pdfgrep action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-zgrep "../plugin/anything-config" "\
Run Grep action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-copy-file "../plugin/anything-config" "\
Run Copy file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-rename-file "../plugin/anything-config" "\
Run Rename file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-byte-compile-file "../plugin/anything-config" "\
Run Byte compile file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-load-file "../plugin/anything-config" "\
Run Load file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-eshell-command-on-file "../plugin/anything-config" "\
Run eshell command on file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-ediff-file "../plugin/anything-config" "\
Run Ediff file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-ediff-merge-file "../plugin/anything-config" "\
Run Ediff merge file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-symlink-file "../plugin/anything-config" "\
Run Symlink file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-hardlink-file "../plugin/anything-config" "\
Run Hardlink file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-delete-file "../plugin/anything-config" "\
Run Delete file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-complete-fn-at-point "../plugin/anything-config" "\
Run complete file name action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-switch-to-eshell "../plugin/anything-config" "\
Run switch to eshell action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-switch-other-window "../plugin/anything-config" "\
Run switch to other window action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-switch-other-frame "../plugin/anything-config" "\
Run switch to other frame action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-open-file-externally "../plugin/anything-config" "\
Run open file externally command action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-locate "../plugin/anything-config" "\
Run locate action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-gnus-attach-files "../plugin/anything-config" "\
Run gnus attach files command action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-etags "../plugin/anything-config" "\
Run Etags command action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-run-print-file "../plugin/anything-config" "\
Run Print file action from `anything-c-source-find-files'.

\(fn)" t nil)

(autoload 'anything-ff-properties-persistent "../plugin/anything-config" "\
Show properties without quitting anything.

\(fn)" t nil)

(autoload 'anything-ff-persistent-delete "../plugin/anything-config" "\
Delete current candidate without quitting.

\(fn)" t nil)

(autoload 'anything-ff-run-kill-buffer-persistent "../plugin/anything-config" "\
Execute `anything-ff-kill-buffer-fname' whitout quitting.

\(fn)" t nil)

(defvar anything-dired-mode "Enable anything completion in Dired functions.\nBindings affected are C, R, S, H.\nThis is deprecated for Emacs24+ users, use `ac-mode' instead." "\
Non-nil if Anything-Dired mode is enabled.
See the command `anything-dired-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `anything-dired-mode'.")

(custom-autoload 'anything-dired-mode "../plugin/anything-config" nil)

(autoload 'anything-dired-mode "../plugin/anything-config" "\
Toggle Anything-Dired mode on or off.
With a prefix argument ARG, enable Anything-Dired mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{anything-dired-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'anything-c-goto-precedent-file "../plugin/anything-config" "\
Go to precedent file in anything grep/etags buffers.

\(fn)" t nil)

(autoload 'anything-c-goto-next-file "../plugin/anything-config" "\
Go to precedent file in anything grep/etags buffers.

\(fn)" t nil)

(autoload 'anything-c-grep-run-persistent-action "../plugin/anything-config" "\
Run grep persistent action from `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-c-grep-run-default-action "../plugin/anything-config" "\
Run grep default action from `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-c-grep-run-other-window-action "../plugin/anything-config" "\
Run grep goto other window action from `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-c-grep-run-save-buffer "../plugin/anything-config" "\
Run grep save results action from `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-yank-text-at-point "../plugin/anything-config" "\
Yank text at point in minibuffer.

\(fn)" t nil)

(autoload 'anything-c-bookmark-run-jump-other-window "../plugin/anything-config" "\
Jump to bookmark from keyboard.

\(fn)" t nil)

(autoload 'anything-c-bookmark-run-delete "../plugin/anything-config" "\
Delete bookmark from keyboard.

\(fn)" t nil)

(autoload 'anything-c-bmkext-run-edit "../plugin/anything-config" "\
Run `bmkext-edit-bookmark' from keyboard.

\(fn)" t nil)

(autoload 'anything-yaoddmuse-cache-pages "../plugin/anything-config" "\
Fetch the list of files on emacswiki and create cache file.
If load is non--nil load the file and feed `yaoddmuse-pages-hash'.

\(fn &optional LOAD)" t nil)

(defvar anything-completion-mode nil "\
Non-nil if Anything-Completion mode is enabled.
See the command `anything-completion-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `anything-completion-mode'.")

(custom-autoload 'anything-completion-mode "../plugin/anything-config" nil)

(autoload 'anything-completion-mode "../plugin/anything-config" "\
Toggle generic anything completion.

All functions in Emacs that use `completing-read'
or `read-file-name' and friends will use anything interface
when this mode is turned on.
However you can modify this behavior for functions of your choice
with `anything-completing-read-handlers-alist'.

Called with a positive arg, turn on unconditionally, with a
negative arg turn off.
You can turn it on with `ac-mode'.

Some crap emacs functions may not be supported,
e.g `ffap-alternate-file' and maybe others
You can add such functions to `anything-completing-read-handlers-alist'
with a nil value.

Note: This mode will work only partially on Emacs23.

\(fn &optional ARG)" t nil)

(autoload 'anything-lisp-completion-at-point "../plugin/anything-config" "\
Anything lisp symbol completion at point.

\(fn)" t nil)

(autoload 'anything-c-complete-file-name-at-point "../plugin/anything-config" "\
Complete file name at point.

\(fn)" t nil)

(autoload 'anything-lisp-completion-at-point-or-indent "../plugin/anything-config" "\
First call indent and second call complete lisp symbol.
The second call should happen before `anything-lisp-completion-or-indent-delay',
after this delay, next call will indent again.
After completion, next call is always indent.
See that like click and double mouse click.
One hit indent, two quick hits maybe indent and complete.

\(fn ARG)" t nil)

(autoload 'anything-lisp-completion-or-file-name-at-point "../plugin/anything-config" "\
Complete lisp symbol or filename at point.
Filename completion happen if filename is started in
or between double quotes.

\(fn)" t nil)

(autoload 'anything-w32-shell-execute-open-file "../plugin/anything-config" "\


\(fn FILE)" t nil)

(autoload 'anything-c-call-interactively "../plugin/anything-config" "\
Execute CMD-OR-NAME as Emacs command.
It is added to `extended-command-history'.
`anything-current-prefix-arg' is used as the command's prefix argument.

\(fn CMD-OR-NAME)" nil nil)

(autoload 'anything-c-set-variable "../plugin/anything-config" "\
Set value to VAR interactively.

\(fn VAR)" t nil)

(autoload 'anything-c-reset-adaptative-history "../plugin/anything-config" "\
Delete all `anything-c-adaptive-history' and his file.
Useful when you have a old or corrupted `anything-c-adaptive-history-file'.

\(fn)" t nil)

(autoload 'anything-mini "../plugin/anything-config" "\
Preconfigured `anything' lightweight version (buffer -> recentf).

\(fn)" t nil)

(autoload 'anything-for-files "../plugin/anything-config" "\
Preconfigured `anything' for opening files.
ffap -> recentf -> buffer -> bookmark -> file-cache -> files-in-current-dir -> locate.

\(fn)" t nil)

(autoload 'anything-recentf "../plugin/anything-config" "\
Preconfigured `anything' for `recentf'.

\(fn)" t nil)

(autoload 'anything-info-at-point "../plugin/anything-config" "\
Preconfigured `anything' for searching info at point.
With a prefix-arg insert symbol at point.

\(fn ARG)" t nil)

(autoload 'anything-show-kill-ring "../plugin/anything-config" "\
Preconfigured `anything' for `kill-ring'.
It is drop-in replacement of `yank-pop'.
You may bind this command to M-y.
First call open the kill-ring browser, next calls move to next line.

\(fn)" t nil)

(autoload 'anything-minibuffer-history "../plugin/anything-config" "\
Preconfigured `anything' for `minibuffer-history'.

\(fn)" t nil)

(autoload 'anything-gentoo "../plugin/anything-config" "\
Preconfigured `anything' for gentoo linux.

\(fn)" t nil)

(autoload 'anything-imenu "../plugin/anything-config" "\
Preconfigured `anything' for `imenu'.

\(fn)" t nil)

(autoload 'anything-google-suggest "../plugin/anything-config" "\
Preconfigured `anything' for google search with google suggest.

\(fn)" t nil)

(autoload 'anything-yahoo-suggest "../plugin/anything-config" "\
Preconfigured `anything' for Yahoo searching with Yahoo suggest.

\(fn)" t nil)

(autoload 'anything-for-buffers "../plugin/anything-config" "\
Preconfigured `anything' for buffers.

\(fn)" t nil)

(autoload 'anything-buffers-list "../plugin/anything-config" "\
Preconfigured `anything' to list buffers.
It is an enhanced version of `anything-for-buffers'.

\(fn)" t nil)

(autoload 'anything-bbdb "../plugin/anything-config" "\
Preconfigured `anything' for BBDB.

Needs BBDB.

http://bbdb.sourceforge.net/

\(fn)" t nil)

(autoload 'anything-locate "../plugin/anything-config" "\
Preconfigured `anything' for Locate.
Note: you can add locate options after entering pattern.
See 'man locate' for valid options.

You can specify a specific database with prefix argument ARG (C-u).
Many databases can be used: navigate and mark them.
See also `anything-locate-with-db'.

To create a user specific db, use
\"updatedb -l 0 -o db_path -U directory\".
Where db_path is a filename matched by
`anything-locate-db-file-regexp'.

\(fn ARG)" t nil)

(autoload 'anything-w3m-bookmarks "../plugin/anything-config" "\
Preconfigured `anything' for w3m bookmark.

Needs w3m and emacs-w3m.

http://w3m.sourceforge.net/
http://emacs-w3m.namazu.org/

\(fn)" t nil)

(autoload 'anything-firefox-bookmarks "../plugin/anything-config" "\
Preconfigured `anything' for firefox bookmark.
You will have to enable html bookmarks in firefox:
open about:config in firefox and double click on this line to enable value to true:

user_pref(\"browser.bookmarks.autoExportHTML\", false);

You should have now:

user_pref(\"browser.bookmarks.autoExportHTML\", true);

After closing firefox, you will be able to browse you bookmarks.

\(fn)" t nil)

(autoload 'anything-colors "../plugin/anything-config" "\
Preconfigured `anything' for color.

\(fn)" t nil)

(autoload 'anything-bookmarks "../plugin/anything-config" "\
Preconfigured `anything' for bookmarks.

\(fn)" t nil)

(autoload 'anything-c-pp-bookmarks "../plugin/anything-config" "\
Preconfigured `anything' for bookmarks (pretty-printed).

\(fn)" t nil)

(autoload 'anything-c-insert-latex-math "../plugin/anything-config" "\
Preconfigured anything for latex math symbols completion.

\(fn)" t nil)

(autoload 'anything-register "../plugin/anything-config" "\
Preconfigured `anything' for Emacs registers.

\(fn)" t nil)

(autoload 'anything-man-woman "../plugin/anything-config" "\
Preconfigured `anything' for Man and Woman pages.

\(fn)" t nil)

(autoload 'anything-org-keywords "../plugin/anything-config" "\
Preconfigured `anything' for org keywords.

\(fn)" t nil)

(autoload 'anything-emms "../plugin/anything-config" "\
Preconfigured `anything' for emms sources.

\(fn)" t nil)

(autoload 'anything-eev-anchors "../plugin/anything-config" "\
Preconfigured `anything' for eev anchors.

\(fn)" t nil)

(autoload 'anything-bm-list "../plugin/anything-config" "\
Preconfigured `anything' for visible bookmarks.

Needs bm.el

http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el

\(fn)" t nil)

(autoload 'anything-timers "../plugin/anything-config" "\
Preconfigured `anything' for timers.

\(fn)" t nil)

(autoload 'anything-list-emacs-process "../plugin/anything-config" "\
Preconfigured `anything' for emacs process.

\(fn)" t nil)

(autoload 'anything-occur "../plugin/anything-config" "\
Preconfigured Anything for Occur source.
If region is active, search only in region,
otherwise search in whole buffer.

\(fn)" t nil)

(autoload 'anything-browse-code "../plugin/anything-config" "\
Preconfigured anything to browse code.

\(fn)" t nil)

(autoload 'anything-org-headlines "../plugin/anything-config" "\
Preconfigured anything to show org headlines.

\(fn)" t nil)

(autoload 'anything-regexp "../plugin/anything-config" "\
Preconfigured anything to build regexps.
`query-replace-regexp' can be run from there against found regexp.

\(fn)" t nil)

(autoload 'anything-c-copy-files-async "../plugin/anything-config" "\
Preconfigured anything to copy file list FLIST to DEST asynchronously.

\(fn)" t nil)

(autoload 'anything-find-files "../plugin/anything-config" "\
Preconfigured `anything' for anything implementation of `find-file'.
Called with a prefix arg show history if some.
Don't call it from programs, use `anything-find-files-1' instead.
This is the starting point for nearly all actions you can do on files.

\(fn ARG)" t nil)

(autoload 'anything-write-file "../plugin/anything-config" "\
Preconfigured `anything' providing completion for `write-file'.

\(fn)" t nil)

(autoload 'anything-insert-file "../plugin/anything-config" "\
Preconfigured `anything' providing completion for `insert-file'.

\(fn)" t nil)

(autoload 'anything-dired-rename-file "../plugin/anything-config" "\
Preconfigured `anything' to rename files from dired.

\(fn)" t nil)

(autoload 'anything-dired-copy-file "../plugin/anything-config" "\
Preconfigured `anything' to copy files from dired.

\(fn)" t nil)

(autoload 'anything-dired-symlink-file "../plugin/anything-config" "\
Preconfigured `anything' to symlink files from dired.

\(fn)" t nil)

(autoload 'anything-dired-hardlink-file "../plugin/anything-config" "\
Preconfigured `anything' to hardlink files from dired.

\(fn)" t nil)

(autoload 'anything-do-grep "../plugin/anything-config" "\
Preconfigured anything for grep.
Contrarily to Emacs `grep' no default directory is given, but
the full path of candidates in ONLY.
That allow to grep different files not only in `default-directory' but anywhere
by marking them (C-<SPACE>). If one or more directory is selected
grep will search in all files of these directories.
You can use also wildcard in the base name of candidate.
If a prefix arg is given use the -r option of grep.
The prefix arg can be passed before or after start.
See also `anything-do-grep-1'.

\(fn)" t nil)

(autoload 'anything-do-zgrep "../plugin/anything-config" "\
Preconfigured anything for zgrep.

\(fn)" t nil)

(autoload 'anything-do-pdfgrep "../plugin/anything-config" "\
Preconfigured anything for pdfgrep.

\(fn)" t nil)

(autoload 'anything-c-etags-select "../plugin/anything-config" "\
Preconfigured anything for etags.
Called with one prefix arg use symbol at point as initial input.
Called with two prefix arg reinitialize cache.
If tag file have been modified reinitialize cache.

\(fn ARG)" t nil)

(autoload 'anything-filelist "../plugin/anything-config" "\
Preconfigured `anything' to open files instantly.

See `anything-c-filelist-file-name' docstring for usage.

\(fn)" t nil)

(autoload 'anything-filelist+ "../plugin/anything-config" "\
Preconfigured `anything' to open files/buffers/bookmarks instantly.

This is a replacement for `anything-for-files'.
See `anything-c-filelist-file-name' docstring for usage.

\(fn)" t nil)

(autoload 'anything-M-x "../plugin/anything-config" "\
Preconfigured `anything' for Emacs commands.
It is `anything' replacement of regular `M-x' `execute-extended-command'.

\(fn)" t nil)

(autoload 'anything-manage-advice "../plugin/anything-config" "\
Preconfigured `anything' to disable/enable function advices.

\(fn)" t nil)

(autoload 'anything-bookmark-ext "../plugin/anything-config" "\
Preconfigured `anything' for bookmark-extensions sources.
Needs bookmark-ext.el:
<http://mercurial.intuxication.org/hg/emacs-bookmark-extension>.
Contain also `anything-c-source-google-suggest'.

\(fn)" t nil)

(autoload 'anything-simple-call-tree "../plugin/anything-config" "\
Preconfigured `anything' for simple-call-tree. List function relationships.

Needs simple-call-tree.el.
http://www.emacswiki.org/cgi-bin/wiki/download/simple-call-tree.el

\(fn)" t nil)

(autoload 'anything-mark-ring "../plugin/anything-config" "\
Preconfigured `anything' for `anything-c-source-mark-ring'.

\(fn)" t nil)

(autoload 'anything-global-mark-ring "../plugin/anything-config" "\
Preconfigured `anything' for `anything-c-source-global-mark-ring'.

\(fn)" t nil)

(autoload 'anything-all-mark-rings "../plugin/anything-config" "\
Preconfigured `anything' for `anything-c-source-global-mark-ring' and `anything-c-source-mark-ring'.

\(fn)" t nil)

(autoload 'anything-yaoddmuse-emacswiki-edit-or-view "../plugin/anything-config" "\
Preconfigured `anything' to edit or view EmacsWiki page.

Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el

\(fn)" t nil)

(autoload 'anything-yaoddmuse-emacswiki-post-library "../plugin/anything-config" "\
Preconfigured `anything' to post library to EmacsWiki.

Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el

\(fn)" t nil)

(autoload 'anything-eval-expression "../plugin/anything-config" "\
Preconfigured anything for `anything-c-source-evaluation-result'.

\(fn ARG)" t nil)

(autoload 'anything-eval-expression-with-eldoc "../plugin/anything-config" "\
Preconfigured anything for `anything-c-source-evaluation-result' with `eldoc' support. 

\(fn)" t nil)

(autoload 'anything-calcul-expression "../plugin/anything-config" "\
Preconfigured anything for `anything-c-source-calculation-result'.

\(fn)" t nil)

(autoload 'anything-surfraw "../plugin/anything-config" "\
Preconfigured `anything' to search PATTERN with search ENGINE.

\(fn PATTERN ENGINE)" t nil)

(autoload 'anything-call-source "../plugin/anything-config" "\
Preconfigured `anything' to call anything source.

\(fn)" t nil)

(autoload 'anything-execute-anything-command "../plugin/anything-config" "\
Preconfigured `anything' to execute preconfigured `anything'.

\(fn)" t nil)

(autoload 'anything-create "../plugin/anything-config" "\
Preconfigured `anything' to do many create actions from STRING.
See also `anything-create--actions'.

\(fn &optional STRING INITIAL-INPUT)" t nil)

(autoload 'anything-top "../plugin/anything-config" "\
Preconfigured `anything' for top command.

\(fn)" t nil)

(autoload 'anything-select-xfont "../plugin/anything-config" "\
Preconfigured `anything' to select Xfont.

\(fn)" t nil)

(autoload 'anything-world-time "../plugin/anything-config" "\
Preconfigured `anything' to show world time.

\(fn)" t nil)

(autoload 'anything-apt "../plugin/anything-config" "\
Preconfigured `anything' : frontend of APT package manager.
With a prefix arg reload cache.

\(fn ARG)" t nil)

(autoload 'anything-esh-pcomplete "../plugin/anything-config" "\
Preconfigured anything to provide anything completion in eshell.

\(fn)" t nil)

(autoload 'anything-eshell-history "../plugin/anything-config" "\
Preconfigured anything for eshell history.

\(fn)" t nil)

(autoload 'anything-c-run-external-command "../plugin/anything-config" "\
Preconfigured `anything' to run External PROGRAM asyncronously from Emacs.
If program is already running exit with error.
You can set your own list of commands with
`anything-c-external-commands-list'.

\(fn PROGRAM)" t nil)

(autoload 'anything-ratpoison-commands "../plugin/anything-config" "\
Preconfigured `anything' to execute ratpoison commands.

\(fn)" t nil)

(autoload 'anything-ucs "../plugin/anything-config" "\
Preconfigured anything for `ucs-names' math symbols.

\(fn)" t nil)

(autoload 'anything-c-apropos "../plugin/anything-config" "\
Preconfigured anything to describe commands, functions, variables and faces.

\(fn)" t nil)

(autoload 'anything-xrandr-set "../plugin/anything-config" "\


\(fn)" t nil)

(autoload 'anything-ctags-current-file "../plugin/anything-config" "\
Preconfigured `anything' to list function/variable definitions.

Needs Exuberant Ctags.

http://ctags.sourceforge.net/

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/anything-match-plugin" "../plugin/anything-match-plugin.el"
;;;;;;  (22026 35731 99049 998000))
;;; Generated autoloads from ../plugin/anything-match-plugin.el

(autoload 'anything-mp-toggle-match-plugin "../plugin/anything-match-plugin" "\
Turn on/off multiple regexp matching in anything.
i.e anything-match-plugin.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ascii" "../plugin/ascii.el" (22026
;;;;;;  35731 105049 997000))
;;; Generated autoloads from ../plugin/ascii.el

(autoload 'ascii-customize "../plugin/ascii" "\
Customize ASCII options.

\(fn)" t nil)

(autoload 'ascii-display "../plugin/ascii" "\
Toggle ASCII code display.

If ARG is null, toggle ASCII code display.
If ARG is a number and is greater than zero, turn on display; otherwise, turn
off display.
If ARG is anything else, turn on display.

\(fn &optional ARG)" t nil)

(autoload 'ascii-on "../plugin/ascii" "\
Turn on ASCII code display.

\(fn)" t nil)

(autoload 'ascii-off "../plugin/ascii" "\
Turn off ASCII code display.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/auto-chmod-x" "../plugin/auto-chmod-x.el"
;;;;;;  (22026 35731 105049 997000))
;;; Generated autoloads from ../plugin/auto-chmod-x.el

(autoload 'make-file-executable "../plugin/auto-chmod-x" "\
Make the file of this buffer executable, when it is a script source.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "../plugin/auto-highlight-symbol" "../plugin/auto-highlight-symbol.el"
;;;;;;  (22026 35731 106049 997000))
;;; Generated autoloads from ../plugin/auto-highlight-symbol.el

(defvar global-auto-highlight-symbol-mode nil "\
Non-nil if Global-Auto-Highlight-Symbol mode is enabled.
See the command `global-auto-highlight-symbol-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-highlight-symbol-mode'.")

(custom-autoload 'global-auto-highlight-symbol-mode "../plugin/auto-highlight-symbol" nil)

(autoload 'global-auto-highlight-symbol-mode "../plugin/auto-highlight-symbol" "\
Toggle Auto-Highlight-Symbol mode in all buffers.
With prefix ARG, enable Global-Auto-Highlight-Symbol mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Highlight-Symbol mode is enabled in all buffers where
`ahs-mode-maybe' would do it.
See `auto-highlight-symbol-mode' for more information on Auto-Highlight-Symbol mode.

\(fn &optional ARG)" t nil)

(autoload 'auto-highlight-symbol-mode "../plugin/auto-highlight-symbol" "\
Toggle Auto Highlight Symbol Mode

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/autotest-mode" "../plugin/autotest-mode.el"
;;;;;;  (22026 35731 108049 997000))
;;; Generated autoloads from ../plugin/autotest-mode.el

(autoload 'autotest-mode "../plugin/autotest-mode" "\
A major-mode to edit Autotest files like testsuite.at.
\\{autotest-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/bm" "../plugin/bm.el" (22026 35731
;;;;;;  109049 997000))
;;; Generated autoloads from ../plugin/bm.el

(autoload 'bm-toggle "../plugin/bm" "\
Toggle bookmark in current buffer.

\(fn)" t nil)

(autoload 'bm-next "../plugin/bm" "\
Goto bookmark.

\(fn)" t nil)

(autoload 'bm-previous "../plugin/bm" "\
Goto previous bookmark.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/c-includes" "../plugin/c-includes.el"
;;;;;;  (22026 35731 109049 997000))
;;; Generated autoloads from ../plugin/c-includes.el

(autoload 'c-includes-add-binding "../plugin/c-includes" "\
Set binding for C-c C-i in cc-mode.

\(fn)" nil nil)

(autoload 'c-includes-current-file "../plugin/c-includes" "\
Find all of the header file included by the current file.

\(fn &optional REGEXP)" t nil)

(autoload 'c-includes "../plugin/c-includes" "\
Find all of the header files included by FILENAME.
REGEXP, if non-nil, is a regular expression to search for within
FILENAME and the files that it includes.  The output will be
structured in the same order that the compiler will see it, enabling
you determine order of occurrence.

\(fn FILENAME &optional REGEXP)" t nil)

;;;***

;;;### (autoloads nil "../plugin/col-highlight" "../plugin/col-highlight.el"
;;;;;;  (22026 35731 110049 997000))
;;; Generated autoloads from ../plugin/col-highlight.el

(let ((loads (get 'column-highlight 'custom-loads))) (if (member '"../plugin/col-highlight" loads) nil (put 'column-highlight 'custom-loads (cons '"../plugin/col-highlight" loads))))

(defvar col-highlight-show-only nil "\
Non-nil means `column-highlight-mode' affects only a section of text.
This affects `vline-mode' also.

The non-nil value determines the type of text section: paragraph,
sentence, defun, page...

The actual non-nil value is a forward movement command for the given
section type, e.g., `forward-paragraph', `end-of-defun'.")

(custom-autoload 'col-highlight-show-only "../plugin/col-highlight" t)

(defvar col-highlight-vline-face-flag t "\
*Non-nil means `column-highlight-mode' uses `col-highlight-face'.
nil means that it uses `vline-face'.")

(custom-autoload 'col-highlight-vline-face-flag "../plugin/col-highlight" t)

(defvar col-highlight-period 1 "\
*Number of seconds to highlight the current column.")

(custom-autoload 'col-highlight-period "../plugin/col-highlight" t)

(defvar col-highlight-overlay-priority 300 "\
*Priority to use for overlays in `vline-overlay-table'.
A higher priority can make the vline highlighting appear on top of
other overlays that might exist.")

(custom-autoload 'col-highlight-overlay-priority "../plugin/col-highlight" t)

(defface col-highlight '((t (:background "SlateGray3"))) "\
*Face for current-column highlighting by `column-highlight-mode'.
Not used if `col-highlight-vline-face-flag' is nil." :group (quote column-highlight) :group (quote faces))

(defvar column-highlight-mode nil "\
Non-nil if Column-Highlight mode is enabled.
See the command `column-highlight-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `column-highlight-mode'.")

(custom-autoload 'column-highlight-mode "../plugin/col-highlight" nil)

(autoload 'column-highlight-mode "../plugin/col-highlight" "\
Toggle highlighting the current column.
With ARG, turn column highlighting on if and only if ARG is positive.

Column-Highlight mode uses the functions
`col-highlight-unhighlight' and `col-highlight-highlight'
on `pre-command-hook' and `post-command-hook'.

\(fn &optional ARG)" t nil)

(defalias 'toggle-highlight-column-when-idle 'col-highlight-toggle-when-idle)

(autoload 'col-highlight-toggle-when-idle "../plugin/col-highlight" "\
Turn on or off highlighting the current column when Emacs is idle.
With prefix argument, turn on if ARG > 0; else turn off.

\(fn &optional ARG)" t nil)

(autoload 'col-highlight-set-interval "../plugin/col-highlight" "\
Set the delay before highlighting current column when Emacs is idle.
Whenever Emacs has been idle for N seconds, the current column is
highlighted using the face that is the value of variable
`col-highlight-face'.

To turn on or off automatically highlighting the current column
when Emacs is idle, use `\\[toggle-highlight-column-when-idle].

\(fn N)" t nil)

(defalias 'flash-column-highlight 'col-highlight-flash)

(autoload 'col-highlight-flash "../plugin/col-highlight" "\
Highlight the current column for `col-highlight-period' seconds.
With a prefix ARG, highlight for that many seconds.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/color-theme-6.6.0/color-theme" "../plugin/color-theme-6.6.0/color-theme.el"
;;;;;;  (22026 35731 127049 997000))
;;; Generated autoloads from ../plugin/color-theme-6.6.0/color-theme.el

(autoload 'color-theme-select "../plugin/color-theme-6.6.0/color-theme" "\
Displays a special buffer for selecting and installing a color theme.
With optional prefix ARG, this buffer will include color theme libraries
as well.  A color theme library is in itself not complete, it must be
used as part of another color theme to be useful.  Thus, color theme
libraries are mainly useful for color theme authors.

\(fn &optional ARG)" t nil)

(autoload 'color-theme-describe "../plugin/color-theme-6.6.0/color-theme" "\
Describe color theme listed at point.
This shows the documentation of the value of text-property color-theme
at point.  The text-property color-theme should be a color theme
function.  See `color-themes'.

\(fn)" t nil)

(autoload 'color-theme-install-at-mouse "../plugin/color-theme-6.6.0/color-theme" "\
Install color theme clicked upon using the mouse.
First argument EVENT is used to set point.  Then
`color-theme-install-at-point' is called.

\(fn EVENT)" t nil)

(autoload 'color-theme-install-at-point-for-current-frame "../plugin/color-theme-6.6.0/color-theme" "\
Install color theme at point for current frame only.
Binds `color-theme-is-global' to nil and calls
`color-theme-install-at-point'.

\(fn)" t nil)

(autoload 'color-theme-print "../plugin/color-theme-6.6.0/color-theme" "\
Print the current color theme function.

You can contribute this function to <URL:news:gnu.emacs.sources> or
paste it into your .emacs file and call it.  That should recreate all
the settings necessary for your color theme.

Example:

    (require 'color-theme)
    (defun my-color-theme ()
      \"Color theme by Alex Schroeder, created 2000-05-17.\"
      (interactive)
      (color-theme-install
       '(...
	 ...
	 ...)))
    (my-color-theme)

If you want to use a specific color theme function, you can call the
color theme function in your .emacs directly.

Example:

    (require 'color-theme)
    (color-theme-gnome2)

\(fn &optional BUF)" t nil)

(autoload 'color-theme-analyze-defun "../plugin/color-theme-6.6.0/color-theme" "\
Once you have a color-theme printed, check for missing faces.
This is used by maintainers who receive a color-theme submission
and want to make sure it follows the guidelines by the color-theme
author.

\(fn)" t nil)

(autoload 'color-theme-make-snapshot "../plugin/color-theme-6.6.0/color-theme" "\
Return the definition of the current color-theme.
The function returned will recreate the color-theme in use at the moment.

\(fn)" nil nil)

(autoload 'color-theme-compare "../plugin/color-theme-6.6.0/color-theme" "\
Compare two color themes.
This will print the differences between installing THEME-A and
installing THEME-B.  Note that the order is important: If a face is
defined in THEME-A and not in THEME-B, then this will not show up as a
difference, because there is no reset before installing THEME-B.  If a
face is defined in THEME-B and not in THEME-A, then this will show up as
a difference.

\(fn THEME-A THEME-B)" t nil)

(autoload 'color-theme-install "../plugin/color-theme-6.6.0/color-theme" "\
Install a color theme defined by frame parameters, variables and faces.

The theme is installed for all present and future frames; any missing
faces are created.  See `color-theme-install-faces'.

THEME is a color theme definition.  See below for more information.

If you want to install a color theme from your .emacs, use the output
generated by `color-theme-print'.  This produces color theme function
which you can copy to your .emacs.

A color theme definition is a list:
\([FUNCTION] FRAME-PARAMETERS VARIABLE-SETTINGS FACE-DEFINITIONS)

FUNCTION is the color theme function which called `color-theme-install'.
This is no longer used.  There was a time when this package supported
automatic factoring of color themes.  This has been abandoned.

FRAME-PARAMETERS is an alist of frame parameters.  These are installed
with `color-theme-install-frame-params'.  These are installed last such
that any changes to the default face can be changed by the frame
parameters.

VARIABLE-DEFINITIONS is an alist of variable settings.  These are
installed with `color-theme-install-variables'.

FACE-DEFINITIONS is an alist of face definitions.  These are installed
with `color-theme-install-faces'.

If `color-theme-is-cumulative' is nil, a color theme will undo face and
frame-parameter settings of previous color themes.

\(fn THEME)" nil nil)

(autoload 'color-theme-submit "../plugin/color-theme-6.6.0/color-theme" "\
Submit your color-theme to the maintainer.

\(fn)" t nil)

(autoload 'color-theme-initialize "../plugin/color-theme-6.6.0/color-theme" "\
Initialize the color theme package by loading color-theme-libraries.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/color-theme-6.6.0/color-theme-other"
;;;;;;  "../plugin/color-theme-6.6.0/color-theme-other.el" (22026
;;;;;;  35731 125049 997000))
;;; Generated autoloads from ../plugin/color-theme-6.6.0/color-theme-other.el

(autoload 'color-theme-black "../plugin/color-theme-6.6.0/color-theme-other" "\
Black background.
Doesn't mess with most faces, but does turn on dark background mode.

\(fn)" t nil)

(autoload 'color-theme-black-calm-forest "../plugin/color-theme-6.6.0/color-theme-other" "\
Color theme by Artur Hefczyc, created 2003-04-18.

\(fn)" t nil)

(autoload 'color-theme-black-hober "../plugin/color-theme-6.6.0/color-theme-other" "\
Does all sorts of crazy stuff.
Originally based on color-theme-standard, so I probably still have some
setting that I haven't changed. I also liberally copied settings from
the other themes in this package. The end result isn't much like the
other ones; I hope you like it.

\(fn &optional PREVIEW)" t nil)

(autoload 'color-theme-white-katester "../plugin/color-theme-6.6.0/color-theme-other" "\
Color theme by walterh@rocketmail.com, created 2001-12-12.
A pastelly-mac like color-theme.

\(fn)" t nil)

(autoload 'color-theme-black-lawrence-hackers-like "../plugin/color-theme-6.6.0/color-theme-other" "\
Color theme by lawrence mitchell <wence@gmx.li>.
Mainly shades of green.
Contains faces for erc, gnus, most of jde.

\(fn)" t nil)

(autoload 'color-theme-black-matrix-hackers-like "../plugin/color-theme-6.6.0/color-theme-other" "\
Color theme by walterh@rocketmail.com, created 2003-10-16.

\(fn)" t nil)

(autoload 'color-theme-black-lethe "../plugin/color-theme-6.6.0/color-theme-other" "\
Color theme by Ivica Loncar, created 2002-08-02.
Some additional X resources as suggested by the author:

Emacs*menubar.Foreground:		Yellow
Emacs*menubar.Background:		#1a2b3c
Emacs*menubar.topShadowColor:		gray
Emacs*menubar.bottomShadowColor:	dimgray

Some fonts I really like (note: this fonts are not highly
available):

Emacs.default.attributeFont: -letl-*-medium-r-*-*-*-*-*-*-*-*-iso8859-2
Emacs*menubar*Font:  -etl-fixed-medium-r-normal--14-*-*-*-*-*-iso8859-1

Mouse fix:

Emacs*dialog*XmPushButton.translations:#override
	  <Btn1Down>:         Arm()
 <Btn1Down>,<Btn1Up>: Activate()			 Disarm()
      <Btn1Down>(2+):     MultiArm()
	<Btn1Up>(2+):       MultiActivate()
	    <Btn1Up>:           Activate()			 Disarm()
      <Key>osfSelect:    ArmAndActivate()
    <Key>osfActivate:   ArmAndActivate()
	<Key>osfHelp:    Help()
 ~Shift ~Meta ~Alt <Key>Return:  ArmAndActivate()
       <EnterWindow>:      Enter()
       <LeaveWindow>:      Leave()


Bonus: do not use 3D modeline.

\(fn)" t nil)

(autoload 'color-theme-black-ld-dark "../plugin/color-theme-6.6.0/color-theme-other" "\
Dark Color theme by Linh Dang, created 2001-11-06.

\(fn)" t nil)

(autoload 'color-theme-black-renegade "../plugin/color-theme-6.6.0/color-theme-other" "\
Renegade BBS styled color theme. Works well in X and terminals.
Created by Dave Benjamin <ramen@ramenfest.com> Dec 23 2005.

\(fn)" t nil)

(autoload 'color-theme-black-retro-green-hackers-like "../plugin/color-theme-6.6.0/color-theme-other" "\
Plain green on black faces for those longing for the good old days.

\(fn &optional COLOR FUNC)" t nil)

(autoload 'color-theme-white-sitaramv-nt "../plugin/color-theme-6.6.0/color-theme-other" "\
Black foreground on white background.
Includes faces for font-lock, widget, custom, speedbar.

\(fn)" t nil)

(autoload 'color-theme-white-standard "../plugin/color-theme-6.6.0/color-theme-other" "\
Emacs default colors.
If you are missing standard faces in this theme, please notify the maintainer.

\(fn)" t nil)

(autoload 'color-theme-white-emacs-21 "../plugin/color-theme-6.6.0/color-theme-other" "\
Color theme used by Emacs 21.1.
Added and adapted for XEmacs by Alex Schroeder.  Adaptation mostly
consisted of resolving :inherit attributes and adding missing faces.
This theme includes faces from the following Emacs libraries: add-log
calendar comint cus-edit cus-face custom diff-mode ediff-init re-builder
viper-init enriched em-ls em-prompt esh-test faces font-lock generic-x
gnus-art gnus-cite gnus message hilit-chg hi-lock info isearch log-view
paren pcvs-info antlr-mode cperl-mode ebrowse idlwave idlw-shell
make-mode sh-script vhdl-mode smerge-mode speedbar strokes artist
flyspell texinfo tex-mode tooltip vcursor wid-edit woman term man

\(fn)" t nil)

(autoload 'color-theme-white-emacs-nw "../plugin/color-theme-6.6.0/color-theme-other" "\
Follow emacs21's color-theme, with -nw getting 100% compatibility.

Alex's `color-theme-emacs-21' follows emacs21's theme, but in the
current scheme of things, that means that when it works on X, it won't
work in -nw perfectly.  The modeline and menuline will have same
colors as the rest of emacs, which can be particularly disturbing when
there are multiple windows.

OTOH, `color-theme-emacs-nw' follows emacs21's theme but the goal is
100% -nw compatibility, and in X; we shall try for decent color
scheme, and as much compability default emacs21's X as possble.
Bugs to deego@gnufans.org.

TODO: Try to make this theme relative to color-theme-emacs-21 rather
than absolute, viz: call that first and then tweak minor stuff.

\(fn)" t nil)

(autoload 'color-theme-white-subtle-hacker "../plugin/color-theme-6.6.0/color-theme-other" "\
Subtle Hacker Color Theme.
Based on gnome2, but uses white for important things like comments,
and less of the unreadable tomato.  By Colin Walters <levanti@verbum.org>

\(fn)" t nil)

(autoload 'color-theme-white-vim-colors "../plugin/color-theme-6.6.0/color-theme-other" "\
Color theme by Michael Soulier, created 2003-03-26.

\(fn)" t nil)

(autoload 'color-theme-gnome2 "../plugin/color-theme-6.6.0/color-theme-other" "\
Wheat on darkslategrey scheme.
`color-theme-gnome' started it all.

This theme supports standard faces, font-lock, eshell, info, message,
gnus, custom, widget, woman, diary, cperl, bbdb, and erc.  This theme
includes faces for Emacs and XEmacs.

The theme does not support w3 faces because w3 faces can be controlled
by your default style sheet.

This is what you should put in your .Xdefaults file, if you want to
change the colors of the menus in Emacs 20 as well:

emacs*Background:		DarkSlateGray
emacs*Foreground:		Wheat

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/color-theme-6.6.0/themes/color-theme-t1"
;;;;;;  "../plugin/color-theme-6.6.0/themes/color-theme-t1.el" (22026
;;;;;;  35731 127049 997000))
;;; Generated autoloads from ../plugin/color-theme-6.6.0/themes/color-theme-t1.el

(autoload 'color-theme-t1 "../plugin/color-theme-6.6.0/themes/color-theme-t1" "\
Color theme by t1

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/column-marker" "../plugin/column-marker.el"
;;;;;;  (22026 35731 127049 997000))
;;; Generated autoloads from ../plugin/column-marker.el

(autoload 'column-marker-1 "column-marker" "\
Highlight a column." t)

;;;***

;;;### (autoloads nil "../plugin/columnize" "../plugin/columnize.el"
;;;;;;  (22026 35731 128049 997000))
;;; Generated autoloads from ../plugin/columnize.el

(autoload 'columnize-strings "../plugin/columnize" "\
Trivial wrapper for `columnize-text' which see.
Uses `columnize-quoted-regexp' to recognize quoted strings as words even if
they contain embedded spaces.

\(fn BEGIN END &optional PILLAR-WIDTH)" t nil)

(autoload 'columnize-text "../plugin/columnize" "\
Turns a list of words in a region into an evenly spaced list.
For clarity I use pillar to describe a column of words since the word
column already has a meaning in emacs.

The region is defined by BEGIN and END.  If PILLAR-WIDTH is not specified then
the length of the longest word in the region + `columnize-spacing' is used.
The number of pillars is determined by how many will fit between the indent
column and `fill-column'.  The list is indented to BEGIN's `current-column'.
Words are defined as the sequence of characters matching `columnize-regexp'.

Interactively, point and mark determine the region, a prefix argument sets
PILLAR-WIDTH.  A value of 0 or 1 means use the default.  Negative values mean
calculate a width that yields that number of pillars.  For example -4 means
calculate a value for PILLAR-WIDTH that yields 4 pillars.

If PILLAR-WIDTH is specified but is less than or equal to the longest word,
words will overflow into adjacent pillars but cannot span more than
`columnize-span' pillars which see.

Example using a fill-column of 70 and letting pillar-width default.

     here is a list of various length words that I want columnized

     here        is          a           list        of
     various     length      words       that        I
     want        columnized

See also `columnize-strings'.

\(fn BEGIN END &optional PILLAR-WIDTH)" t nil)

;;;***

;;;### (autoloads nil "../plugin/crosshairs" "../plugin/crosshairs.el"
;;;;;;  (22026 35731 128049 997000))
;;; Generated autoloads from ../plugin/crosshairs.el

(let ((loads (get 'crosshairs 'custom-loads))) (if (member '"../plugin/crosshairs" loads) nil (put 'crosshairs 'custom-loads (cons '"../plugin/crosshairs" loads))))

(defvar crosshairs-mode nil "\
Non-nil if Crosshairs mode is enabled.
See the command `crosshairs-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `crosshairs-mode'.")

(custom-autoload 'crosshairs-mode "../plugin/crosshairs" nil)

(autoload 'crosshairs-mode "../plugin/crosshairs" "\
Toggle highlighting the current line and column.
With ARG, turn highlighting on if and only if ARG is positive.

\(fn &optional ARG)" t nil)

(defalias 'toggle-crosshairs-when-idle 'crosshairs-toggle-when-idle)

(autoload 'crosshairs-toggle-when-idle "../plugin/crosshairs" "\
Toggle highlighting the current line and column when Emacs is idle.
With prefix argument, turn on if ARG > 0; else turn off.
You can use commands `col-highlight-set-interval' and
`hl-line-when-idle-interval' to change the idle times.

\(fn &optional ARG)" t nil)

(defalias 'flash-crosshairs 'crosshairs-flash)

(autoload 'crosshairs-flash "../plugin/crosshairs" "\
Highlight the current line and column temporarily.
Highlight the line for `hl-line-flash-show-period' and the column for
`column-show-period' seconds.  With prefix argument SECONDS, highlight
both for SECONDS seconds.

\(fn &optional SECONDS)" t nil)

(autoload 'crosshairs "../plugin/crosshairs" "\
Highlight current position with crosshairs.
With no prefix arg, highlighting turns off at the next command.
With a prefix arg, highlighting stays on until you toggle it off using
`crosshairs-mode'.

\(fn &optional MODALP)" t nil)

(autoload 'crosshairs-highlight "../plugin/crosshairs" "\
Echo current position and highlight it with crosshairs.
If optional arg MODE is `line-only', then highlight only the line.
If optional arg MODE is `col-only', then highlight only the column.
 Interactively:
  A non-negative prefix argument uses MODE `line-only'.
  A negative prefix argument uses MODE `col-only'.

Optional arg NOMSG non-nil means show no message.

If the current buffer is not the same as the value of `orig-buff',
then indicate the buffer, as well as the position.  Variable
`orig-buff' is not bound here; if you want to take advantage of this
feature in your code, then bind it.

Return current position as a marker.

\(fn &optional MODE NOMSG)" t nil)

(autoload 'crosshairs-unhighlight "../plugin/crosshairs" "\
Turn off crosshairs highlighting of current position.
Optional arg nil means do nothing if this event is a frame switch.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/csv-mode" "../plugin/csv-mode.el"
;;;;;;  (22026 35731 129049 997000))
;;; Generated autoloads from ../plugin/csv-mode.el

(autoload 'csv-mode "../plugin/csv-mode" "\
Major mode for editing files of comma-separated value type.

CSV mode is derived from `text-mode', and runs `text-mode-hook' before
running `csv-mode-hook'.  It turns `auto-fill-mode' off by default.
CSV mode can be customized by user options in the CSV customization
group.  The separators are specified by the value of `csv-separators'.

CSV mode commands ignore blank lines and comment lines beginning with
the value of `csv-comment-start', which delimit \"paragraphs\".
\"Sexp\" is re-interpreted to mean \"field\", so that `forward-sexp'
\(\\[forward-sexp]), `kill-sexp' (\\[kill-sexp]), etc. all apply to fields.
Standard comment commands apply, such as `comment-dwim' (\\[comment-dwim]).

If `font-lock-mode' is enabled then separators, quoted values and
comment lines are highlighted using respectively `csv-separator-face',
`font-lock-string-face' and `font-lock-comment-face'.

The user interface (UI) for CSV mode commands is similar to that of
the standard commands `sort-fields' and `sort-numeric-fields', except
that if there is no prefix argument then the UI prompts for the field
index or indices.  In `transient-mark-mode' only: if the region is not
set then the UI attempts to set it to include all consecutive CSV
records around point, and prompts for confirmation; if there is no
prefix argument then the UI prompts for it, offering as a default the
index of the field containing point if the region was not set
explicitly.  The region set automatically is delimited by blank lines
and comment lines, and the number of header lines at the beginning of
the region given by the value of `csv-header-lines' are skipped.

Sort order is controlled by `csv-descending'.

CSV mode provides the following specific keyboard key bindings:

\\{csv-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))

;;;***

;;;### (autoloads nil "../plugin/doctest-mode" "../plugin/doctest-mode.el"
;;;;;;  (22026 35731 130049 997000))
;;; Generated autoloads from ../plugin/doctest-mode.el

(add-to-list 'auto-mode-alist '("\\.doctest$" . doctest-mode))

(autoload 'doctest-mode "../plugin/doctest-mode" "\
A major mode for editing text files that contain Python
doctest examples.  Doctest is a testing framework for Python that
emulates an interactive session, and checks the result of each
command.  For more information, see the Python library reference:
<http://docs.python.org/lib/module-doctest.html>

`doctest-mode' defines three kinds of line, each of which is
treated differently:

  - 'Source lines' are lines consisting of a Python prompt
    ('>>>' or '...'), followed by source code.  Source lines are
    colored (similarly to `python-mode') and auto-indented.

  - 'Output lines' are non-blank lines immediately following
    source lines.  They are colored using several doctest-
    specific output faces.

  - 'Text lines' are any other lines.  They are not processed in
    any special way.

\\{doctest-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee" "../plugin/ee-0.1.0/ee.el"
;;;;;;  (22026 35731 143049 996000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee.el

(autoload 'ee "../plugin/ee-0.1.0/ee" "\
Enter top-level index of all available ee extensions.
Optional argument FILE specifies the file to examine;
the default is the top-level mode list.
In interactive use, a prefix argument directs this command
to read a root file name from the minibuffer.

\(fn &optional FILE)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-bbdb" "../plugin/ee-0.1.0/ee-bbdb.el"
;;;;;;  (22026 35731 133049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-bbdb.el

(autoload 'ee-bbdb "../plugin/ee-0.1.0/ee-bbdb" "\
Summary mode for BBDB.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-buffers" "../plugin/ee-0.1.0/ee-buffers.el"
;;;;;;  (22026 35731 133049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-buffers.el

(autoload 'ee-buffers "../plugin/ee-0.1.0/ee-buffers" "\
Display and manipulate Emacs buffers.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-commands" "../plugin/ee-0.1.0/ee-commands.el"
;;;;;;  (22026 35731 134049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-commands.el

(autoload 'ee-commands "../plugin/ee-0.1.0/ee-commands" "\
Categorized menu of Emacs commands.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-customize" "../plugin/ee-0.1.0/ee-customize.el"
;;;;;;  (22026 35731 134049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-customize.el

(autoload 'ee-customize "../plugin/ee-0.1.0/ee-customize" "\
Browse Emacs customization groups.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-datafile" "../plugin/ee-0.1.0/ee-datafile.el"
;;;;;;  (22026 35731 134049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-datafile.el
 (add-to-list 'auto-mode-alist '("\\.ee\\'" . emacs-lisp-mode))

(autoload 'ee-datafile-mode "../plugin/ee-0.1.0/ee-datafile" "\
Datafile view mode.
The purpose of this function is to create the view buffer,
when user visits a file with -*- mode: ee-datafile -*-.

\(fn &optional ARG)" t nil)

(autoload 'ee-datafile "../plugin/ee-0.1.0/ee-datafile" "\
Display and edit data files.

\(fn &optional ARG FILE)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-dired" "../plugin/ee-0.1.0/ee-dired.el"
;;;;;;  (22026 35731 135049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-dired.el

(autoload 'ee-dired "../plugin/ee-0.1.0/ee-dired" "\
Categorized directory listings.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-dselect" "../plugin/ee-0.1.0/ee-dselect.el"
;;;;;;  (22026 35731 135049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-dselect.el

(autoload 'ee-dselect "../plugin/ee-0.1.0/ee-dselect" "\
Debian package handling frontend.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-edb" "../plugin/ee-0.1.0/ee-edb.el"
;;;;;;  (22026 35731 135049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-edb.el

(autoload 'ee-edb "../plugin/ee-0.1.0/ee-edb" "\
Summary mode for EDB.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-ell" "../plugin/ee-0.1.0/ee-ell.el"
;;;;;;  (22026 35731 135049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-ell.el

(autoload 'ee-ell "../plugin/ee-0.1.0/ee-ell" "\
Browse the categorized Emacs Lisp List.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-example" "../plugin/ee-0.1.0/ee-example.el"
;;;;;;  (22026 35731 136049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-example.el

(autoload 'ee-example "../plugin/ee-0.1.0/ee-example" "\
Accompanying example for demonstration of ee capabilities.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-fields" "../plugin/ee-0.1.0/ee-fields.el"
;;;;;;  (22026 35731 136049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-fields.el

(autoload 'ee-fields "../plugin/ee-0.1.0/ee-fields" "\
Display and edit fields of the current record.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-finder" "../plugin/ee-0.1.0/ee-finder.el"
;;;;;;  (22026 35731 137049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-finder.el

(autoload 'ee-finder "../plugin/ee-0.1.0/ee-finder" "\
Keyword-based Emacs code finder.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-gnus" "../plugin/ee-0.1.0/ee-gnus.el"
;;;;;;  (22026 35731 137049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-gnus.el

(autoload 'ee-gnus "../plugin/ee-0.1.0/ee-gnus" "\
Summary and topic mode for Gnus.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-history" "../plugin/ee-0.1.0/ee-history.el"
;;;;;;  (22026 35731 137049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-history.el

(autoload 'ee-history-command "../plugin/ee-0.1.0/ee-history" "\
Display list from Emacs variable `command-history'.

\(fn &optional ARG)" t nil)

(autoload 'ee-history-extended-command "../plugin/ee-0.1.0/ee-history" "\
Display list from Emacs variable `extended-command-history'.

\(fn &optional ARG)" t nil)

(autoload 'ee-history-shell-command "../plugin/ee-0.1.0/ee-history" "\
Display list from Emacs variable `shell-command-history'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-imenu" "../plugin/ee-0.1.0/ee-imenu.el"
;;;;;;  (22026 35731 137049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-imenu.el

(autoload 'ee-imenu "../plugin/ee-0.1.0/ee-imenu" "\
Categorized mode-specific buffer indexes.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-info" "../plugin/ee-0.1.0/ee-info.el"
;;;;;;  (22026 35731 138049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-info.el

(autoload 'ee-info "../plugin/ee-0.1.0/ee-info" "\
Enter ee-info, the documentation browser.
Optional argument FILE specifies the file to examine;
the default is the top-level directory of Info.

In interactive use, a prefix argument directs this command
to read a file name from the minibuffer.

The search path for Info files is in the variable `Info-directory-list'.
The top-level Info directory is made by combining all the files named `dir'
in all the directories in that path.

\(fn &optional FILE)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-marks" "../plugin/ee-0.1.0/ee-marks.el"
;;;;;;  (22026 35731 138049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-marks.el

(autoload 'ee-marks "../plugin/ee-0.1.0/ee-marks" "\
Display and go to marked lines in the current Emacs buffer.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-menubar" "../plugin/ee-0.1.0/ee-menubar.el"
;;;;;;  (22026 35731 139049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-menubar.el

(autoload 'ee-menubar "../plugin/ee-0.1.0/ee-menubar" "\
Categorized access to Emacs menu-bar.

\(fn &optional ARG)" t nil)
 (defalias 'ee-tmm 'ee-menubar)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-outline" "../plugin/ee-0.1.0/ee-outline.el"
;;;;;;  (22026 35731 139049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-outline.el

(autoload 'ee-outline "../plugin/ee-0.1.0/ee-outline" "\
Manipulate outlines collected from outline-mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-processes" "../plugin/ee-0.1.0/ee-processes.el"
;;;;;;  (22026 35731 139049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-processes.el

(autoload 'ee-processes "../plugin/ee-0.1.0/ee-processes" "\
Display and manipulate Emacs processes.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-programs" "../plugin/ee-0.1.0/ee-programs.el"
;;;;;;  (22026 35731 140049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-programs.el

(autoload 'ee-programs "../plugin/ee-0.1.0/ee-programs" "\
Categorized program menu.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-ps" "../plugin/ee-0.1.0/ee-ps.el"
;;;;;;  (22026 35731 141049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-ps.el

(autoload 'ee-ps "../plugin/ee-0.1.0/ee-ps" "\
Display CPU processes.

\(fn &optional ARG)" t nil)
 (fset 'ee-top 'ee-ps)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-tags" "../plugin/ee-0.1.0/ee-tags.el"
;;;;;;  (22026 35731 141049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-tags.el

(autoload 'ee-tags "../plugin/ee-0.1.0/ee-tags" "\
Etags facility.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-textfile" "../plugin/ee-0.1.0/ee-textfile.el"
;;;;;;  (22026 35731 141049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-textfile.el

(autoload 'ee-textfile-changelog "../plugin/ee-0.1.0/ee-textfile" "\
Organize information from ChangeLog files.

\(fn &optional ARG)" t nil)

(autoload 'ee-textfile-apachelog "../plugin/ee-0.1.0/ee-textfile" "\
Organize information from Apache log files.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-variables" "../plugin/ee-0.1.0/ee-variables.el"
;;;;;;  (22026 35731 141049 997000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-variables.el

(autoload 'ee-variables "../plugin/ee-0.1.0/ee-variables" "\
Categorized menu of Emacs variables.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-views" "../plugin/ee-0.1.0/ee-views.el"
;;;;;;  (22026 35731 142049 996000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-views.el

(autoload 'ee-views "../plugin/ee-0.1.0/ee-views" "\
Display, edit and switch views.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/ee-0.1.0/ee-windows" "../plugin/ee-0.1.0/ee-windows.el"
;;;;;;  (22026 35731 142049 996000))
;;; Generated autoloads from ../plugin/ee-0.1.0/ee-windows.el

(autoload 'ee-windows-and-add-current "../plugin/ee-0.1.0/ee-windows" "\


\(fn &optional ARG)" t nil)

(autoload 'ee-windows-add "../plugin/ee-0.1.0/ee-windows" "\
Add current Emacs window configuration.

\(fn)" t nil)

(autoload 'ee-windows "../plugin/ee-0.1.0/ee-windows" "\
Display and switch Emacs window configurations.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/eval-expr" "../plugin/eval-expr.el"
;;;;;;  (22026 35731 150049 996000))
;;; Generated autoloads from ../plugin/eval-expr.el

(defvar eval-expr-error-message-delay 3 "\
*Amount of time, in seconds, to display in echo area before continuing.")

(custom-autoload 'eval-expr-error-message-delay "../plugin/eval-expr" t)

(defvar eval-expr-prompt "Eval: " "\
*Prompt used by eval-expr.")

(custom-autoload 'eval-expr-prompt "../plugin/eval-expr" t)

(defvar eval-expr-honor-debug-on-error t "\
*If non-nil, do not trap evaluation errors.
Instead, allow errors to throw user into the debugger, provided
debug-on-error specifies that the particular error is a debuggable condition.")

(custom-autoload 'eval-expr-honor-debug-on-error "../plugin/eval-expr" t)

(defvar eval-expr-use-echo-area-or-buffer 1 "\
*Preference for when to use echo area of a temporary buffer for results.

If set to t or `buffer', always put results into a temporary buffer.
If set to `nil' or `echo-area', always display results in echo area.
If an integer N, use the echo area unless the results would require more
than N lines to display; in that case, use a temporary buffer.

Some versions of emacs can display arbitrarily large output in the echo
area by dynamically resizing it, so a temporary buffer is not necessary
unless you expect the output to exceed the limits of the resize thresholds
or want to be able to edit the results.")

(custom-autoload 'eval-expr-use-echo-area-or-buffer "../plugin/eval-expr" t)

(defvar eval-expr-print-level (cond ((boundp 'eval-expression-print-level) (default-value 'eval-expression-print-level)) ((boundp 'print-level) (default-value 'print-level))) "\
*Like print-level, but affect results printed by `eval-expr' only.")

(custom-autoload 'eval-expr-print-level "../plugin/eval-expr" t)

(defvar eval-expr-print-length (cond ((boundp 'eval-expression-print-length) (default-value 'eval-expression-print-length)) ((boundp 'print-length) (default-value 'print-length))) "\
*Like print-length, but affect results printed by `eval-expr' only.")

(custom-autoload 'eval-expr-print-length "../plugin/eval-expr" t)

(defvar eval-expr-print-function (if (fboundp 'pp) 'pp 'prin1) "\
*Function to use for printing objects.
E.g. this can be set to `pp' to generate pretty-printed results,
or `prin1' for unformatted results.")

(custom-autoload 'eval-expr-print-function "../plugin/eval-expr" t)

(autoload 'eval-expr-install "../plugin/eval-expr" "\
Replace standard eval-expression command with enhanced eval-expr.

\(fn)" t nil)

(autoload 'eval-expr "../plugin/eval-expr" "\
Evaluate EXPRESSION and print value in minibuffer, temp, or current buffer.
A temp output buffer is used if there is more than one line in the
evaluated result.
If invoked with a prefix arg, or second lisp argument EE::INSERT-VALUE is
non-nil, then insert final value into the current buffer at point.

Value is also consed on to front of the variable `values'.

\(fn EE::EXPRESSION &optional EE::INSERT-VALUE)" t nil)

;;;***

;;;### (autoloads nil "../plugin/everything" "../plugin/everything.el"
;;;;;;  (22026 35731 150049 996000))
;;; Generated autoloads from ../plugin/everything.el

(defalias 'everything 'everything-find-file)

(autoload 'everything-find-file "../plugin/everything" "\
Prompt for a search string, let the user choose one of the returned files and
open it.

\(fn)" t nil)

(autoload 'everything-find-prompt "../plugin/everything" "\
Prompt for a query and return the chosen filename.
If the current major mode is dired or (e)shell-mode limit the search to
the current directory and its sub-directories.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "../plugin/expand-region/expand-region" "../plugin/expand-region/expand-region.el"
;;;;;;  (22026 35731 152049 996000))
;;; Generated autoloads from ../plugin/expand-region/expand-region.el

(autoload 'er/expand-region "../plugin/expand-region/expand-region" "\
Increase selected region by semantic units.

With prefix argument expands the region that many times.
If prefix argument is negative calls `er/contract-region'.
If prefix argument is 0 it resets point and mark to their state
before calling `er/expand-region' for the first time.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/expand-region/expand-region-custom"
;;;;;;  "../plugin/expand-region/expand-region-custom.el" (22026
;;;;;;  35731 152049 996000))
;;; Generated autoloads from ../plugin/expand-region/expand-region-custom.el

(let ((loads (get 'expand-region 'custom-loads))) (if (member '"../plugin/expand-region/expand-region-custom" loads) nil (put 'expand-region 'custom-loads (cons '"../plugin/expand-region/expand-region-custom" loads))))

(defvar expand-region-preferred-python-mode 'python "\
The name of your preferred python mode")

(custom-autoload 'expand-region-preferred-python-mode "../plugin/expand-region/expand-region-custom" t)

(defvar expand-region-guess-python-mode t "\
If expand-region should attempt to guess your preferred python mode")

(custom-autoload 'expand-region-guess-python-mode "../plugin/expand-region/expand-region-custom" t)

(defvar expand-region-autocopy-register "" "\
If set to a string of a single character (try \"e\"), then the
contents of the most recent expand or contract command will
always be copied to the register named after that character.")

(custom-autoload 'expand-region-autocopy-register "../plugin/expand-region/expand-region-custom" t)

(defvar expand-region-skip-whitespace t "\
If expand-region should skip past whitespace on initial expansion")

(custom-autoload 'expand-region-skip-whitespace "../plugin/expand-region/expand-region-custom" t)

(defvar expand-region-fast-keys-enabled t "\
If expand-region should bind fast keys after initial expand/contract")

(custom-autoload 'expand-region-fast-keys-enabled "../plugin/expand-region/expand-region-custom" t)

(defvar expand-region-contract-fast-key "-" "\
Key to use after an initial expand/contract to contract once more.")

(custom-autoload 'expand-region-contract-fast-key "../plugin/expand-region/expand-region-custom" t)

(defvar expand-region-reset-fast-key "0" "\
Key to use after an initial expand/contract to undo.")

(custom-autoload 'expand-region-reset-fast-key "../plugin/expand-region/expand-region-custom" t)

;;;***

;;;### (autoloads nil "../plugin/expand-region/util/ert" "../plugin/expand-region/util/ert.el"
;;;;;;  (22026 35731 157049 996000))
;;; Generated autoloads from ../plugin/expand-region/util/ert.el

(autoload 'ert-deftest "../plugin/expand-region/util/ert" "\
Define NAME (a symbol) as a test.

BODY is evaluated as a `progn' when the test is run.  It should
signal a condition on failure or just return if the test passes.

`should', `should-not' and `should-error' are useful for
assertions in BODY.

Use `ert' to run tests interactively.

Tests that are expected to fail can be marked as such
using :expected-result.  See `ert-test-result-type-p' for a
description of valid values for RESULT-TYPE.

\(fn NAME () [DOCSTRING] [:expected-result RESULT-TYPE] [:tags '(TAG...)] BODY...)" nil (quote macro))

(put 'ert-deftest 'lisp-indent-function 2)

(put 'ert-info 'lisp-indent-function 1)

(autoload 'ert-run-tests-batch "../plugin/expand-region/util/ert" "\
Run the tests specified by SELECTOR, printing results to the terminal.

SELECTOR works as described in `ert-select-tests', except if
SELECTOR is nil, in which case all tests rather than none will be
run; this makes the command line \"emacs -batch -l my-tests.el -f
ert-run-tests-batch-and-exit\" useful.

Returns the stats object.

\(fn &optional SELECTOR)" nil nil)

(autoload 'ert-run-tests-batch-and-exit "../plugin/expand-region/util/ert" "\
Like `ert-run-tests-batch', but exits Emacs when done.

The exit status will be 0 if all test results were as expected, 1
on unexpected results, or 2 if the framework detected an error
outside of the tests (e.g. invalid SELECTOR or bug in the code
that runs the tests).

\(fn &optional SELECTOR)" nil nil)

(autoload 'ert-run-tests-interactively "../plugin/expand-region/util/ert" "\
Run the tests specified by SELECTOR and display the results in a buffer.

SELECTOR works as described in `ert-select-tests'.
OUTPUT-BUFFER-NAME and MESSAGE-FN should normally be nil; they
are used for automated self-tests and specify which buffer to use
and how to display message.

\(fn SELECTOR &optional OUTPUT-BUFFER-NAME MESSAGE-FN)" t nil)

(defalias 'ert 'ert-run-tests-interactively)

(autoload 'ert-describe-test "../plugin/expand-region/util/ert" "\
Display the documentation for TEST-OR-TEST-NAME (a symbol or ert-test).

\(fn TEST-OR-TEST-NAME)" t nil)

;;;***

;;;### (autoloads nil "../plugin/eyedropper" "../plugin/eyedropper.el"
;;;;;;  (22026 35731 158049 996000))
;;; Generated autoloads from ../plugin/eyedropper.el

(autoload 'eyedrop-background-at-mouse "../plugin/eyedropper" "\
Return the background color under the mouse pointer.
Non-nil optional arg MSG-P means display an informative message.

\(fn EVENT &optional MSG-P)" t nil)

(autoload 'eyedrop-foreground-at-mouse "../plugin/eyedropper" "\
Return the foreground color under the mouse pointer.
Non-nil optional arg MSG-P means display an informative message.

\(fn EVENT &optional MSG-P)" t nil)

(defalias 'background-color 'eyedrop-background-at-point)

(autoload 'eyedrop-background-at-point "../plugin/eyedropper" "\
Return the background color under the text cursor.
Non-nil optional arg MSG-P means display an informative message.

\(fn &optional MSG-P)" t nil)

(defalias 'foreground-color 'eyedrop-foreground-at-point)

(autoload 'eyedrop-foreground-at-point "../plugin/eyedropper" "\
Return the foreground color under the text cursor.
Non-nil optional arg MSG-P means display an informative message.

\(fn &optional MSG-P)" t nil)

(autoload 'eyedrop-pick-background-at-mouse "../plugin/eyedropper" "\
Pick background of face or frame at character under the mouse pointer.
Save the background color in `eyedrop-picked-background' and
`eyedrop-last-picked-color'.  Return the picked color.
Non-nil optional arg MSG-P means display an informative message.

\(fn EVENT &optional MSG-P)" t nil)

(autoload 'eyedrop-pick-foreground-at-mouse "../plugin/eyedropper" "\
Pick foreground of face or frame at character under the mouse pointer.
Save the foreground color in `eyedrop-picked-foreground' and
`eyedrop-last-picked-color'.  Return the picked color.
Non-nil optional arg MSG-P means display an informative message.

\(fn EVENT &optional MSG-P)" t nil)

(defalias 'eyedropper-background 'eyedrop-pick-background-at-point)

(defalias 'pick-background-color 'eyedrop-pick-background-at-point)

(autoload 'eyedrop-pick-background-at-point "../plugin/eyedropper" "\
Pick background of face or frame at character at text cursor (point).
Save the background color in `eyedrop-picked-background' and
`eyedrop-last-picked-color'.  Return the picked color.
Non-nil optional arg MSG-P means display an informative message.

\(fn &optional MSG-P)" t nil)

(defalias 'eyedropper-foreground 'eyedrop-pick-foreground-at-point)

(defalias 'pick-foreground-color 'eyedrop-pick-foreground-at-point)

(autoload 'eyedrop-pick-foreground-at-point "../plugin/eyedropper" "\
Pick foreground of face or frame at character at text cursor (point).
Save the foreground color in `eyedrop-picked-foreground' and
`eyedrop-last-picked-color'.  Return the picked color.
Non-nil optional arg MSG-P means display an informative message.

\(fn &optional MSG-P)" t nil)

;;;***

;;;### (autoloads nil "../plugin/flymake-cursor" "../plugin/flymake-cursor.el"
;;;;;;  (22026 35731 158049 996000))
;;; Generated autoloads from ../plugin/flymake-cursor.el

(autoload 'flyc/show-fly-error-at-point-now "../plugin/flymake-cursor" "\
If the cursor is sitting on a flymake error, display
the error message in the  minibuffer.

\(fn)" t nil)

(autoload 'flyc/show-fly-error-at-point-pretty-soon "../plugin/flymake-cursor" "\
If the cursor is sitting on a flymake error, grab the error,
and set a timer for \"pretty soon\". When the timer fires, the error
message will be displayed in the minibuffer.

This allows a post-command-hook to NOT cause the minibuffer to be
updated 10,000 times as a user scrolls through a buffer
quickly. Only when the user pauses on a line for more than a
second, does the flymake error message (if any) get displayed.

\(fn)" nil nil)

(eval-after-load "flymake" '(progn (defadvice flymake-goto-next-error (after flyc/display-message-1 activate compile) "Display the error in the mini-buffer rather than having to mouse over it" (flyc/show-fly-error-at-point-now)) (defadvice flymake-goto-prev-error (after flyc/display-message-2 activate compile) "Display the error in the mini-buffer rather than having to mouse over it" (flyc/show-fly-error-at-point-now)) (defadvice flymake-mode (before flyc/post-command-fn activate compile) "Add functionality to the post command hook so that if the\ncursor is sitting on a flymake error the error information is\ndisplayed in the minibuffer (rather than having to mouse over\nit)" (add-hook 'post-command-hook 'flyc/show-fly-error-at-point-pretty-soon t t))))

;;;***

;;;### (autoloads nil "../plugin/flymake-patch" "../plugin/flymake-patch.el"
;;;;;;  (22026 35731 159049 996000))
;;; Generated autoloads from ../plugin/flymake-patch.el

(autoload 'flymake-mode "../plugin/flymake-patch" "\
Minor mode to do on-the-fly syntax checking.
When called interactively, toggles the minor mode.
With arg, turn Flymake mode on if and only if arg is positive.

\(fn &optional ARG)" t nil)

(autoload 'flymake-mode-on "../plugin/flymake-patch" "\
Turn flymake mode on.

\(fn)" nil nil)

(autoload 'flymake-mode-off "../plugin/flymake-patch" "\
Turn flymake mode off.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "../plugin/frame-cmds" "../plugin/frame-cmds.el"
;;;;;;  (22026 35731 161049 996000))
;;; Generated autoloads from ../plugin/frame-cmds.el

(autoload 'save-frame-config "../plugin/frame-cmds" "\
Save current frame configuration.
You can restore it with \\[jump-to-frame-config-register].

\(fn)" t nil)

(autoload 'jump-to-frame-config-register "../plugin/frame-cmds" "\
Restore frame configuration saved in `frame-config-register'.

\(fn)" t nil)

(autoload 'deiconify-everything "../plugin/frame-cmds" "\
Deiconify any iconified frames.

\(fn)" t nil)

(autoload 'iconify-everything "../plugin/frame-cmds" "\
Iconify all frames of session at once.
Remembers frame configuration in register `C-l' (Control-L).
To restore this frame configuration, use `\\[jump-to-register] C-l'.

\(fn)" t nil)

(autoload 'hide-everything "../plugin/frame-cmds" "\
Hide all frames of session at once.
Iconify minibuffer frame; make all others invisible.
Remembers frame configuration in register `C-l' (Control-L).
To restore this frame configuration, use `\\[jump-to-register] C-l'.

\(fn)" t nil)

(autoload 'show-hide "../plugin/frame-cmds" "\
1 frame visible: `show-hide-show-function'; else: `hide-everything'.
This acts as a toggle between showing all frames and showing only an
iconified minibuffer frame.

\(fn)" t nil)

(autoload 'show-buffer-menu "../plugin/frame-cmds" "\
Call `buffer-menu' after making all frames visible.
Useful after using `hide-everything' because of a Windows bug that
doesn't let you display frames that have been made visible after
being made invisible.

\(fn)" t nil)

(autoload 'mouse-show-hide-mark-unmark "../plugin/frame-cmds" "\
In minibuffer: `show-hide'.  In dired: mark/unmark; else: buffer menu.

\(fn EVENT)" t nil)

(defalias 'iconify/map-frame 'iconify/show-frame)

(autoload 'iconify/show-frame "../plugin/frame-cmds" "\
Iconify selected frame if now shown.  Show it if now iconified.
A non-negative prefix arg iconifies all shown frames.
A negative prefix arg deiconifies all iconified frames.

\(fn &optional ALL-ACTION)" t nil)

(defalias 'mouse-iconify/map-frame 'mouse-iconify/show-frame)

(autoload 'mouse-iconify/show-frame "../plugin/frame-cmds" "\
Iconify frame you click, if now shown.  Show it if now iconified.

\(fn EVENT)" t nil)

(autoload 'delete-window "../plugin/frame-cmds" "\
Remove WINDOW from the display.  Default is `selected-window'.
If WINDOW is the only one in its frame, then `delete-frame' too.

\(fn &optional WINDOW)" t nil)

(autoload 'delete-windows-for "../plugin/frame-cmds" "\
`delete-window' or prompt for buffer and delete its windows.
With no prefix arg, delete the selected window.
With a prefix arg, prompt for a buffer and delete all windows, on any
  frame, that show that buffer.

\(fn &optional BUFFER)" t nil)

(autoload 'delete-windows-on "../plugin/frame-cmds" "\
Delete windows showing BUFFER.
Optional arg BUFFER defaults to the current buffer.

Optional second arg FRAME controls which frames are considered.
  If nil or omitted, delete all windows showing BUFFER in any frame.
  If t, delete only windows showing BUFFER in the selected frame.
  If `visible', delete all windows showing BUFFER in any visible frame.
  If a frame, delete only windows showing BUFFER in that frame.

Interactively, FRAME depends on the prefix arg, as follows:
  Without a prefix arg (prefix = nil), FRAME is nil (all frames).
  With prefix arg >= 0, FRAME is t (this frame only).
  With prefix arg < 0,  FRAME is `visible' (all visible frames).

\(fn &optional BUFFER FRAME)" t nil)

(defalias 'remove-window 'delete-window)

(autoload 'remove-windows-on "../plugin/frame-cmds" "\
Remove all windows showing BUFFER.  This calls `remove-window'
on each window showing BUFFER.

\(fn BUFFER)" t nil)

(autoload 'mouse-remove-window "../plugin/frame-cmds" "\
Remove the window you click on.  (This calls `remove-window'.)
This command must be bound to a mouse click.

\(fn EVENT)" t nil)

(autoload 'delete/iconify-window "../plugin/frame-cmds" "\
Delete or iconify WINDOW (default: `selected-window').
If WINDOW is the only one in its frame (`one-window-p'), then optional
arg FRAME-P determines the behavior regarding the frame, as follows:
  If FRAME-P is nil, then the frame is deleted (with the window).
  If FRAME-P is t, then the frame is iconified.
  If FRAME-P is a symbol naming a function, the function is applied
             to WINDOW as its only arg.
             If the result is nil, then the frame is deleted.
             If the result is non-nil, then the frame is iconified.
  If FRAME-P is anything else, then behavior is as if FRAME-P were the
             symbol `window-dedicated-p': the frame is iconified if
             WINDOW is dedicated, otherwise the frame is deleted.

Interactively, FRAME-P depends on the prefix arg, as follows:
  Without a prefix arg (prefix = nil), FRAME-P is `window-dedicated-p'.
  With prefix arg < 0, FRAME-P is t.  The frame is iconified.
  With prefix arg >= 0, FRAME-P is nil.  The frame is deleted.

\(fn &optional WINDOW FRAME-P)" t nil)

(autoload 'delete/iconify-windows-on "../plugin/frame-cmds" "\
For each window showing BUFFER: delete it or iconify its frame.
\(This calls `delete/iconify-window' on each window showing BUFFER.)

Optional second arg FRAME controls which frames are considered.
  If nil or omitted, treat all windows showing BUFFER in any frame.
  If t, treat only windows showing BUFFER in the selected frame.
  If `visible', treat all windows showing BUFFER in any visible frame.
  If a frame, treat only windows showing BUFFER in that frame.

Optional third arg FRAME-P controls what to do with one-window frames.
  If FRAME-P is nil, then one-window frames showing BUFFER are deleted.
  If FRAME-P is t, then one-window frames are iconified.
  If FRAME-P is a symbol naming a function, the function is applied
             to each window showing buffer in a frame by itself.
             If the result is nil, then the frame is deleted.
             If the result is non-nil, then the frame is iconified.
  If FRAME-P is anything else, then behavior is as if FRAME-P were the
             symbol `window-dedicated-p': One-window frames are
             iconified if window is dedicated, else they are deleted.

Interactively, FRAME is nil, and FRAME-P depends on the prefix arg:
  Without a prefix arg (prefix = nil), FRAME-P is `window-dedicated-p'.
  With prefix arg < 0, FRAME-P is t.  The frame is iconified.
  With prefix arg >= 0, FRAME-P is nil.  The frame is deleted.

\(fn BUFFER &optional FRAME FRAME-P)" t nil)

(autoload 'rename-frame "../plugin/frame-cmds" "\
Rename a frame named OLD-NAME to NEW-NAME.
Prefix arg non-nil means rename all frames named OLD-NAME to NEWNAME.
OLD-NAME may be a frame, its name, or nil.  Default is `selected-frame'.
NEW-NAME is a string or nil.  Default NEW-NAME is current `buffer-name'.

\(fn &optional OLD-NAME NEW-NAME ALL-NAMED)" t nil)

(autoload 'rename-non-minibuffer-frame "../plugin/frame-cmds" "\
Unless OLD-NAME names the minibuffer frame, use `rename-frame'
to rename a frame named OLD-NAME to NEW-NAME.
Prefix arg non-nil means rename all frames named OLD-NAME to NEW-NAME.
OLD-NAME may be a frame, its name, or nil.  Default is `selected-frame'.
NEW-NAME is a string or nil.  Default NEW-NAME is current `buffer-name'.

\(fn &optional OLD-NAME NEW-NAME ALL-NAMED)" t nil)

(autoload 'show-frame "../plugin/frame-cmds" "\
Make FRAME visible and raise it, without selecting it.
FRAME may be a frame or its name.

\(fn FRAME)" t nil)

(autoload 'hide-frame "../plugin/frame-cmds" "\
Make FRAME invisible.  Like `make-frame-invisible', but reads frame name.
Non-nil PREFIX makes it invisible even if all other frames are invisible.

\(fn FRAME &optional PREFIX)" t nil)

(autoload 'show-a-frame-on "../plugin/frame-cmds" "\
Make visible and raise a frame showing BUFFER, if there is one.
Neither the frame nor the BUFFER are selected.
BUFFER may be a buffer or its name (a string).

\(fn BUFFER)" t nil)

(autoload 'show-*Help*-buffer "../plugin/frame-cmds" "\
Raise a frame showing buffer *Help*, without selecting it.

\(fn)" t nil)

(autoload 'delete-1-window-frames-on "../plugin/frame-cmds" "\
Delete all visible 1-window frames showing BUFFER.

\(fn BUFFER)" t nil)

(autoload 'delete-other-frames "../plugin/frame-cmds" "\
Delete all frames except FRAME (default: selected frame).
Interactively, use a prefix arg (`\\[universal-argument]') to be prompted for FRAME.

\(fn &optional FRAME)" t nil)

(autoload 'maximize-frame-horizontally "../plugin/frame-cmds" "\
Maximize selected frame horizontally.

\(fn &optional FRAME)" t nil)

(autoload 'maximize-frame-vertically "../plugin/frame-cmds" "\
Maximize selected frame vertically.

\(fn &optional FRAME)" t nil)

(autoload 'maximize-frame "../plugin/frame-cmds" "\
Maximize selected frame horizontally, vertically, or both.
With no prefix arg, maximize both directions.
With a non-negative prefix arg, maximize vertically.
With a negative prefix arg, maximize horizontally.

In Lisp code:
 DIRECTION is the direction: `horizontal', `vertical', or `both'.
 FRAME is the frame to maximize.

\(fn &optional DIRECTION FRAME)" t nil)

(unless (fboundp 'restore-frame-horizontally) (defalias 'restore-frame-horizontally 'toggle-max-frame-horizontally))

(autoload 'toggle-max-frame-horizontally "../plugin/frame-cmds" "\
Toggle maximization of FRAME horizontally.
If used once, this restores the frame.  If repeated, it maximizes.
This affects the `left' and `width' frame parameters.

FRAME defaults to the selected frame.

\(fn &optional FRAME)" t nil)

(unless (fboundp 'restore-frame-vertically) (defalias 'restore-frame-vertically 'toggle-max-frame-vertically))

(autoload 'toggle-max-frame-vertically "../plugin/frame-cmds" "\
Toggle maximization of FRAME vertically.
If used once, this restores the frame.  If repeated, it maximizes.
This affects the `top' and `height' frame parameters.

FRAME defaults to the selected frame.

\(fn &optional FRAME)" t nil)

(unless (fboundp 'restore-frame) (defalias 'restore-frame 'toggle-max-frame))

(autoload 'toggle-max-frame "../plugin/frame-cmds" "\
Toggle maximization of FRAME horizontally, vertically, or both.
Reverses or (if restored) repeats the effect of the Emacs maximize
commands.  Does not restore from maximization effected outside Emacs.

With no prefix arg, toggle both directions.
With a non-negative prefix arg, toggle only vertically.
With a negative prefix arg, toggle horizontally.

When toggling both directions, each is toggled from its last maximize
or restore state.  This means that using this after
`maximize-horizontal', `maximize-vertical', `toggle-max-horizontal',
or `toggle-max-vertical' does not necessarily just reverse the effect
of that command.

In Lisp code:
 DIRECTION is the direction: `horizontal', `vertical', or `both'.
 FRAME is the frame to change.  It defaults to the selected frame.

\(fn &optional DIRECTION FRAME)" t nil)

(autoload 'tile-frames-horizontally "../plugin/frame-cmds" "\
Tile frames horizontally.
Interatively:
  With prefix arg, you are prompted for names of two frames to tile.
  With no prefix arg, all visible frames are tiled, except a
       standalone minibuffer frame, if any.
If called from a program, all frames in list FRAMES are tiled.

\(fn &optional FRAMES)" t nil)

(autoload 'tile-frames-vertically "../plugin/frame-cmds" "\
Tile frames vertically.
Interatively:
  With prefix arg, you are prompted for names of two frames to tile.
  With no prefix arg, all visible frames are tiled, except a
       standalone minibuffer frame, if any.
If called from a program, all frames in list FRAMES are tiled.

\(fn &optional FRAMES)" t nil)

(autoload 'enlarge-frame "../plugin/frame-cmds" "\
Increase the height of FRAME (default: selected-frame) by INCREMENT.
INCREMENT is in lines (characters).
Interactively, it is given by the prefix argument.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'enlarge-frame-horizontally "../plugin/frame-cmds" "\
Increase the width of FRAME (default: selected-frame) by INCREMENT.
INCREMENT is in columns (characters).
Interactively, it is given by the prefix argument.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'shrink-frame "../plugin/frame-cmds" "\
Decrease the height of FRAME (default: selected-frame) by INCREMENT.
INCREMENT is in lines (characters).
Interactively, it is given by the prefix argument.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'shrink-frame-horizontally "../plugin/frame-cmds" "\
Decrease the width of FRAME (default: selected-frame) by INCREMENT.
INCREMENT is in columns (characters).
Interactively, it is given by the prefix argument.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'move-frame-down "../plugin/frame-cmds" "\
Move selected frame down.
Move it N times `frame-char-height', where N is the prefix arg.
In Lisp code, FRAME is the frame to move.

\(fn &optional N FRAME)" t nil)

(autoload 'move-frame-up "../plugin/frame-cmds" "\
Move selected frame up.
Same as `move-frame-down', except movement is up.

\(fn &optional N FRAME)" t nil)

(autoload 'move-frame-right "../plugin/frame-cmds" "\
Move frame to the right.
Move it N times `frame-char-width', where N is the prefix arg.
In Lisp code, FRAME is the frame to move.

\(fn &optional N FRAME)" t nil)

(autoload 'move-frame-left "../plugin/frame-cmds" "\
Move frame to the left.
Same as `move-frame-right', except movement is to the left.

\(fn &optional N FRAME)" t nil)

(autoload 'move-frame-to-screen-top "../plugin/frame-cmds" "\
Move FRAME (default: selected-frame) to the top of the screen.
With a prefix arg, offset it that many char heights from the top.

\(fn ARG &optional FRAME)" t nil)

(autoload 'move-frame-to-screen-bottom "../plugin/frame-cmds" "\
Move FRAME (default: selected-frame) to the bottom of the screen.
With a prefix arg, offset it that many char heights from the bottom.

\(fn ARG &optional FRAME)" t nil)

(autoload 'move-frame-to-screen-left "../plugin/frame-cmds" "\
Move FRAME (default: selected-frame) to the left side of the screen.
With a prefix arg, offset it that many char widths from the left.

\(fn ARG &optional FRAME)" t nil)

(autoload 'move-frame-to-screen-right "../plugin/frame-cmds" "\
Move FRAME (default: selected-frame) to the right side of the screen.
With a prefix arg, offset it that many char widths from the right.

\(fn ARG &optional FRAME)" t nil)

(autoload 'move-frame-to-screen-top-left "../plugin/frame-cmds" "\
Move FRAME (default: selected-frame) to the top and left of the screen.
With a prefix arg, offset it that many char widths from the edges.

Note: You can use this command to move an off-screen (thus not
visible) frame back onto the screen.

\(fn ARG &optional FRAME)" t nil)

(autoload 'enlarge-font "../plugin/frame-cmds" "\
Increase size of font in FRAME by INCREMENT.
Interactively, INCREMENT is given by the prefix argument.
Optional FRAME parameter defaults to current frame.

\(fn &optional INCREMENT FRAME)" t nil)

(autoload 'set-frame-alist-parameter-from-frame "../plugin/frame-cmds" "\
Set PARAMETER of frame alist ALIST to its current value in FRAME.
FRAME defaults to the selected frame.  ALIST is a variable (symbol)
whose value is an alist of frame parameters.

\(fn ALIST PARAMETER &optional FRAME)" t nil)

(autoload 'set-all-frame-alist-parameters-from-frame "../plugin/frame-cmds" "\
Set frame parameters of ALIST to their current values in FRAME.
Unless optional argument REALLY-ALL-P (prefix arg) is non-nil, the
frame parameters in list `frame-parameters-to-exclude' are
excluded: they are not copied from FRAME to ALIST.
ALIST is a variable (symbol) whose value is an alist of frame parameters.
FRAME defaults to the selected frame.

\(fn ALIST &optional FRAME REALLY-ALL-P)" t nil)

(autoload 'tell-customize-var-has-changed "../plugin/frame-cmds" "\
Tell Customize to recognize that VARIABLE has been set (changed).
VARIABLE is a symbol that names a user option.

\(fn VARIABLE)" t nil)

(autoload 'other-window-or-frame "../plugin/frame-cmds" "\
`other-frame', if `one-window-p'; otherwise, `other-window'.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/google-this" "../plugin/google-this.el"
;;;;;;  (22026 35731 161049 996000))
;;; Generated autoloads from ../plugin/google-this.el

(autoload 'google-search "../plugin/google-this" "\
Write and do a google search.

\(fn PREFIX &optional SEARCH-URL)" t nil)

(autoload 'google-lucky-and-insert-url "../plugin/google-this" "\
Fetch the url that would be visited by `google-lucky'.

If you just want to do an \"I'm feeling lucky search\", use
`google-lucky-search' instead.

Interactively:
* Insert the URL at point,
* Kill the searched term, removing it from the buffer (it is killed, not
  deleted, so it can be easily yanked back if desired).
* Search term defaults to region or line, and always queries for
  confirmation.

Non-Interactively:
* Runs synchronously,
* Only insert if INSERT is non-nil,
* Search term is an argument without confirmation.

\(fn TERM &optional INSERT)" t nil)

(autoload 'google-lucky-search "../plugin/google-this" "\
Exactly like `google-search', but uses the \"I'm feeling lucky\" option.

\(fn PREFIX)" t nil)

(autoload 'google-string "../plugin/google-this" "\
Google given TEXT, but ask the user first if NOCONFIRM is nil.

\(fn PREFIX &optional TEXT NOCONFIRM)" nil nil)

(autoload 'google-line "../plugin/google-this" "\
Google the current line.

\(fn PREFIX)" t nil)

(autoload 'google-word "../plugin/google-this" "\
Google the current word.

\(fn PREFIX)" t nil)

(autoload 'google-symbol "../plugin/google-this" "\
Google the current symbol.

\(fn PREFIX)" t nil)

(autoload 'google-region "../plugin/google-this" "\
Google the current region.

\(fn PREFIX)" t nil)

(autoload 'google-this "../plugin/google-this" "\
Automatically decide what the user wants to google (always something under point).

Unlike `google-search' (which presents an empty prompt with
\"this\" as the default value), this function inserts the query
in the minibuffer to be edited.

\(fn PREFIX)" t nil)

(autoload 'google-error "../plugin/google-this" "\
Google the current error in the compilation buffer.

\(fn PREFIX)" t nil)

(autoload 'google-this-clean-error-string "../plugin/google-this" "\
Parse error strings and turn them into googleable strings.

Removes unhelpful details like file names and line numbers from
simple error strings (such as c-like erros).

Uses replacements in `google-error-regexp' and stops at the first match.

\(fn S)" t nil)

(autoload 'google-cpp-reference "../plugin/google-this" "\
Visit the most probable cppreference.com page for this word.

\(fn)" t nil)

(autoload 'google-forecast "../plugin/google-this" "\
Just searches google for \"weather\".

\(fn PREFIX)" t nil)

(defvar google-this-mode nil "\
Non-nil if Google-This mode is enabled.
See the command `google-this-mode' for a description of this minor mode.")

(custom-autoload 'google-this-mode "../plugin/google-this" nil)

(autoload 'google-this-mode "../plugin/google-this" "\
Toggle Google-This mode on or off.
With a prefix argument ARG, enable Google-This mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{google-this-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/grep-a-lot" "../plugin/grep-a-lot.el"
;;;;;;  (22026 35731 162049 996000))
;;; Generated autoloads from ../plugin/grep-a-lot.el

(autoload 'grep-a-lot-advise "../plugin/grep-a-lot" "\
Advise a grep-like function FUNC with an around-type advice,
so as to enable multiple search results buffers.

\(fn FUNC)" nil t)

(autoload 'grep-a-lot-setup-keys "../plugin/grep-a-lot" "\
Define some key bindings for navigating multiple
grep search results buffers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/gtags" "../plugin/gtags.el" (22026
;;;;;;  35731 163049 996000))
;;; Generated autoloads from ../plugin/gtags.el

(autoload 'gtags-mode "../plugin/gtags" "\
Toggle Gtags mode, a minor mode for browsing source code using GLOBAL.

Specify the root directory of project.
	\\[gtags-visit-rootdir]
Input tag name and move to the definition.
	\\[gtags-find-tag]
Input tag name and move to the definition in other window.
        \\[gtags-find-tag-other-window]
Input tag name and move to the referenced point.
	\\[gtags-find-rtag]
Input symbol and move to the locations.
	\\[gtags-find-symbol]
Input pattern, search with grep(1) and move to the locations.
	\\[gtags-find-with-grep]
Input pattern, search with idutils(1) and move to the locations.
	\\[gtags-find-with-idutils]
Input pattern and move to the top of the file.
	\\[gtags-find-file]
Get the expression as a tagname around here and move there.
	\\[gtags-find-tag-from-here]
Display current screen on hypertext browser.
	\\[gtags-display-browser]
Get the expression as a tagname around here and move there.
	\\[gtags-find-tag-by-event]
Move to previous point on the stack.
	\\[gtags-pop-stack]

Key definitions:
\\{gtags-mode-map}
Turning on Gtags mode calls the value of the variable `gtags-mode-hook'
with no args, if that value is non-nil.

\(fn &optional FORCES)" t nil)

;;;***

;;;### (autoloads nil "../plugin/header2" "../plugin/header2.el"
;;;;;;  (22026 35731 164049 996000))
;;; Generated autoloads from ../plugin/header2.el

(autoload 'make-header "../plugin/header2" "\
Insert (mode-dependent) header comment at beginning of file.
A header is composed of a mode line, a body, and an end line.  The body is
constructed by calling the functions in `make-header-hook'.  The mode line
and end lines start and terminate block comments.  The body lines continue
the comment.

\(fn)" t nil)

(autoload 'make-revision "../plugin/header2" "\
Prepare for a new history revision.  Insert history line if inexistant.

\(fn)" t nil)

(autoload 'make-divider "../plugin/header2" "\
Insert a comment divider line: the comment start, filler, and end.
END-COL is the last column of the divider line.

\(fn &optional END-COL)" t nil)

(autoload 'make-box-comment "../plugin/header2" "\
Insert an empty (mode dependent) box comment.
END-COL is the last column of the divider line.

\(fn &optional END-COL)" t nil)

(autoload 'update-file-header "../plugin/header2" "\
Update file header.
Search the first `header-max' chars in buffer using regexps in
`file-header-update-alist'.  When a match is found, apply the
corresponding function with point located just after the match.
The functions can use `match-beginning' and `match-end' to find
the strings that cause them to be invoked.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm-pydoc" "../plugin/helm-pydoc.el"
;;;;;;  (22026 35731 164049 996000))
;;; Generated autoloads from ../plugin/helm-pydoc.el

(autoload 'helm-pydoc "../plugin/helm-pydoc" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm" "../plugin/helm/helm.el"
;;;;;;  (22026 35731 181049 996000))
;;; Generated autoloads from ../plugin/helm/helm.el

(autoload 'helm-define-multi-key "../plugin/helm/helm" "\
In KEYMAP, define key sequence KEY for function list FUNCTIONS.
Each function run sequentialy each time the key KEY is pressed.
If DELAY is specified switch back to initial function of FUNCTIONS list
after DELAY seconds.
The functions in FUNCTIONS list are functions with no args.
e.g
  (defun foo ()
    (message \"Run foo\"))
  (defun bar ()
    (message \"Run bar\"))
  (defun baz ()
    (message \"Run baz\"))

\(helm-define-multi-key global-map \"<f5> q\" '(foo bar baz) 2)

Each time \"<f5> q\" is pressed the next function is executed, if you wait
More than 2 seconds, next hit will run again the first function and so on.

\(fn KEYMAP KEY FUNCTIONS &optional DELAY)" nil nil)

(autoload 'helm-open-last-log "../plugin/helm/helm" "\
Open helm log file of last helm session.
If `helm-last-log-file' is nil, switch to `helm-debug-buffer' .

\(fn)" t nil)

(autoload 'helm-resume "../plugin/helm/helm" "\
Resurrect previously invoked `helm'.
Called with a prefix arg, allow choosing among all existing
helm buffers.  i.e choose among various helm sessions.
Called from lisp, you can specify a buffer-name as a string with ARG.

\(fn ARG)" t nil)

(autoload 'helm-resume-previous-session-after-quit "../plugin/helm/helm" "\
Resume previous helm session within running helm.

\(fn)" t nil)

(autoload 'helm-other-buffer "../plugin/helm/helm" "\
Simplified interface of `helm' with other `helm-buffer'.
Call `helm' with only ANY-SOURCES and ANY-BUFFER as args.

\(fn ANY-SOURCES ANY-BUFFER)" nil nil)

(autoload 'helm-toggle-suspend-update "../plugin/helm/helm" "\
Enable or disable update of display in helm.
This can be useful for e.g writing quietly a complex regexp.

\(fn)" t nil)

(autoload 'helm-force-update "../plugin/helm/helm" "\
Force recalculation and update of candidates.
The difference with `helm-update' is this function is reevaling
the `init' and `update' attributes functions when present
before updating candidates according to pattern i.e calling `helm-update'.
Selection is preserved to current candidate or moved to PRESELECT
if specified.

\(fn &optional PRESELECT)" t nil)

(autoload 'helm-select-action "../plugin/helm/helm" "\
Select an action for the currently selected candidate.
If action buffer is selected, back to the helm buffer.

\(fn)" t nil)

(autoload 'helm-previous-line "../plugin/helm/helm" "\
Move selection to the previous line.

\(fn)" t nil)

(autoload 'helm-next-line "../plugin/helm/helm" "\
Move selection to the next line.

\(fn)" t nil)

(autoload 'helm-previous-page "../plugin/helm/helm" "\
Move selection back with a pageful.

\(fn)" t nil)

(autoload 'helm-next-page "../plugin/helm/helm" "\
Move selection forward with a pageful.

\(fn)" t nil)

(autoload 'helm-beginning-of-buffer "../plugin/helm/helm" "\
Move selection at the top.

\(fn)" t nil)

(autoload 'helm-end-of-buffer "../plugin/helm/helm" "\
Move selection at the bottom.

\(fn)" t nil)

(autoload 'helm-previous-source "../plugin/helm/helm" "\
Move selection to the previous source.

\(fn)" t nil)

(autoload 'helm-next-source "../plugin/helm/helm" "\
Move selection to the next source.

\(fn)" t nil)

(autoload 'helm-confirm-and-exit-minibuffer "../plugin/helm/helm" "\
Maybe ask for confirmation when exiting helm.
It is similar to `minibuffer-complete-and-exit' adapted to helm.
If `minibuffer-completion-confirm' value is 'confirm,
send in minibuffer confirm message and exit on next hit.
If `minibuffer-completion-confirm' value is t,
don't exit and send message 'no match'.

\(fn)" t nil)

(autoload 'helm-exit-minibuffer "../plugin/helm/helm" "\
Select the current candidate by exiting the minibuffer.

\(fn)" t nil)

(autoload 'helm-keyboard-quit "../plugin/helm/helm" "\
Quit minibuffer in helm.
If action buffer is displayed, kill it.

\(fn)" t nil)

(autoload 'helm-debug-output "../plugin/helm/helm" "\
Show all helm-related variables at this time.

\(fn)" t nil)

(autoload 'helm-delete-current-selection "../plugin/helm/helm" "\
Delete the currently selected item.

\(fn)" t nil)

(autoload 'helm-delete-minibuffer-contents "../plugin/helm/helm" "\
Delete minibuffer contents.
When called with a prefix arg or when
`helm-delete-minibuffer-contents-from-point' is non--nil,
delete minibuffer contents from point instead of deleting all.

\(fn &optional ARG)" t nil)

(autoload 'helm-toggle-resplit-window "../plugin/helm/helm" "\
Toggle resplit helm window, vertically or horizontally.

\(fn)" t nil)

(autoload 'helm-narrow-window "../plugin/helm/helm" "\
Narrow helm window.

\(fn)" t nil)

(autoload 'helm-enlarge-window "../plugin/helm/helm" "\
Enlarge helm window.

\(fn)" t nil)

(autoload 'helm-swap-windows "../plugin/helm/helm" "\
Swap window holding `helm-buffer' with other window.

\(fn)" t nil)

(autoload 'helm-select-2nd-action "../plugin/helm/helm" "\
Select the 2nd action for the currently selected candidate.

\(fn)" t nil)

(autoload 'helm-select-3rd-action "../plugin/helm/helm" "\
Select the 3rd action for the currently selected candidate.

\(fn)" t nil)

(autoload 'helm-select-4th-action "../plugin/helm/helm" "\
Select the 4th action for the currently selected candidate.

\(fn)" t nil)

(autoload 'helm-select-2nd-action-or-end-of-line "../plugin/helm/helm" "\
Select the 2nd action for the currently selected candidate.
This happen when point is at the end of minibuffer.
Otherwise goto the end of minibuffer.

\(fn)" t nil)

(autoload 'helm-execute-persistent-action "../plugin/helm/helm" "\
Perform the associated action ATTR without quitting helm.
ATTR default is 'persistent-action', but it can be anything else.
In this case you have to add this new attribute to your source.

When `helm-full-frame' or SPLIT-ONEWINDOW are non--nil,
and `helm-buffer' is displayed in only one window,
the helm window is splitted to display
`helm-select-persistent-action-window' in other window 
and keep its visibility.

\(fn &optional (attr (quote persistent-action)) SPLIT-ONEWINDOW)" t nil)

(autoload 'helm-scroll-other-window "../plugin/helm/helm" "\
Scroll other window (not *Helm* window) upward.

\(fn)" t nil)

(autoload 'helm-scroll-other-window-down "../plugin/helm/helm" "\
Scroll other window (not *Helm* window) downward.

\(fn)" t nil)

(autoload 'helm-recenter-top-bottom-other-window "../plugin/helm/helm" "\
`recenter-top-bottom' in other window (not *Helm* window).

\(fn)" t nil)

(autoload 'helm-reposition-window-other-window "../plugin/helm/helm" "\
`helm-reposition-window' in other window (not *Helm* window).

\(fn)" t nil)

(autoload 'helm-toggle-visible-mark "../plugin/helm/helm" "\
Toggle helm visible mark at point.

\(fn)" t nil)

(autoload 'helm-mark-all "../plugin/helm/helm" "\
Mark all visible unmarked candidates in current source.

\(fn)" t nil)

(autoload 'helm-unmark-all "../plugin/helm/helm" "\
Unmark all candidates in all sources of current helm session.

\(fn)" t nil)

(autoload 'helm-toggle-all-marks "../plugin/helm/helm" "\
Toggle all marks.
Mark all visible candidates of current source or unmark all candidates
visible or invisible in all sources of current helm session

\(fn)" t nil)

(autoload 'helm-display-all-visible-marks "../plugin/helm/helm" "\
Show all `helm' visible marks strings.
Only useful for debugging.

\(fn)" t nil)

(autoload 'helm-next-visible-mark "../plugin/helm/helm" "\
Move next helm visible mark.
If PREV is non-nil move to precedent.

\(fn &optional PREV)" t nil)

(autoload 'helm-prev-visible-mark "../plugin/helm/helm" "\
Move previous helm visible mark.

\(fn)" t nil)

(autoload 'helm-yank-selection "../plugin/helm/helm" "\
Set minibuffer contents to current selection.

\(fn)" t nil)

(autoload 'helm-kill-selection-and-quit "../plugin/helm/helm" "\
Store current selection to kill ring.
You can paste it by typing \\[yank].

\(fn)" t nil)

(autoload 'helm-follow-mode "../plugin/helm/helm" "\
Execute persistent action everytime the cursor is moved when enabled.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-adaptative" "../plugin/helm/helm-adaptative.el"
;;;;;;  (22026 35731 166049 996000))
;;; Generated autoloads from ../plugin/helm/helm-adaptative.el

(autoload 'helm-c-reset-adaptative-history "../plugin/helm/helm-adaptative" "\
Delete all `helm-c-adaptive-history' and his file.
Useful when you have a old or corrupted `helm-c-adaptive-history-file'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-apt" "../plugin/helm/helm-apt.el"
;;;;;;  (22026 35731 166049 996000))
;;; Generated autoloads from ../plugin/helm/helm-apt.el

(autoload 'helm-apt "../plugin/helm/helm-apt" "\
Preconfigured `helm' : frontend of APT package manager.
With a prefix arg reload cache.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-bbdb" "../plugin/helm/helm-bbdb.el"
;;;;;;  (22026 35731 166049 996000))
;;; Generated autoloads from ../plugin/helm/helm-bbdb.el

(autoload 'helm-bbdb "../plugin/helm/helm-bbdb" "\
Preconfigured `helm' for BBDB.

Needs BBDB.

http://bbdb.sourceforge.net/

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-bmkext" "../plugin/helm/helm-bmkext.el"
;;;;;;  (22026 35731 166049 996000))
;;; Generated autoloads from ../plugin/helm/helm-bmkext.el

(autoload 'helm-c-bmkext-run-edit "../plugin/helm/helm-bmkext" "\
Run `bmkext-edit-bookmark' from keyboard.

\(fn)" t nil)

(autoload 'helm-bookmark-ext "../plugin/helm/helm-bmkext" "\
Preconfigured `helm' for bookmark-extensions sources.
Needs bookmark-ext.el:
<http://mercurial.intuxication.org/hg/emacs-bookmark-extension>.
Contain also `helm-c-source-google-suggest'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-bookmark" "../plugin/helm/helm-bookmark.el"
;;;;;;  (22026 35731 167049 996000))
;;; Generated autoloads from ../plugin/helm/helm-bookmark.el

(autoload 'helm-c-bookmark-run-jump-other-window "../plugin/helm/helm-bookmark" "\
Jump to bookmark from keyboard.

\(fn)" t nil)

(autoload 'helm-c-bookmark-run-delete "../plugin/helm/helm-bookmark" "\
Delete bookmark from keyboard.

\(fn)" t nil)

(autoload 'helm-bookmarks "../plugin/helm/helm-bookmark" "\
Preconfigured `helm' for bookmarks.

\(fn)" t nil)

(autoload 'helm-c-pp-bookmarks "../plugin/helm/helm-bookmark" "\
Preconfigured `helm' for bookmarks (pretty-printed).

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-buffers" "../plugin/helm/helm-buffers.el"
;;;;;;  (22026 35731 167049 996000))
;;; Generated autoloads from ../plugin/helm/helm-buffers.el

(autoload 'helm-buffer-diff-persistent "../plugin/helm/helm-buffers" "\
Toggle diff buffer without quitting helm.

\(fn)" t nil)

(autoload 'helm-buffer-revert-persistent "../plugin/helm/helm-buffers" "\
Revert buffer without quitting helm.

\(fn)" t nil)

(autoload 'helm-buffer-save-persistent "../plugin/helm/helm-buffers" "\
Save buffer without quitting helm.

\(fn)" t nil)

(autoload 'helm-buffer-run-kill-buffers "../plugin/helm/helm-buffers" "\
Run kill buffer action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffer-run-grep "../plugin/helm/helm-buffers" "\
Run Grep action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffer-run-zgrep "../plugin/helm/helm-buffers" "\
Run Grep action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffer-run-query-replace-regexp "../plugin/helm/helm-buffers" "\
Run Query replace regexp action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffer-run-query-replace "../plugin/helm/helm-buffers" "\
Run Query replace action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffer-switch-other-window "../plugin/helm/helm-buffers" "\
Run switch to other window action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffer-switch-other-frame "../plugin/helm/helm-buffers" "\
Run switch to other frame action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffer-switch-to-elscreen "../plugin/helm/helm-buffers" "\
Run switch to elscreen  action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffer-run-ediff "../plugin/helm/helm-buffers" "\
Run ediff action from `helm-c-source-buffers-list'.

\(fn)" t nil)

(autoload 'helm-buffers-run-multi-occur "../plugin/helm/helm-buffers" "\
Run `helm-multi-occur-as-action' by key.

\(fn)" t nil)

(autoload 'helm-buffers-list "../plugin/helm/helm-buffers" "\
Preconfigured `helm' to list buffers.
It is an enhanced version of `helm-for-buffers'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-call-tree" "../plugin/helm/helm-call-tree.el"
;;;;;;  (22026 35731 167049 996000))
;;; Generated autoloads from ../plugin/helm/helm-call-tree.el

(autoload 'helm-simple-call-tree "../plugin/helm/helm-call-tree" "\
Preconfigured `helm' for simple-call-tree. List function relationships.

Needs simple-call-tree.el.
http://www.emacswiki.org/cgi-bin/wiki/download/simple-call-tree.el

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-color" "../plugin/helm/helm-color.el"
;;;;;;  (22026 35731 168049 996000))
;;; Generated autoloads from ../plugin/helm/helm-color.el

(autoload 'helm-colors "../plugin/helm/helm-color" "\
Preconfigured `helm' for color.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-command" "../plugin/helm/helm-command.el"
;;;;;;  (22026 35731 168049 996000))
;;; Generated autoloads from ../plugin/helm/helm-command.el

(autoload 'helm-M-x "../plugin/helm/helm-command" "\
Preconfigured `helm' for Emacs commands.
It is `helm' replacement of regular `M-x' `execute-extended-command'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-config" "../plugin/helm/helm-config.el"
;;;;;;  (22026 35731 169049 996000))
;;; Generated autoloads from ../plugin/helm/helm-config.el

(autoload 'helm-configuration "../plugin/helm/helm-config" "\
Customize `helm'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-elisp" "../plugin/helm/helm-elisp.el"
;;;;;;  (22026 35731 169049 996000))
;;; Generated autoloads from ../plugin/helm/helm-elisp.el

(autoload 'helm-lisp-completion-at-point "../plugin/helm/helm-elisp" "\
Helm lisp symbol completion at point.

\(fn)" t nil)

(autoload 'helm-c-complete-file-name-at-point "../plugin/helm/helm-elisp" "\
Complete file name at point.

\(fn &optional FORCE)" t nil)

(autoload 'helm-lisp-indent "../plugin/helm/helm-elisp" "\


\(fn)" t nil)

(autoload 'helm-lisp-completion-or-file-name-at-point "../plugin/helm/helm-elisp" "\
Complete lisp symbol or filename at point.
Filename completion happen if string start after or between a double quote.

\(fn)" t nil)

(autoload 'helm-c-apropos "../plugin/helm/helm-elisp" "\
Preconfigured helm to describe commands, functions, variables and faces.

\(fn)" t nil)

(autoload 'helm-manage-advice "../plugin/helm/helm-elisp" "\
Preconfigured `helm' to disable/enable function advices.

\(fn)" t nil)

(autoload 'helm-timers "../plugin/helm/helm-elisp" "\
Preconfigured `helm' for timers.

\(fn)" t nil)

(autoload 'helm-complex-command-history "../plugin/helm/helm-elisp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-elscreen" "../plugin/helm/helm-elscreen.el"
;;;;;;  (22026 35731 169049 996000))
;;; Generated autoloads from ../plugin/helm/helm-elscreen.el

(autoload 'helm-elscreen "../plugin/helm/helm-elscreen" "\
Preconfigured helm to list elscreen.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-emms" "../plugin/helm/helm-emms.el"
;;;;;;  (22026 35731 169049 996000))
;;; Generated autoloads from ../plugin/helm/helm-emms.el

(autoload 'helm-emms "../plugin/helm/helm-emms" "\
Preconfigured `helm' for emms sources.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-eshell" "../plugin/helm/helm-eshell.el"
;;;;;;  (22026 35731 169049 996000))
;;; Generated autoloads from ../plugin/helm/helm-eshell.el

(autoload 'helm-esh-pcomplete "../plugin/helm/helm-eshell" "\
Preconfigured helm to provide helm completion in eshell.

\(fn)" t nil)

(autoload 'helm-eshell-history "../plugin/helm/helm-eshell" "\
Preconfigured helm for eshell history.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-eval" "../plugin/helm/helm-eval.el"
;;;;;;  (22026 35731 170049 996000))
;;; Generated autoloads from ../plugin/helm/helm-eval.el

(autoload 'helm-eval-expression "../plugin/helm/helm-eval" "\
Preconfigured helm for `helm-c-source-evaluation-result'.

\(fn ARG)" t nil)

(autoload 'helm-eval-expression-with-eldoc "../plugin/helm/helm-eval" "\
Preconfigured helm for `helm-c-source-evaluation-result' with `eldoc' support. 

\(fn)" t nil)

(autoload 'helm-calcul-expression "../plugin/helm/helm-eval" "\
Preconfigured helm for `helm-c-source-calculation-result'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-external" "../plugin/helm/helm-external.el"
;;;;;;  (22026 35731 170049 996000))
;;; Generated autoloads from ../plugin/helm/helm-external.el

(autoload 'helm-c-run-external-command "../plugin/helm/helm-external" "\
Preconfigured `helm' to run External PROGRAM asyncronously from Emacs.
If program is already running exit with error.
You can set your own list of commands with
`helm-c-external-commands-list'.

\(fn PROGRAM)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-files" "../plugin/helm/helm-files.el"
;;;;;;  (22026 35731 171049 996000))
;;; Generated autoloads from ../plugin/helm/helm-files.el

(autoload 'helm-ff-run-toggle-auto-update "../plugin/helm/helm-files" "\


\(fn)" t nil)

(autoload 'helm-ff-run-switch-to-history "../plugin/helm/helm-files" "\
Run Switch to history action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-grep "../plugin/helm/helm-files" "\
Run Grep action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-pdfgrep "../plugin/helm/helm-files" "\
Run Pdfgrep action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-zgrep "../plugin/helm/helm-files" "\
Run Grep action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-copy-file "../plugin/helm/helm-files" "\
Run Copy file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-rename-file "../plugin/helm/helm-files" "\
Run Rename file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-byte-compile-file "../plugin/helm/helm-files" "\
Run Byte compile file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-load-file "../plugin/helm/helm-files" "\
Run Load file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-eshell-command-on-file "../plugin/helm/helm-files" "\
Run eshell command on file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-ediff-file "../plugin/helm/helm-files" "\
Run Ediff file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-ediff-merge-file "../plugin/helm/helm-files" "\
Run Ediff merge file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-symlink-file "../plugin/helm/helm-files" "\
Run Symlink file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-hardlink-file "../plugin/helm/helm-files" "\
Run Hardlink file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-delete-file "../plugin/helm/helm-files" "\
Run Delete file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-complete-fn-at-point "../plugin/helm/helm-files" "\
Run complete file name action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-switch-to-eshell "../plugin/helm/helm-files" "\
Run switch to eshell action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-switch-other-window "../plugin/helm/helm-files" "\
Run switch to other window action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-switch-other-frame "../plugin/helm/helm-files" "\
Run switch to other frame action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-open-file-externally "../plugin/helm/helm-files" "\
Run open file externally command action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-open-file-with-default-tool "../plugin/helm/helm-files" "\
Run open file externally command action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-locate "../plugin/helm/helm-files" "\
Run locate action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-find-file-as-root "../plugin/helm/helm-files" "\


\(fn)" t nil)

(autoload 'helm-ff-run-gnus-attach-files "../plugin/helm/helm-files" "\
Run gnus attach files command action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-etags "../plugin/helm/helm-files" "\
Run Etags command action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-print-file "../plugin/helm/helm-files" "\
Run Print file action from `helm-c-source-find-files'.

\(fn)" t nil)

(autoload 'helm-ff-run-toggle-basename "../plugin/helm/helm-files" "\


\(fn)" t nil)

(autoload 'helm-find-files-down-one-level "../plugin/helm/helm-files" "\
Go down one level like unix command `cd ..'.
If prefix numeric arg is given go ARG level down.

\(fn ARG)" t nil)

(autoload 'helm-ff-properties-persistent "../plugin/helm/helm-files" "\
Show properties without quitting helm.

\(fn)" t nil)

(autoload 'helm-ff-persistent-delete "../plugin/helm/helm-files" "\
Delete current candidate without quitting.

\(fn)" t nil)

(autoload 'helm-ff-run-kill-buffer-persistent "../plugin/helm/helm-files" "\
Execute `helm-ff-kill-buffer-fname' whitout quitting.

\(fn)" t nil)

(autoload 'helm-ff-rotate-left-persistent "../plugin/helm/helm-files" "\
Rotate image left without quitting helm.

\(fn)" t nil)

(autoload 'helm-ff-rotate-right-persistent "../plugin/helm/helm-files" "\
Rotate image right without quitting helm.

\(fn)" t nil)

(defvar helm-dired-mode nil "\
Non-nil if Helm-Dired mode is enabled.
See the command `helm-dired-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-dired-mode'.")

(custom-autoload 'helm-dired-mode "../plugin/helm/helm-files" nil)

(autoload 'helm-dired-mode "../plugin/helm/helm-files" "\
Enable helm completion in Dired functions.
Bindings affected are C, R, S, H.
This is deprecated for Emacs24+ users, use `helm-mode' instead.

\(fn &optional ARG)" t nil)

(autoload 'helm-find "../plugin/helm/helm-files" "\
Preconfigured `helm' for the find shell command.

\(fn ARG)" t nil)

(autoload 'helm-find-files "../plugin/helm/helm-files" "\
Preconfigured `helm' for helm implementation of `find-file'.
Called with a prefix arg show history if some.
Don't call it from programs, use `helm-find-files-1' instead.
This is the starting point for nearly all actions you can do on files.

\(fn ARG)" t nil)

(autoload 'helm-write-file "../plugin/helm/helm-files" "\
Preconfigured `helm' providing completion for `write-file'.

\(fn)" t nil)

(autoload 'helm-insert-file "../plugin/helm/helm-files" "\
Preconfigured `helm' providing completion for `insert-file'.

\(fn)" t nil)

(autoload 'helm-dired-rename-file "../plugin/helm/helm-files" "\
Preconfigured `helm' to rename files from dired.

\(fn)" t nil)

(autoload 'helm-dired-copy-file "../plugin/helm/helm-files" "\
Preconfigured `helm' to copy files from dired.

\(fn)" t nil)

(autoload 'helm-dired-symlink-file "../plugin/helm/helm-files" "\
Preconfigured `helm' to symlink files from dired.

\(fn)" t nil)

(autoload 'helm-dired-hardlink-file "../plugin/helm/helm-files" "\
Preconfigured `helm' to hardlink files from dired.

\(fn)" t nil)

(autoload 'helm-for-files "../plugin/helm/helm-files" "\
Preconfigured `helm' for opening files.
Run all sources defined in `helm-for-files-preferred-list'.

\(fn)" t nil)

(autoload 'helm-recentf "../plugin/helm/helm-files" "\
Preconfigured `helm' for `recentf'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-firefox" "../plugin/helm/helm-firefox.el"
;;;;;;  (22026 35731 172049 996000))
;;; Generated autoloads from ../plugin/helm/helm-firefox.el

(autoload 'helm-firefox-bookmarks "../plugin/helm/helm-firefox" "\
Preconfigured `helm' for firefox bookmark.
You will have to enable html bookmarks in firefox:
open about:config in firefox and double click on this line to enable value to true:

user_pref(\"browser.bookmarks.autoExportHTML\", false);

You should have now:

user_pref(\"browser.bookmarks.autoExportHTML\", true);

After closing firefox, you will be able to browse you bookmarks.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-font" "../plugin/helm/helm-font.el"
;;;;;;  (22026 35731 172049 996000))
;;; Generated autoloads from ../plugin/helm/helm-font.el

(autoload 'helm-select-xfont "../plugin/helm/helm-font" "\
Preconfigured `helm' to select Xfont.

\(fn)" t nil)

(autoload 'helm-ucs "../plugin/helm/helm-font" "\
Preconfigured helm for `ucs-names' math symbols.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-gentoo" "../plugin/helm/helm-gentoo.el"
;;;;;;  (22026 35731 172049 996000))
;;; Generated autoloads from ../plugin/helm/helm-gentoo.el

(autoload 'helm-gentoo "../plugin/helm/helm-gentoo" "\
Preconfigured `helm' for gentoo linux.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-grep" "../plugin/helm/helm-grep.el"
;;;;;;  (22026 35731 173049 996000))
;;; Generated autoloads from ../plugin/helm/helm-grep.el

(autoload 'helm-c-goto-precedent-file "../plugin/helm/helm-grep" "\
Go to precedent file in helm grep/etags buffers.

\(fn)" t nil)

(autoload 'helm-c-goto-next-file "../plugin/helm/helm-grep" "\
Go to precedent file in helm grep/etags buffers.

\(fn)" t nil)

(autoload 'helm-c-grep-run-persistent-action "../plugin/helm/helm-grep" "\
Run grep persistent action from `helm-do-grep-1'.

\(fn)" t nil)

(autoload 'helm-c-grep-run-default-action "../plugin/helm/helm-grep" "\
Run grep default action from `helm-do-grep-1'.

\(fn)" t nil)

(autoload 'helm-c-grep-run-other-window-action "../plugin/helm/helm-grep" "\
Run grep goto other window action from `helm-do-grep-1'.

\(fn)" t nil)

(autoload 'helm-c-grep-run-save-buffer "../plugin/helm/helm-grep" "\
Run grep save results action from `helm-do-grep-1'.

\(fn)" t nil)

(autoload 'helm-grep-mode "../plugin/helm/helm-grep" "\
Major mode to provide actions in helm grep saved buffer.

Special commands:
\\{helm-grep-mode-map}

\(fn)" t nil)

(autoload 'helm-gm-next-file "../plugin/helm/helm-grep" "\


\(fn)" t nil)

(autoload 'helm-gm-precedent-file "../plugin/helm/helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-quit "../plugin/helm/helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-jump "../plugin/helm/helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-jump-other-window-forward "../plugin/helm/helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-jump-other-window-backward "../plugin/helm/helm-grep" "\


\(fn)" t nil)

(autoload 'helm-grep-mode-jump-other-window "../plugin/helm/helm-grep" "\


\(fn)" t nil)

(autoload 'helm-do-grep "../plugin/helm/helm-grep" "\
Preconfigured helm for grep.
Contrarily to Emacs `grep', no default directory is given, but
the full path of candidates in ONLY.
That allow to grep different files not only in `default-directory' but anywhere
by marking them (C-<SPACE>). If one or more directory is selected
grep will search in all files of these directories.
You can also use wildcard in the base name of candidate.
If a prefix arg is given use the -r option of grep (recurse).
The prefix arg can be passed before or after start file selection.
See also `helm-do-grep-1'.

\(fn)" t nil)

(autoload 'helm-do-zgrep "../plugin/helm/helm-grep" "\
Preconfigured helm for zgrep.

\(fn)" t nil)

(autoload 'helm-do-pdfgrep "../plugin/helm/helm-grep" "\
Preconfigured helm for pdfgrep.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-help" "../plugin/helm/helm-help.el"
;;;;;;  (22026 35731 173049 996000))
;;; Generated autoloads from ../plugin/helm/helm-help.el

(defvar helm-mode-line-string "\\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "\
Help string displayed in mode-line in `helm'.
It can be a string or a list of two args, in this case,
first arg is a string that will be used as name for candidates number,
second arg any string to display in mode line.
If nil, use default `mode-line-format'.")

(autoload 'helm-help "../plugin/helm/helm-help" "\
Help of `helm'.

\(fn)" t nil)

(autoload 'helm-c-buffer-help "../plugin/helm/helm-help" "\
Help command for helm buffers.

\(fn)" t nil)

(autoload 'helm-ff-help "../plugin/helm/helm-help" "\
Help command for `helm-find-files'.

\(fn)" t nil)

(autoload 'helm-read-file-name-help "../plugin/helm/helm-help" "\


\(fn)" t nil)

(autoload 'helm-generic-file-help "../plugin/helm/helm-help" "\


\(fn)" t nil)

(autoload 'helm-grep-help "../plugin/helm/helm-help" "\


\(fn)" t nil)

(autoload 'helm-pdfgrep-help "../plugin/helm/helm-help" "\


\(fn)" t nil)

(autoload 'helm-etags-help "../plugin/helm/helm-help" "\
The help function for etags.

\(fn)" t nil)

(autoload 'helm-c-ucs-help "../plugin/helm/helm-help" "\
Help command for `helm-ucs'.

\(fn)" t nil)

(autoload 'helm-c-bookmark-help "../plugin/helm/helm-help" "\
Help command for bookmarks.

\(fn)" t nil)

(autoload 'helm-esh-help "../plugin/helm/helm-help" "\
Help command for `helm-find-files-eshell-command-on-file'.

\(fn)" t nil)

(autoload 'helm-buffers-ido-virtual-help "../plugin/helm/helm-help" "\
Help command for ido virtual buffers.

\(fn)" t nil)

(autoload 'helm-moccur-help "../plugin/helm/helm-help" "\


\(fn)" t nil)

(defvar helm-buffer-mode-line-string '("Buffer(s)" "\\<helm-c-buffer-map>\\[helm-c-buffer-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "String displayed in mode-line in `helm-c-source-buffers-list'"))

(defvar helm-buffers-ido-virtual-mode-line-string '("Killed Buffer(s)" "\\<helm-buffers-ido-virtual-map>\\[helm-buffers-ido-virtual-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "String displayed in mode-line in `helm-c-source-buffers-list'"))

(defvar helm-ff-mode-line-string "\\<helm-find-files-map>\\[helm-ff-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "\
String displayed in mode-line in `helm-c-source-find-files'")

(defvar helm-read-file-name-mode-line-string "\\<helm-c-read-file-map>\\[helm-read-file-name-help]:Help \\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "\
String displayed in mode-line in `helm-c-source-find-files'.")

(defvar helm-generic-file-mode-line-string "\\<helm-generic-files-map>\\[helm-generic-file-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "\
String displayed in mode-line in Locate.")

(defvar helm-grep-mode-line-string "\\<helm-c-grep-map>\\[helm-grep-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "\
String displayed in mode-line in `helm-do-grep'.")

(defvar helm-pdfgrep-mode-line-string "\\<helm-c-pdfgrep-map>\\[helm-pdfgrep-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "\
String displayed in mode-line in `helm-do-pdfgrep'.")

(defvar helm-etags-mode-line-string "\\<helm-c-etags-map>\\[helm-etags-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "\
String displayed in mode-line in `helm-c-etags-select'.")

(defvar helm-c-ucs-mode-line-string "\\<helm-c-ucs-map>\\[helm-c-ucs-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "\
String displayed in mode-line in `helm-ucs'.")

(defvar helm-bookmark-mode-line-string '("Bookmark(s)" "\\<helm-c-bookmark-map>\\[helm-c-bookmark-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct") "\
String displayed in mode-line in `helm-c-source-buffers-list'")

(defvar helm-occur-mode-line "\\<helm-map>\\[helm-help]:Help \\<helm-occur-map>\\[helm-occur-run-query-replace-regexp]:Query replace regexp \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-moccur-mode-line "\\<helm-c-moccur-map>\\[helm-moccur-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-comp-read-mode-line "\\<helm-comp-read-map>\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct")

(autoload 'helm-describe-helm-attribute "../plugin/helm/helm-help" "\
Display the full documentation of HELM-ATTRIBUTE.
HELM-ATTRIBUTE should be a symbol.

\(fn HELM-ATTRIBUTE)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-imenu" "../plugin/helm/helm-imenu.el"
;;;;;;  (22026 35731 174049 996000))
;;; Generated autoloads from ../plugin/helm/helm-imenu.el

(autoload 'helm-imenu "../plugin/helm/helm-imenu" "\
Preconfigured `helm' for `imenu'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-info" "../plugin/helm/helm-info.el"
;;;;;;  (22026 35731 174049 996000))
;;; Generated autoloads from ../plugin/helm/helm-info.el

(autoload 'helm-info-at-point "../plugin/helm/helm-info" "\
Preconfigured `helm' for searching info at point.
With a prefix-arg insert symbol at point.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-locate" "../plugin/helm/helm-locate.el"
;;;;;;  (22026 35731 174049 996000))
;;; Generated autoloads from ../plugin/helm/helm-locate.el

(autoload 'helm-locate "../plugin/helm/helm-locate" "\
Preconfigured `helm' for Locate.
Note: you can add locate options after entering pattern.
See 'man locate' for valid options.

You can specify a local database with prefix argument ARG.
With two prefix arg, refresh the current local db or create it
if it doesn't exists.
Many databases can be used: navigate and mark them.
See also `helm-locate-with-db'.

To create a user specific db, use
\"updatedb -l 0 -o db_path -U directory\".
Where db_path is a filename matched by
`helm-locate-db-file-regexp'.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-man" "../plugin/helm/helm-man.el"
;;;;;;  (22026 35731 174049 996000))
;;; Generated autoloads from ../plugin/helm/helm-man.el

(autoload 'helm-man-woman "../plugin/helm/helm-man" "\
Preconfigured `helm' for Man and Woman pages.
With a prefix arg reinitialize the cache.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-match-plugin" "../plugin/helm/helm-match-plugin.el"
;;;;;;  (22026 35731 175049 996000))
;;; Generated autoloads from ../plugin/helm/helm-match-plugin.el

(defvar helm-match-plugin-mode nil "\
Non-nil if Helm-Match-Plugin mode is enabled.
See the command `helm-match-plugin-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-match-plugin-mode'.")

(custom-autoload 'helm-match-plugin-mode "../plugin/helm/helm-match-plugin" nil)

(autoload 'helm-match-plugin-mode "../plugin/helm/helm-match-plugin" "\
Add more flexible regexp matching for helm.
See `helm-mp-matching-method' for the behavior of each method.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-misc" "../plugin/helm/helm-misc.el"
;;;;;;  (22026 35731 175049 996000))
;;; Generated autoloads from ../plugin/helm/helm-misc.el

(autoload 'helm-world-time "../plugin/helm/helm-misc" "\
Preconfigured `helm' to show world time.

\(fn)" t nil)

(autoload 'helm-c-insert-latex-math "../plugin/helm/helm-misc" "\
Preconfigured helm for latex math symbols completion.

\(fn)" t nil)

(autoload 'helm-eev-anchors "../plugin/helm/helm-misc" "\
Preconfigured `helm' for eev anchors.

\(fn)" t nil)

(autoload 'helm-ratpoison-commands "../plugin/helm/helm-misc" "\
Preconfigured `helm' to execute ratpoison commands.

\(fn)" t nil)

(autoload 'helm-stumpwm-commands "../plugin/helm/helm-misc" "\


\(fn)" t nil)

(autoload 'helm-mini "../plugin/helm/helm-misc" "\
Preconfigured `helm' lightweight version (buffer -> recentf).

\(fn)" t nil)

(autoload 'helm-minibuffer-history "../plugin/helm/helm-misc" "\
Preconfigured `helm' for `minibuffer-history'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-mode" "../plugin/helm/helm-mode.el"
;;;;;;  (22026 35731 176049 996000))
;;; Generated autoloads from ../plugin/helm/helm-mode.el

(autoload 'helm-cr-empty-string "../plugin/helm/helm-mode" "\
Return empty string.

\(fn)" t nil)

(autoload 'helm-comp-read "../plugin/helm/helm-mode" "\
Read a string in the minibuffer, with helm completion.

It is helm `completing-read' equivalent.

- PROMPT is the prompt name to use.

- COLLECTION can be a list, vector, obarray or hash-table.
  It can be also a function that receives three arguments:
  the values string, predicate and t. See `all-completions' for more details.

Keys description:

- TEST: A predicate called with one arg i.e candidate.

- INITIAL-INPUT: Same as input arg in `helm'.

- PRESELECT: See preselect arg of `helm'.

- DEFAULT: This option is used only for compatibility with regular
  Emacs `completing-read' (Same as DEFAULT arg of `completing-read').

- BUFFER: Name of helm-buffer.

- MUST-MATCH: Candidate selected must be one of COLLECTION.

- REQUIRES-PATTERN: Same as helm attribute, default is 0.

- HISTORY: A list containing specific history, default is nil.
  When it is non--nil, all elements of HISTORY are displayed in
  a special source before COLLECTION.

- INPUT-HISTORY: A symbol. the minibuffer input history will be
  stored there, if nil or not provided, `minibuffer-history'
  will be used instead.

- CASE-FOLD: Same as `helm-case-fold-search'.

- DEL-INPUT: Boolean, when non--nil (default) remove the partial
  minibuffer input from HISTORY is present.

- PERSISTENT-ACTION: A function called with one arg i.e candidate.

- PERSISTENT-HELP: A string to document PERSISTENT-ACTION.

- MODE-LINE: A string or list to display in mode line.
  (See `helm-mode-line-string')

- KEYMAP: A keymap to use in this `helm-comp-read'.
  (The keymap will be shared with history source)

- NAME: The name related to this local source.

- EXEC-WHEN-ONLY-ONE: Bound `helm-execute-action-at-once-if-one'
  to non--nil. (possibles values are t or nil).

- VOLATILE: Use volatile attribute (enabled by default).

- SORT: A predicate to give to `sort' e.g `string-lessp'.

- FC-TRANSFORMER: A `filtered-candidate-transformer' function.

- MARKED-CANDIDATES: If non--nil return candidate or marked candidates as a list.

- ALISTP: (default is non--nil) See `helm-comp-read-get-candidates'.

- CANDIDATES-IN-BUFFER: when non--nil use a source build with
  `helm-candidates-in-buffer' which is much faster.
  Argument VOLATILE have no effect when CANDIDATES-IN-BUFFER is non--nil.

Any prefix args passed during `helm-comp-read' invocation will be recorded
in `helm-current-prefix-arg', otherwise if prefix args were given before
`helm-comp-read' invocation, the value of `current-prefix-arg' will be used.
That's mean you can pass prefix args before or after calling a command
that use `helm-comp-read' See `helm-M-x' for example.

\(fn PROMPT COLLECTION &key TEST INITIAL-INPUT DEFAULT PRESELECT (buffer \"*Helm Completions*\") MUST-MATCH (requires-pattern 0) (history nil) INPUT-HISTORY (case-fold helm-comp-read-case-fold-search) (del-input t) (persistent-action nil) (persistent-help \"DoNothing\") (mode-line helm-comp-read-mode-line) (keymap helm-comp-read-map) (name \"Helm Completions\") CANDIDATES-IN-BUFFER EXEC-WHEN-ONLY-ONE (volatile t) SORT (fc-transformer (quote helm-cr-default-transformer)) (marked-candidates nil) (alistp t))" nil nil)

(defvar helm-mode nil "\
Non-nil if Helm mode is enabled.
See the command `helm-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-mode'.")

(custom-autoload 'helm-mode "../plugin/helm/helm-mode" nil)

(autoload 'helm-mode "../plugin/helm/helm-mode" "\
Toggle generic helm completion.

All functions in Emacs that use `completing-read'
or `read-file-name' and friends will use helm interface
when this mode is turned on.
However you can modify this behavior for functions of your choice
with `helm-completing-read-handlers-alist'.

Called with a positive arg, turn on unconditionally, with a
negative arg turn off.
You can turn it on with `helm-mode'.

Some crap emacs functions may not be supported,
e.g `ffap-alternate-file' and maybe others
You can add such functions to `helm-completing-read-handlers-alist'
with a nil value.

Note: This mode will work only partially on Emacs23.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-net" "../plugin/helm/helm-net.el"
;;;;;;  (22026 35731 176049 996000))
;;; Generated autoloads from ../plugin/helm/helm-net.el

(autoload 'helm-surfraw "../plugin/helm/helm-net" "\
Preconfigured `helm' to search PATTERN with search ENGINE.

\(fn PATTERN ENGINE)" t nil)

(autoload 'helm-google-suggest "../plugin/helm/helm-net" "\
Preconfigured `helm' for google search with google suggest.

\(fn)" t nil)

(autoload 'helm-yahoo-suggest "../plugin/helm/helm-net" "\
Preconfigured `helm' for Yahoo searching with Yahoo suggest.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-org" "../plugin/helm/helm-org.el"
;;;;;;  (22026 35731 177049 996000))
;;; Generated autoloads from ../plugin/helm/helm-org.el

(autoload 'helm-org-keywords "../plugin/helm/helm-org" "\
Preconfigured `helm' for org keywords.

\(fn)" t nil)

(autoload 'helm-org-headlines "../plugin/helm/helm-org" "\
Preconfigured helm to show org headlines.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-regexp" "../plugin/helm/helm-regexp.el"
;;;;;;  (22026 35731 177049 996000))
;;; Generated autoloads from ../plugin/helm/helm-regexp.el

(autoload 'helm-regexp "../plugin/helm/helm-regexp" "\
Preconfigured helm to build regexps.
`query-replace-regexp' can be run from there against found regexp.

\(fn)" t nil)

(autoload 'helm-occur "../plugin/helm/helm-regexp" "\
Preconfigured helm for Occur.

\(fn)" t nil)

(autoload 'helm-multi-occur "../plugin/helm/helm-regexp" "\
Preconfigured helm for multi occur.

  BUFFERS is a list of buffers to search through.
With a prefix arg, force searching in current buffer
even if `helm-moccur-always-search-in-current' is nil.
The prefix arg can be set before calling `helm-multi-occur'
or during the buffer selection.

\(fn BUFFERS)" t nil)

(autoload 'helm-browse-code "../plugin/helm/helm-regexp" "\
Preconfigured helm to browse code.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-ring" "../plugin/helm/helm-ring.el"
;;;;;;  (22026 35731 177049 996000))
;;; Generated autoloads from ../plugin/helm/helm-ring.el

(autoload 'helm-mark-ring "../plugin/helm/helm-ring" "\
Preconfigured `helm' for `helm-c-source-mark-ring'.

\(fn)" t nil)

(autoload 'helm-global-mark-ring "../plugin/helm/helm-ring" "\
Preconfigured `helm' for `helm-c-source-global-mark-ring'.

\(fn)" t nil)

(autoload 'helm-all-mark-rings "../plugin/helm/helm-ring" "\
Preconfigured `helm' for `helm-c-source-global-mark-ring' and `helm-c-source-mark-ring'.

\(fn)" t nil)

(autoload 'helm-register "../plugin/helm/helm-ring" "\
Preconfigured `helm' for Emacs registers.

\(fn)" t nil)

(autoload 'helm-show-kill-ring "../plugin/helm/helm-ring" "\
Preconfigured `helm' for `kill-ring'.
It is drop-in replacement of `yank-pop'.

First call open the kill-ring browser, next calls move to next line.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-semantic" "../plugin/helm/helm-semantic.el"
;;;;;;  (22026 35731 178049 996000))
;;; Generated autoloads from ../plugin/helm/helm-semantic.el

(autoload 'helm-semantic "../plugin/helm/helm-semantic" "\
Preconfigured `helm' for `semantic'.

\(fn)" t nil)

(autoload 'helm-semantic-or-imenu "../plugin/helm/helm-semantic" "\
Run `helm' with `semantic' or `imenu'.

If `semantic-mode' is active in the current buffer, then use
semantic for generating tags, otherwise fall back to `imenu'.
Fill in the symbol at point by default.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-sys" "../plugin/helm/helm-sys.el"
;;;;;;  (22026 35731 178049 996000))
;;; Generated autoloads from ../plugin/helm/helm-sys.el

(autoload 'helm-top "../plugin/helm/helm-sys" "\
Preconfigured `helm' for top command.

\(fn)" t nil)

(autoload 'helm-list-emacs-process "../plugin/helm/helm-sys" "\
Preconfigured `helm' for emacs process.

\(fn)" t nil)

(autoload 'helm-xrandr-set "../plugin/helm/helm-sys" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-tags" "../plugin/helm/helm-tags.el"
;;;;;;  (22026 35731 178049 996000))
;;; Generated autoloads from ../plugin/helm/helm-tags.el

(autoload 'helm-c-etags-select "../plugin/helm/helm-tags" "\
Preconfigured helm for etags.
Called with one prefix arg use symbol at point as initial input.
Called with two prefix arg reinitialize cache.
If tag file have been modified reinitialize cache.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-utils" "../plugin/helm/helm-utils.el"
;;;;;;  (22026 35731 179049 996000))
;;; Generated autoloads from ../plugin/helm/helm-utils.el

(autoload 'helm-show-all-in-this-source-only "../plugin/helm/helm-utils" "\
Show only current source of this helm session with all its candidates.
With a numeric prefix arg show only the ARG number of candidates.

\(fn ARG)" t nil)

(autoload 'helm-display-all-sources "../plugin/helm/helm-utils" "\
Display all sources previously hidden by `helm-set-source-filter'.

\(fn)" t nil)

(autoload 'helm-quit-and-find-file "../plugin/helm/helm-utils" "\
Drop into `helm-find-files' from `helm'.
If current selection is a buffer or a file, `helm-find-files'
from its directory.

\(fn)" t nil)

(autoload 'helm-w32-shell-execute-open-file "../plugin/helm/helm-utils" "\


\(fn FILE)" t nil)

(autoload 'helm-yank-text-at-point "../plugin/helm/helm-utils" "\
Yank text at point in invocation buffer into minibuffer.

`helm-yank-symbol-first' controls whether the first yank grabs
the entire symbol.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-w3m" "../plugin/helm/helm-w3m.el"
;;;;;;  (22026 35731 179049 996000))
;;; Generated autoloads from ../plugin/helm/helm-w3m.el

(autoload 'helm-w3m-bookmarks "../plugin/helm/helm-w3m" "\
Preconfigured `helm' for w3m bookmark.

Needs w3m and emacs-w3m.

http://w3m.sourceforge.net/
http://emacs-w3m.namazu.org/

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/helm/helm-yaoddmuse" "../plugin/helm/helm-yaoddmuse.el"
;;;;;;  (22026 35731 179049 996000))
;;; Generated autoloads from ../plugin/helm/helm-yaoddmuse.el

(autoload 'helm-yaoddmuse-cache-pages "../plugin/helm/helm-yaoddmuse" "\
Fetch the list of files on emacswiki and create cache file.
If load is non--nil load the file and feed `yaoddmuse-pages-hash'.

\(fn &optional LOAD)" t nil)

(autoload 'helm-yaoddmuse-emacswiki-edit-or-view "../plugin/helm/helm-yaoddmuse" "\
Preconfigured `helm' to edit or view EmacsWiki page.

Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el

\(fn)" t nil)

(autoload 'helm-yaoddmuse-emacswiki-post-library "../plugin/helm/helm-yaoddmuse" "\
Preconfigured `helm' to post library to EmacsWiki.

Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/hexrgb" "../plugin/hexrgb.el" (22026
;;;;;;  35731 182049 996000))
;;; Generated autoloads from ../plugin/hexrgb.el

(eval-and-compile (defun hexrgb-canonicalize-defined-colors (list) "Copy of LIST with color names canonicalized.\nLIST is a list of color names (strings).\nCanonical names are lowercase, with no whitespace.\nThere are no duplicate names." (let ((tail list) this new) (while tail (setq this (car tail) this (hexrgb-delete-whitespace-from-string (downcase this) 0 (length this))) (unless (member this new) (push this new)) (pop tail)) (nreverse new))) (defun hexrgb-delete-whitespace-from-string (string &optional from to) "Remove whitespace from substring of STRING from FROM to TO.\nIf FROM is nil, then start at the beginning of STRING (FROM = 0).\nIf TO is nil, then end at the end of STRING (TO = length of STRING).\nFROM and TO are zero-based indexes into STRING.\nCharacter FROM is affected (possibly deleted).  Character TO is not." (setq from (or from 0) to (or to (length string))) (with-temp-buffer (insert string) (goto-char (+ from (point-min))) (let ((count from) char) (while (and (not (eobp)) (< count to)) (setq char (char-after)) (if (memq char '(32 9 10)) (delete-char 1) (forward-char 1)) (setq count (1+ count))) (buffer-string)))))

(defconst hexrgb-defined-colors (eval-when-compile (and window-system (x-defined-colors))) "\
List of all supported colors.")

(defconst hexrgb-defined-colors-no-dups (eval-when-compile (and window-system (hexrgb-canonicalize-defined-colors (x-defined-colors)))) "\
List of all supported color names, with no duplicates.
Names are all lowercase, without any spaces.")

(defconst hexrgb-defined-colors-alist (eval-when-compile (and window-system (mapcar #'list (x-defined-colors)))) "\
Alist of all supported color names, for use in completion.
See also `hexrgb-defined-colors-no-dups-alist', which is the same
thing, but without any duplicates, such as \"light blue\" and
\"LightBlue\".")

(defconst hexrgb-defined-colors-no-dups-alist (eval-when-compile (and window-system (mapcar #'list (hexrgb-canonicalize-defined-colors (x-defined-colors))))) "\
Alist of all supported color names, with no duplicates, for completion.
Names are all lowercase, without any spaces.")

(defvar hexrgb-canonicalize-defined-colors-flag t "\
*Non-nil means remove duplicate color names.
Names are considered duplicates if they are the same when abstracting
from whitespace and letter case.")

(custom-autoload 'hexrgb-canonicalize-defined-colors-flag "../plugin/hexrgb" t)

(autoload 'hexrgb-read-color "../plugin/hexrgb" "\
Read a color name or hex RGB hexadecimal color value #RRRRGGGGBBBB.
Completion is available for color names, but not for RGB hex strings.
If you input an RGB hex string, it must have the form #XXXXXXXXXXXX or
XXXXXXXXXXXX, where each X is a hex digit.  The number of Xs must be a
multiple of 3, with the same number of Xs for each of red, green, and
blue.  The order is red, green, blue.

Color names that are normally considered equivalent are canonicalized:
They are lowercased, whitespace is removed, and duplicates are
eliminated.  E.g. \"LightBlue\" and \"light blue\" are both replaced
by \"lightblue\".  If you do not want this behavior, but want to
choose names that might contain whitespace or uppercase letters, then
customize option `hexrgb-canonicalize-defined-colors-flag' to nil.

In addition to standard color names and RGB hex values, the following
are available as color candidates.  In each case, the corresponding
color is used.

* `*copied foreground*'  - last copied foreground, if available
* `*copied background*'  - last copied background, if available
* `*mouse-2 foreground*' - foreground where you click `mouse-2'
* `*mouse-2 background*' - background where you click `mouse-2'
* `*point foreground*'   - foreground under the cursor
* `*point background*'   - background under the cursor

\(You can copy a color using eyedropper commands such as
`eyedrop-pick-foreground-at-mouse'.)

Optional arg PROMPT is the prompt - nil means use a default prompt.

Checks input to be sure it represents a valid color.  If not, raises
an error (but see exception for empty input with non-nil
ALLOW-EMPTY-NAME-P).

Interactively, or with optional arg CONVERT-TO-RGB-P non-nil, converts
an input color name to an RGB hex string.  Returns the RGB hex string.

Optional arg ALLOW-EMPTY-NAME-P controls what happens if you enter an
empty color name (that is, you just hit `RET').  If non-nil, then
`hexrgb-read-color' returns an empty color name, \"\".  If nil, then
it raises an error.  Calling programs must test for \"\" if
ALLOW-EMPTY-NAME-P is non-nil.  They can then perform an appropriate
action in case of empty input.

Interactively, or with non-nil MSGP, show color name in the echo area.

\(fn &optional PROMPT CONVERT-TO-RGB-P ALLOW-EMPTY-NAME-P MSGP)" t nil)

(autoload 'hexrgb-complement "../plugin/hexrgb" "\
Return the color that is the complement of COLOR.
Non-interactively, non-nil optional arg MSG-P means show a message
with the complement.

\(fn COLOR &optional MSG-P)" t nil)

(autoload 'hexrgb-hue "../plugin/hexrgb" "\
Return the hue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-saturation "../plugin/hexrgb" "\
Return the saturation component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-value "../plugin/hexrgb" "\
Return the value component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-red "../plugin/hexrgb" "\
Return the red component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-green "../plugin/hexrgb" "\
Return the green component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

(autoload 'hexrgb-blue "../plugin/hexrgb" "\
Return the blue component of COLOR, in range 0 to 1 inclusive.
COLOR is a color name or hex RGB string that starts with \"#\".

\(fn COLOR)" t nil)

;;;***

;;;### (autoloads nil "../plugin/hide-lines" "../plugin/hide-lines.el"
;;;;;;  (22026 35731 182049 996000))
;;; Generated autoloads from ../plugin/hide-lines.el

(autoload 'hide-lines "../plugin/hide-lines" "\
Hide lines matching the specified regexp.
With prefix arg of 4 (C-u) hide lines that do not match the specified regexp.
With any other prefix arg, reveal all hidden lines.

\(fn &optional ARG)" t nil)

(autoload 'hide-lines-not-matching "../plugin/hide-lines" "\
Hide lines that don't match the specified regexp.

\(fn SEARCH-TEXT)" t nil)

(autoload 'hide-lines-matching "../plugin/hide-lines" "\
Hide lines matching the specified regexp.

\(fn SEARCH-TEXT)" t nil)

(autoload 'hide-lines-show-all "../plugin/hide-lines" "\
Show all areas hidden by the filter-buffer command.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/highlight-indentation" "../plugin/highlight-indentation.el"
;;;;;;  (22026 35731 182049 996000))
;;; Generated autoloads from ../plugin/highlight-indentation.el

(autoload 'highlight-indentation-mode "../plugin/highlight-indentation" "\
Highlight indentation minor mode highlights indentation based
on spaces

\(fn &optional ARG)" t nil)

(autoload 'highlight-indentation-set-offset "../plugin/highlight-indentation" "\
Set indentation offset localy in buffer, will prevent
highlight-indentation from trying to guess indentation offset
from major mode

\(fn OFFSET)" t nil)

(autoload 'highlight-indentation-current-column-mode "../plugin/highlight-indentation" "\
Hilight Indentation minor mode displays
a vertical bar corresponding to the indentation of the current line

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/hl-line+" "../plugin/hl-line+.el"
;;;;;;  (22026 35731 183049 995000))
;;; Generated autoloads from ../plugin/hl-line+.el

(defface hl-line '((t (:background "SlateGray3"))) "\
*Face to use for `hl-line-face'." :group (quote hl-line))

(defvar hl-line-flash-show-period 1 "\
*Number of seconds for `hl-line-flash' to highlight the line.")

(custom-autoload 'hl-line-flash-show-period "../plugin/hl-line+" t)

(defvar hl-line-inhibit-highlighting-for-modes nil "\
*Modes where highlighting is inhibited for `hl-line-highlight-now'.
A list of `major-mode' values (symbols).")

(custom-autoload 'hl-line-inhibit-highlighting-for-modes "../plugin/hl-line+" t)

(defvar hl-line-overlay-priority 300 "\
*Priority to use for `hl-line-overlay' and `global-hl-line-overlay'.
A higher priority can make the hl-line highlighting appear on top of
other overlays that might exist.")

(custom-autoload 'hl-line-overlay-priority "../plugin/hl-line+" t)

(defalias 'toggle-hl-line-when-idle 'hl-line-toggle-when-idle)

(autoload 'hl-line-toggle-when-idle "../plugin/hl-line+" "\
Turn on or off using `global-hl-line-mode' when Emacs is idle.
When on, use `global-hl-line-mode' whenever Emacs is idle.
With prefix argument, turn on if ARG > 0; else turn off.

In Lisp code, non-nil optional second arg MSGP means display a message
showing the new value.

\(fn &optional ARG MSGP)" t nil)

(autoload 'hl-line-when-idle-interval "../plugin/hl-line+" "\
Set wait until using `global-hl-line-mode' when Emacs is idle.
Whenever Emacs is idle for this many seconds, `global-hl-line-mode'
will be turned on.

To turn on or off using `global-hl-line-mode' when idle,
use `\\[toggle-hl-line-when-idle].

\(fn SECS)" t nil)

(defalias 'flash-line-highlight 'hl-line-flash)

(autoload 'hl-line-flash "../plugin/hl-line+" "\
Highlight the current line for `hl-line-flash-show-period' seconds.
With a prefix argument, highlight for that many seconds.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/idle-require" "../plugin/idle-require.el"
;;;;;;  (22026 35731 183049 995000))
;;; Generated autoloads from ../plugin/idle-require.el

(autoload 'idle-require "../plugin/idle-require" "\
Add SYMBOL to `idle-require-symbols'.

\(fn SYMBOL)" nil nil)

(autoload 'idle-require-mode "../plugin/idle-require" "\
Load unloaded autoload functions when Emacs becomes idle.
If `idle-require-symbols' is a list of files, those will be loaded.
Otherwise all autoload functions will be loaded.

Loading all autoload functions can easily triple Emacs' memory footprint.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/info+" "../plugin/info+.el" (22026
;;;;;;  35731 186049 995000))
;;; Generated autoloads from ../plugin/info+.el

(let ((loads (get 'Info-Plus 'custom-loads))) (if (member '"../plugin/info+" loads) nil (put 'Info-Plus 'custom-loads (cons '"../plugin/info+" loads))))

(defface info-file '((((background dark)) (:foreground "Yellow" :background "DimGray")) (t (:foreground "Blue" :background "LightGray"))) "\
*Face for file heading labels in `info'." :group (quote Info-Plus) :group (quote faces))

(defface info-menu '((((background dark)) (:foreground "Yellow")) (t (:foreground "Blue"))) "\
*Face used for menu items in `info'." :group (quote Info-Plus) :group (quote faces))

(defface info-quoted-name '((((background dark)) (:inherit font-lock-string-face :foreground "#6B6BFFFF2C2C")) (((background light)) (:inherit font-lock-string-face :foreground "DarkViolet")) (t (:foreground "yellow"))) "\
*Face for quoted names (`...') in `info'." :group (quote Info-Plus) :group (quote faces))

(defface info-string '((((background dark)) (:inherit font-lock-string-face :foreground "Orange")) (t (:inherit font-lock-string-face :foreground "red3"))) "\
*Face for strings (\"...\") in `info'." :group (quote Info-Plus) :group (quote faces))

(defface info-single-quote '((((background dark)) (:inherit font-lock-keyword-face :foreground "Green")) (t (:inherit font-lock-keyword-face :foreground "Magenta"))) "\
*Face for isolated single-quote marks (') in `info'." :group (quote Info-Plus) :group (quote faces))

(defface info-title-1 '((((type tty pc) (class color) (background dark)) :foreground "yellow" :weight bold) (((type tty pc) (class color) (background light)) :foreground "brown" :weight bold)) "\
*Face for info titles at level 1." :group (if (facep (quote info-title-1)) (quote info) (quote Info-Plus)))

(defface info-title-2 '((((type tty pc) (class color)) :foreground "lightblue" :weight bold)) "\
*Face for info titles at level 2." :group (if (facep (quote info-title-1)) (quote info) (quote Info-Plus)))

(defface info-title-3 '((((type tty pc) (class color)) :weight bold)) "\
*Face for info titles at level 3." :group (if (facep (quote info-title-1)) (quote info) (quote Info-Plus)))

(defface info-title-4 '((((type tty pc) (class color)) :weight bold)) "\
*Face for info titles at level 4." :group (if (facep (quote info-title-1)) (quote info) (quote Info-Plus)))

(defface info-command-ref-item '((((background dark)) (:foreground "#7474FFFF7474" :background "DimGray")) (t (:foreground "Blue" :background "LightGray"))) "\
*Face used for \"Command:\" reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defface info-constant-ref-item '((((background dark)) (:foreground "DeepPink" :background "DimGray")) (t (:foreground "DeepPink" :background "LightGray"))) "\
*Face used for \"Constant:\" reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defface info-function-ref-item '((((background dark)) (:foreground "#4D4DDDDDDDDD" :background "DimGray")) (t (:foreground "DarkBlue" :background "LightGray"))) "\
*Face used for \"Function:\" reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defface info-macro-ref-item '((((background dark)) (:foreground "Yellow" :background "DimGray")) (t (:foreground "DarkMagenta" :background "LightGray"))) "\
*Face used for \"Macro:\" reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defface info-reference-item '((((background dark)) (:background "DimGray")) (t (:background "LightGray"))) "\
*Face used for reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defface info-special-form-ref-item '((((background dark)) (:foreground "Yellow" :background "DimGray")) (t (:foreground "DarkMagenta" :background "LightGray"))) "\
*Face used for \"Special Form:\" reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defface info-syntax-class-item '((((background dark)) (:foreground "#FFFF9B9BFFFF" :background "DimGray")) (t (:foreground "DarkGreen" :background "LightGray"))) "\
*Face used for \"Syntax Class:\" reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defface info-user-option-ref-item '((((background dark)) (:foreground "Red" :background "DimGray")) (t (:foreground "Red" :background "LightGray"))) "\
*Face used for \"User Option:\" reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defface info-variable-ref-item '((((background dark)) (:foreground "Orange" :background "DimGray")) (t (:foreground "FireBrick" :background "LightGray"))) "\
*Face used for \"Variable:\" reference items in `info' manual." :group (quote Info-Plus) :group (quote faces))

(defvar Info-fit-frame-flag t "\
*Non-nil means call `fit-frame' on Info buffer.")

(custom-autoload 'Info-fit-frame-flag "../plugin/info+" t)

(defvar Info-fontify-quotations-flag t "\
*Non-nil means `info' fontifies text between quotes.
This applies to double-quote strings (\"...\") and text between
single-quotes (`...').

Note: This fontification can never be 100% reliable.  It aims to be
useful in most Info texts, but it can occasionally result in
fontification that you might not expect.  This is not a bug; it is
part of the design to be able to appropriately fontify a great variety
of texts.  Set this flag to nil if you do not find this fontification
useful.")

(custom-autoload 'Info-fontify-quotations-flag "../plugin/info+" t)

(defvar Info-fontify-angle-bracketed-flag t "\
*Non-nil means `info' fontifies text within `<...>.
A non-nil value has no effect unless `Info-fontify-quotations-flag' is
also non-nil.

Note: This fontification can never be 100% reliable.  It aims to be
useful in most Info texts, but it can occasionally result in
fontification that you might not expect.  This is not a bug; it is
part of the design to be able to appropriately fontify a great variety
of texts.  Set this flag to nil if you do not find this fontification
useful.")

(custom-autoload 'Info-fontify-angle-bracketed-flag "../plugin/info+" t)

(defvar Info-fontify-single-quote-flag t "\
*Non-nil means `info' fontifies ' when not preceded by `....
A non-nil value has no effect unless `Info-fontify-quotations-flag' is
also non-nil.

Note: This fontification can never be 100% reliable.  It aims to be
useful in most Info texts, but it can occasionally result in
fontification that you might not expect.  This is not a bug; it is
part of the design to be able to appropriately fontify a great variety
of texts.  Set this flag to nil if you do not find this fontification
useful.")

(custom-autoload 'Info-fontify-single-quote-flag "../plugin/info+" t)

(defvar Info-fontify-reference-items-flag t "\
*Non-nil means `info' fontifies reference items such as \"Function:\".")

(custom-autoload 'Info-fontify-reference-items-flag "../plugin/info+" t)

(defvar Info-display-node-header-fn 'Info-display-node-default-header "\
*Function to insert header by `Info-merge-subnodes'.")

(custom-autoload 'Info-display-node-header-fn "../plugin/info+" t)

(defvar Info-subtree-separator "\n* " "\
*A string used to separate Info node descriptions.
Inserted by `Info-merge-subnodes' just before each node title.
Setting this to a string that includes a form-feed (^L), such as
\"\\f\\n* \", will cause a page break before each node description.

Use command `set-variable' to set this, quoting any control characters
you want to include, such as form-feed (^L) and newline (^J), with ^Q.
For example, type `^Q^L^Q^J* ' to set this to \"\\f\\n* \".")

(custom-autoload 'Info-subtree-separator "../plugin/info+" t)
 (autoload 'Info-clear "info+")
 (autoload 'Info-toggle-breadcrumbs-in-header-line "info+")
 (autoload 'Info-toggle-fontify-quotations "info+")
 (autoload 'Info-toggle-fontify-single-quote "info+")
 (autoload 'Info-toggle-fontify-angle-bracketed "info+")

(autoload 'Info-goto-emacs-command-node "../plugin/info+" "\
Go to the Info node in the Emacs manual for command COMMAND.
The command is found by looking it up in Emacs manual's indexes,
or in another manual found via COMMAND's `info-file' property or
the variable `Info-file-list-for-emacs'.
COMMAND must be a symbol or string.

\(fn COMMAND &optional MSGP)" t nil)

(autoload 'Info-goto-emacs-key-command-node "../plugin/info+" "\
Go to the node in the Emacs manual describing command bound to KEY.
KEY is a string.

Interactively, if the binding is `execute-extended-command', then a
command is read.

The command is found by looking it up in Emacs manual's indexes,
or in another manual's index found via COMMAND's `info-file' property
or the variable `Info-file-list-for-emacs'.

If key's command cannot be found by looking in indexes, then
`Info-search' is used to search for the key sequence in the info text.

\(fn KEY &optional MSGP)" t nil)

(autoload 'Info-merge-subnodes "../plugin/info+" "\
Integrate current node with nodes referred to in its Menu.

Displays the current Info node, together with the nodes in its Menu.
Buffer `*Info: NODE*' is used for the display, where NODE is the name
of the current node.  The contents of this node's subnodes (the nodes
named in this node's Menu) are included in the buffer, following the
contents of the current node.

Optional arg RECURSIVE-DISPLAY-P (prefix arg if interactive) governs
the way menus of subnodes are treated:

  If nil, nothing additional happens.  Subnode menus are not explored.
  Only the current node and its immediate subnodes are documented, in
  the single display buffer `*Info: NODE*'.

  If non-nil, then the subnodes of a node are treated in the same way
  as the parent node, recursively: If any of them has, itself, a Menu,
  then that menu's subnodes are also explored, and so on.

    If RECURSIVE-DISPLAY-P is zero, then a single display buffer is
    used for all of the nodes explored.  Otherwise, a separate display
    buffer is used for each subnode that has a Menu (see next).

      Use this when you want a single, flat compilation of the current
      node and all of its subnodes.  It is less appropriate when the
      current node has several levels of subnodes: The flattened
      result can be difficult to read.

    If RECURSIVE-DISPLAY-P is positive, then the contents of each
    subnode are displayed twice: once in the parent node's display,
    and once in the subnode's own display.

      Use this when the current node has several levels of subnodes
      and you want each display buffer to be self-contained.

    If RECURSIVE-DISPLAY-P is negative, then there is no redundancy: A
    subnode's contents are only displayed in its parent's buffer.  The
    subnode's own display buffer only contains the contents of its own
    subnodes.

      Use this when the current node has several levels of subnodes
      and you want no redundancy between the display buffers.

The user option (variable) `Info-subtree-separator' is a string to be
inserted by `Info-merge-subnodes' just before the title of each
node (preceding its description).  By default it is \"\\n* \", producing
a node title resembling a menu item.  Setting this to \"\\f\\n* \" will
cause a page break before each node description.  For more on setting
this variable, type \\<Info-mode-map>`\\[describe-variable] Info-subtree-separator'.

------

Optional second arg RECURSIVE-CALL-P is only for internal use.  It is
used to indicate whether (non-nil) or not (nil) this is a recursive
\(i.e. not a top-level) call to `Info-merge-subnodes'.  Non-nil
means that this is a subnode, and that its contents should only be
included in the present display if RECURSIVE-DISPLAY-P is also
non-nil.  For proper operation when RECURSIVE-DISPLAY-P is zero, the
non-nil value of RECURSIVE-CALL-P should be the node name of the
top-level call to `Info-merge-subnodes'.

\(fn &optional RECURSIVE-DISPLAY-P RECURSIVE-CALL-P)" t nil)

;;;***

;;;### (autoloads nil "../plugin/init-loader" "../plugin/init-loader.el"
;;;;;;  (22026 35731 186049 995000))
;;; Generated autoloads from ../plugin/init-loader.el

(autoload 'init-loader-load "../plugin/init-loader" "\
Load configuration files in INIT-DIR.

\(fn &optional (init-dir init-loader-directory))" nil nil)

(autoload 'init-loader-show-log "../plugin/init-loader" "\
Show init-loader log buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/irfc" "../plugin/irfc.el" (22026
;;;;;;  35731 188049 995000))
;;; Generated autoloads from ../plugin/irfc.el

(let ((loads (get 'irfc 'custom-loads))) (if (member '"../plugin/irfc" loads) nil (put 'irfc 'custom-loads (cons '"../plugin/irfc" loads))))

(defvar irfc-assoc-mode nil "\
If non-nil, RFC documents are associated with `irfc-mode'.
Default is nil.")

(custom-autoload 'irfc-assoc-mode "../plugin/irfc" nil)

(autoload 'irfc-mode "../plugin/irfc" "\
Major mode for IETF RFC documents.

\(fn)" t nil)

(autoload 'irfc-follow "../plugin/irfc" "\
Open RFC document around point.
Download and open RFC document if it
does not exist in `irfc-directory'.

\(fn)" t nil)

(autoload 'irfc-visit "../plugin/irfc" "\
Open RFC document RFC-NUMBER.
Download and open RFC document if it
does not exist in `irfc-directory'.

\(fn &optional RFC-NUMBER)" t nil)

;;;***

;;;### (autoloads nil "../plugin/javascript" "../plugin/javascript.el"
;;;;;;  (22026 35731 188049 995000))
;;; Generated autoloads from ../plugin/javascript.el

(autoload 'javascript-mode "../plugin/javascript" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{javascript-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/key-chord" "../plugin/key-chord.el"
;;;;;;  (22026 35731 189049 995000))
;;; Generated autoloads from ../plugin/key-chord.el

(autoload 'key-chord-mode "../plugin/key-chord" "\
Toggle key chord mode.
With positive ARG enable the mode. With zero or negative arg disable the mode.
A key chord is two keys that are pressed simultaneously, or one key quickly
pressed twice.
See functions `key-chord-define-global' or `key-chord-define'
and variables `key-chord-two-keys-delay' and `key-chord-one-key-delay'.

\(fn ARG)" t nil)

(autoload 'key-chord-define-global "../plugin/key-chord" "\
Define a key-chord of two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

\(fn KEYS COMMAND)" t nil)

(autoload 'key-chord-define "../plugin/key-chord" "\
Define in KEYMAP, a key-chord of two keys in KEYS starting a COMMAND.

KEYS can be a string or a vector of two elements. Currently only elements
that corresponds to ascii codes in the range 32 to 126 can be used.

COMMAND can be an interactive function, a string, or nil.
If COMMAND is nil, the key-chord is removed.

\(fn KEYMAP KEYS COMMAND)" nil nil)

;;;***

;;;### (autoloads nil "../plugin/linkd" "../plugin/linkd.el" (22026
;;;;;;  35731 190049 995000))
;;; Generated autoloads from ../plugin/linkd.el

(autoload 'linkd-version "../plugin/linkd" "\
Display Linkd version.

\(fn)" t nil)

(autoload 'linkd-back "../plugin/linkd" "\
Return to the buffer being viewed before the last link was followed.

\(fn)" t nil)

(autoload 'linkd-follow-at-point "../plugin/linkd" "\
Follow the link at point.

\(fn)" t nil)

(autoload 'linkd-next-link "../plugin/linkd" "\
Move point to the next link, if any.

\(fn)" t nil)

(autoload 'linkd-previous-link "../plugin/linkd" "\
Move point to the previous link, if any.

\(fn)" t nil)

(autoload 'linkd-insert-single-arg-link "../plugin/linkd" "\
Insert a link containing ARGUMENT.

\(fn TYPE-STRING ARGUMENT)" nil nil)

(autoload 'linkd-insert-tag "../plugin/linkd" "\
Insert a tag.

\(fn TAG-NAME)" t nil)

(autoload 'linkd-insert-star "../plugin/linkd" "\
Insert a star.

\(fn STAR-NAME)" t nil)

(autoload 'linkd-insert-wiki "../plugin/linkd" "\
Insert a wiki link.

\(fn WIKI-NAME)" t nil)

(autoload 'linkd-insert-lisp "../plugin/linkd" "\
Insert a Lisp sexp.

\(fn SEXP)" t nil)

(autoload 'linkd-insert-link "../plugin/linkd" "\
Insert a link.
Optional arg TYPE is the link type.
Optional arg CURRENT-VALUES is a property list of current values.

\(fn &optional TYPE CURRENT-VALUES)" t nil)

(autoload 'linkd-edit-link-at-point "../plugin/linkd" "\
Edit the Linkd link at point.

\(fn)" t nil)

(autoload 'linkd-export-default "../plugin/linkd" "\
Export the current buffer with default settings to all available formats.

\(fn)" t nil)

(autoload 'linkd-latex-export "../plugin/linkd" "\
Render a buffer as a LaTeX book chapter.

\(fn)" t nil)

(autoload 'linkd-wiki-find-page "../plugin/linkd" "\
Find Linkd wiki page named PAGE-NAME.

\(fn PAGE-NAME)" t nil)

;;;***

;;;### (autoloads nil "../plugin/log4j-mode" "../plugin/log4j-mode.el"
;;;;;;  (22026 35731 191049 995000))
;;; Generated autoloads from ../plugin/log4j-mode.el
 (add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))

(autoload 'log4j-mode "../plugin/log4j-mode" "\
Major mode for viewing log files.
Log4j mode provides syntax highlighting and filtering of log files.
It also provides functionality to find and display the declaration
of a Java identifier found in the log file.

You can customize the faces that are used for syntax highlighting.
Type `M-x customize-group' and enter group name \"log4j-mode\".
You can also customize the regular expressions that are used to find
the beginning and end of multi-line log records. However, in many
cases this will not be necessary.

Commands:
Use `\\<log4j-mode-map>\\[log4j-start-filter]' to start/stop log file filtering in the current buffer.
Enter any number of include and exclude keywords that will be used to
filter the log records. Keywords are separated by spaces.

Use `\\<log4j-mode-map>\\[log4j-browse-source]' to show the declaration of the Java identifier around or
before point. This command is only enabled if package `jtags' is loaded.
For more information about jtags, see http://jtags.sourceforge.net.

Finally, the commands `\\<log4j-mode-map>\\[log4j-forward-record]' and `\\<log4j-mode-map>\\[log4j-backward-record]' move point forward and backward
across log records.

\\{log4j-mode-local-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/make-file-executable" "../plugin/make-file-executable.el"
;;;;;;  (22026 35731 191049 995000))
;;; Generated autoloads from ../plugin/make-file-executable.el

(autoload 'make-file-executable "../plugin/make-file-executable" "\
Make the file of this buffer executable, when it is a script source.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "../plugin/mark-multiple/inline-string-rectangle"
;;;;;;  "../plugin/mark-multiple/inline-string-rectangle.el" (22026
;;;;;;  35731 192049 995000))
;;; Generated autoloads from ../plugin/mark-multiple/inline-string-rectangle.el

(autoload 'inline-string-rectangle "../plugin/mark-multiple/inline-string-rectangle" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/mark-multiple/mark-more-like-this"
;;;;;;  "../plugin/mark-multiple/mark-more-like-this.el" (22026 35731
;;;;;;  192049 995000))
;;; Generated autoloads from ../plugin/mark-multiple/mark-more-like-this.el

(autoload 'mark-next-like-this "../plugin/mark-multiple/mark-more-like-this" "\
Find and mark the next part of the buffer matching the currently active region
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mark-previous-like-this "../plugin/mark-multiple/mark-more-like-this" "\
Find and mark the previous part of the buffer matching the currently active region
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark previous.

\(fn ARG)" t nil)

(autoload 'mark-all-like-this "../plugin/mark-multiple/mark-more-like-this" "\
Find and mark all the parts of the buffer matching the currently active region

\(fn)" t nil)

(autoload 'mark-all-like-this-in-region "../plugin/mark-multiple/mark-more-like-this" "\
Find and mark all the parts in the region matching the given search

\(fn REG-START REG-END)" t nil)

(autoload 'mark-more-like-this "../plugin/mark-multiple/mark-more-like-this" "\
Marks next part of buffer that matches the currently active region ARG times.
Given a negative ARG it searches backwards instead.

\(fn ARG)" t nil)

(autoload 'mark-more-like-this-extended "../plugin/mark-multiple/mark-more-like-this" "\
Like mark-more-like-this, but then lets you adjust with arrows key.
The actual adjustment made depends on the final component of the
key-binding used to invoke the command, with all modifiers removed:

   <up>    Mark previous like this
   <down>  Mark next like this
   <left>  If last was previous, skip it
           If last was next, remove it
   <right> If last was next, skip it
           If last was previous, remove it

Then, continue to read input events and further add or move marks
as long as the input event read (with all modifiers removed)
is one of the above.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/mark-multiple/mark-multiple" "../plugin/mark-multiple/mark-multiple.el"
;;;;;;  (22026 35731 193049 995000))
;;; Generated autoloads from ../plugin/mark-multiple/mark-multiple.el

(autoload 'mm/deactivate-region-or-clear-all "../plugin/mark-multiple/mark-multiple" "\
Deactivate mark if active, otherwise clear all.

\(fn)" t nil)

(autoload 'mm/deactivate-region-and-clear-all "../plugin/mark-multiple/mark-multiple" "\
Deactivate mark and clear all.

\(fn)" t nil)

(autoload 'mm/clear-all "../plugin/mark-multiple/mark-multiple" "\
Remove all marks

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/mark-multiple/rename-sgml-tag" "../plugin/mark-multiple/rename-sgml-tag.el"
;;;;;;  (22026 35731 193049 995000))
;;; Generated autoloads from ../plugin/mark-multiple/rename-sgml-tag.el

(autoload 'rename-sgml-tag "../plugin/mark-multiple/rename-sgml-tag" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/mcomplete" "../plugin/mcomplete.el"
;;;;;;  (22026 35731 194049 995000))
;;; Generated autoloads from ../plugin/mcomplete.el

(autoload 'mcomplete-mode "../plugin/mcomplete" "\
Toggle minibuffer completion with prefix and substring matching.
With ARG, turn the mode on if ARG is positive, off otherwise.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-mcomplete-mode "../plugin/mcomplete" "\
Turn on minibuffer completion with prefix and substring matching.

\(fn)" t nil)

(autoload 'turn-off-mcomplete-mode "../plugin/mcomplete" "\
Turn off minibuffer completion with prefix and substring matching.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/org-doing" "../plugin/org-doing.el"
;;;;;;  (22026 35731 195049 995000))
;;; Generated autoloads from ../plugin/org-doing.el

(autoload 'org-doing-log "../plugin/org-doing" "\
Logs the `description' of what you're doing now in the file
`org-doing-file' at the *top* of the file.

When `later-p' is true, logs the item as something to be done
later.

\(fn DESCRIPTION &optional LATER-P)" t nil)

(autoload 'org-doing "../plugin/org-doing" "\
Interactive function for running any org-doing command.

The first part of the `command' string is parsed as a command:
- now: calls `org-doing-log'
- later: calls `org-doing-log'
- done: calls `org-doing-done'

\(fn COMMAND)" t nil)

;;;***

;;;### (autoloads nil "../plugin/protbuf" "../plugin/protbuf.el"
;;;;;;  (22026 35731 195049 995000))
;;; Generated autoloads from ../plugin/protbuf.el

(defvar protect-buffer-from-kill-mode nil "\
*If non-`nil', then prevent buffer from being accidentally killed.
This variable is local to all buffers.")

(defvar protect-process-buffer-from-kill-mode nil "\
*If non-`nil', then protect buffer with live process from being killed.
This variable is local to all buffers.")

(defvar protect-process-buffer-from-kill-preserve-function nil "\
*Function to run to determine whether to kill a process buffer.
If function returns non-nil, buffer is preserved.  Otherwise, the buffer
may be killed.

If this variable is undefined, default action is to test whether a process
object is using this buffer as a process buffer.

This variable is buffer-local when set.")

(autoload 'protect-buffer-from-kill-mode "../plugin/protbuf" "\
Protect buffer from being killed.
To remove this protection, call this command with a negative prefix argument.

\(fn &optional PREFIX BUFFER)" t nil)

(autoload 'protect-process-buffer-from-kill-mode "../plugin/protbuf" "\
Protect buffer from being killed as long as it has an active process.
To remove this protection, call this command with a negative prefix argument.

\(fn &optional PREFIX BUFFER)" t nil)

;;;***

;;;### (autoloads nil "../plugin/py-smart-operator" "../plugin/py-smart-operator.el"
;;;;;;  (22026 35731 195049 995000))
;;; Generated autoloads from ../plugin/py-smart-operator.el

(autoload 'py-smart-operator-mode "../plugin/py-smart-operator" "\
Insert operators with surrounding spaces smartly.

\(fn &optional ARG)" t nil)

(autoload 'smart-operator-self-insert-command "../plugin/py-smart-operator" "\
Insert the entered operator plus surrounding spaces.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/pydoc-info" "../plugin/pydoc-info.el"
;;;;;;  (22026 35731 196049 995000))
;;; Generated autoloads from ../plugin/pydoc-info.el

(require 'info-look)

(autoload 'pydoc-info-add-help "../plugin/pydoc-info" "\
Add help specifications for a list of Info FILES.

The added specifications are tailored for use with Info files
generated from Sphinx documents.

MORE-SPECS are additional or overriding values passed to
`info-lookup-add-help'.

\(fn FILES &rest MORE-SPECS)" nil nil)

(pydoc-info-add-help '("python"))

;;;***

;;;### (autoloads nil "../plugin/pylookup" "../plugin/pylookup.el"
;;;;;;  (22026 35731 196049 995000))
;;; Generated autoloads from ../plugin/pylookup.el

(autoload 'pylookup-lookup "../plugin/pylookup" "\
Lookup SEARCH-TERM in the Python HTML indexes.

\(fn SEARCH-TERM)" t nil)

(autoload 'pylookup-set-search-option "../plugin/pylookup" "\
Set search option interactively

\(fn OPTION-STRING)" t nil)

(autoload 'pylookup-update "../plugin/pylookup" "\
Run pylookup-update and create the database at `pylookup-db-file'.

\(fn SRC &optional APPEND)" t nil)

(autoload 'pylookup-update-all "../plugin/pylookup" "\
Run pylookup-update for all sources and create the database at `pylookup-db-file'.

\(fn)" t nil)

(autoload 'pylookup-lookup-at-point "../plugin/pylookup" "\
Query the for string with help of word read at point and call `pylookup-lookup'

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/pymacs" "../plugin/pymacs.el" (22026
;;;;;;  35731 197049 995000))
;;; Generated autoloads from ../plugin/pymacs.el

(autoload 'pymacs-load "../plugin/pymacs" "\
Import the Python module named MODULE into Emacs.
Each function in the Python module is made available as an Emacs function.
The Lisp name of each function is the concatenation of PREFIX with
the Python name, in which underlines are replaced by dashes.  If PREFIX is
not given, it defaults to MODULE followed by a dash.
If NOERROR is not nil, do not raise error when the module is not found.

\(fn MODULE &optional PREFIX NOERROR)" t nil)

(autoload 'pymacs-autoload "../plugin/pymacs" "\
Pymacs's equivalent of the standard emacs facility `autoload'.
Define FUNCTION to autoload from Python MODULE using PREFIX.
If PREFIX is not given, it defaults to MODULE followed by a dash.
Optional DOCSTRING documents FUNCTION until it gets loaded.
INTERACTIVE is normally the argument to the function `interactive',
t means `interactive' without arguments, nil means not interactive,
which is the default.

\(fn FUNCTION MODULE &optional PREFIX DOCSTRING INTERACTIVE)" nil nil)

(autoload 'pymacs-eval "../plugin/pymacs" "\
Compile TEXT as a Python expression, and return its value.

\(fn TEXT)" t nil)

(autoload 'pymacs-exec "../plugin/pymacs" "\
Compile and execute TEXT as a sequence of Python statements.
This functionality is experimental, and does not appear to be useful.

\(fn TEXT)" t nil)

(autoload 'pymacs-call "../plugin/pymacs" "\
Return the result of calling a Python function FUNCTION over ARGUMENTS.
FUNCTION is a string denoting the Python function, ARGUMENTS are separate
Lisp expressions, one per argument.  Immutable Lisp constants are converted
to Python equivalents, other structures are converted into Lisp handles.

\(fn FUNCTION &rest ARGUMENTS)" nil nil)

(autoload 'pymacs-apply "../plugin/pymacs" "\
Return the result of calling a Python function FUNCTION over ARGUMENTS.
FUNCTION is a string denoting the Python function, ARGUMENTS is a list of
Lisp expressions.  Immutable Lisp constants are converted to Python
equivalents, other structures are converted into Lisp handles.

\(fn FUNCTION ARGUMENTS)" nil nil)

;;;***

;;;### (autoloads nil "../plugin/python-pep8" "../plugin/python-pep8.el"
;;;;;;  (22026 35731 207049 995000))
;;; Generated autoloads from ../plugin/python-pep8.el

(autoload 'python-pep8 "../plugin/python-pep8" "\
Run PEP8, and collect output in a buffer.
While pep8 runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<python-pep8-mode-map>\\[compile-goto-error] in the grep output buffer, to go to the lines where pep8 found matches.

\(fn)" t nil)

(defalias 'pep8 'python-pep8)

;;;***

;;;### (autoloads nil "../plugin/python-pylint" "../plugin/python-pylint.el"
;;;;;;  (22026 35731 207049 995000))
;;; Generated autoloads from ../plugin/python-pylint.el

(autoload 'python-pylint "../plugin/python-pylint" "\
Run PYLINT, and collect output in a buffer.
While pylint runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<python-pylint-mode-map>\\[compile-goto-error] in the grep output buffer, to go to the lines where pylint found matches.

\(fn)" t nil)

(defalias 'pylint 'python-pylint)

;;;***

;;;### (autoloads nil "../plugin/quickrun" "../plugin/quickrun.el"
;;;;;;  (22026 35731 208049 995000))
;;; Generated autoloads from ../plugin/quickrun.el

(autoload 'quickrun-set-default "../plugin/quickrun" "\
Set `key' as default key in programing language `lang'

\(fn LANG KEY)" nil nil)

(autoload 'quickrun-add-command "../plugin/quickrun" "\


\(fn KEY ALIST &key DEFAULT MODE OVERRIDE)" nil nil)

(autoload 'quickrun "../plugin/quickrun" "\
Run commands quickly for current buffer
   With universal prefix argument(C-u), select command-key,
   With double prefix argument(C-u C-u), run in compile-only-mode

\(fn &rest PLIST)" t nil)

(autoload 'quickrun-with-arg "../plugin/quickrun" "\
Run commands quickly for current buffer with arguments

\(fn ARG)" t nil)

(autoload 'quickrun-region "../plugin/quickrun" "\
Run commands with specified region

\(fn START END)" t nil)

(autoload 'quickrun-replace-region "../plugin/quickrun" "\
Run commands with specified region and replace

\(fn START END)" t nil)

(autoload 'quickrun-compile-only "../plugin/quickrun" "\
Exec only compilation

\(fn)" t nil)

(autoload 'quickrun-shell "../plugin/quickrun" "\
Run commands in shell for interactive programs

\(fn)" t nil)

(autoload 'anything-quickrun "../plugin/quickrun" "\


\(fn)" t nil)

(autoload 'helm-quickrun "../plugin/quickrun" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters"
;;;;;;  "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters.el"
;;;;;;  (22026 35731 209049 995000))
;;; Generated autoloads from ../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters.el

(autoload 'rainbow-delimiters-mode "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters" "\
Highlight nested parentheses, brackets, and braces according to their depth.

\(fn &optional ARG)" t nil)

(autoload 'rainbow-delimiters-mode-enable "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters" "\


\(fn)" nil nil)

(autoload 'rainbow-delimiters-mode-disable "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters" "\


\(fn)" nil nil)

(defvar global-rainbow-delimiters-mode nil "\
Non-nil if Global-Rainbow-Delimiters mode is enabled.
See the command `global-rainbow-delimiters-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-rainbow-delimiters-mode'.")

(custom-autoload 'global-rainbow-delimiters-mode "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters" nil)

(autoload 'global-rainbow-delimiters-mode "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters" "\
Toggle Rainbow-Delimiters mode in all buffers.
With prefix ARG, enable Global-Rainbow-Delimiters mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Rainbow-Delimiters mode is enabled in all buffers where
`rainbow-delimiters-mode-enable' would do it.
See `rainbow-delimiters-mode' for more information on Rainbow-Delimiters mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/revive" "../plugin/revive.el" (22026
;;;;;;  35731 210049 995000))
;;; Generated autoloads from ../plugin/revive.el

(autoload 'current-window-configuration-printable "../plugin/revive" "\
Return the printable current-window-configuration.
This configuration will be stored by restore-window-configuration.
Returned configurations are list of:
'(Screen-Width Screen-Height Edge-List Buffer-List)

Edge-List is a return value of revive:all-window-edges, list of all
window-edges whose first member is always of north west window.

Buffer-List is a list of buffer property list of all windows.  This
property lists are stored in order corresponding to Edge-List.  Buffer
property list is formed as
'((buffer-file-name) (buffer-name) (point) (window-start)).

\(fn)" nil nil)

(autoload 'restore-window-configuration "../plugin/revive" "\
Restore the window configuration.
Configuration CONFIG should be created by
current-window-configuration-printable.

\(fn CONFIG)" nil nil)

(autoload 'wipe "../plugin/revive" "\
Wipe Emacs.

\(fn)" t nil)

(autoload 'save-current-configuration "../plugin/revive" "\
Save current window/buffer configuration into configuration file.

\(fn &optional NUM)" t nil)

(autoload 'resume "../plugin/revive" "\
Resume window/buffer configuration.
Configuration should be saved by save-current-configuration.

\(fn &optional NUM)" t nil)

;;;***

;;;### (autoloads nil "../plugin/smart-operator" "../plugin/smart-operator.el"
;;;;;;  (22026 35731 215049 995000))
;;; Generated autoloads from ../plugin/smart-operator.el

(autoload 'smart-operator-mode "../plugin/smart-operator" "\
Insert operators with surrounding spaces smartly.

\(fn &optional ARG)" t nil)

(autoload 'smart-operator-mode-on "../plugin/smart-operator" "\
Turn on `smart-operator-mode'.  

\(fn)" nil nil)

(autoload 'smart-operator-self-insert-command "../plugin/smart-operator" "\
Insert the entered operator plus surrounding spaces.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/syslog-mode" "../plugin/syslog-mode.el"
;;;;;;  (22026 35731 216049 995000))
;;; Generated autoloads from ../plugin/syslog-mode.el

(defvar syslog-setup-on-load nil "\
*If not nil setup syslog mode on load by running syslog-add-hooks.")

(autoload 'syslog-filter-lines "../plugin/syslog-mode" "\
Restrict buffer to lines matching regexp.
With prefix arg: remove lines matching regexp.

\(fn &optional ARG)" t nil)

(defvar syslog-datetime-regexp "^[a-z]\\{3\\} [0-9]\\{1,2\\} \\([0-9]\\{2\\}:\\)\\{2\\}[0-9]\\{2\\} " "\
A regular expression matching the date-time at the beginning of each line in the log file.")

(custom-autoload 'syslog-datetime-regexp "../plugin/syslog-mode" t)

(autoload 'syslog-date-to-time "../plugin/syslog-mode" "\
Convert DATE string to time.
If no year is present in the date then the current year is used.
If DATE can't be parsed then if SAFE is non-nil return nil otherwise throw an error.

\(fn DATE &optional SAFE)" nil nil)

(autoload 'syslog-filter-dates "../plugin/syslog-mode" "\
Restrict buffer to lines between dates.
With prefix arg: remove lines between dates.

\(fn START END &optional ARG)" t nil)

(autoload 'syslog-mode "../plugin/syslog-mode" "\
Major mode for working with system logs.

\\{syslog-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/systemd" "../plugin/systemd.el"
;;;;;;  (22026 35731 217049 995000))
;;; Generated autoloads from ../plugin/systemd.el
 (add-to-list 'auto-mode-alist '("\\.automount\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.busname\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.mount\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.service\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.slice\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.socket\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.target\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.timer\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.link\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.netdev\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.network\\'" . systemd-mode))
 (add-to-list 'auto-mode-alist '("\\.override\\.conf.*\\'" . systemd-mode))

(autoload 'systemd-mode "../plugin/systemd" "\
Major mode for editing systemd unit files. See
http://www.freedesktop.org/wiki/Software/systemd/ for more
information about systemd.  The hook `systemd-mode-hook' is run
at mode initialization.

Key bindings:
\\{systemd-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/tabbar" "../plugin/tabbar.el" (22026
;;;;;;  35731 218049 995000))
;;; Generated autoloads from ../plugin/tabbar.el

(autoload 'tabbar-backward "../plugin/tabbar" "\
Select the previous available tab.
Depend on the setting of the option `tabbar-cycle-scope'.

\(fn)" t nil)

(autoload 'tabbar-forward "../plugin/tabbar" "\
Select the next available tab.
Depend on the setting of the option `tabbar-cycle-scope'.

\(fn)" t nil)

(autoload 'tabbar-backward-group "../plugin/tabbar" "\
Go to selected tab in the previous available group.

\(fn)" t nil)

(autoload 'tabbar-forward-group "../plugin/tabbar" "\
Go to selected tab in the next available group.

\(fn)" t nil)

(autoload 'tabbar-backward-tab "../plugin/tabbar" "\
Select the previous visible tab.

\(fn)" t nil)

(autoload 'tabbar-forward-tab "../plugin/tabbar" "\
Select the next visible tab.

\(fn)" t nil)

(autoload 'tabbar-press-home "../plugin/tabbar" "\
Press the tab bar home button.
That is, simulate a mouse click on that button.
A numeric prefix ARG value of 2, or 3, respectively simulates a
mouse-2, or mouse-3 click.  The default is a mouse-1 click.

\(fn &optional ARG)" t nil)

(autoload 'tabbar-press-scroll-left "../plugin/tabbar" "\
Press the tab bar scroll-left button.
That is, simulate a mouse click on that button.
A numeric prefix ARG value of 2, or 3, respectively simulates a
mouse-2, or mouse-3 click.  The default is a mouse-1 click.

\(fn &optional ARG)" t nil)

(autoload 'tabbar-press-scroll-right "../plugin/tabbar" "\
Press the tab bar scroll-right button.
That is, simulate a mouse click on that button.
A numeric prefix ARG value of 2, or 3, respectively simulates a
mouse-2, or mouse-3 click.  The default is a mouse-1 click.

\(fn &optional ARG)" t nil)

(autoload 'tabbar-mwheel-backward "../plugin/tabbar" "\
Select the previous available tab.
EVENT is the mouse event that triggered this command.
Mouse-enabled equivalent of the command `tabbar-backward'.

\(fn EVENT)" t nil)

(autoload 'tabbar-mwheel-forward "../plugin/tabbar" "\
Select the next available tab.
EVENT is the mouse event that triggered this command.
Mouse-enabled equivalent of the command `tabbar-forward'.

\(fn EVENT)" t nil)

(autoload 'tabbar-mwheel-backward-group "../plugin/tabbar" "\
Go to selected tab in the previous available group.
If there is only one group, select the previous visible tab.
EVENT is the mouse event that triggered this command.
Mouse-enabled equivalent of the command `tabbar-backward-group'.

\(fn EVENT)" t nil)

(autoload 'tabbar-mwheel-forward-group "../plugin/tabbar" "\
Go to selected tab in the next available group.
If there is only one group, select the next visible tab.
EVENT is the mouse event that triggered this command.
Mouse-enabled equivalent of the command `tabbar-forward-group'.

\(fn EVENT)" t nil)

(autoload 'tabbar-mwheel-backward-tab "../plugin/tabbar" "\
Select the previous visible tab.
EVENT is the mouse event that triggered this command.
Mouse-enabled equivalent of the command `tabbar-backward-tab'.

\(fn EVENT)" t nil)

(autoload 'tabbar-mwheel-forward-tab "../plugin/tabbar" "\
Select the next visible tab.
EVENT is the mouse event that triggered this command.
Mouse-enabled equivalent of the command `tabbar-forward-tab'.

\(fn EVENT)" t nil)

(autoload 'tabbar-mwheel-switch-tab "../plugin/tabbar" "\
Select the next or previous tab according to EVENT.

\(fn EVENT)" t nil)

(autoload 'tabbar-mwheel-switch-group "../plugin/tabbar" "\
Select the next or previous group of tabs according to EVENT.

\(fn EVENT)" t nil)

(autoload 'tabbar-local-mode "../plugin/tabbar" "\
Toggle local display of the tab bar.
With prefix argument ARG, turn on if positive, otherwise off.
Returns non-nil if the new state is enabled.
When turned on, if a local header line is shown, it is hidden to show
the tab bar.  The tab bar is locally hidden otherwise.  When turned
off, if a local header line is hidden or the tab bar is locally
hidden, it is shown again.  Signal an error if Tabbar mode is off.

\(fn &optional ARG)" t nil)

(defvar tabbar-mode nil "\
Non-nil if Tabbar mode is enabled.
See the command `tabbar-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `tabbar-mode'.")

(custom-autoload 'tabbar-mode "../plugin/tabbar" nil)

(autoload 'tabbar-mode "../plugin/tabbar" "\
Toggle display of a tab bar in the header line.
With prefix argument ARG, turn on if positive, otherwise off.
Returns non-nil if the new state is enabled.

\\{tabbar-mode-map}

\(fn &optional ARG)" t nil)

(defvar tabbar-mwheel-mode nil "\
Non-nil if Tabbar-Mwheel mode is enabled.
See the command `tabbar-mwheel-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `tabbar-mwheel-mode'.")

(custom-autoload 'tabbar-mwheel-mode "../plugin/tabbar" nil)

(autoload 'tabbar-mwheel-mode "../plugin/tabbar" "\
Toggle use of the mouse wheel to navigate through tabs or groups.
With prefix argument ARG, turn on if positive, otherwise off.
Returns non-nil if the new state is enabled.

\\{tabbar-mwheel-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/tempbuf" "../plugin/tempbuf.el"
;;;;;;  (22026 35731 218049 995000))
;;; Generated autoloads from ../plugin/tempbuf.el

(autoload 'tempbuf-mode "../plugin/tempbuf" "\
Toggle tempbuf mode.

With prefix ARG, turn the mode on if ARG is positive.
After mode activation, `tempbuf-mode-hook' is run.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-tempbuf-mode "../plugin/tempbuf" "\
Turn on tempbuf mode.

See also function `tempbuf-mode'.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "../plugin/vline" "../plugin/vline.el" (22026
;;;;;;  35731 220049 995000))
;;; Generated autoloads from ../plugin/vline.el

(autoload 'vline-mode "../plugin/vline" "\
Display vertical line mode.

\(fn &optional ARG)" t nil)

(defvar vline-global-mode nil "\
Non-nil if Vline-Global mode is enabled.
See the command `vline-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vline-global-mode'.")

(custom-autoload 'vline-global-mode "../plugin/vline" nil)

(autoload 'vline-global-mode "../plugin/vline" "\
Toggle Vline mode in all buffers.
With prefix ARG, enable Vline-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Vline mode is enabled in all buffers where
`(lambda nil (unless (minibufferp) (vline-mode 1)))' would do it.
See `vline-mode' for more information on Vline mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "../plugin/xmodmap-mode" "../plugin/xmodmap-mode.el"
;;;;;;  (22026 35731 222049 995000))
;;; Generated autoloads from ../plugin/xmodmap-mode.el

(autoload 'xmodmap-mode "../plugin/xmodmap-mode" "\
Major mode for editing ~/.xmodmaprc

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../plugin/zenburn" "../plugin/zenburn.el"
;;;;;;  (22026 35731 223049 995000))
;;; Generated autoloads from ../plugin/zenburn.el

(autoload 'color-theme-zenburn "../plugin/zenburn" "\
Just some alien fruit salad to keep you in the zone.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "10_el-get_plugin_start" "10_el-get_plugin_start.el"
;;;;;;  (22026 36194 841038 876000))
;;; Generated autoloads from 10_el-get_plugin_start.el

(autoload 'el-get-mode-custom-predefine "10_el-get_plugin_start" "\
For `eval-after-load' el-get customize.

\(fn)" nil nil)

(autoload 'el-get-mode-predefine "10_el-get_plugin_start" "\
For `eval-after-load' el-get function.

\(fn)" nil nil)

(autoload 'el-get-mode-map-predefine "10_el-get_plugin_start" "\
For el-get key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "22_mcomplete_plugin_start" "22_mcomplete_plugin_start.el"
;;;;;;  (22026 35731 230049 994000))
;;; Generated autoloads from 22_mcomplete_plugin_start.el

(autoload 'mcomplete-mode-predefine "22_mcomplete_plugin_start" "\
For `eval-after-load' mcomplete function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "30_check_misspell_plugin_start" "30_check_misspell_plugin_start.el"
;;;;;;  (22026 35731 231049 994000))
;;; Generated autoloads from 30_check_misspell_plugin_start.el

(autoload 'check-misspell-mode-predefine "30_check_misspell_plugin_start" "\
For `eval-after-load' check-misspell function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "70_eww_mode_start" "70_eww_mode_start.el"
;;;;;;  (22026 35731 240049 994000))
;;; Generated autoloads from 70_eww_mode_start.el

(autoload 'eww-mode-custom-predefine "70_eww_mode_start" "\
For `eval-after-load' eww customize.

\(fn)" nil nil)

(autoload 'eww-mode-predefine "70_eww_mode_start" "\
For `eval-after-load' eww function.

\(fn)" nil nil)

(autoload 'eww-mode-map-predefine "70_eww_mode_start" "\
For eww key bindings.

\(fn)" t nil)

(autoload 'eww-mode-face-predefine "70_eww_mode_start" "\
For eww face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "80_systemd_mode_start" "80_systemd_mode_start.el"
;;;;;;  (22026 35731 242049 994000))
;;; Generated autoloads from 80_systemd_mode_start.el

(autoload 'systemd-mode-custom-predefine "80_systemd_mode_start" "\
For `eval-after-load' systemd customize.

\(fn)" nil nil)

(autoload 'systemd-mode-predefine "80_systemd_mode_start" "\
For `eval-after-load' systemd function.

\(fn)" nil nil)

(autoload 'systemd-mode-map-predefine "80_systemd_mode_start" "\
For systemd key bindings.

\(fn)" t nil)

(autoload 'systemd-mode-face-predefine "80_systemd_mode_start" "\
For systemd face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "Emacs_Lisp_mode_start" "Emacs_Lisp_mode_start.el"
;;;;;;  (22026 35731 253049 994000))
;;; Generated autoloads from Emacs_Lisp_mode_start.el

(autoload 'emacs-lisp-mode-hook-predefine "Emacs_Lisp_mode_start" "\
For `eval-after-load' Emacs Lisp mode function.

\(fn)" nil nil)

(autoload 'my-find-tag "Emacs_Lisp_mode_start" "\
In Emacs Lisp mode, one of these functions is called:
`find-library', `find-variable', `find-face-definition',
`find-function' and `find-tag'.

\(fn)" t nil)

(autoload 'right-parentheses-indent "Emacs_Lisp_mode_start" "\
Insert right-parentheses then indent.
N

\(fn N)" t nil)

(autoload 'lisp-interaction-mode-hook-predefine "Emacs_Lisp_mode_start" "\
Lisp interaction mode hook predefine.

\(fn)" nil nil)

(autoload 'after-init-load-ac-sources-lisp-interaction "Emacs_Lisp_mode_start" "\


\(fn)" nil nil)

(autoload 'load-scratch-auto-complete "Emacs_Lisp_mode_start" "\
Load scratch auto complete.

\(fn)" t nil)

(autoload 'scratch-load-ac-sources-after-auto-complete-predefine "Emacs_Lisp_mode_start" "\
Load ac-sources after load auto-complete.

\(fn)" nil nil)

(defvar idle-lisp-interaction-mode-hook-predefine-flag nil)

(autoload 'toggle-let-astah-search-let "Emacs_Lisp_mode_start" "\


\(fn)" nil nil)

(autoload 'toggle-let-astah "Emacs_Lisp_mode_start" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "Info_mode_start" "Info_mode_start.el" (22026
;;;;;;  35731 253049 994000))
;;; Generated autoloads from Info_mode_start.el

(autoload 'Info-mode-custom-predefine "Info_mode_start" "\
For `eval-after-load' `Info-mode' customize.

\(fn)" nil nil)

(autoload 'Info-mode-predefine "Info_mode_start" "\
For `eval-after-load' `Info-mode' function.

\(fn)" nil nil)

(autoload 'Info-mode-map-predefine "Info_mode_start" "\
For `Info-mode' key bindings.

\(fn)" t nil)

(autoload 'Info-mode-mode-face-predefine "Info_mode_start" "\
For `Info-mode' face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "anything-c-moccur_plugin_start" "anything-c-moccur_plugin_start.el"
;;;;;;  (22026 35731 255049 994000))
;;; Generated autoloads from anything-c-moccur_plugin_start.el

(autoload 'anything-c-moccur-mode-custom-predefine "anything-c-moccur_plugin_start" "\
For `eval-after-load' anything-c-moccur customize.

\(fn)" nil nil)

(autoload 'anything-c-moccur-mode-predefine "anything-c-moccur_plugin_start" "\
For `eval-after-load' anything-c-moccur function.

\(fn)" nil nil)

(autoload 'anything-c-moccur-mode-map-predefine "anything-c-moccur_plugin_start" "\
For anything-c-moccur key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "anything_plugin_start" "anything_plugin_start.el"
;;;;;;  (22026 35731 255049 994000))
;;; Generated autoloads from anything_plugin_start.el

(autoload 'anything-mode-custom-predefine "anything_plugin_start" "\
For `eval-after-load' anything customize.

\(fn)" nil nil)

(autoload 'anything-mode-predefine "anything_plugin_start" "\
For `eval-after-load' anything function.

\(fn)" nil nil)

(autoload 'reload-anything-source "anything_plugin_start" "\


\(fn)" t nil)

(autoload 'anything-mode-map-predefine "anything_plugin_start" "\
For anything key bindings.

\(fn)" t nil)

(autoload 'anything-mode-face-predefine "anything_plugin_start" "\
For anything face.

\(fn)" nil nil)

(autoload 'my-anything-edit "anything_plugin_start" "\
My anything for edit.
`anything-c-source-kill-ring', `anything-c-source-yasnippet'

\(fn)" t nil)

(autoload 'anything-my-elisp "anything_plugin_start" "\
My anything for elisp.
`anything-c-source-emacs-functions', `anything-c-source-emacs-variables'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "apropos_mode_start" "apropos_mode_start.el"
;;;;;;  (22026 35731 255049 994000))
;;; Generated autoloads from apropos_mode_start.el

(autoload 'apropos-mode-custom-predefine "apropos_mode_start" "\
For `eval-after-load' apropos customize.

\(fn)" nil nil)

(autoload 'apropos-mode-predefine "apropos_mode_start" "\
For `eval-after-load' apropos function.

\(fn)" nil nil)

(autoload 'apropos-mode-map-predefine "apropos_mode_start" "\
For apropos key bindings.

\(fn)" t nil)

(autoload 'apropos-mode-face-predefine "apropos_mode_start" "\
For apropos face.

\(fn)" nil nil)

(defvar hi-apro:type2face-alist '(("Command" . font-lock-keyword-face) ("Face" . font-lock-string-face) ("Function" . font-lock-function-name-face) ("Group" . font-lock-constant-face) ("Macro" . font-lock-warning-face) ("Plist" . font-lock-type-face) ("Variable" . font-lock-variable-name-face) ("Widget" . font-lock-builtin-face)))

(defvar hi-apro:default-header-face 'font-lock-comment-face)

;;;***

;;;### (autoloads nil "ascii_plugin_start" "ascii_plugin_start.el"
;;;;;;  (22026 35731 255049 994000))
;;; Generated autoloads from ascii_plugin_start.el

(autoload 'ascii-mode-custom-predefine "ascii_plugin_start" "\
For `eval-after-load' ascii customize.

\(fn)" nil nil)

(autoload 'ascii-mode-predefine "ascii_plugin_start" "\
For `eval-after-load' ascii function.

\(fn)" nil nil)

(autoload 'ascii-mode-map-predefine "ascii_plugin_start" "\
For ascii key bindings.

\(fn)" t nil)

(autoload 'ascii-mode-face-predefine "ascii_plugin_start" "\
For ascii face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "asm_mode_start" "asm_mode_start.el" (22026
;;;;;;  35731 256049 994000))
;;; Generated autoloads from asm_mode_start.el

(autoload 'asm-mode-mode-custom-predefine "asm_mode_start" "\
For `eval-after-load' `asm-mode' customize.

\(fn)" nil nil)

(autoload 'asm-mode-mode-predefine "asm_mode_start" "\
For `eval-after-load' `asm-mode' function.

\(fn)" nil nil)

(autoload 'asm-mode-mode-map-predefine "asm_mode_start" "\
For `asm-mode' key bindings.

\(fn)" t nil)

(autoload 'asm-mode-mode-face-predefine "asm_mode_start" "\
For `asm-mode' face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "auto-async-byte-compile_plugin_start" "auto-async-byte-compile_plugin_start.el"
;;;;;;  (22026 35731 256049 994000))
;;; Generated autoloads from auto-async-byte-compile_plugin_start.el

(autoload 'auto-async-byte-compile-mode-custom-predefine "auto-async-byte-compile_plugin_start" "\
For `eval-after-load' auto-async-byte-compile customize.

\(fn)" nil nil)

(autoload 'auto-async-byte-compile-mode-predefine "auto-async-byte-compile_plugin_start" "\
For `eval-after-load' auto-async-byte-compile function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "auto-complete_plugin_start" "auto-complete_plugin_start.el"
;;;;;;  (22026 35731 256049 994000))
;;; Generated autoloads from auto-complete_plugin_start.el

(autoload 'auto-complete-mode-custom-predefine "auto-complete_plugin_start" "\
For `eval-after-load' auto-complete customize.

\(fn)" nil nil)

(autoload 'auto-complete-mode-predefine "auto-complete_plugin_start" "\
For `eval-after-load' auto-complete function.

\(fn)" nil nil)

(autoload 'auto-complete-mode-map-predefine "auto-complete_plugin_start" "\
For auto-complete key bindings.

\(fn)" t nil)

(autoload 'auto-complete-stop&save "auto-complete_plugin_start" "\
Auto complete stop and save.

\(fn)" t nil)

(autoload 'global-auto-complete-mode-on "auto-complete_plugin_start" "\
Turn on global auto complete mode.

\(fn)" t nil)

(autoload 'global-auto-complete-mode-off "auto-complete_plugin_start" "\
Turn off global auto complete mode.

\(fn)" t nil)

(autoload 'my-ac-look "auto-complete_plugin_start" "\
Look コマンドの出力をリストで返す.

\(fn)" t nil)

(autoload 'ac-complete-look "auto-complete_plugin_start" "\


\(fn)" t nil)

(autoload 'reload-auto-complete-mode "auto-complete_plugin_start" "\
Reload auto-complete-mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auto-highlight-symbol_plugin_start" "auto-highlight-symbol_plugin_start.el"
;;;;;;  (22026 35731 256049 994000))
;;; Generated autoloads from auto-highlight-symbol_plugin_start.el

(autoload 'auto-highlight-symbol-mode-custom-predefine "auto-highlight-symbol_plugin_start" "\
For `eval-after-load' auto-highlight-symbol customize.

\(fn)" nil nil)

(autoload 'auto-highlight-symbol-mode-predefine "auto-highlight-symbol_plugin_start" "\
For `eval-after-load' auto-highlight-symbol function.

\(fn)" nil nil)

(autoload 'auto-highlight-symbol-mode-map-predefine "auto-highlight-symbol_plugin_start" "\
For auto-highlight-symbol key bindings.

\(fn)" t nil)

(autoload 'auto-highlight-symbol-mode-face-predefine "auto-highlight-symbol_plugin_start" "\
For auto-highlight-symbol face.

\(fn)" nil nil)

(autoload 'auto-highlight-symbol-mode-on "auto-highlight-symbol_plugin_start" "\
Global `auto-highlight-symbol' mode on.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "auto-install_plugin_start" "auto-install_plugin_start.el"
;;;;;;  (22026 35731 256049 994000))
;;; Generated autoloads from auto-install_plugin_start.el

(autoload 'auto-install-mode-custom-predefine "auto-install_plugin_start" "\
For `eval-after-load' auto-install customize.

\(fn)" nil nil)

(autoload 'auto-install-mode-predefine "auto-install_plugin_start" "\
For `eval-after-load' auto-install function.

\(fn)" nil nil)

(autoload 'auto-install-mode-map-predefine "auto-install_plugin_start" "\
For auto-install key bindings.

\(fn)" t nil)

(autoload 'auto-install-save&erase "auto-install_plugin_start" "\
Auto install erase after save as one command.
`auto-install-buffer-save', `erase-auto-install-buffer'

\(fn)" t nil)

(autoload 'auto-install-handle-emacswiki-package-name "auto-install_plugin_start" "\
Handle elisp package name from `EmacsWiki'.
DOWNLOAD-BUFFER is the name of download buffer.
PROMPT-INSTALL is non-nil, will prompt package name for install.

\(fn DOWNLOAD-BUFFER &optional PROMPT-INSTALL)" nil nil)

(autoload 'erase-auto-install-buffer "auto-install_plugin_start" "\


\(fn)" nil nil)

(autoload 'auto-install-download-by-wget "auto-install_plugin_start" "\


\(fn URL HANDLE-FUNCTION DOWNLOAD-BUFFER)" nil nil)

(autoload 'anything-auto-install-mode-predefine "auto-install_plugin_start" "\
For `eval-after-load' anything-auto-install function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "autoinsert_plugin_start" "autoinsert_plugin_start.el"
;;;;;;  (22026 35731 257049 994000))
;;; Generated autoloads from autoinsert_plugin_start.el

(autoload 'autoinsert-custom-predefine "autoinsert_plugin_start" "\
For `eval-after-load' autoinsert customize.

\(fn)" nil nil)

(autoload 'autoinsert-predefine "autoinsert_plugin_start" "\
For `eval-after-load' autoinsert function.

\(fn)" nil nil)

(autoload 'yas-expand-link "autoinsert_plugin_start" "\
Hyperlink function for yasnippet expansion.
Argument KEY .
Argument DEL .

\(fn KEY DEL)" nil nil)

(autoload 'yas-expand-link-choice "autoinsert_plugin_start" "\
Hyperlink to select yasnippet template.
Argument DEL .
Optional argument KEYS .

\(fn DEL &rest KEYS)" nil nil)

(autoload 'my-auto-insert-elisp "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-auto-insert-cpp "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-auto-insert-shscripts "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-auto-insert-init-python "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-auto-insert-main-python "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-junk-auto-insert-python "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-test-auto-insert-python "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-junk-auto-insert-elisp "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-setup-auto-insert-python "autoinsert_plugin_start" "\


\(fn)" nil nil)

(autoload 'my-auto-insert-python "autoinsert_plugin_start" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "c_mode_start" "c_mode_start.el" (22026 35731
;;;;;;  257049 994000))
;;; Generated autoloads from c_mode_start.el

(autoload 'cc-coding-style "c_mode_start" "\


\(fn)" nil nil)

(autoload 'cc-mode-mode-custom-predefine "c_mode_start" "\
For `eval-after-load' cc-mode customize.

\(fn)" nil nil)

(autoload 'cc-mode-mode-predefine "c_mode_start" "\
For `eval-after-load' cc-mode function.

\(fn)" nil nil)

(autoload 'cc-mode-mode-map-predefine "c_mode_start" "\
For cc-mode key bindings.

\(fn)" t nil)

(autoload 'cc-mode-mode-face-predefine "c_mode_start" "\
For cc-mode face.

\(fn)" nil nil)

(autoload 'c-mode-common-hook-predefine "c_mode_start" "\
For `c-mode-common-hook'.

\(fn)" nil nil)

(autoload 'gtags-mode-predefine "c_mode_start" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "check_default_start" "check_default_start.el"
;;;;;;  (22026 35731 257049 994000))
;;; Generated autoloads from check_default_start.el

(autoload 'default-el-prompt "check_default_start" "\


\(fn)" nil nil)

(autoload 'default-el-update-var "check_default_start" "\
update 09_check_default_start.el setting variables.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "col-highlight_plugin_start" "col-highlight_plugin_start.el"
;;;;;;  (22026 35731 257049 994000))
;;; Generated autoloads from col-highlight_plugin_start.el

(autoload 'col-highlight-mode-predefine "col-highlight_plugin_start" "\
For `eval-after-load' col-highlight function.

\(fn)" nil nil)

(autoload 'col-highlight-mode-face-predefine "col-highlight_plugin_start" "\
For col-highlight face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "crontab_mode_start" "crontab_mode_start.el"
;;;;;;  (22026 35731 257049 994000))
;;; Generated autoloads from crontab_mode_start.el

(add-to-list 'auto-mode-alist '("\\.cron\\(tab\\)?\\'" . crontab-mode))

(add-to-list 'auto-mode-alist '("cron\\(tab\\)" . crontab-mode))

;;;***

;;;### (autoloads nil "customize_plugin_start" "customize_plugin_start.el"
;;;;;;  (22026 35731 257049 994000))
;;; Generated autoloads from customize_plugin_start.el

(autoload 'cus-edit-predefine "customize_plugin_start" "\
For `eval-after-load' cus-edit function.

\(fn)" nil nil)

(autoload 'cus-edit-face-predefine "customize_plugin_start" "\
For cus-edit key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "dired_mode_start" "dired_mode_start.el" (22026
;;;;;;  35731 257049 994000))
;;; Generated autoloads from dired_mode_start.el

(autoload 'dired-mode-custom-predefine "dired_mode_start" "\
For `eval-after-load' dired customize.

\(fn)" nil nil)

(autoload 'dired-mode-predefine "dired_mode_start" "\
For `eval-after-load' dired function.

\(fn)" nil nil)

(autoload 'dired-mode-map-predefine "dired_mode_start" "\
For dired key bindings.

\(fn)" t nil)

(autoload 'dired-mode-face-predefine "dired_mode_start" "\
For dired face.

\(fn)" nil nil)

(autoload 'dired-mode-hook-predefine "dired_mode_start" "\
Dired mode hook.

\(fn)" nil nil)

(autoload 'dired+-mode-custom-predefine "dired_mode_start" "\
For `eval-after-load' dired+ customize.

\(fn)" nil nil)

(autoload 'dired+-mode-predefine "dired_mode_start" "\
For `eval-after-load' dired+ function.

\(fn)" nil nil)

(autoload 'dired+-mode-map-predefine "dired_mode_start" "\
For dired+ key bindings.

\(fn)" t nil)

(autoload 'dired+-mode-face-predefine "dired_mode_start" "\
For dired+ face.

\(fn)" nil nil)

(autoload 'dired-toggle-mark "dired_mode_start" "\
Toggle the current (or next ARG) files.

\(fn ARG)" t nil)

(autoload 'dired-my-advertised-find-file "dired_mode_start" "\


\(fn)" t nil)

(autoload 'dired-my-up-directory "dired_mode_start" "\
Run dired on parent directory of current directory.
  Find the parent directory either in this buffer or another buffer.
  Creates a buffer if necessary.

\(fn &optional OTHER-WINDOW)" t nil)

(autoload 'my-dired-today-search "dired_mode_start" "\
Fontlock search function for dired.
ARG:

\(fn ARG)" nil nil)

(autoload 'wdired-mode-hook-predefine "dired_mode_start" "\
Wdired mode hook.

\(fn)" nil nil)

(autoload 'wdired-mode-custom-predefine "dired_mode_start" "\
For `eval-after-load' wdired customize.

\(fn)" nil nil)

(autoload 'wdired-mode-predefine "dired_mode_start" "\
For `eval-after-load' wdired function.

\(fn)" nil nil)

(autoload 'wdired-mode-map-predefine "dired_mode_start" "\
For wdired key bindings.

\(fn)" t nil)

(autoload 'wdired-mode-face-predefine "dired_mode_start" "\
For wdired face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "doctest-mode_plugin_start" "doctest-mode_plugin_start.el"
;;;;;;  (22026 35731 257049 994000))
;;; Generated autoloads from doctest-mode_plugin_start.el

(autoload 'doctest-mode-mode-predefine "doctest-mode_plugin_start" "\
For `eval-after-load' doctest-mode function.

\(fn)" nil nil)

(autoload 'doctest-mode-mode-map-predefine "doctest-mode_plugin_start" "\
For doctest-mode key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "dsvn_mode_start" "dsvn_mode_start.el" (22026
;;;;;;  35731 258049 994000))
;;; Generated autoloads from dsvn_mode_start.el

(autoload 'dsvn-mode-custom-predefine "dsvn_mode_start" "\
For `eval-after-load' dsvn customize.

\(fn)" nil nil)

(autoload 'dsvn-mode-predefine "dsvn_mode_start" "\
For `eval-after-load' dsvn function.

\(fn)" nil nil)

(autoload 'dsvn-mode-map-predefine "dsvn_mode_start" "\
For dsvn key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "e2wm_mode_start" "e2wm_mode_start.el" (22026
;;;;;;  35731 258049 994000))
;;; Generated autoloads from e2wm_mode_start.el

(autoload 'e2wm-mode-custom-predefine "e2wm_mode_start" "\
For `eval-after-load' e2wm customize.

\(fn)" nil nil)

(autoload 'e2wm-mode-predefine "e2wm_mode_start" "\
For `eval-after-load' e2wm function.

\(fn)" nil nil)

(autoload 'e2wm-mode-map-predefine "e2wm_mode_start" "\
For e2wm key bindings.

\(fn)" t nil)

(autoload 'e2wm-mode-face-predefine "e2wm_mode_start" "\
For e2wm face.

\(fn)" nil nil)

(autoload 'e2wm:toggle-start-stop "e2wm_mode_start" "\


\(fn)" t nil)

(autoload 'e2wm:windmove-down-or-splitmove "e2wm_mode_start" "\
Try window move down. If not exist window then split it vertically

\(fn &optional ARGS)" t nil)

(autoload 'e2wm:windmove-up-or-splitmove "e2wm_mode_start" "\
Try window move up. If not exist window then split it vertically

\(fn &optional ARGS)" t nil)

;;;***

;;;### (autoloads nil "edit-list_plugin_start" "edit-list_plugin_start.el"
;;;;;;  (22026 35731 258049 994000))
;;; Generated autoloads from edit-list_plugin_start.el

(autoload 'edit-list-mode-custom-predefine "edit-list_plugin_start" "\
For `eval-after-load' edit-list customize.

\(fn)" nil nil)

(autoload 'edit-list-mode-predefine "edit-list_plugin_start" "\
For `eval-after-load' edit-list function.

\(fn)" nil nil)

(autoload 'edit-list-mode-map-predefine "edit-list_plugin_start" "\
For edit-list key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "eldoc_plugin_start" "eldoc_plugin_start.el"
;;;;;;  (22026 35731 258049 994000))
;;; Generated autoloads from eldoc_plugin_start.el

(autoload 'eldoc-mode-custom-predefine "eldoc_plugin_start" "\
For `eval-after-load' eldoc customize.

\(fn)" nil nil)

(autoload 'eldoc-mode-predefine "eldoc_plugin_start" "\
For `eval-after-load' eldoc function.

\(fn)" nil nil)

(autoload 'eldoc-mode-map-predefine "eldoc_plugin_start" "\
For eldoc key bindings.

\(fn)" t nil)

(autoload 'eldoc-mode-face-predefine "eldoc_plugin_start" "\
For eldoc face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "face_start" "face_start.el" (22026 35731 258049
;;;;;;  994000))
;;; Generated autoloads from face_start.el

(autoload 'default-frame-width "face_start" "\
Set width of selected frame.

\(fn)" nil nil)

(autoload 'toggle-max-window "face_start" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "filecache_start" "filecache_start.el" (22026
;;;;;;  35731 258049 994000))
;;; Generated autoloads from filecache_start.el

(autoload 'filecache-mode-custom-predefine "filecache_start" "\
For `eval-after-load' filecache customize.

\(fn)" nil nil)

(autoload 'filecache-mode-predefine "filecache_start" "\
For `eval-after-load' filecache function.

\(fn)" nil nil)

(autoload 'file-cache-save-cache-to-file "filecache_start" "\
Save contents of `file-cache-alist' to FILE.
For later retrieval using `file-cache-read-cache-from-file'

\(fn FILE)" t nil)

(autoload 'file-cache-read-cache-from-file "filecache_start" "\
Clear `file-cache-alist' and read cache from FILE.
The file cache can be saved to a file using `file-cache-save-cache-to-file'.

\(fn FILE)" t nil)

(autoload 'file-cache-add-this-file "filecache_start" "\


\(fn)" nil nil)

(autoload 'filecache-cleaning "filecache_start" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "flycheck_plugin_start" "flycheck_plugin_start.el"
;;;;;;  (22026 35731 258049 994000))
;;; Generated autoloads from flycheck_plugin_start.el

(autoload 'flycheck-mode-custom-predefine "flycheck_plugin_start" "\
For `eval-after-load' flycheck customize.

\(fn)" nil nil)

(autoload 'flycheck-mode-predefine "flycheck_plugin_start" "\
For `eval-after-load' flycheck function.

\(fn)" nil nil)

(autoload 'flycheck-mode-map-predefine "flycheck_plugin_start" "\
For flycheck key bindings.

\(fn)" t nil)

(autoload 'flycheck-mode-face-predefine "flycheck_plugin_start" "\
For flycheck face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "flymake_plugin_start" "flymake_plugin_start.el"
;;;;;;  (22026 35731 259049 994000))
;;; Generated autoloads from flymake_plugin_start.el

(autoload 'flymake-mode-custom-predefine "flymake_plugin_start" "\
For `eval-after-load' flymake customize.

\(fn)" nil nil)

(autoload 'flymake-mode-predefine "flymake_plugin_start" "\
For `eval-after-load' flymake function.

\(fn)" nil nil)

(autoload 'flymake-mode-map-predefine "flymake_plugin_start" "\
For flymake key bindings.

\(fn)" t nil)

(autoload 'flymake-mode-face-predefine "flymake_plugin_start" "\
For flymake face.

\(fn)" nil nil)

(autoload 'flymake-pyflakes-init "flymake_plugin_start" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "gdb_mode_start" "gdb_mode_start.el" (22026
;;;;;;  35731 259049 994000))
;;; Generated autoloads from gdb_mode_start.el

(autoload 'gud-mode-custom-predefine "gdb_mode_start" "\
For `eval-after-load' gud customize.

\(fn)" nil nil)

(autoload 'gud-mode-predefine "gdb_mode_start" "\
For `eval-after-load' gud function.

\(fn)" nil nil)

(autoload 'gud-mode-map-predefine "gdb_mode_start" "\
For gud key bindings.

\(fn)" t nil)

(autoload 'gud-mode-hook-predefine "gdb_mode_start" "\
GUD mode hook predefine.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "gnus-art_plugin_start" "gnus-art_plugin_start.el"
;;;;;;  (22026 35731 259049 994000))
;;; Generated autoloads from gnus-art_plugin_start.el

(autoload 'gnus-art-predefine "gnus-art_plugin_start" "\
For `eval-after-load' gnus-art function.

\(fn)" nil nil)

(autoload 'gnus-art-faces-predefine "gnus-art_plugin_start" "\
For gnus-art key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "gnus-cite_plugin_start" "gnus-cite_plugin_start.el"
;;;;;;  (22026 35731 260049 994000))
;;; Generated autoloads from gnus-cite_plugin_start.el

(autoload 'gnus-cite-predefine "gnus-cite_plugin_start" "\
For `eval-after-load' gnus-cite function.

\(fn)" nil nil)

(autoload 'gnus-cite-face-predefine "gnus-cite_plugin_start" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "gnus_plugin_start" "gnus_plugin_start.el"
;;;;;;  (22026 35731 260049 994000))
;;; Generated autoloads from gnus_plugin_start.el

(autoload 'gnus-predefine "gnus_plugin_start" "\
For `eval-after-load' gnus function.

\(fn)" nil nil)

(autoload 'gnus-faces-predefine "gnus_plugin_start" "\
For gnus key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "grep_plugin_start" "grep_plugin_start.el"
;;;;;;  (22026 35731 260049 994000))
;;; Generated autoloads from grep_plugin_start.el

(autoload 'grep-mode-custom-predefine "grep_plugin_start" "\
For `eval-after-load' grep customize.

\(fn)" nil nil)

(autoload 'grep-mode-predefine "grep_plugin_start" "\
For `eval-after-load' grep function.

\(fn)" nil nil)

(autoload 'grep-mode-map-predefine "grep_plugin_start" "\
For grep key bindings.

\(fn)" t nil)

(autoload 'grep-edit-mode-predefine "grep_plugin_start" "\
For `eval-after-load' grep-edit function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "helm_plugin_start" "helm_plugin_start.el"
;;;;;;  (22026 35731 260049 994000))
;;; Generated autoloads from helm_plugin_start.el

(autoload 'helm-mode-custom-predefine "helm_plugin_start" "\
For `eval-after-load' helm customize.

\(fn)" nil nil)

(autoload 'helm-mode-predefine "helm_plugin_start" "\
For `eval-after-load' helm function.

\(fn)" nil nil)

(autoload 'helm-mode-map-predefine "helm_plugin_start" "\
For helm key bindings.

\(fn)" t nil)

(autoload 'helm-mode-face-predefine "helm_plugin_start" "\
For helm face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "highlight-indentation_plugin_start" "highlight-indentation_plugin_start.el"
;;;;;;  (22026 35731 260049 994000))
;;; Generated autoloads from highlight-indentation_plugin_start.el

(autoload 'highlight-indentation-mode-predefine "highlight-indentation_plugin_start" "\
For `eval-after-load' highlight-indentation function.

\(fn)" nil nil)

(autoload 'highlight-indentation-mode-face-predefine "highlight-indentation_plugin_start" "\
For highlight-indentation face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "image_mode_start" "image_mode_start.el" (22026
;;;;;;  35731 260049 994000))
;;; Generated autoloads from image_mode_start.el

(autoload 'image-mode-mode-custom-predefine "image_mode_start" "\
For `eval-after-load' `image-mode' customize.

\(fn)" nil nil)

(autoload 'image-mode-mode-predefine "image_mode_start" "\
For `eval-after-load' `image-mode' function.

\(fn)" nil nil)

(autoload 'image-mode-mode-map-predefine "image_mode_start" "\
For `image-mode' key bindings.

\(fn)" t nil)

(autoload 'image-mode-mode-face-predefine "image_mode_start" "\
For `image-mode' face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "irfc_plugin_start" "irfc_plugin_start.el"
;;;;;;  (22026 35731 260049 994000))
;;; Generated autoloads from irfc_plugin_start.el

(autoload 'irfc-mode-custom-predefine "irfc_plugin_start" "\
For `eval-after-load' irfc customize.

\(fn)" nil nil)

(autoload 'irfc-mode-predefine "irfc_plugin_start" "\
For `eval-after-load' irfc function.

\(fn)" nil nil)

(autoload 'irfc-mode-map-predefine "irfc_plugin_start" "\
For irfc key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "ispell_plugin_start" "ispell_plugin_start.el"
;;;;;;  (22026 35731 260049 994000))
;;; Generated autoloads from ispell_plugin_start.el

(autoload 'ispell-mode-custom-predefine "ispell_plugin_start" "\
For `eval-after-load' Ispell customize.

\(fn)" nil nil)

(autoload 'ispell-mode-predefine "ispell_plugin_start" "\
For `eval-after-load' Ispell function.

\(fn)" nil nil)

(autoload 'ispell-mode-map-predefine "ispell_plugin_start" "\
For Ispell key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "iswitchb_plugin_start" "iswitchb_plugin_start.el"
;;;;;;  (22026 35731 261049 994000))
;;; Generated autoloads from iswitchb_plugin_start.el

(autoload 'iswitchb-mode-custom-predefine "iswitchb_plugin_start" "\
For `eval-after-load' iswitchb customize.

\(fn)" nil nil)

(autoload 'iswitchb-mode-predefine "iswitchb_plugin_start" "\
For `eval-after-load' iswitchb function.

\(fn)" nil nil)

(autoload 'iswitchb-mode-map-predefine "iswitchb_plugin_start" "\
For iswitchb key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "javascript_mode_start" "javascript_mode_start.el"
;;;;;;  (22026 35731 261049 994000))
;;; Generated autoloads from javascript_mode_start.el

(autoload 'javascript-mode-custom-predefine "javascript_mode_start" "\
For `eval-after-load' javascript customize.

\(fn)" nil nil)

(autoload 'javascript-mode-predefine "javascript_mode_start" "\
For `eval-after-load' javascript function.

\(fn)" nil nil)

(autoload 'javascript-mode-map-predefine "javascript_mode_start" "\
For javascript key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "jedi_plugin_start" "jedi_plugin_start.el"
;;;;;;  (22026 35731 261049 994000))
;;; Generated autoloads from jedi_plugin_start.el

(autoload 'jedi-mode-custom-predefine "jedi_plugin_start" "\
For `eval-after-load' jedi customize.

\(fn)" nil nil)

(autoload 'jedi-mode-predefine "jedi_plugin_start" "\
For `eval-after-load' jedi function.

\(fn)" nil nil)

(autoload 'jedi-mode-map-predefine "jedi_plugin_start" "\
For jedi key bindings.

\(fn)" t nil)

(autoload 'jedi-mode-face-predefine "jedi_plugin_start" "\
For jedi face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "linum_plugin_start" "linum_plugin_start.el"
;;;;;;  (22026 35731 261049 994000))
;;; Generated autoloads from linum_plugin_start.el

(autoload 'linum-mode-custom-predefine "linum_plugin_start" "\
For `eval-after-load' linum customize.

\(fn)" nil nil)

(autoload 'linum-mode-predefine "linum_plugin_start" "\
For `eval-after-load' linum function.

\(fn)" nil nil)

(autoload 'linum-mode-face-predefine "linum_plugin_start" "\
For linum face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "ll-debug_start" "ll-debug_start.el" (22026
;;;;;;  35731 261049 994000))
;;; Generated autoloads from ll-debug_start.el

(autoload 'll-debug-predefine "ll-debug_start" "\
For `eval-after-load' ll-debug function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "message_plugin_start" "message_plugin_start.el"
;;;;;;  (22026 35731 261049 994000))
;;; Generated autoloads from message_plugin_start.el

(autoload 'message-predefine "message_plugin_start" "\
For `eval-after-load' message function.

\(fn)" nil nil)

(autoload 'message-faces-predefine "message_plugin_start" "\
For message faces.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "midnight_plugin_start" "midnight_plugin_start.el"
;;;;;;  (22026 35731 261049 994000))
;;; Generated autoloads from midnight_plugin_start.el

(autoload 'midnight-mode-custom-predefine "midnight_plugin_start" "\
For `eval-after-load' midnight customize.

\(fn)" nil nil)

(autoload 'midnight-mode-predefine "midnight_plugin_start" "\
For `eval-after-load' midnight function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "moccur_plugin_start" "moccur_plugin_start.el"
;;;;;;  (22026 35731 261049 994000))
;;; Generated autoloads from moccur_plugin_start.el

(autoload 'color-moccur-mode-custom-predefine "moccur_plugin_start" "\
For `eval-after-load' color-moccur customize.

\(fn)" nil nil)

(autoload 'color-moccur-mode-predefine "moccur_plugin_start" "\
For `eval-after-load' color-moccur function.

\(fn)" nil nil)

(autoload 'color-moccur-mode-map-predefine "moccur_plugin_start" "\
For color-moccur key bindings.

\(fn)" t nil)

(autoload 'moccur-edit-mode-custom-predefine "moccur_plugin_start" "\
For `eval-after-load' moccur-edit customize.

\(fn)" nil nil)

(autoload 'moccur-edit-mode-predefine "moccur_plugin_start" "\
For `eval-after-load' moccur-edit function.

\(fn)" nil nil)

(autoload 'moccur-edit-mode-map-predefine "moccur_plugin_start" "\
For moccur-edit key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "multi-term_plugin_start" "multi-term_plugin_start.el"
;;;;;;  (22026 35731 264049 994000))
;;; Generated autoloads from multi-term_plugin_start.el

(autoload 'multi-term-mode-custom-predefine "multi-term_plugin_start" "\
For `eval-after-load' multi-term customize.

\(fn)" nil nil)

(autoload 'multi-term-mode-predefine "multi-term_plugin_start" "\
For `eval-after-load' multi-term function.

\(fn)" nil nil)

(autoload 'multi-term-mode-map-predefine "multi-term_plugin_start" "\
For multi-term key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "multiple-cursors_plugin_start" "multiple-cursors_plugin_start.el"
;;;;;;  (22026 35731 264049 994000))
;;; Generated autoloads from multiple-cursors_plugin_start.el

(autoload 'multiple-cursors-mode-predefine "multiple-cursors_plugin_start" "\
For `eval-after-load' multiple-cursors function.

\(fn)" nil nil)

(autoload 'multiple-cursors-mode-map-predefine "multiple-cursors_plugin_start" "\
For multiple-cursors key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "nosetests_plugin_start" "nosetests_plugin_start.el"
;;;;;;  (22026 35731 264049 994000))
;;; Generated autoloads from nosetests_plugin_start.el

(autoload 'nosetests-mode-custom-predefine "nosetests_plugin_start" "\
For `eval-after-load' nosetests customize.

\(fn)" nil nil)

(autoload 'nosetests-mode-predefine "nosetests_plugin_start" "\
For `eval-after-load' nosetests function.

\(fn)" nil nil)

(autoload 'nosetests-mode-map-predefine "nosetests_plugin_start" "\
For nosetests key bindings.

\(fn)" t nil)

(autoload 'nosetests-mode-face-predefine "nosetests_plugin_start" "\
For nosetests face.

\(fn)" nil nil)

(autoload 'nosetests-run-all+ "nosetests_plugin_start" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-it-cover-package+ "nosetests_plugin_start" "\
ARGS

\(fn ARGS)" t nil)

(autoload 'nosetests-run-all-cover-package+ "nosetests_plugin_start" "\
ARGS

\(fn ARGS)" t nil)

;;;***

;;;### (autoloads nil "open-junk-file_plugin_start" "open-junk-file_plugin_start.el"
;;;;;;  (22026 35731 264049 994000))
;;; Generated autoloads from open-junk-file_plugin_start.el

(autoload 'open-junk-file-mode-predefine "open-junk-file_plugin_start" "\
For `eval-after-load' open-junk-file function.

\(fn)" nil nil)

(autoload 'cleanup-open-junk-files "open-junk-file_plugin_start" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "org_mode_start" "org_mode_start.el" (22026
;;;;;;  35731 264049 994000))
;;; Generated autoloads from org_mode_start.el

(autoload 'org-mode-custom-predefine "org_mode_start" "\
For `eval-after-load' org customize.

\(fn)" nil nil)

(autoload 'org-mode-predefine "org_mode_start" "\
For `eval-after-load' org function.

\(fn)" nil nil)

(autoload 'org-mode-map-predefine "org_mode_start" "\
For org key bindings.

\(fn)" t nil)

(autoload 'org-mode-face-predefine "org_mode_start" "\
For org face.

\(fn)" nil nil)

(autoload 'org-remember-mode-custom-predefine "org_mode_start" "\
For `eval-after-load' org-remember customize.

\(fn)" nil nil)

(autoload 'org-remember-mode-predefine "org_mode_start" "\
For `eval-after-load' org-remember function.

\(fn)" nil nil)

(autoload 'org-remember-mode-map-predefine "org_mode_start" "\
For org-remember key bindings.

\(fn)" t nil)

(autoload 'org-remember-mode-face-predefine "org_mode_start" "\
For org-remember face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "popup_plugin_start" "popup_plugin_start.el"
;;;;;;  (22026 35731 264049 994000))
;;; Generated autoloads from popup_plugin_start.el

(autoload 'popup-mode-predefine "popup_plugin_start" "\
For `eval-after-load' popup function.

\(fn)" nil nil)

(autoload 'popup-mode-map-predefine "popup_plugin_start" "\
For popup key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "purge-package_plugin_start" "purge-package_plugin_start.el"
;;;;;;  (22026 35731 265049 994000))
;;; Generated autoloads from purge-package_plugin_start.el

(autoload 'purge-package-mode-custom-predefine "purge-package_plugin_start" "\
For `eval-after-load' purge-package customize.

\(fn)" nil nil)

(autoload 'purge-package-mode-predefine "purge-package_plugin_start" "\
For `eval-after-load' purge-package function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "pylookup_plugin_start" "pylookup_plugin_start.el"
;;;;;;  (22026 35731 265049 994000))
;;; Generated autoloads from pylookup_plugin_start.el

(autoload 'pylookup-mode-predefine "pylookup_plugin_start" "\
For `eval-after-load' pylookup function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "python-pep8_start" "python-pep8_start.el"
;;;;;;  (22026 35731 265049 994000))
;;; Generated autoloads from python-pep8_start.el

(autoload 'python-pep8-mode-custom-predefine "python-pep8_start" "\
For `eval-after-load' python-pep8 customize.

\(fn)" nil nil)

(autoload 'python-pep8-mode-predefine "python-pep8_start" "\
For `eval-after-load' python-pep8 function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "python_mode_start" "python_mode_start.el"
;;;;;;  (22026 35731 265049 994000))
;;; Generated autoloads from python_mode_start.el

(autoload 'python-mode-custom-predefine "python_mode_start" "\
For `eval-after-load' python customize.

\(fn)" nil nil)

(autoload 'python-mode-predefine "python_mode_start" "\
For `eval-after-load' python function.

\(fn)" nil nil)

(autoload 'python-mode-map-predefine "python_mode_start" "\
For python key bindings.

\(fn)" t nil)

(autoload 'python-mode-face-predefine "python_mode_start" "\
For python face.

\(fn)" nil nil)

(autoload 'pymacs-predefine "python_mode_start" "\
For `eval-after-load' pymacs function.

\(fn)" nil nil)

(autoload 'python-coding-style "python_mode_start" "\
Coding style for python.

\(fn)" nil nil)

(autoload 'python-mode-hook-predefine "python_mode_start" "\
Python mode hooks.

\(fn)" nil nil)

(autoload 'rope-open-current-or-parent "python_mode_start" "\
Rope open current or parent.

\(fn)" nil nil)

(autoload 'epy-django-snippets "python_mode_start" "\
Load django snippets.

\(fn)" t nil)

(autoload 'workon-postactivate "python_mode_start" "\
Workon post activate.
VIRTUALENV: virtualenv

\(fn VIRTUALENV)" nil nil)

(autoload 'python-flymake-show-help "python_mode_start" "\
Flaymake show help.

\(fn)" nil nil)

(autoload 'py-quote "python_mode_start" "\
Pyquote.
ARGS:

\(fn ARGS)" t nil)

(autoload 'inferior-python-mode-hook-predefine "python_mode_start" "\
Inferior python mode hook predefine.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "python_pylint_plugin_start" "python_pylint_plugin_start.el"
;;;;;;  (22026 35731 265049 994000))
;;; Generated autoloads from python_pylint_plugin_start.el

(autoload 'python-pylint-mode-custom-predefine "python_pylint_plugin_start" "\
For `eval-after-load' python-pylint customize.

\(fn)" nil nil)

(autoload 'python-pylint-mode-predefine "python_pylint_plugin_start" "\
For `eval-after-load' python-pylint function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "recentf_plugin_start" "recentf_plugin_start.el"
;;;;;;  (22026 35731 266049 994000))
;;; Generated autoloads from recentf_plugin_start.el

(autoload 'recentf-mode-custom-predefine "recentf_plugin_start" "\
For `eval-after-load' recentf customize.

\(fn)" nil nil)

(autoload 'recentf-mode-predefine "recentf_plugin_start" "\
For `eval-after-load' recentf function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "rotate-text_plugin_start" "rotate-text_plugin_start.el"
;;;;;;  (22026 35731 266049 994000))
;;; Generated autoloads from rotate-text_plugin_start.el

(autoload 'rotate-text-mode-predefine "rotate-text_plugin_start" "\
For `eval-after-load' rotate-text function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "sdic_plugin_start" "sdic_plugin_start.el"
;;;;;;  (22026 35731 266049 994000))
;;; Generated autoloads from sdic_plugin_start.el

(autoload 'sdic-mode-custom-predefine "sdic_plugin_start" "\
For `eval-after-load' sdic customize.

\(fn)" nil nil)

(autoload 'sdic-mode-predefine "sdic_plugin_start" "\
For `eval-after-load' sdic function.

\(fn)" nil nil)

(autoload 'sdic-mode-map-predefine "sdic_plugin_start" "\
For sdic key bindings.

\(fn)" t nil)

(autoload 'my-sdic-describe-word-with-popup "sdic_plugin_start" "\
Display the meaning of word.

\(fn WORD &optional SEARCH-FUNCTION)" t nil)

(defadvice sdic-describe-word-at-point (around sdic-popup-advice activate) (letf (((symbol-function 'sdic-describe-word) (symbol-function 'my-sdic-describe-word-with-popup))) ad-do-it))

;;;***

;;;### (autoloads nil "shell_script_mode_start" "shell_script_mode_start.el"
;;;;;;  (22026 35731 266049 994000))
;;; Generated autoloads from shell_script_mode_start.el

(autoload 'sh-script-mode-custom-predefine "shell_script_mode_start" "\
For `eval-after-load' sh-script customize.

\(fn)" nil nil)

(autoload 'sh-script-mode-predefine "shell_script_mode_start" "\
For `eval-after-load' sh-script function.

\(fn)" nil nil)

(autoload 'sh-script-mode-map-predefine "shell_script_mode_start" "\
For sh-script key bindings.

\(fn)" t nil)

(autoload 'sh-script-mode-face-predefine "shell_script_mode_start" "\
For sh-script face.

\(fn)" nil nil)

(autoload 'sh-mode-hook-predefine "shell_script_mode_start" "\
Shell mode hook.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "smart-operator_plugin_start" "smart-operator_plugin_start.el"
;;;;;;  (22026 35731 266049 994000))
;;; Generated autoloads from smart-operator_plugin_start.el

(autoload 'smart-operator-mode-predefine "smart-operator_plugin_start" "\
For `eval-after-load' smart-operator function.

\(fn)" nil nil)

(autoload 'smart-operator-mode-map-predefine "smart-operator_plugin_start" "\
For smart-operator key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "tabbar_plugin_start" "tabbar_plugin_start.el"
;;;;;;  (22026 35731 267049 993000))
;;; Generated autoloads from tabbar_plugin_start.el

(autoload 'tabbar-mode-custom-predefine "tabbar_plugin_start" "\
For `eval-after-load' tabbar customize.

\(fn)" nil nil)

(autoload 'tabbar-mode-predefine "tabbar_plugin_start" "\
For `eval-after-load' tabbar function.

\(fn)" nil nil)

(autoload 'tabbar-mode-map-predefine "tabbar_plugin_start" "\
For tabbar key bindings.

\(fn)" t nil)

(autoload 'tabbar-mode-face-predefine "tabbar_plugin_start" "\
For tabbar face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "tempbuf_plugin_start" "tempbuf_plugin_start.el"
;;;;;;  (22026 35731 267049 993000))
;;; Generated autoloads from tempbuf_plugin_start.el

(autoload 'tempbuf-mode-predefine "tempbuf_plugin_start" "\
For `eval-after-load' tempbuf function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "term_mode_start" "term_mode_start.el" (22026
;;;;;;  35731 267049 993000))
;;; Generated autoloads from term_mode_start.el

(defvar launch-term (cond ((windows-p) 'shell) (t 'multi-term)))

(autoload 'term-mode-custom-predefine "term_mode_start" "\
For `eval-after-load' term customize.

\(fn)" nil nil)

(autoload 'term-mode-predefine "term_mode_start" "\
For `eval-after-load' term function.

\(fn)" nil nil)

(autoload 'term-mode-map-predefine "term_mode_start" "\
For term key bindings.

\(fn)" t nil)

(autoload 'term-mode-face-predefine "term_mode_start" "\
For term face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "text-adjust_plugin_start" "text-adjust_plugin_start.el"
;;;;;;  (22026 35731 269049 993000))
;;; Generated autoloads from text-adjust_plugin_start.el

(autoload 'text-adjust-mode-custom-predefine "text-adjust_plugin_start" "\
For `eval-after-load' text-adjust customize.

\(fn)" nil nil)

(autoload 'text-adjust-mode-predefine "text-adjust_plugin_start" "\
For `eval-after-load' text-adjust function.

\(fn)" nil nil)

(autoload 'text-adjust-mode-map-predefine "text-adjust_plugin_start" "\
For text-adjust key bindings.

\(fn)" t nil)

(autoload 'text-adjust-space-before-save-if-needed "text-adjust_plugin_start" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "text-translator_plugin_start" "text-translator_plugin_start.el"
;;;;;;  (22026 35731 270049 993000))
;;; Generated autoloads from text-translator_plugin_start.el

(autoload 'text-translator-mode-custom-predefine "text-translator_plugin_start" "\
For `eval-after-load' text-translator customize.

\(fn)" nil nil)

(autoload 'text-translator-mode-predefine "text-translator_plugin_start" "\
For `eval-after-load' text-translator function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "text_mode_start" "text_mode_start.el" (22026
;;;;;;  35731 270049 993000))
;;; Generated autoloads from text_mode_start.el

(autoload 'text-mode-hook-predefine "text_mode_start" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "thumbs_plugin_start" "thumbs_plugin_start.el"
;;;;;;  (22026 35731 270049 993000))
;;; Generated autoloads from thumbs_plugin_start.el

(autoload 'thumbs-mode-predefine "thumbs_plugin_start" "\
For `eval-after-load' thumbs function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "tramp_plugin_start" "tramp_plugin_start.el"
;;;;;;  (22026 35731 270049 993000))
;;; Generated autoloads from tramp_plugin_start.el

(autoload 'tramp-mode-custom-predefine "tramp_plugin_start" "\
For `eval-after-load' tramp customize.

\(fn)" nil nil)

(autoload 'tramp-mode-predefine "tramp_plugin_start" "\
For `eval-after-load' tramp function.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "usage-memo_plugin_start" "usage-memo_plugin_start.el"
;;;;;;  (22026 35731 270049 993000))
;;; Generated autoloads from usage-memo_plugin_start.el

(autoload 'usage-memo-mode-custom-predefine "usage-memo_plugin_start" "\
For `eval-after-load' usage-memo customize.

\(fn)" nil nil)

(autoload 'usage-memo-mode-predefine "usage-memo_plugin_start" "\
For `eval-after-load' usage-memo function.

\(fn)" nil nil)

(autoload 'usage-memo-mode-map-predefine "usage-memo_plugin_start" "\
For usage-memo key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "view_mode_start" "view_mode_start.el" (22026
;;;;;;  35731 270049 993000))
;;; Generated autoloads from view_mode_start.el

(autoload 'view-mode-custom-predefine "view_mode_start" "\
For `eval-after-load' view customize.

\(fn)" nil nil)

(autoload 'view-mode-predefine "view_mode_start" "\
For `eval-after-load' view function.

\(fn)" nil nil)

(autoload 'view-mode-map-predefine "view_mode_start" "\
For view key bindings.

\(fn)" t nil)

(defsubst turn-on-view-mode nil (interactive) (unless (eq last-command 'self-insert-command) (view-mode 1)))

(defsubst turn-off-view-mode nil (interactive) (view-mode -1))

(autoload 'viewer-mode-custom-predefine "view_mode_start" "\
For `eval-after-load' viewer customize.

\(fn)" nil nil)

(autoload 'viewer-mode-predefine "view_mode_start" "\
For `eval-after-load' viewer function.

\(fn)" nil nil)

(autoload 'viewer-mode-map-predefine "view_mode_start" "\
For viewer key bindings.

\(fn)" t nil)

(autoload 'viewer-mode-face-predefine "view_mode_start" "\
For viewer face.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil "w3m_mode_start" "w3m_mode_start.el" (22026
;;;;;;  35731 270049 993000))
;;; Generated autoloads from w3m_mode_start.el

(autoload 'w3m-mode-hook-predefine "w3m_mode_start" "\


\(fn)" nil nil)

(autoload 'w3m-mode-custom-predefine "w3m_mode_start" "\
For `eval-after-load' w3m customize.

\(fn)" nil nil)

(autoload 'w3m-mode-predefine "w3m_mode_start" "\
For `eval-after-load' w3m function.

\(fn)" nil nil)

(autoload 'w3m-mode-map-predefine "w3m_mode_start" "\
For w3m key bindings.

\(fn)" t nil)

(autoload 'w3m-mode-face-predefine "w3m_mode_start" "\
For w3m face.

\(fn)" nil nil)

(autoload 'rand-w3m-view-this-url-background-session "w3m_mode_start" "\


\(fn)" t nil)

(autoload 'w3m-browse-url-new-tab "w3m_mode_start" "\


\(fn URL &optional NEW-SESSION)" t nil)

;;;***

;;;### (autoloads nil "wid-edit_plugin_start" "wid-edit_plugin_start.el"
;;;;;;  (22026 35731 270049 993000))
;;; Generated autoloads from wid-edit_plugin_start.el

(autoload 'wid-edit-predefine "wid-edit_plugin_start" "\
For `eval-after-load' wid-edit function.

\(fn)" nil nil)

(autoload 'wid-edit-faces-predefine "wid-edit_plugin_start" "\
For wid-edit key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "woman_mode_start" "woman_mode_start.el" (22026
;;;;;;  35731 270049 993000))
;;; Generated autoloads from woman_mode_start.el

(autoload 'woman-mode-custom-predefine "woman_mode_start" "\
For `eval-after-load' woman customize.

\(fn)" nil nil)

(autoload 'woman-mode-predefine "woman_mode_start" "\
For `eval-after-load' woman function.

\(fn)" nil nil)

(autoload 'woman-mode-map-predefine "woman_mode_start" "\
For woman key bindings.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "xmodmap_mode_start" "xmodmap_mode_start.el"
;;;;;;  (22026 35731 271049 993000))
;;; Generated autoloads from xmodmap_mode_start.el

(autoload 'xmodmap-mode "xmodmap-mode" "\
.Xmodmap edit mode." t)

(add-to-list 'auto-mode-alist '(".Xmodmap" . xmodmap-mode))

;;;***

;;;### (autoloads nil "yama-find-binary_start" "yama-find-binary_start.el"
;;;;;;  (22026 35731 271049 993000))
;;; Generated autoloads from yama-find-binary_start.el

(defvar YAMA-file-not-binary-extensions '("el" "ahk") "\
バイナリと見なさないファイルの拡張子を
    (\"txt\") のようにリストで指定する
    ただしすべて小文字で指定する")

(defvar YAMA-file-not-binary-files '("tags" "gsyms" "gpath" "grtags" "gsyms" "gtags" "el") "\
バイナリとみなされないファイル名を指定する。
     ただし、すべて小文字で指定のこと")

(autoload 'YAMA-file-binary-p "yama-find-binary_start" "\
Return t if FILE contains binary data.  If optional FULL is non-nil,
  check for the whole contents of FILE, otherwise check for the first
    1000-byte.

\(fn FILE &optional FULL)" nil nil)

;;;***

;;;### (autoloads nil "yasnippet_plugin_start" "yasnippet_plugin_start.el"
;;;;;;  (22026 35731 271049 993000))
;;; Generated autoloads from yasnippet_plugin_start.el

(autoload 'yasnippet-mode-custom-predefine "yasnippet_plugin_start" "\
For `eval-after-load' yasnippet customize.

\(fn)" nil nil)

(autoload 'yasnippet-mode-predefine "yasnippet_plugin_start" "\
For `eval-after-load' yasnippet function.

\(fn)" nil nil)

(autoload 'yasnippet-mode-map-predefine "yasnippet_plugin_start" "\
For yasnippet key bindings.

\(fn)" t nil)

(autoload 'snippet-mode-hook-predefine "yasnippet_plugin_start" "\
Predefine for Snippet Major Mode.

\(fn)" nil nil)

(autoload 'yas-popup-isearch-prompt "yasnippet_plugin_start" "\


\(fn PROMPT CHOICES &optional DISPLAY-FN)" nil nil)

(defvar yas-my-pre-marker nil)

(defvar yas-my-post-marker nil)

(autoload 'yas-my-save-marker "yasnippet_plugin_start" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("../mylisp/__python__.el" "../mylisp/t1macro.el"
;;;;;;  "../plugin/anything-auto-install.el" "../plugin/anything-c-moccur.el"
;;;;;;  "../plugin/anything-c-yasnippet.el" "../plugin/anything-complete.el"
;;;;;;  "../plugin/anything-grep.el" "../plugin/anything-gtags.el"
;;;;;;  "../plugin/anything-ipython.el" "../plugin/anything-irfc.el"
;;;;;;  "../plugin/anything-menu.el" "../plugin/anything-migemo.el"
;;;;;;  "../plugin/anything-obsolete.el" "../plugin/anything-search-file.el"
;;;;;;  "../plugin/anything-show-completion.el" "../plugin/anything-startup.el"
;;;;;;  "../plugin/approx-isearch.el" "../plugin/approx-old-isearch.el"
;;;;;;  "../plugin/approx-search.el" "../plugin/ascii-table.el" "../plugin/auto-complete-clang.el"
;;;;;;  "../plugin/auto-install.el" "../plugin/auto-yasnippet.el"
;;;;;;  "../plugin/autopair.el" "../plugin/basic-edit-toolkit.el"
;;;;;;  "../plugin/bat-mode.el" "../plugin/c-eldoc.el" "../plugin/color-moccur.el"
;;;;;;  "../plugin/color-theme-6.6.0/color-theme-autoloads.el" "../plugin/color-theme-6.6.0/themes/color-theme-dark-laptop.el"
;;;;;;  "../plugin/cython-mode.el" "../plugin/descbinds-anything.el"
;;;;;;  "../plugin/doc-view-extension.el" "../plugin/duplicate-line.el"
;;;;;;  "../plugin/edit-list.el" "../plugin/edit-server.el" "../plugin/editable-help.el"
;;;;;;  "../plugin/ee-0.1.0/ee-autoloads.el" "../plugin/eldoc-extension.el"
;;;;;;  "../plugin/expand-region/cc-mode-expansions.el" "../plugin/expand-region/clojure-mode-expansions.el"
;;;;;;  "../plugin/expand-region/css-mode-expansions.el" "../plugin/expand-region/erlang-mode-expansions.el"
;;;;;;  "../plugin/expand-region/expand-region-core.el" "../plugin/expand-region/expand-region-pkg.el"
;;;;;;  "../plugin/expand-region/feature-mode-expansions.el" "../plugin/expand-region/features/step-definitions/expand-region-steps.el"
;;;;;;  "../plugin/expand-region/features/support/env.el" "../plugin/expand-region/html-mode-expansions.el"
;;;;;;  "../plugin/expand-region/js-mode-expansions.el" "../plugin/expand-region/js2-mode-expansions.el"
;;;;;;  "../plugin/expand-region/jsp-expansions.el" "../plugin/expand-region/latex-mode-expansions.el"
;;;;;;  "../plugin/expand-region/nxml-mode-expansions.el" "../plugin/expand-region/org-mode-expansions.el"
;;;;;;  "../plugin/expand-region/python-el-expansions.el" "../plugin/expand-region/python-el-fgallina-expansions.el"
;;;;;;  "../plugin/expand-region/python-mode-expansions.el" "../plugin/expand-region/ruby-mode-expansions.el"
;;;;;;  "../plugin/expand-region/text-mode-expansions.el" "../plugin/fold-dwim-org.el"
;;;;;;  "../plugin/fold-dwim.el" "../plugin/frame-fns.el" "../plugin/gccsense.el"
;;;;;;  "../plugin/grep-edit.el" "../plugin/helm/helm-pkg.el" "../plugin/helm/helm-plugin.el"
;;;;;;  "../plugin/ipython.el" "../plugin/jaspace.el" "../plugin/jedi-eldoc.el"
;;;;;;  "../plugin/journal.el" "../plugin/lambda-mode.el" "../plugin/linum-off.el"
;;;;;;  "../plugin/ll-debug.el" "../plugin/mark-multiple/mark-multiple-pkg.el"
;;;;;;  "../plugin/mark-multiple/mm-pabbrev-integration.el" "../plugin/mell.el"
;;;;;;  "../plugin/moccur-edit.el" "../plugin/multi-region.el" "../plugin/point-undo.el"
;;;;;;  "../plugin/powerline.el" "../plugin/pycov2.el" "../plugin/pylit.el"
;;;;;;  "../plugin/python-mode.el" "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters-autoloads.el"
;;;;;;  "../plugin/rainbow-delimiters-1.3.4/rainbow-delimiters-pkg.el"
;;;;;;  "../plugin/recentf-ext.el" "../plugin/save-sexp.el" "../plugin/scratch-log.el"
;;;;;;  "../plugin/sdic/sdic-compat.el" "../plugin/sdic/sdic-gene.el"
;;;;;;  "../plugin/sdic/sdic.el" "../plugin/sdic/sdicf-client.el"
;;;;;;  "../plugin/sdic/sdicf.el" "../plugin/sdic/stem.el" "../plugin/sequential-command-config.el"
;;;;;;  "../plugin/sequential-command.el" "../plugin/smartchr.el"
;;;;;;  "../plugin/smartrep.el" "../plugin/sorter.el" "../plugin/space-chord.el"
;;;;;;  "../plugin/sudo-ext.el" "../plugin/systemd-company.el" "../plugin/tail.el"
;;;;;;  "../plugin/text-adjust.el" "../plugin/trans-regions.el" "../plugin/trash-settings.el"
;;;;;;  "../plugin/unbound.el" "../plugin/usage-memo.el" "../plugin/viewer.el"
;;;;;;  "../plugin/virtualenv.el" "../plugin/w3m-extension.el" "../plugin/webkit/webkit.el"
;;;;;;  "../plugin/yasnippet-config.el" "02_base_start.el" "04_bindings_start.el"
;;;;;;  "08_simple_start.el" "09_check_default_start.el" "20_auto-async-byte-compile_plugin_start.el"
;;;;;;  "20_auto-recover_plugin_start.el" "20_recentf_plugin_start.el"
;;;;;;  "22_anything_plugin_start.el" "22_auto-install_plugin_start.el"
;;;;;;  "22_autoinsert_plugin_start.el" "22_filecache_start.el" "22_iswitchb_plugin_start.el"
;;;;;;  "22_multi-term_plugin_start.el" "22_savekill_plugin_start.el"
;;;;;;  "22_sudo-ext_plugin_start.el" "23_helm_plugin_start.el" "30_auto-complete_plugin_start.el"
;;;;;;  "30_dmacro_plugin_start.el" "30_duplicate-line_plugin_start.el"
;;;;;;  "30_header2_plugin_start.el" "30_hotstring_plugin_start.el"
;;;;;;  "30_jedi_plugin_start.el" "30_ll-debug_plugin_start.el" "30_multiple-cursors_plugin_start.el"
;;;;;;  "30_point-undo_plugin_start.el" "30_recover-last-killed-file_plugin_start.el"
;;;;;;  "30_rotate-text_plugin_start.el" "30_sequential-command_plugin_start.el"
;;;;;;  "30_smart-operator_plugin_start.el" "30_smartchr_plugin_start.el"
;;;;;;  "30_smartrep_plugin_start.el" "30_tramp_plugin_start.el"
;;;;;;  "30_trans-regions_plugin_start.el" "30_undo_tree_plugin_start.el"
;;;;;;  "30_yama-find-binary_start.el" "31_popup_plugin_start.el"
;;;;;;  "40_col-highlight_plugin_start.el" "40_grep_plugin_start.el"
;;;;;;  "40_highlight-indentation_plugin_start.el" "40_linum_plugin_start.el"
;;;;;;  "40_moccur_plugin_start.el" "40_text-adjust_plugin_start.el"
;;;;;;  "40_yasnippet_plugin_start.el" "50_ascii_plugin_start.el"
;;;;;;  "50_edit-list_plugin_start.el" "50_irfc_plugin_start.el"
;;;;;;  "50_ispell_plugin_start.el" "50_open-junk-file_plugin_start.el"
;;;;;;  "50_saveplace_plugin_start.el" "50_sdic_plugin_start.el"
;;;;;;  "50_tail_plugin_start.el" "50_text-translator_plugin_start.el"
;;;;;;  "50_uniquify_plugin_start.el" "50_usage-memo_plugin_start.el"
;;;;;;  "60_auto-highlight-symbol_plugin_start.el" "60_eldoc_plugin_start.el"
;;;;;;  "60_flycheck_plugin_start.el" "60_flymake_plugin_start.el"
;;;;;;  "60_fold-dwim_plugin_start.el" "60_key-chord_plugin_start.el"
;;;;;;  "60_nosetests_plugin_start.el" "60_python-pep8_plugin_start.el"
;;;;;;  "60_python_pylint_plugin_start.el" "60_tabbar_plugin_start.el"
;;;;;;  "61_midnight_plugin_start.el" "70_Info_mode_start.el" "70_apropos_mode_start.el"
;;;;;;  "70_dired_mode_start.el" "70_doctest_mode_plugin_start.el"
;;;;;;  "70_e2wm_mode_start.el" "70_ee_mode_start.el" "70_gdb_mode_start.el"
;;;;;;  "70_image_mode_start.el" "70_org_mode_start.el" "70_svn_status_mode_start.el"
;;;;;;  "70_term_mode_start.el" "70_view_mode_start.el" "70_w3m_mode_start.el"
;;;;;;  "70_woman_mode_start.el" "80_asm_mode_start.el" "80_c_mode_start.el"
;;;;;;  "80_emacs_lisp_mode_start.el" "80_javascript_mode_start.el"
;;;;;;  "80_python_mode_start.el" "80_shell_script_mode_start.el"
;;;;;;  "80_text_mode_start.el" "81_final_mode_start.el" "92_face_start.el"
;;;;;;  "98_final_start.el" "Emacs22_trash-setting.el" "Linux_face_start.el"
;;;;;;  "Linux_keyrate_start.el" "MainDesktopPC_start.el" "Windows_ahk_mode_start.el"
;;;;;;  "Windows_everything_plugin_start.el" "Windows_face_start.el"
;;;;;;  "Windows_start.el" "_60_c-includes_plugin_start.el" "_60_gccsense_plugin_start.el"
;;;;;;  "_61_tempbuf_plugin_start.el" "_70_cvs_mode_start.el" "anything-complete_plugin_start.el"
;;;;;;  "header2_plugin_start.el" "subroutines_start.el" "test_start.el")
;;;;;;  (22026 36284 873193 365000))

;;;***

(provide '06_loaddefs_start)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; 06_loaddefs_start.el ends here
