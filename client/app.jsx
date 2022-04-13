import React from 'react';
import Nav from './components/nav';
import Home from './pages/home';
import NewEntry from './pages/new-entry';
import { parseRoute } from './lib';

export default class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      route: parseRoute(location.hash)
    };
  }

  componentDidMount() {
    window.addEventListener('hashchange', () => {
      const route = parseRoute(location.hash);
      this.setState({ route });
    });
  }

  renderPage() {
    const { route } = this.state;

    if (route.path === '') {
      return <Home />;
    }
    if (route.path === 'new-entry') {
      return <NewEntry />;
    }

    return (
      <div className="py-5">
        <h1 className="text-center text-danger">404 - Page Not Found</h1>
      </div>
    );
  }

  render() {
    return (
      <div>
        <Nav/>
        <div className="container">
          {this.renderPage()}
        </div>
      </div>
    );
  }
}
