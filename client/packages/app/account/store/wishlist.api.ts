import api from '@app/_global/store/api'
import { getStrapiURL } from '@app/_global/utils/index'

const wishlistsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getWishlist: build.query({
      query: () => getStrapiURL(`/users/me?populate[wishlist][populate][0]=featuredImage`),
      transformResponse: (user: any) => {
        return user.wishlist
      },
      providesTags: ['Wishlist']
    }),
    saveToWishlist: build.mutation({
      query(id) {
        return {
          url: getStrapiURL('/users/me/wishlist'),
          method: 'PUT',
          body: {
            data: {
              wishlist: {
                connect: [id]
              }
            }
          }
        }
      },
      invalidatesTags: ['Wishlist']
    }),
    removeFromWishlist: build.mutation({
      query(id) {
        return {
          url: getStrapiURL('/users/me/wishlist'),
          method: 'PUT',
          body: {
            data: {
              wishlist: {
                disconnect: [id]
              }
            }
          }
        }
      },
      invalidatesTags: ['Wishlist']
    })
  }),
  overrideExisting: false
})

export const { useSaveToWishlistMutation, useRemoveFromWishlistMutation, useGetWishlistQuery } =
  wishlistsApi

const enhancedApi = api.enhanceEndpoints({ addTagTypes: ['Wishlist'] })
