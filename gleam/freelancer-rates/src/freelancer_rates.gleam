//// A module for calculating freelancer rates and budgets.
import gleam/float
import gleam/int

const billable_hours = 8.0
const billable_days = 22.0

/// Calculate the daily rate for a given hourly rate.
pub fn daily_rate(hourly_rate: Int) -> Float {
  billable_hours *. int.to_float(hourly_rate)
}

/// Apply a discount to a given amount.
pub fn apply_discount(before_discount: Int, discount: Float) -> Float {
  int.to_float(before_discount) *. {1.0 -. discount /. 100.0}
}

/// Calculate the daily rate for a given hourly rate after discount.
fn discounted_daily_rate(hourly_rate: Int, discount: Float) -> Float {
  billable_hours *. apply_discount(hourly_rate, discount)
}

/// Calculate the monthly rate for a given hourly rate after discount.
pub fn monthly_rate(hourly_rate: Int, discount: Float) -> Int {
  billable_days *. discounted_daily_rate(hourly_rate, discount)
    |> float.ceiling
    |> float.truncate
}

/// Calculate the number of days in a budget.
pub fn days_in_budget(budget: Int, hourly_rate: Int, discount: Float) -> Float {
  let round_to_one_decimal = fn(x: Float) -> Float {
    float.multiply(x, 10.0)
      |> float.floor
      |> fn(x) { x /. 10.0 }
  }

  int.to_float(budget) /. discounted_daily_rate(hourly_rate, discount)
    |> round_to_one_decimal
}
