import { render, screen } from '@testing-library/react'
import Page from './[[...slug]]'

test('renders learn react link', () => {
  render(Page)
  const linkElement = screen.getByRole('heading')
  expect(linkElement).toBeInTheDocument()
})
