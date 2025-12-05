<p align="center"><b>МОНУ НТУУ КПІ ім. Ігоря Сікорського ФПМ СПіСКС</b></p>
<p align="center">
<b>Звіт з лабораторної роботи 1</b><br/>
"Обробка списків з використанням базових функцій"<br/>
дисципліни "Вступ до функціонального програмування"
</p>
<p align="right">Студент: Марчук Дмитро Андрійович група КВ-22<p>
<p align="right">Рік: 2025<p>
	
## Загальне завдання
1.	Створіть список з п'яти елементів, використовуючи функції LIST і CONS . Форма створення списку має бути одна — використання SET чи SETQ (або інших допоміжних форм) для збереження проміжних значень не допускається. Загальна кількість елементів (включно з підсписками та їх елементами) не має перевищувати 10-12 шт. (дуже великий список робити не потрібно). Збережіть створений список у якусь змінну з SET або SETQ . Список має містити (напряму або у підсписках):
•	хоча б один символ
•	хоча б одне число
•	хоча б один не пустий підсписок
•	хоча б один пустий підсписок
2.	Отримайте голову списку.
3.	Отримайте хвіст списку.
4.	Отримайте третій елемент списку.
5.	Отримайте останній елемент списку.
6.	Використайте предикати ATOM та LISTP на різних елементах списку (по 2-3 приклади для кожної функції).
7.	Використайте на елементах списку 2-3 інших предикати з розглянутих у розділі 4 навчального посібника.
8.	Об'єднайте створений список з одним із його непустих підсписків. Для цього використайте функцію APPEND.

```lisp
;; 1. Створення списку та ініціалізація змінної
CL-USER> (defvar *task-list* nil)
CL-USER> (setq *task-list* (cons 'A 
                    (cons (list 'B (list 'C 'D) ()) 
                          (list 7 (list 'C 'D)))))
CL-USER> (print *task-list*)
; (A (B (C D) NIL) 7 (C D)) 

;; 2. Отримання голови списку
CL-USER> (print (car *task-list*))
; A

;; 3. Отримання хвоста списку
CL-USER> (print (cdr *task-list*))
; ((B (C D) NIL) 7 (C D))

;; 4. Отримання третього елемента
CL-USER> (print (third *task-list*))
; 7

;; 5. Отримання останнього елемента (значення, а не комірки)
CL-USER> (print (car (last *task-list*)))
; (C D)

;; 6. Перевірка предикатом ATOM
CL-USER> (print (atom (nth 1 *task-list*)))        ; 2-й елемент - список
; NIL

CL-USER> (print (atom (cdr *task-list*)))          ; Хвіст списку - це список
; NIL

CL-USER> (print (atom (car (nthcdr 2 *task-list*)))) ; 3-й елемент (7) - атом
; T

;; 6.1. Перевірка предикатом LISTP
CL-USER> (print (listp (second (nth 1 *task-list*)))) ; Вкладений (C D) - список
; T

CL-USER> (print (listp (first *task-list*)))       ; 'A - не список
; NIL

CL-USER> (print (listp (third (cdr *task-list*)))) ; Останній (C D) - список
; T

;; 7. Перевірка на рівність (EQL - числа і символи)
CL-USER> (print (eql (third *task-list*) 7))       ; Число 7 дорівнює 7
; T

CL-USER> (print (eql (cdr *task-list*) '(C D)))    ; Списки не ідентичні за посиланням
; NIL

;; 7.1. Перевірка на рівність (EQUAL - структура списків)
CL-USER> (print (equal (car *task-list*) 'A))      ; Символ A
; T

CL-USER> (print (equal (second (nth 1 *task-list*)) (first (last *task-list*)))) 
;; Порівняння (C D) з першого підсписку та (C D) з кінця:
; T

;; 7.2. Перевірка на нестрогу рівність (EQUALP - регістр та типи)
CL-USER> (print (equalp (third *task-list*) 7.0))  ; 7 дорівнює 7.0
; T

CL-USER> (print (equalp (car *task-list*) 'a))     ; 'A дорівнює 'a
; T

;; 8. Об'єднання списків (APPEND)
CL-USER> (print (append *task-list* (second *task-list*)))
; (A (B (C D) NIL) 7 (C D) B (C D) NIL)

```
## Варіант 7
<p align="center">
<img src="lab1variant7.png">
</p>

```lisp
CL-USER> (defvar *sub-list* nil)
; *SUB-LIST*

CL-USER> (defvar *main-list* nil)
; *MAIN-LIST*

CL-USER> (setq *sub-list* '(D E F) 
               *main-list* (list *sub-list* ; 1. Посилання на початок
                                 (cdr *sub-list*) ; 2. Посилання на хвіст (спільна пам'ять)
                                 (list 'F)        ; 3. Копія (нова пам'ять)
                                 4))              ; 4. Число
; ((D E F) (E F) (F) 4)

CL-USER> (print *main-list*)
; ((D E F) (E F) (F) 4) 

CL-USER> (eq (second *main-list*) (cdr (first *main-list*)))
; T

```
 
