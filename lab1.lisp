;; 1. Створення списку та ініціалізація змінної
(defvar *task-list* nil)
(setq *task-list* (cons 'A 
                    (cons (list 'B (list 'C 'D) ()) 
                          (list 7 (list 'C 'D)))))
(print *task-list*)
;; Результат: (A (B (C D) NIL) 7 (C D)) 

;; 2. Отримання голови списку
(print (car *task-list*))
;; Результат: A

;; 3. Отримання хвоста списку
(print (cdr *task-list*))
;; Результат: ((B (C D) NIL) 7 (C D))

;; 4. Отримання третього елемента
(print (third *task-list*))
;; Результат: 7

;; 5. Отримання останнього елемента (значення, а не комірки)
(print (car (last *task-list*)))
;; Результат: (C D)

;; 6. Перевірка предикатом ATOM
(print (atom (nth 1 *task-list*)))        ; 2-й елемент - список
;; Результат: NIL

(print (atom (cdr *task-list*)))          ; Хвіст списку - це список
;; Результат: NIL

(print (atom (car (nthcdr 2 *task-list*)))) ; 3-й елемент (7) - атом
;; Результат: T

;; 6.1. Перевірка предикатом LISTP
(print (listp (second (nth 1 *task-list*)))) ; Вкладений (C D) - список
;; Результат: T

(print (listp (first *task-list*)))       ; 'A - не список
;; Результат: NIL

(print (listp (third (cdr *task-list*)))) ; Останній (C D) - список
;; Результат: T

;; 7. Перевірка на рівність (EQL - числа і символи)
(print (eql (third *task-list*) 7))       ; Число 7 дорівнює 7
;; Результат: T

(print (eql (cdr *task-list*) '(C D)))    ; Списки не ідентичні за посиланням
;; Результат: NIL

;; 7.1. Перевірка на рівність (EQUAL - структура списків)
(print (equal (car *task-list*) 'A))      ; Символ A
;; Результат: T

(print (equal (second (nth 1 *task-list*)) (first (last *task-list*)))) 
;; Порівняння (C D) з першого підсписку та (C D) з кінця:
;; Результат: T

;; 7.2. Перевірка на нестрогу рівність (EQUALP - регістр та типи)
(print (equalp (third *task-list*) 7.0))  ; 7 дорівнює 7.0
;; Результат: T

(print (equalp (car *task-list*) 'a))     ; 'A дорівнює 'a
;; Результат: T

;; 8. Об'єднання списків (APPEND)
(print (append *task-list* (second *task-list*)))
;; Результат: (A (B (C D) NIL) 7 (C D) B (C D) NIL)

;; Оголошення змінних для варіанту
(defvar *sub-list* nil)
(defvar *main-list* nil)

;; Реалізація логіки 7-го варіанту
(setq *sub-list* '(D E F)    ; Базовий список
      *main-list* (list *sub-list* ; 1. Посилання на (D E F)
                        (cdr *sub-list*) ; 2. Посилання на (E F) - СПІЛЬНА ПАМ'ЯТЬ
                        (list 'F)        ; 3. Копія списку (F) - нова пам'ять
                        4))              ; 4. Атом 4

;; Вивід отриманого списку
(print *main-list*)
;; Результат: ((D E F) (E F) (F) 4)

;; ДОКАЗ спільної пам'яті
;; Перевіряємо, чи є 2-й елемент фізично тим самим об'єктом, що й хвіст 1-го
(print (eq (second *main-list*) (cdr (first *main-list*))))
;; Результат: T