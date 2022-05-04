import React, { useState, useEffect } from 'react';
import { TechStacksService } from '../../services';

function Table() {
  const [dummy, setDummy] = useState(null);

  // eslint-disable-next-line consistent-return
  const getAllTechStacks = async () => {
    TechStacksService.getAll()
      .then((res) => {
        setDummy(res.data);
      })
      .catch((err) => console.log('Error API Request', err));
  };

  useEffect(() => {
    getAllTechStacks();
  }, []);

  return (
    <div>
      {dummy &&
        dummy.map((item) => (
          <>
            <p>{item.frontend}</p>
            <p>{item.backend}</p>
            <p>{item.database}</p>
          </>
        ))}
      {/* <h1>dumbo</h1> */}
    </div>
  );
}

export default Table;
