
;; blockpost
;; contract that writes a post on chain for a small fee

(define-constant contract-owner (as-contract tx-sender))

;; how much to post 
(define-constant price u1000000) ;; 1STX

(define-data-var total-posts uint u0)

(define-map post principal (string-utf8 500))

(define-read-only (get-total-posts)
    (var-get total-posts)
)

(define-read-only (get-post (user principal)) 
    (map-get? post user) ;; 'SP2342342: "this is my message"
)

(define-public (write-post (message (string-utf8 500)))
    (begin 
        (try! (stx-transfer? price tx-sender contract-owner))
        (map-set post tx-sender message)
        (var-set total-posts (+ (var-get total-posts) u1))
        (ok "SUCCESS")       
    )
)