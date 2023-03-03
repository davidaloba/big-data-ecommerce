module.exports = {
  async rewrites() {
    return [{ source: '/packages/api/:path*', destination: '/pages/api/:path*' }]
  },
  images: {
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '1337',
        pathname: '/uploads/**'
      }
    ]
  }
}
