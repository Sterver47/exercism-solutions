# Freelancer Rates

Welcome to Freelancer Rates on Exercism's Gleam Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

In this exercise you'll be writing code to help a freelancer communicate with a project manager by providing a few utilities to quickly calculate daily and monthly rates, optionally with a given discount.

We first establish a few rules between the freelancer and the project manager:

The daily rate is 8 times the hourly rate.
A month has 22 billable days.
The freelancer is offering to apply a discount if the project manager chooses to let the freelancer bill per month, which can come in handy if there is a certain budget the project manager has to work with.

Discounts are modeled as fractional numbers representing percentage, for example 25.0 (25%).

## 1. Calculate the daily rate given an hourly rate

Implement a function to calculate the daily rate given an hourly rate:

```gleam
freelancer_rates.daily_rate(60)
# => 480.0
```

The returned daily rate should be a float.

## 2. Calculate a discounted price

Implement a function to calculate the price after a discount.

```gleam
freelancer_rates.apply_discount(150, 10)
# => 135.0
```

The returned value should always be a float, not rounded in any way.

## 3. Calculate the monthly rate, given an hourly rate and a discount

Implement a function to calculate the monthly rate, and apply a discount:

```gleam
freelancer_rates.monthly_rate(77, 10.5)
# => 12130
```

The returned monthly rate should be rounded up (take the ceiling) to the nearest integer.

## 4. Calculate the number of workdays given a budget, hourly rate and discount

Implement a function that takes a budget, a hourly rate, and a discount, and calculates how many days of work that covers.

```gleam
freelancer_rates.days_in_budget(20000, 80, 11.0)
# => 35
```

The returned number of days should be rounded down (take the floor) to one decimal place.

## Source

### Created by

- @Theosaurus-Rex