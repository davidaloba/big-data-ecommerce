import api from '@app/_global/store/api'
import { getStrapiURL } from '@app/_global/utils/index'
import { IOrder } from '../../shop/__types'

const ordersApi = api.injectEndpoints({
  endpoints: (build) => ({
    addOrder: build.mutation({
      query(order) {
        return {
          url: getStrapiURL('/orders'),
          method: 'POST',
          body: { data: { ...order, slug: `${order.billing.payment.transaction_id}` } }
          // headers: new Headers({ 'content-type': 'application/json' })
        }
      }
    }),
    getOrder: build.query({
      query: (id) => getStrapiURL(`/orders?filters[slug][$eq]=${id}`),
      transformResponse: (order: any) => {
        return order[0]
      }
    }),
    updateOrder: build.mutation({
      query(data) {
        const { id, ...body } = data
        return {
          url: getStrapiURL(`order/${id}`),
          method: 'PUT',
          body
        }
      }
    }),
    deleteOrder: build.mutation({
      query(id) {
        return {
          url: getStrapiURL(`order/${id}`),
          method: 'DELETE'
        }
      }
    }),
    getOrders: build.query({
      query: () => getStrapiURL('/orders'),
      transformResponse: (orders: any): IOrder => {
        return orders
      }
    })
  }),
  overrideExisting: false
})

export const { useAddOrderMutation, useGetOrderQuery, useGetOrdersQuery } = ordersApi

const enhancedApi = ordersApi.enhanceEndpoints({ addTagTypes: ['Orders'] })
