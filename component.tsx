import * as React from 'react';

import './COMPONENTCAMEL.scss';

interface ICOMPONENTPASCALProps {

}

export const COMPONENTPASCAL: React.FC<React.PropsWithChildren<ICOMPONENTPASCALProps>> = ({ children }) => {
    return (
        <div className="COMPONENTKEBAB">
            {children}
        </div>
    )
}