import React from 'react';

import GiphysIndex from './giphys_index';
import GiphysSearch from '../../solution/components/giphys_search';

class giphysSearch extends React.Component {
    constructor(props) {
        super(props)

        this.state = searchTerm
    }

    render() {
        let { giphys } = this.props


     return (
        <div>
            <form className="search">
                <input value={this.state.searchTerm} onChange={this.handleChange}/>
                <button type="submit" onClick={this.handleSubmit}>Seach for fire giphy!</button>
            </form>
            {/* <GiphysIndex giphys={giphy} */}
        </div>
     );
    }
}

export default GiphysSearch;