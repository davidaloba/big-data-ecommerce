import Header from '../../__lib/Header'
import FeatureCards from './feature-cards'

const Features = ({ header, cards }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="bg-gray-50 pb-24">
      // @ts-expect-error TS(2749): 'Header' refers to a value, but is being used as a... Remove this comment to see the full error message
      <Header {...header} />
      // @ts-expect-error TS(2709): Cannot use namespace 'FeatureCards' as a type.
      <FeatureCards cards={cards} />
    </div>
  )
}

Features.defaultProps = {}

export default Features
