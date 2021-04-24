@unboxed
type t = {
    milliseconds: float,
}

let elapsed = (self: t): Elapsed.t => {
    Elapsed.fromMilliseconds(Js.Date.now() -. self.milliseconds)
}

let now = (): t => {
    milliseconds: Js.Date.now(),
}

let toString = (self: t): string => {
    self.milliseconds
    ->Js.Date.fromFloat
    ->Js.Date.toISOString
}
