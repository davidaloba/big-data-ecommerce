import api from '@globalStore/api'

interface IOrder {
  billing: object
  shipping: object
  cart: object
}

const ordersApi = api.injectEndpoints({
  endpoints: (build) => ({
    addOrder: build.mutation({
      query(order) {
        return {
          url: '/orders',
          method: 'POST',
          body: { data: { ...order, slug: `${order.billing.payment.method}` } }
          // headers: new Headers({ 'content-type': 'application/json' })
        }
      },
      invalidatesTags: [{ type: 'Orders', id: 'LIST' }]
    }),
    getOrder: build.query({
      query: (slug) => `order/${slug}`,
      providesTags: (result, error, id) => [{ type: 'Orders', id }]
    }),
    updateOrder: build.mutation({
      query(data) {
        const { id, ...body } = data
        return {
          url: `order/${id}`,
          method: 'PUT',
          body
        }
      },
      invalidatesTags: (result, error, { id }) => [{ type: 'Orders', id }]
    }),
    deleteOrder: build.mutation({
      query(id) {
        return {
          url: `order/${id}`,
          method: 'DELETE'
        }
      },
      invalidatesTags: (result, error, id) => [{ type: 'Orders', id }]
    }),
    getOrders: build.query({
      query: () => 'orders',
      providesTags: (result) =>
        result
          ? [
              ...result.map(({ id }) => ({ type: 'Orders', id } as const)),
              { type: 'Orders', id: 'LIST' }
            ]
          : [{ type: 'Orders', id: 'LIST' }]
    })
  }),
  overrideExisting: false
})

export const { useAddOrderMutation, useGetOrderQuery } = ordersApi

const enhancedApi = ordersApi.enhanceEndpoints({ addTagTypes: ['Orders'] })