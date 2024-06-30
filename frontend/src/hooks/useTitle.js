import { useEffect, useState } from 'react';

// set title for component
function useTitle(title = 'ABC', isOverride = false) {
  useEffect(() => {
    if (isOverride) {
      document.title = title;
    } else {
      document.title = title !== 'ABC' ? `${title} - ABC` : title;
    }
  }, []);

  return null;
}

export default useTitle;
