import { getStrapiMedia } from '@utils/index'

const MemberCards = ({ members }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-4 pt-24 pb-40">
      {members &&
        members.data.map((member, index) => (
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="p-4"
            // @ts-expect-error TS(2304): Cannot find name 'key'.
            key={index}>
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="flex-col flex justify-center items-center">
              // @ts-expect-error TS(2304): Cannot find name 'div'.
              <div className="flex-shrink-0">
                // @ts-expect-error TS(2304): Cannot find name 'div'.
                <div className="block relative">
                  // @ts-expect-error TS(2304): Cannot find name 'img'.
                  <img
                    // @ts-expect-error TS(2304): Cannot find name 'alt'.
                    alt="profil"
                    // @ts-expect-error TS(2304): Cannot find name 'src'.
                    src={getStrapiMedia(
                      member.attributes.picture.data.attributes.url
                    )}
                    // @ts-expect-error TS(2304): Cannot find name 'className'.
                    className="mx-auto object-cover rounded-full h-20 w-20 "
                  />
                </div>
              </div>
              // @ts-expect-error TS(2304): Cannot find name 'div'.
              <div className="mt-2 text-center flex flex-col">
                // @ts-expect-error TS(2304): Cannot find name 'span'.
                <span className="text-gray-600 text-lg font-medium">
                  // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                  {member.attributes.username}
                </span>
                // @ts-expect-error TS(2304): Cannot find name 'span'.
                <span className="text-gray-400 text-sm">
                  // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                  {member.attributes.job}
                </span>
              </div>
            </div>
          </div>
        ))}
    </div>
  )
}

MemberCards.defaultProps = {}

export default MemberCards
