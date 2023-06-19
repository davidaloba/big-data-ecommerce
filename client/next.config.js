module.exports = {
  images: {
    remotePatterns: [
      {
        protocol: process.env.NEXT_PUBLIC_API_PROTOCOL,
        hostname: process.env.NEXT_PUBLIC_API_HOSTNAME,
        port: process.env.NEXT_PUBLIC_API_PORT,
        pathname: process.env.NEXT_PUBLIC_UPLOAD_PATH
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
