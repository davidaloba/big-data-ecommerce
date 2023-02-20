export interface GlobalData {
  id: number
  attributes: {
    createdAt: string
    updatedAt: string
    publishedAt: string
    locale: string
    navigation: {
      id: number
      links: string[]
      leftButton: object
      rightButton: object
    }
    footer: {
      id: number
      label: string
      footerColumns: []
    }
  }
}

export interface PageData {
  id: number
  attributes: {
    slug: string
    createdAt: string
    updatedAt: string
    publishedAt: string
    locale: string
    localizations: object
    seo: null
    title?: string
    main?: object[]
    blocks?: object[]
    perPage?: null
    TagText?: null
    categoryText?: string
    publicationStages?: object
    publicationState?: string
  }
}
