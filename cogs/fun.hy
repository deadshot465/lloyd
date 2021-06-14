(import discord)
(import [discord.ext [commands]])
(import [utils.constants [HY_LOGO LLOYD_COLOR STAR_ICON]])
(import [datetime [datetime]])
(import [owoify.owoify [owoify]])

(defclass Fun [commands.Cog]
    (defn __init__ [self bot]
        (.__init__ (super))
        (setv self.bot bot))
        
    #@((commands.command :description "Ask Lloyd for help in owoifying your text." :help "Turns your sentences and texts to nonsensical babyspeaks." :aliases [])
        (defn/a owoify [self ctx level * [text ""]]
            (setv actual_level (if (and (> (len level) 0) (not (= level "")))
                                   (.lower level)
                                   "soft"))
            (cond [(= actual_level "soft") (setv result (-> (owoify text "owo")
                                                            (.replace "`" "\\`")
                                                            (.replace "*" "\\*")))]
                [(= actual_level "medium") (setv result (-> (owoify text "uwu")
                                                            (.replace "`" "\\`")
                                                            (.replace "*" "\\*")))]
                [(= actual_level "hard") (setv result (-> (owoify text "uvu")
                                                          (.replace "`" "\\`")
                                                          (.replace "*" "\\*")))]
                [True (do (setv text f"{level} {text}")
                          (setv result (-> (owoify text "owo")
                                           (.replace "`" "\\`")
                                           (.replace "*" "\\*"))))])
            (setv author ctx.author)
            (setv result f"You asked for it and you'll get it! Here is your owoified text, {author.mention}:\n\n{result}")
            (await (.send ctx result))))
)

(defn setup [bot]
    (.add_cog bot (Fun bot)))