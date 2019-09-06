import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import {
  BarChart, XAxis, YAxis, Bar, Tooltip, Legend, ResponsiveContainer, CartesianGrid
} from 'recharts'

class PipelineChart extends React.Component {
  constructor(props) {
    super(props)
    
    this.state = {
      chartData: []
    }
  }

  componentDidMount() {
    fetch("/api/deal_stages")
      .then(result => result.json())
      .then(result => {
	this.setState({
	  chartData: result
	})
      })
  }

  render() {    
    return (
      <BarChart data={this.state.chartData} width={900} height={600}>
	<XAxis
	  dataKey="name"
	  width={500}
	  tick={{fill: 'var(--text-color)'}}
	  stroke="var(--primary-color)" />
	<YAxis
	  dataKey="total_value"
	  width={100}
	  tick={{fill: 'var(--text-color)'}}
	  stroke="var(--primary-color)" />
	<Tooltip cursor={{fill: 'hsl(262, 100%, 95%)'}} />
	<CartesianGrid strokeDasharray="3 3" stroke="var(--primary-color)" />
	<Bar dataKey="total_value" fill="#653cad" />
      </BarChart>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <PipelineChart />,
    document.body.appendChild(document.createElement('div'))
  )
})
