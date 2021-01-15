Rails.configuration.stripe = {
    :publishable_key => 'pk_test_TYooMQauvdEDq54NiTphI7jx',
    :secret_key      => 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'

    # :publishable_key => 'pk_live_51I9ZfLBs30OqjAvUcHEaWXcTuyiIuYDEnjoc9OZZX1RxcpDuFC6KpRhadA9jiYr5COzXfBHeyBbJuj34a6uTKv0p00A9rbJ6Er',
    # :secret_key      => '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'
  }
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]

  