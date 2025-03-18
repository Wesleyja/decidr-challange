import api from './index'

const endpoints = {
  importFromCsv: async(csv_data: ArrayBuffer) => {
    return await api('upload/from_csv', {
      method: 'post',
      data: csv_data
    })
  },
  defaultCsv: async() => {
    return await api('upload/default_from_csv', {
      method: 'post',
    })
  }
}

export default endpoints
