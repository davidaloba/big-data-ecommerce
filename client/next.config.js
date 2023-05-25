module.exports = {
  images: {
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'localhost',
        port: '1338',
        pathname: '/uploads/**'
      }
    ]
  },
  experimental: {},
  typescript: {
    // Dangerously allow production builds to successfully complete even if your project has type errors.
    ignoreBuildErrors: true
  },
  output: 'standalone',
  eslint: {
    // Warning: This allows production builds to successfully complete even if  your project has ESLint errors.
    ignoreDuringBuilds: false
  }
}
