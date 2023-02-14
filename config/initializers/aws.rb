require 'env_config'

aws_env = EnvConfig.require(
  *%w[
    AWS_DOCUMENT_BUCKET
    AWS_ACCESS_KEY_ID
    AWS_SECRET_ACCESS_KEY
  ],
  always: true
)

config = {
  bucket: aws_env['AWS_DOCUMENT_BUCKET'],
  access_key_id: aws_env['AWS_ACCESS_KEY_ID'],
  secret_access_key: aws_env['AWS_SECRET_ACCESS_KEY']
}

Rails.configuration.aws = aws_env.present? ? config : nil
