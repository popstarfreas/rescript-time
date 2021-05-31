type t
let now: unit => t
let elapsed: t => Elapsed.t
let toString: t => string
let addElapsed: (t, Elapsed.t) => t
let isInPast: t => bool
let toFloat: t => float
let fromFloat: float => t
