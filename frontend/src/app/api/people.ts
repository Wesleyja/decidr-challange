import api from './index'

type Endpoints = {
    getPeople: () => Promise<APISchema.Person[]>
}

const endpoints : Endpoints = {
    getPeople: async () => {
        return await api('people')
    },
}

export default endpoints