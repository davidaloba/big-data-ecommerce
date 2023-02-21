const Pricing = ({ header, pricingCards }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="bg-white pb-60">
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="text-center pt-24">
        {header && (
          // @ts-expect-error TS(2304): Cannot find name 'h2'.
          <h2
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className={`text-${header.theme} font-extrabold tracking-wide uppercase`}>
            {header.label}
          </h2>
        )}

        // @ts-expect-error TS(2552): Cannot find name 'header'. Did you mean 'Headers'?
        {header && (
          // @ts-expect-error TS(2304): Cannot find name 'p'.
          <p className="mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 dark:text-white sm:text-4xl">
            // @ts-expect-error TS(2552): Cannot find name 'header'. Did you mean 'Headers'?
            {header.title}
          </p>
        )}
      </div>

      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="flex flex-wrap justify-center items-center text-center gap-8 pb-12 pt-16 mt-4">
        // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
        {pricingCards &&
          // @ts-expect-error TS(2304): Cannot find name 'pricingCards'.
          pricingCards.map((card, index) => (
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div
              // @ts-expect-error TS(2304): Cannot find name 'className'.
              className="shadow-lg rounded-2xl w-64 bg-white dark:bg-gray-800 p-4"
              // @ts-expect-error TS(2304): Cannot find name 'key'.
              key={`pricingCard-${index}`}>
              // @ts-expect-error TS(2304): Cannot find name 'p'.
              <p className="text-gray-800 dark:text-gray-50 text-xl font-medium mb-4">
                // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                {card.title}
              </p>
              // @ts-expect-error TS(2304): Cannot find name 'p'.
              <p className="text-gray-900 dark:text-white text-3xl font-bold">
                // @ts-expect-error TS(2581): Cannot find name '$'. Do you need to install type ... Remove this comment to see the full error message
                ${card.price}
                // @ts-expect-error TS(2304): Cannot find name 'span'.
                <span className="text-gray-300 text-sm">/ month</span>
              </p>
              // @ts-expect-error TS(2304): Cannot find name 'p'.
              <p className="text-gray-600 dark:text-gray-100  text-xs mt-4">
                // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                {card.description}
              </p>
              // @ts-expect-error TS(2304): Cannot find name 'ul'.
              <ul className="text-sm text-gray-600 dark:text-gray-100 w-full mt-6 mb-6">
                // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                {card.perks &&
                  // @ts-expect-error TS(2304): Cannot find name 'card'.
                  card.perks.map((perk, index) => (
                    // @ts-expect-error TS(2304): Cannot find name 'li'.
                    <li
                      // @ts-expect-error TS(2304): Cannot find name 'className'.
                      className="mb-3 flex items-center"
                      // @ts-expect-error TS(2304): Cannot find name 'key'.
                      key={`perk-${index}`}>
                      // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                      {perk.included ? (
                        // @ts-expect-error TS(2304): Cannot find name 'svg'.
                        <svg
                          // @ts-expect-error TS(2304): Cannot find name 'className'.
                          className="h-6 w-6 mr-2"
                          xmlns="http://www.w3.org/2000/svg"
                          width="6"
                          height="6"
                          stroke="currentColor"
                          fill="#10b981"
                          viewBox="0 0 1792 1792">
                          // @ts-expect-error TS(2304): Cannot find name 'path'.
                          <path d="M1412 734q0-28-18-46l-91-90q-19-19-45-19t-45 19l-408 407-226-226q-19-19-45-19t-45 19l-91 90q-18 18-18 46 0 27 18 45l362 362q19 19 45 19 27 0 46-19l543-543q18-18 18-45zm252 162q0 209-103 385.5t-279.5 279.5-385.5 103-385.5-103-279.5-279.5-103-385.5 103-385.5 279.5-279.5 385.5-103 385.5 103 279.5 279.5 103 385.5z"></path>
                        </svg>
                      ) : (
                        // @ts-expect-error TS(2304): Cannot find name 'svg'.
                        <svg
                          // @ts-expect-error TS(2304): Cannot find name 'xmlns'.
                          xmlns="http://www.w3.org/2000/svg"
                          // @ts-expect-error TS(2304): Cannot find name 'width'.
                          width="6"
                          // @ts-expect-error TS(2304): Cannot find name 'height'.
                          height="6"
                          // @ts-expect-error TS(2304): Cannot find name 'className'.
                          className="h-6 w-6 mr-2"
                          // @ts-expect-error TS(2304): Cannot find name 'fill'.
                          fill="red"
                          // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
                          viewBox="0 0 1792 1792">
                          // @ts-expect-error TS(2304): Cannot find name 'path'.
                          <path d="M1277 1122q0-26-19-45l-181-181 181-181q19-19 19-45 0-27-19-46l-90-90q-19-19-46-19-26 0-45 19l-181 181-181-181q-19-19-45-19-27 0-46 19l-90 90q-19 19-19 46 0 26 19 45l181 181-181 181q-19 19-19 45 0 27 19 46l90 90q19 19 46 19 26 0 45-19l181-181 181 181q19 19 45 19 27 0 46-19l90-90q19-19 19-46zm387-226q0 209-103 385.5t-279.5 279.5-385.5 103-385.5-103-279.5-279.5-103-385.5 103-385.5 279.5-279.5 385.5-103 385.5 103 279.5 279.5 103 385.5z"></path>
                        </svg>
                      )}
                      // @ts-expect-error TS(2304): Cannot find name 'perk'.
                      {perk.name}
                    </li>
                  ))}
              </ul>
              // @ts-expect-error TS(2304): Cannot find name 'button'.
              <button
                // @ts-expect-error TS(2304): Cannot find name 'type'.
                type="button"
                // @ts-expect-error TS(2304): Cannot find name 'className'.
                className="py-2 px-4 bg-secondary hover:bg-secondary-darker text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2  rounded-lg ">
                // @ts-expect-error TS(2304): Cannot find name 'Choose'.
                Choose plan
              </button>
            </div>
          ))}
      </div>
    </div>
  )
}

Pricing.defaultProps = {}

export default Pricing
