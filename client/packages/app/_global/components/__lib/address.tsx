const Address = ({ address }) => {
  return (
    <div className=" flex flex-col justify-center  p-4 ">
      <div className="flex flex-row flex-wrap gap-1">
        <p>{address.firstName}</p>
        <p>{address.lastName}</p>
      </div>
      <p>{address.addressLine1}</p>
      <p>{address.addressLine2}</p>
      <div className="flex flex-row flex-wrap gap-1 mb-2">
        <p>{address.city},</p>
        <p>{address.state}</p>
        <p>{address.zipCode}</p>
      </div>
      <p>{address.phone}</p>
    </div>
  )
}

export default Address
