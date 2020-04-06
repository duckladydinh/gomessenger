import React from 'react';
import { render } from 'react-dom';
import { ChatMessage } from './ChatMessage';
import { ChatInputBox } from './ChatInputBox';
import _ from 'lodash';

const message = `Truncation should be conditionally applicable on this long line of text
 as this is a much longer line than what the container can support. `;

const App = () => {
    return (
        <div>
            <div>
                {
                    _.range(120).map(() => <>
                        <ChatMessage user="Simeon" message={message} isOwned={false}/>
                        <ChatMessage user="Alex" message={message} isOwned={true}/>
                    </>)
                }
                <div style={{height: '108px'}}/>
            </div>
            <ChatInputBox/>
        </div>
    );
};

render(<App />, document.getElementById('app'));
