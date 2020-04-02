import '/index.scss';
import 'bulma/css/bulma.css';
import React from 'react';
import { render } from 'react-dom';

const App = () => {
    return (
        <div className="container is-fluid is-full-widescreen has-text-centered">
            <h1 style={{padding: "5em"}} className="is-primary is-size-1">Hello, World!</h1>
        </div>
    );
};

render(<App />, document.getElementById('app'));
