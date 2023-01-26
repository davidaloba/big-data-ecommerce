module.exports = {
  async rewrites() {
    return [{ source: '/server/api/:path*', destination: '/pages/api/:path*' }]
  }
}
