module.exports = {
  async rewrites() {
    return [{ source: 'packages/api/:path*', destination: 'pages/api/:path*' }]
  }
}
