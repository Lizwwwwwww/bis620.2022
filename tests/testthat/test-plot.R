test_that(
  "The accel_plot() returns a ggplot object.",
  {
    data(ukb_accel)
    p <-  accel_plot(ukb_accel[1:100, ])
    expect_true(inherits(p, "gg"))
  }
)

test_that(
  "The accel_plot() errors when no time or freq column.",
  {
    data(iris)
    expect_error(accel_plot(iris))
  }
)

test_that(
  "The accel_plot() is correct for time-series data.",
  {
    data(ukb_accel)
    p <- accel_plot(ukb_accel[1:100, ])
    expect_doppelganger("first-100-samples", p)
    #p is ggolot project compare with
  }
)


test_that(
  "The spectral_signature() is correct for a data.frame with
  columns X, Y, Z, and time.",
  {
    data(ukb_accel)
    p <- ukb_accel[1:100, ] |>
      spectral_signature(take_log = FALSE) |>
      accel_plot()
    expect_doppelganger("spectral signature", p)
  }
)

test_that(
  "The spectral_signature() using the log of
  the modulus is correct for a data.frame with
  columns X, Y, Z, and time.",
  {
    data(ukb_accel)
    p <- ukb_accel[1:100, ] |>
      spectral_signature(take_log = TRUE) |>
      accel_plot()
    expect_doppelganger("spectral signature take log", p)
  }
)
