;;
;; .emacs for emacs in /home/gassem_a
;;
;; Made by Aurélien Gassemann
;; Login   <gassem_a@epitech.net>
;;
;; Started on  Wed May  4 20:54:19 2016 Aurélien Gassemann
;; Last update Wed May  4 20:54:24 2016 Aurélien Gassemann
;;

;; DO NOT DELETE
(eval-after-load "warnings"
  '(setq display-warning-minimum-level :error))
(load "std.el")
(load "std_comment.el")
(add-to-list 'load-path "~/.emacs.d/")

;; Affichage des lignes
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

;; Surlignage en orange des ligne de plus de 80 caractères
(add-hook 'c-mode-hook '(lambda () (highlight-lines-matching-regexp ".\\{81\\}" 'hi-yellow)))

;; Suppression des espaces en fin de ligne dans les fichiers C et C++
(add-hook 'c-mode-hook '(lambda () (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook 'c++-mode-hook '(lambda () (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))

;; Deplacement auto des fichier~ dans le dossier ~/.emacs.d/backup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 5
      kept-old-versions 5
      )

;; Auto-completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;; Config pour le web dev
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
	("blade"  . "\\.blade\\."))
      )

(setq emacs-lisp-dir "~/.emacs.d/"
      my-elmode-dir (concat emacs-lisp-dir "elmodes/"))
(setq load-path
      (append load-path (list my-elmode-dir)))

(add-to-list 'load-path "~/.emacs.d/")

(load "std.el")
(load "std_comment.el")
(if (file-exists-p "~/.myemacs")
    (load-file "~/.myemacs"))

;; Suppression des espaces en fin de ligne a l'enregistrement
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Pour éviter le temps d'attente au démarrage...
(modify-frame-parameters nil '((wait-for-wm . nil)) )

;; ...et enlever le message d'accueil
(setq inhibit-startup-message t)

;; affiche les espaces inutile
(setq-default show-trailing-whitespace t)

;; Affiche la parenthese correspondante
(show-paren-mode)

(defun cc-mode-add-keywords (mode)
  (font-lock-add-keywords
   mode
  '(
     ("\t+" (0 'my-tab-face append))
     ("^.\\{81\\}\\(.+\\)$" (1 'my-loong-line-face append)))))

(cc-mode-add-keywords 'c-mode)
(cc-mode-add-keywords 'php-mode)
(cc-mode-add-keywords 'sh-mode)
(cc-mode-add-keywords 'python-mode)
(cc-mode-add-keywords 'perl-mode)
(cc-mode-add-keywords 'c++-mode)
(put 'scroll-left 'disabled nil)

;; C++ mode pour les fichiers .h
;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
