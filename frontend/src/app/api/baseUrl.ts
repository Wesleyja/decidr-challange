const baseUrls = {
  development: 'http://localhost:3002',
  live: ''
}

const baseUrl = baseUrls[process.env.NODE_ENV || 'development']

export default baseUrl