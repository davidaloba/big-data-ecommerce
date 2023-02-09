import { render, screen } from '@testing-library/react'
import Component from '../components/Component'

test('renders learn react link', () => {
  render(<Component />)
  const linkElement = screen.getByText(/learn react/i)
  expect(linkElement).toBeInTheDocument()
})
