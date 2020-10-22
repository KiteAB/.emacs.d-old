;;;; This file is used for the user's macros
(fset 'insert-placeholder
      (kmacro-lambda-form [?< ?+ ?+ ?+ ?>] 0 "%d"))
(fset 'replace-placeholder
      (kmacro-lambda-form [?\M-% ?< ?+ ?+ ?+ ?> return return ?.] 0 "%d"))
(fset 'search-todo-in-code
      (kmacro-lambda-form [?\C-s ?T ?O ?D ?O ?\C-a] 0 "%d"))

(provide 'init-macros)
