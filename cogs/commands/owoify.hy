(import discord)
(import [owoify.owoify [owoify]])

(defn/a execute [ctx level text]
    (setv actual-level (if (and (> (len level) 0) (not (= level "")))
                            (.lower level)
                            "soft"))
    (cond [(= actual-level "soft") (setv result (-> (owoify text "owo")
                                                    (.replace "`" "\\`")
                                                    (.replace "*" "\\*")))]
          [(= actual-level "medium") (setv result (-> (owoify text "uwu")
                                                      (.replace "`" "\\`")
                                                      (.replace "*" "\\*")))]
          [(= actual-level "hard") (setv result (-> (owoify text "uvu")
                                                    (.replace "`" "\\`")
                                                    (.replace "*" "\\*")))]
          [True (do (setv text f"{level} {text}")
                    (setv result (-> (owoify text "owo")
                                     (.replace "`" "\\`")
                                     (.replace "*" "\\*"))))])
    (setv author ctx.author)
    (setv result f"You asked for it and you'll get it! Here is your owoified text, {author.mention}:\n\n{result}")
    (await (.send ctx result)))