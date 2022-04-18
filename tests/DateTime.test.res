let {zoraBlock, equal, ok} = module(Zora)
let d1 = DateTime.fromDate(
  Js.Date.makeWithYMDHMS(
    ~year=2000.,
    ~month=5.,
    ~date=1.,
    ~hours=5.,
    ~minutes=30.,
    ~seconds=25.,
    (),
  ),
)
let d2 = DateTime.fromDate(
  Js.Date.makeWithYMDHMS(
    ~year=2003.,
    ~month=6.,
    ~date=1.,
    ~hours=5.,
    ~minutes=30.,
    ~seconds=25.,
    (),
  ),
)
let d3 = DateTime.fromDate(
  Js.Date.makeWithYMDHMS(
    ~year=2003.,
    ~month=4.,
    ~date=1.,
    ~hours=5.,
    ~minutes=30.,
    ~seconds=25.,
    (),
  ),
)

zoraBlock("fromDate", _test => {
  DateTime.fromDate(Js.Date.make())->ignore
})

zoraBlock("elapsed", test => {
  test->ok(d1->DateTime.elapsed->Elapsed.toMilliseconds > 0., "Elapsed value is not valid")
})

zoraBlock("addElapsed", test => {
  let newD1 = d1->DateTime.addElapsed(Elapsed.make(~seconds=1, ()))
  test->equal(newD1->DateTime.toFloat, DateTime.toFloat(d1) +. 1000., "addElapsed gave bad result")
})

zoraBlock("subtractElapsed", test => {
  let newD1 = d1->DateTime.subtractElapsed(Elapsed.make(~seconds=1, ()))
  test->equal(
    newD1->DateTime.toFloat,
    DateTime.toFloat(d1) -. 1000.,
    "subtractElapsed gave bad result",
  )
})

zoraBlock("isInPast", test => {
  test->equal(d1->DateTime.isInPast, true, "Date is intended to be in the past")
})

zoraBlock("addDays", test => {
  test->equal(
    d1->DateTime.addDays(1.)->DateTime.toFloat,
    DateTime.toFloat(d1) +. 1000. *. 60. *. 60. *. 24.,
    "addDays gave bad result",
  )
})

zoraBlock("addHours", test => {
  test->equal(
    d1->DateTime.addHours(1.)->DateTime.toFloat,
    DateTime.toFloat(d1) +. 1000. *. 60. *. 60.,
    "addHours gave bad result",
  )
})

zoraBlock("addMinutes", test => {
  test->equal(
    d1->DateTime.addMinutes(1.)->DateTime.toFloat,
    DateTime.toFloat(d1) +. 1000. *. 60.,
    "addMinutes gave bad result",
  )
})

zoraBlock("addSeconds", test => {
  test->equal(
    d1->DateTime.addSeconds(1.)->DateTime.toFloat,
    DateTime.toFloat(d1) +. 1000.,
    "addSeconds gave bad result",
  )
})

zoraBlock("addMilliseconds", test => {
  test->equal(
    d1->DateTime.addMilliseconds(1.)->DateTime.toFloat,
    DateTime.toFloat(d1) +. 1.,
    "addMilliseconds gave bad result",
  )
})
