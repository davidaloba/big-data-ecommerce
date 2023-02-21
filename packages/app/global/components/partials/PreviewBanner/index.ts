const PreviewBanner = () => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="px-4 py-4 bg-secondary md:py-4 md:px-4 lg:py-8 lg:px-8 flex items-center justify-center">
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="items-center justify-center flex">
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="flex-1 pr-2">
          // @ts-expect-error TS(2304): Cannot find name 'svg'.
          <svg
            // @ts-expect-error TS(2304): Cannot find name 'xmlns'.
            xmlns="http://www.w3.org/2000/svg"
            // @ts-expect-error TS(2304): Cannot find name 'height'.
            height="24"
            // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
            viewBox="0 0 24 24"
            // @ts-expect-error TS(2304): Cannot find name 'width'.
            width="24"
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="flex-row">
            // @ts-expect-error TS(2304): Cannot find name 'path'.
            <path
              // @ts-expect-error TS(2304): Cannot find name 'd'.
              d="M0 0h24v24H0z"
              // @ts-expect-error TS(2304): Cannot find name 'fill'.
              fill="none"
            />
            // @ts-expect-error TS(2304): Cannot find name 'path'.
            <path
              // @ts-expect-error TS(2304): Cannot find name 'd'.
              d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"
              // @ts-expect-error TS(2304): Cannot find name 'fill'.
              fill="#ffffff"
            />
          </svg>
        </div>

        // @ts-expect-error TS(2304): Cannot find name 'p'.
        <p className="max-w-3xl text-lg leading-6 text-white">
          // @ts-expect-error TS(2304): Cannot find name 'You'.
          You are in preview mode -
          // @ts-expect-error TS(2304): Cannot find name 'a'.
          <a
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="px-2 underline"
            // @ts-expect-error TS(2304): Cannot find name 'href'.
            href={`/api/exit-preview`}>
            // @ts-expect-error TS(2304): Cannot find name 'Turn'.
            Turn off to safely browse the website again
          </a>
        </p>
      </div>
    </div>
  )
}

export default PreviewBanner
