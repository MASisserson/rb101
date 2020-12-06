Inputs:
1. Loan amount
2. Annual Percentage Rate (APR)
3. Loan Duration

Outputs:
1. Monthly interest rate
2. Loan duration in months
3. Monthly payment

General Formula:
m = p * (j / (1 - (1+j)**(-n)))
m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months

MENTAL MODEL
The calculator requests user three pieces of user input and then asks what
the user wants to know of the outputs. The user then can ask for another
output or can ask to end the session. The system runs methods tied to each
output in order to provide that output for the user.

PROCESS (ALGORITHM)
1. Request and validate user Loan Amount (dollars)
2. Request and validate user APR (percentage)
3. Request and validate user loan duration (years)
4. Present options: (validation loop needed here too)
    Monthly interest rate
    Loan duration in months
    Monthly payment
5. Output user request, then ask if there is anything else the user wishes
   to know. If yes, repeat. If no, end session.
