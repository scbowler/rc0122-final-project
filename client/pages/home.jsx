import React from 'react';

export default class Home extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      entries: []
    };
  }

  componentDidMount() {
    fetch('/api/entries')
      .then(resp => resp.json())
      .then(entries => {
        this.setState({ entries });
      });
  }

  render() {
    return (
      <div className="py-4">
        <h1>Entries</h1>
        <div className="row">
          {
            this.state.entries.map(entry => (
              <div className="col-4" key={entry.entryId}>
                <div className="card">
                  <img className="card-img-top" src={entry.photoUrl} alt={entry.title} />
                  <div className="card-body">
                    <h5 className="card-title">{entry.title}</h5>
                  </div>
                </div>
              </div>
            ))
          }
        </div>
      </div>
    );
  }
}
