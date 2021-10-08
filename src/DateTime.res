include Js.Date

let elapsed = (date: t): Elapsed.t => {
    Elapsed.fromMilliseconds(now() -. getTime(date))
}

let addElapsed = (date: t, elapsed: Elapsed.t) => {
    fromFloat(getTime(date) +. Elapsed.toMilliseconds(elapsed))
}

let subtractElapsed = (date: t, elapsed: Elapsed.t) => {
    fromFloat(getTime(date) -. Elapsed.toMilliseconds(elapsed))
}

let isInPast = (date: t) => {
    now() -. getTime(date) > 0.
}

let toFloat = getTime
