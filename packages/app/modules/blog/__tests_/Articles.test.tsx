import { render, screen } from '@testing-library/react'
// @ts-expect-error TS(2307): Cannot find module '../components/Component' or it... Remove this comment to see the full error message
import Component from '../components/Component'

test('renders learn react link', () => {
  render(<Component />)
  const linkElement = screen.getByText(/learn react/i)
  expect(linkElement).toBeInTheDocument()
})
