aws = {
    access_key_id: ENV['access_key_id'],
    secret_access_key: ENV['secret_access_key'],
    region: 'us-east-1',
    bucket: ENV['bucket']
}
Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
Refile.store = Refile::S3.new(prefix: 'store', **aws)

Refile.cdn_host = ENV['cdn_host']