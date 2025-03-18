import axios, { AxiosError } from "axios";
import baseURL from "./baseUrl";

const axiosInstance = axios.create({
    baseURL,
    timeout: 1000,
})

type ApiOptions = {
    data?: object | string,
    method?: 'get' | 'post'
    params?: object,
}

export const api = async (url: string, options: ApiOptions = {}) => {
    const { data, method = 'get', params } = options

    const accessToken = 'ACCESS_TOKEN'

    try {
        const response = await axiosInstance.request({
            data,
            headers: {
                'Authorization': `Bearer ${accessToken}`,
                'Content-Type': 'application/json',
            },
            method,
            params,
            responseType: 'json',
            url,
        })

        return response.data
    } catch (error) {
        const axiosError = error as AxiosError
        throw new Error(axiosError.message)
    }
}

export default api