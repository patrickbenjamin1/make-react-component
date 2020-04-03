# Make Component

Initialises the shell of a React component written in TS, importing a SCSS file.

## Get it

```
mkdir ~/.makecomponent/
git clone https://github.com/patrickbenjamin1/make-react-component.git ~/.makecomponent/
```

then to your `bashrc`/`zshrc` add

```
alias makecomponent="~/.makecomponent/makecomponent.sh"
```

## Usage

From the directory you want to create your component run

```
makeComponent COMPONENTNAMEINCAMELCASE
```

For example...

```
makecomponent myCoolComponent
```

This will make

**myCoolComponent.tsx**
```tsx
import * as React from 'react';

import './myCoolComponent.scss';

interface IMyCoolComponentProps {

}

export const MyCoolComponent: React.FunctionComponent<IMyCoolComponentProps> = () => {
    return (
        <div className="my-cool-component"></div>
    )
}
```

**myCoolComponnet.scss**
```scss
@import '';

.my-cool-component {

}
```

## Other Cool Stuff

Some other features that would be rad would be to be able to define, per project, maybe with a `.scssimportpath` file or something at the root, where the scss file that is imported into each new scss file is, because for now I've had to just leave it empty.