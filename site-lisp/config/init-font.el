;;; This file is used for Font Settings
(setq kiteab/font-name "Sarasa Mono Slab SC Semibold"
      kiteab/font-style "Regular"
      kiteab/font-size 22)
(if (fontp (font-spec
            :name kiteab/font-name
            :style kiteab/font-style
            :size kiteab/font-size))
    (progn
      (set-face-attribute 'default nil
                          :font (font-spec
                                 :name kiteab/font-name
                                 :style kiteab/font-style
                                 :size kiteab/font-size))
      (set-fontset-font t ?中 (font-spec
                               :name kiteab/font-name
                               :style kiteab/font-style
                               :size kiteab/font-size)))
  (message "Can't find %s font. You can install it or ignore this message at init-ui.el" kiteab/font-name))

(provide 'init-font)
