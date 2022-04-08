(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy
    flycheck
    material-theme
    smooth-scrolling
    helm))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(setq inhibit-startup-message t) ;; hide the startup message

;; material theme
(load-theme 'material t) ;; load material theme

;; leuven theme
;;(setq leuven-scale-outline-headlines nil)
;;(setq leuven-scale-org-agenda-structure nil)
;;(setq leuven-scale-volatile-highlight nil)
;;(load-theme 'leuven t)

(global-linum-mode t) ;; enable line numbers globally

(elpy-enable)
(setq elpy-rpc-python-command "python3")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy_module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'smooth-scrolling)
(setq smooth-scroll-margin 5)

(setq scroll-step           1
      scroll-conservatively 100000)

(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(leuven-theme solarized-theme vdiff magit flycheck use-package smooth-scrolling material-theme helm elpy better-defaults))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 143 :width normal)))))
