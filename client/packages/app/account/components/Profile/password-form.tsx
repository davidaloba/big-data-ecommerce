const PassForm = ({ setEdit, form, submitError, errors, registerOptions, register }) => {
  const currentPasswordErr = (errors && errors.currentPasswor && errors.currentPasswor) || null
  const passwordConfirmationErr =
    (errors && errors.passwordConfirmation && errors.passwordConfirmation) || null
  const passwordErr = (errors && errors.password && errors.password) || null

  return (
    <div className="uppercase">
      <p className=" py-5 uppercase ">Password</p>
      {submitError && <p className="text-red-500  py-5 uppercase ">{submitError}</p>}
      <div className="pb-2  flex flex-col ">
        <div className="flex flex-row justify-between items-center">
          <label className=" mb-1 ">Current Password</label>
          {currentPasswordErr && (
            <p className="text-red-500  text-right">{currentPasswordErr.message}</p>
          )}
        </div>
        <input
          {...register(`currentPassword`, registerOptions.currentPassword)}
          type="password"
          autoFocus
          className={` invalid:border-red-500 ${currentPasswordErr && 'border-red-500'}`}
        />
      </div>
      <div className="flex flex-row gap-5 pb-2">
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1 ">New Password</label>
            {passwordErr && <p className="text-red-500  text-right">{passwordErr.message}</p>}
          </div>
          <input
            {...register(`password`, registerOptions.password)}
            type="password"
            autoFocus
            className={` invalid:border-red-500 ${passwordErr && 'border-red-500'}`}
          />
        </div>
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1 ">Confirm Password</label>
            {passwordConfirmationErr && (
              <p className="text-red-500  text-right">{passwordConfirmationErr.message}</p>
            )}
          </div>
          <input
            {...register(`passwordConfirmation`, registerOptions.passwordConfirmation)}
            type="password"
            autoFocus
            className={` invalid:border-red-500 ${passwordConfirmationErr && 'border-red-500'}`}
          />
        </div>
      </div>
      <div className="flex flex-row gap-5 pb-2">
        <div className=" flex-1 flex flex-row justify-between items-center px-5 py-1 border ">
          <div
            onClick={() => setEdit('')}
            className="grow hover:underline   ">
            Cancel
          </div>
        </div>
        <button
          type="submit"
          className=" flex-1 flex flex-row justify-between items-center px-5 py-1   bg-gray-700 ">
          <div className="grow hover:underline  text-white ">Change Password</div>
          <div className=" text-2xl  text-white">{`>`}</div>
        </button>
      </div>
    </div>
  )
}

export default PassForm
