@unboxed
type t = {
    milliseconds: float,
}

let elapsed = (self: t): Elapsed.t => {
    Elapsed.fromMilliseconds(Js.Date.now() -. self.milliseconds)
}

let addElapsed = (self: t, elapsed: Elapsed.t) => {
    milliseconds: self.milliseconds +. elapsed->Elapsed.toMilliseconds
}

let isInPast = (self: t) => {
    Js.Date.now() -. self.milliseconds > 0.
}

let now = (): t => {
    milliseconds: Js.Date.now(),
}

let toString = (self: t): string => {
    self.milliseconds
    ->Js.Date.fromFloat
    ->Js.Date.toISOString
}
