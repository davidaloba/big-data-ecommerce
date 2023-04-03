export interface Global {
  id: number
  attributes: {
    createdAt: string
    updatedAt: string
    publishedAt: string
    locale: string
    header: {
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

export interface Page {
  id: number
  attributes: {
    slug: string
    createdAt: string
    updatedAt: string
    publishedAt: string
    locale: string
    localizations: {
      id: number
      data: {
        id: number
        attributes: {
          [index: string]: string
        }
      }[]
    }
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
