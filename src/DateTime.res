include Js.Date

let fromDate = (date: t) => {
  fromFloat(getTime(date))
}

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

let addDays = (date: t, days: float): t => {
  let newDate = fromDate(date)
  let _: float = newDate->setUTCDate(getUTCDate(date) +. days)
  newDate
}

let addHours = (date: t, hours: float): t => {
  let newDate = fromDate(date)
  let _: float = newDate->setUTCHours(getUTCHours(date) +. hours)
  newDate
}

let addMinutes = (date: t, minutes: float): t => {
  let newDate = fromDate(date)
  let _: float = newDate->setUTCMinutes(getUTCMinutes(date) +. minutes)
  newDate
}

let addSeconds = (date: t, seconds: float): t => {
  let newDate = fromDate(date)
  let _: float = newDate->setUTCSeconds(getUTCSeconds(date) +. seconds)
  newDate
}

let addMilliseconds = (date: t, milliseconds: float): t => {
  let newDate = fromDate(date)
  let _: float = newDate->setUTCMilliseconds(getUTCMilliseconds(date) +. milliseconds)
  newDate
}

let rec monthDifference = (date: t, otherDate: t): float => {
  if date > otherDate {
    monthDifference(otherDate, date)
  } else {
    let months = ref(0.)
    months.contents = (getUTCFullYear(otherDate) -. getUTCFullYear(date)) *. 12.
    months.contents = months.contents -. getUTCMonth(date)
    months.contents = months.contents +. getUTCMonth(otherDate)
    months.contents
  }
}

let toFloat = getTime
