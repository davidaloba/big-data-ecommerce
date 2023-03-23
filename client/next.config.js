module.exports = {
  images: {
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '1337',
        pathname: '/uploads/**'
      }
    ]
  },
  appDir: 'true'
}
