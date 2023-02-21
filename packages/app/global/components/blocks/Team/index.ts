import Header from '../../__lib/Header'
import MemberCards from './member-cards'

const Team = ({ header, members }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="p-8 bg-white rounded-lg">
      // @ts-expect-error TS(2749): 'Header' refers to a value, but is being used as a... Remove this comment to see the full error message
      <Header {...header} />
      // @ts-expect-error TS(2709): Cannot use namespace 'MemberCards' as a type.
      <MemberCards members={members} />
    </div>
  )
}

Team.defaultProps = {}

export default Team
