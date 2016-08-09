Rails.configuration.stripe = {
  :publishable_key => 'pk_test_om9JIRPO6EFk5cpxkWjHt16G',
  :secret_key      => 'sk_test_G1ka7kbqMnoWTvRDY3jeHklE'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]