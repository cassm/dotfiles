(setq paradox-github-token "65c1835d27ce4f06c13bfcc55b48d5ca0fb3de06")

(defun create-tags (dir-name)
       "Create tags file."
       (interactive "Directory: ")
       (shell-command
        (format "ctags -f %s -e -R %s --exclude=testsuite --exclude=.git" path-to-ctags (directory-file-name dir-name)))
)

;; c-mode customisations - for c and c++-mode
(defun my-c-mode-common-hook()

  ;; bsd indentation style
  (c-set-style "bsd")

  ;; 4 character basic offset
  (setq c-basic-offset 4)

  ;; turn on colouring
  (turn-on-font-lock)

  ;; this makes multi-line macros much easier to edit
  (local-set-key 'return 'c-context-line-break)

  ;; make TABs visible (we set the face for spaces above)
  (whitespace-visual-mode)

  ;; turn off TAB based indentation
  (setq indent-tabs-mode nil)
)



;; attach my c mode customisations to c-mode and c++-mode
(add-hook 'c-mode-hook       'my-c-mode-common-hook)
(add-hook 'c++-mode-hook     'my-c-mode-common-hook)

;; Less (fewer) insane hotkeys for hide-show
(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key (kbd "C-c <right>") 'hs-show-block)
    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
    (local-set-key (kbd "C-c <down>")  'hs-show-all)
    (hs-minor-mode t)))

(global-set-key (kbd "M-s") 'tags-search)

(setq  package-archives
       '(("gnu" . "http://elpa.gnu.org/packages/")
	 ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq slime-contribs '(slime-fancy))
(setq slime-lisp-implementations
      '((sbcl ("/home/ruperts/work/tools/sbcl/bin/sbcl"))))

;; ORG MODE

;; use time stamps for done items
(setq org-log-done 'time)

;; allow collapse/expand from anywhere in scope
(setq org-cycle-emulate-tab 'white)

;; local key bindings
(defun cassm/org-mode-setup ()
  (local-set-key (kbd "M-n") 'org-insert-todo-heading)
  (local-set-key (kbd "C-j") 'eww))

(add-hook 'org-mode-hook 'cassm/org-mode-setup)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c C-l") 'org-insert-link)

(setq browse-url-browser-function 'eww-browse-url)

(fset 'yes-or-no-p 'y-or-n-p)

(defun query-eval-region ()
  (if (y-or-n-p "Evaluate region?")
      'eval-region))

(defun query-eval-buffer ()
  (if (y-or-n-p "Evaluate buffer?")
      'eval-buffer))
 
(fset 'open-c-function
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("{}OA" 0 "%d")) arg)))

(global-set-key (kbd "M-o") 'open-c-function)

(global-set-key (kbd "<RET>") 'newline-and-indent)
(global-set-key (kbd "C-j") 'eww)
(global-set-key (kbd "<M-SPC>") 'call-last-kbd-macro)

(setq sml/theme 'respectful)
;; (sml/setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("9d0dd2e2fd12c96c8ff1b2c83f7d4e09d8895a101245e4721e158991a0b21bae" "ac3c992b0cd6d546fde56267dd3c5c229c20f4b4db992eb4c362cd11064c071d" "7e30b3d5db2cc7cef026152c1147e6d8cea336dccb84feed6e099f2cd8ca3842" "37156ac96a860fbadf6d667eeeb28bc528ccb181478401946d1af29f7569d445" "93a24ac9ccc9f8e06d816f8a496d923988ba1edc7182530fd3f2600be4ce34af" "e3758e47662da33a6b3f06a0cce9ab829e729ffb407472d6ab01fdc1fa31e094" "24e6d5a14658e65573f245961b943d645f9e7f27592807ff0c22aff7731ba108" "f38230408ffa59bfa48b0b8678b3a0e257037cc9f32e5892dab992e7588f81ff" "9b808d789a1d17708aa1b0026503953afac8fb51bfb8eb38ac8a3258a892c07d" "6dd23f9b09e175bb6aafe0c3eacb2282311e380f75b3809d226fa0cb65854c3f" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(fci-rule-color "#49483E")
 '(frame-background-mode (quote dark))
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(magit-diff-use-overlays nil)
 '(sml/extra-filler 0)
 '(sml/modified-char "◆")
 '(sml/outside-modified-char "▲")
 '(sml/read-only-char "⭑")
 '(sml/shorten-mode-string "  ")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(which-function-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(which-func ((t (:foreground "color-252")))))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/enet.org"))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
    (package-initialize))

(require 'zlc)
(zlc-mode t)

(which-function-mode t)

(sml/setup)

(load-theme 'monokai t)

(defun on-frame-open (frame)
  (if (not (display-graphic-p frame))
      (set-face-background 'default "unspecified-bg" frame)))
(on-frame-open (selected-frame))
(add-hook 'after-make-frame-functions 'on-frame-open)

(defun on-after-init ()
    (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(set-face-attribute 'mode-line nil
		    :background "unspecified-bg")

(define-key global-map "\M-," 'tags-loop-continue)

(require 'generic-x) ;; we need this

(define-generic-mode
    'enet-testsuite-mode                           ;; name of the mode to create
  '("#")                                           ;; comments start with '#'
  '("netbCRCFinaliserParams"
    "netbNoddyTestParams"
    "netbRandomTestParams"
    "netbDSFilterParams"
    "netbDiscardTestParams"
    "enetTestStatus"
    "enetPartitionParams"
    "enetPacketFormatParams"
    "enetInterfaceConfigParams"
    "enetTrafficParams")                                ;; some keywords
  '(("=" . 'font-lock-operator)                    ;; '=' is an operator
    ("," . 'font-lock-builtin)                     ;; ',' is a builtin
    (":" . 'font-lock-builtin)                     ;; ':' is a builtin
    ("CHIPS" . 'font-lock-function-name-face)
    ("TESTSUITE" . 'font-lock-function-name-face)
    ("GLOBALOPTIONS" . 'font-lock-function-name-face)
    ("PYTHONOPTIONS" . 'font-lock-function-name-face)
    ("TESTNAME" . 'font-lock-constant-face)
    ("OPTIONS" . 'font-lock-variable-name-face)
    ("PCAPCONFIG" . 'font-lock-constant-face)
    ("POSTTESTFUNC" . 'font-lock-constant-face))
    '("\\.set$")                                     ;; files for which to activate this mode
  nil                                              ;; other constantfaces to call
  "A mode for writing enet testsuite definitions"  ;; doc string for this mode
  )

(setq-default indent-tabs-mode nil)
